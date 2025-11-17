import { Module } from '@nestjs/common';
import { Role } from './roles.model';
import { RolesService } from './roles.service';
import { RolesController } from './roles.controller';
import { SequelizeModule } from '@nestjs/sequelize';

@Module({
  imports: [SequelizeModule.forFeature([Role])],
  providers: [RolesService],
  controllers: [RolesController],
})
export class RolesModule {}
