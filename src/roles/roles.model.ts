import {
  Table,
  Model,
  AutoIncrement,
  DataType,
  PrimaryKey,
  Column,
  BelongsToMany,
} from 'sequelize-typescript';
import { Permission } from 'src/permissions/permissions.model';
import { RolePermission } from './role-permission.model';
import { User } from 'src/users/users.model';
import { UserRoles } from './user-roles.model';

@Table({ tableName: 'roles' })
export class Role extends Model<Role> {
  @PrimaryKey
  @AutoIncrement
  @Column({ type: DataType.INTEGER })
  declare id: number;

  @Column({
    type: DataType.STRING,
    allowNull: false,
    unique: true,
  })
  name: string;

  @Column({
    type: DataType.STRING,
    allowNull: true,
  })
  description?: string;

  @BelongsToMany(() => Permission, () => RolePermission)
  permissions: Permission[];

  @BelongsToMany(() => User, () => UserRoles)
  users: User[];
}
