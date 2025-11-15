import {
  Table,
  Column,
  Model,
  DataType,
  ForeignKey,
  BelongsTo,
  CreatedAt,
  UpdatedAt,
} from 'sequelize-typescript';
import { User } from '../users/users.model';
@Table({ tableName: 'posts' })
export class Post extends Model<Post> {
  @Column({ type: DataType.STRING, allowNull: false })
  title!: string;

  @Column({ type: DataType.TEXT })
  content!: string;

  // 外键：指向 users 表的 id
  @ForeignKey(() => User)
  @Column({ type: DataType.INTEGER })
  userId!: number;

  // 建立关联
  @BelongsTo(() => User)
  user!: User;

  @CreatedAt
  @Column({ type: DataType.DATE })
  declare createdAt: Date;

  @UpdatedAt
  @Column({ type: DataType.DATE })
  declare updatedAt: Date;
}
