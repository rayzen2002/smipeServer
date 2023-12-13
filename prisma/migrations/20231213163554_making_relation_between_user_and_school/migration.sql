/*
  Warnings:

  - You are about to drop the `Escola` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "Escola";

-- CreateTable
CREATE TABLE "School" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "cnpj" TEXT NOT NULL,
    "address" TEXT NOT NULL,

    CONSTRAINT "School_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserOfSchools" (
    "userId" TEXT NOT NULL,
    "schoolId" TEXT NOT NULL,
    "assignedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "UserOfSchools_pkey" PRIMARY KEY ("userId","schoolId")
);

-- AddForeignKey
ALTER TABLE "UserOfSchools" ADD CONSTRAINT "UserOfSchools_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserOfSchools" ADD CONSTRAINT "UserOfSchools_schoolId_fkey" FOREIGN KEY ("schoolId") REFERENCES "School"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
