import e from 'express';
import {
  DataType,
  Model,
  Table,
  Column,
  PrimaryKey,
  AutoIncrement,
  CreatedAt,
  UpdatedAt,
  BelongsTo,
  ForeignKey,
  HasMany,
} from 'sequelize-typescript';

import { User } from 'src/users/users.model';

@Table({ tableName: 'groups' })
export class Group extends Model<Group> {
  @PrimaryKey
  @AutoIncrement
  @Column({ type: DataType.INTEGER })
  declare id: number;

  @Column({ type: DataType.STRING, allowNull: false })
  name!: string;

  @Column({ type: DataType.STRING, allowNull: true })
  description?: string;

  @CreatedAt
  @Column({ type: DataType.DATE })
  declare createdAt: Date;

  @ForeignKey(() => User)
  @Column({ type: DataType.INTEGER })
  userId!: number;

  @BelongsTo(() => User)
  user!: User;

  @HasMany(() => User)
  users!: User[];

  @UpdatedAt
  @Column({ type: DataType.DATE })
  declare updatedAt: Date;
}
