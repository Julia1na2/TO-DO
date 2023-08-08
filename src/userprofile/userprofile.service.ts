import { Injectable } from '@nestjs/common';
import { CreateUserprofileDto } from './dto/create-userprofile.dto';
import { UpdateUserprofileDto } from './dto/update-userprofile.dto';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/prisma.service';

@Injectable()
export class UserprofileService {
  constructor(private prisma: PrismaService){}

  create(createUserprofileDto: Prisma.UserprofileUncheckedCreateInput) {
    return this.prisma.userprofile.create({
      data: createUserprofileDto,
    });
  }

  findAll() {
    return this.prisma.userprofile.findMany();
  }

  findOne(userProfileWhereUniqueInput: Prisma.UserprofileWhereUniqueInput) {
    return this.prisma.userprofile.findUnique({
      where: userProfileWhereUniqueInput,
    });
  }

  update(where: Prisma.UserprofileWhereUniqueInput, data: Prisma.UserprofileUpdateInput) {
    return this.prisma.userprofile.update({
      data,
      where,
    });
  }

  remove(where: Prisma.UserprofileWhereUniqueInput) {
    return this.prisma.userprofile.delete({
      where,
    });
  }
}
