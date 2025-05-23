import { useCallback, useEffect } from "react";
import { useSearchParams } from "react-router-dom";
import { useNavigate } from "react-router-dom";
import axios from "axios";
import { useSelector } from "react-redux";

const GoogleOAuthCallback = () => {
  const [searchParams] = useSearchParams();
  const code = searchParams.get("code");
  const baseURL = useSelector((state) => state.baseUrl.url);
  const navigate = useNavigate();

  const getToken = useCallback(
    async (oauthCode) => {
      console.log("getToken");

      try {
        const response = await axios.post(
          `${baseURL}/v1/auth/google/callback/`,
          {
            code: oauthCode,
          },
          { withCredentials: true }
        );
        if (response.status === 201) {
          navigate("/settings");
        } else {
          navigate("/main");
        }
        // eslint-disable-next-line no-unused-vars
      } catch (err) {
        navigate("/");
      }
    },
    [baseURL, navigate]
  );

  useEffect(() => {
    if (code) {
      getToken(code);
    } else {
      navigate("/");
    }
  }, [code, getToken, navigate]);

  return <h1>Processing GoogleOAuth Callback...</h1>;
};

export default GoogleOAuthCallback;
