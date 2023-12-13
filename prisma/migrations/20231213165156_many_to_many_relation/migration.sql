/*
  Warnings:

  - The primary key for the `UserOfSchools` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `schoolId` on the `UserOfSchools` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `UserOfSchools` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[code]` on the table `School` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[cpf]` on the table `User` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `code` to the `School` table without a default value. This is not possible if the table is not empty.
  - Added the required column `code` to the `UserOfSchools` table without a default value. This is not possible if the table is not empty.
  - Added the required column `cpf` to the `UserOfSchools` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "UserOfSchools" DROP CONSTRAINT "UserOfSchools_schoolId_fkey";

-- DropForeignKey
ALTER TABLE "UserOfSchools" DROP CONSTRAINT "UserOfSchools_userId_fkey";

-- AlterTable
ALTER TABLE "School" ADD COLUMN     "code" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "UserOfSchools" DROP CONSTRAINT "UserOfSchools_pkey",
DROP COLUMN "schoolId",
DROP COLUMN "userId",
ADD COLUMN     "code" INTEGER NOT NULL,
ADD COLUMN     "cpf" TEXT NOT NULL,
ADD CONSTRAINT "UserOfSchools_pkey" PRIMARY KEY ("cpf", "code");

-- CreateIndex
CREATE UNIQUE INDEX "School_code_key" ON "School"("code");

-- CreateIndex
CREATE UNIQUE INDEX "User_cpf_key" ON "User"("cpf");

-- AddForeignKey
ALTER TABLE "UserOfSchools" ADD CONSTRAINT "UserOfSchools_cpf_fkey" FOREIGN KEY ("cpf") REFERENCES "User"("cpf") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserOfSchools" ADD CONSTRAINT "UserOfSchools_code_fkey" FOREIGN KEY ("code") REFERENCES "School"("code") ON DELETE RESTRICT ON UPDATE CASCADE;
