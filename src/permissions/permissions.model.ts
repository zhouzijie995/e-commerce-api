import { Model } from 'sequelize-typescript';
import {
  AllowNull,
  AutoIncrement,
  Column,
  DataType,
  PrimaryKey,
  Table,
} from 'sequelize-typescript';

@Table({ tableName: 'permissions' })
export class Permission extends Model<Permission> {
  @PrimaryKey
  @AutoIncrement
  @Column({
    type: DataType.INTEGER,
    allowNull: false,
  })
  declare id: number;

  @Column({
    type: DataType.STRING,
    allowNull: false,
    unique: true,
  })
  declare key: string;

  @Column({
    type: DataType.STRING,
    allowNull: true,
  })
  declare name?: string;

  @Column({
    type: DataType.STRING,
    allowNull: true,
  })
  declare description?: string;
}
