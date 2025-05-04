/*
  Warnings:

  - You are about to drop the column `slack_access_token` on the `User` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "User" DROP COLUMN "slack_access_token",
ADD COLUMN     "company_name" TEXT NOT NULL DEFAULT 'Not Known',
ADD COLUMN     "morning_brief_time" TEXT DEFAULT '6:00 AM',
ADD COLUMN     "morning_update" TEXT,
ADD COLUMN     "morning_update_check" BOOLEAN NOT NULL DEFAULT true,
ADD COLUMN     "morning_update_preferences" TEXT,
ADD COLUMN     "phone_number" TEXT,
ADD COLUMN     "position" TEXT NOT NULL DEFAULT 'Not Known',
ADD COLUMN     "preferences" TEXT,
ADD COLUMN     "preferences_added" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "profile_image" TEXT,
ADD COLUMN     "slack_bot_access_token" TEXT,
ADD COLUMN     "slack_bot_id" TEXT,
ADD COLUMN     "slack_user_access_token" TEXT,
ADD COLUMN     "slack_user_id" TEXT,
ADD COLUMN     "timeZone" TEXT NOT NULL DEFAULT 'America/Los_Angeles';

-- CreateTable
CREATE TABLE "Events" (
    "id" SERIAL NOT NULL,
    "events" TEXT NOT NULL,

    CONSTRAINT "Events_pkey" PRIMARY KEY ("id")
);
