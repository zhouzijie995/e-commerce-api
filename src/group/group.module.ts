import { Module } from '@nestjs/common';
import { SequelizeModule } from '@nestjs/sequelize';
import { Group } from './group.model';
import { GroupService } from './group.service';
import { GroupController } from './group.controller';
import { User } from 'src/users/users.model';
@Module({
  imports: [SequelizeModule.forFeature([Group, User])],
  controllers: [GroupController],
  providers: [GroupService],
})
export class GroupModule {}
