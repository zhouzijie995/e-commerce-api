import {
  Table,
  Column,
  Model,
  DataType,
  PrimaryKey,
  AutoIncrement,
  CreatedAt,
  UpdatedAt,
  HasMany,
  ForeignKey,
  BelongsTo,
  BelongsToMany,
} from 'sequelize-typescript';
import { Post } from '../posts/post.model';
import { Group } from 'src/group/group.model';
import { Role } from 'src/roles/roles.model';
import { UserRoles } from 'src/roles/user-roles.model';
@Table({ tableName: 'users', freezeTableName: true })
export class User extends Model<User> {
  @PrimaryKey
  @AutoIncrement
  @Column({ type: DataType.INTEGER })
  declare id: number;

  @Column({ type: DataType.STRING, allowNull: false, unique: true })
  declare name: string;
  @ForeignKey(() => Group)
  @Column({ type: DataType.INTEGER, allowNull: true })
  declare groupId?: number;

  @BelongsTo(() => Group)
  declare group?: Group;

  @Column({ type: DataType.INTEGER, allowNull: true })
  declare age: number;

  @Column({ type: DataType.STRING, allowNull: true })
  declare avatar: string;

  @Column({ type: DataType.STRING, allowNull: false })
  declare password: string;

  @CreatedAt
  @Column({ type: DataType.DATE })
  declare createdAt: Date;

  @UpdatedAt
  @Column({ type: DataType.DATE })
  declare updatedAt: Date;
  @HasMany(() => Post)
  posts!: Post[];

  @BelongsToMany(() => Role, () => UserRoles)
  roles: Role[];

  toJSON() {
    const values = { ...this.get() };
    Reflect.deleteProperty(values, 'password');
    return values;
  }
}
