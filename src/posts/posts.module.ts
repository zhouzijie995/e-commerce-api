import { Module } from '@nestjs/common';
import { PostsService } from './posts.service';
import { PostsController } from './posts.controller';
import { User } from 'src/users/users.model';
import { Post } from './post.model';
import { SequelizeModule } from '@nestjs/sequelize';

@Module({
  imports: [SequelizeModule.forFeature([Post, User])],
  providers: [PostsService],
  controllers: [PostsController],
})
export class PostsModule {}
