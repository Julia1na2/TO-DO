import { Module } from '@nestjs/common';
import { UserprofileService } from './userprofile.service';
import { UserprofileController } from './userprofile.controller';
import { PrismaService } from 'src/prisma.service';

@Module({
  controllers: [UserprofileController],
  providers: [UserprofileService, PrismaService],
})
export class UserprofileModule {}
