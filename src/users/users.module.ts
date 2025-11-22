import { Module } from '@nestjs/common';
import { SequelizeModule } from '@nestjs/sequelize';
import { UsersController } from './users.controller';
import { UsersService } from './users.service';
import { User } from './users.model';
import { Group } from 'src/group/group.model';
import { Role } from 'src/roles/roles.model';
import { Permission } from 'src/permissions/permissions.model';

@Module({
  imports: [SequelizeModule.forFeature([User, Group, Role, Permission])],
  controllers: [UsersController],
  providers: [UsersService],
  exports: [UsersService],
})
export class UsersModule {}
