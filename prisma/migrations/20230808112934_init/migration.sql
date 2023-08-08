/*
  Warnings:

  - You are about to drop the column `dateCreated` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `dateUpdated` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `dateCreated` on the `Userprofile` table. All the data in the column will be lost.
  - You are about to drop the column `dateUpdated` on the `Userprofile` table. All the data in the column will be lost.
  - You are about to drop the column `firstName` on the `Userprofile` table. All the data in the column will be lost.
  - You are about to drop the column `lastName` on the `Userprofile` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `Userprofile` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[user_id]` on the table `Userprofile` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `user_id` to the `Userprofile` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `Userprofile` DROP FOREIGN KEY `Userprofile_userId_fkey`;

-- AlterTable
ALTER TABLE `User` DROP COLUMN `dateCreated`,
    DROP COLUMN `dateUpdated`,
    ADD COLUMN `date_created` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `date_updated` DATETIME(3) NULL;

-- AlterTable
ALTER TABLE `Userprofile` DROP COLUMN `dateCreated`,
    DROP COLUMN `dateUpdated`,
    DROP COLUMN `firstName`,
    DROP COLUMN `lastName`,
    DROP COLUMN `userId`,
    ADD COLUMN `date_created` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `date_updated` DATETIME(3) NULL,
    ADD COLUMN `first_name` VARCHAR(191) NULL,
    ADD COLUMN `last_name` VARCHAR(191) NULL,
    ADD COLUMN `user_id` INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `Userprofile_user_id_key` ON `Userprofile`(`user_id`);

-- AddForeignKey
ALTER TABLE `Userprofile` ADD CONSTRAINT `Userprofile_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
