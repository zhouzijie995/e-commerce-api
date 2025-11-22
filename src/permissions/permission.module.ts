import { Module } from '@nestjs/common';

import { SequelizeModule } from '@nestjs/sequelize';

import { PermissionGuard } from './permission.guard';
import { Permission } from './permissions.model';
@Module({
  imports: [SequelizeModule.forFeature([Permission])],
  providers: [PermissionGuard],
  exports: [PermissionGuard],
})
export class PermissionModule {}
