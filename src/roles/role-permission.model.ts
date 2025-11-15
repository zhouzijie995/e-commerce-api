import {
  Table,
  Column,
  Model,
  DataType,
  ForeignKey,
} from 'sequelize-typescript';

import { Role } from './roles.model';
import { Permission } from '../permissions/permissions.model';

@Table({ tableName: 'role_permissions' })
export class RolePermission extends Model<RolePermission> {
  @ForeignKey(() => Role)
  @Column({
    type: DataType.INTEGER,
    allowNull: false,
  })
  roleId: number;

  @ForeignKey(() => Permission)
  @Column({
    type: DataType.INTEGER,
    allowNull: false,
  })
  permissionId: number;
}
