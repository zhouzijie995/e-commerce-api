import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectModel } from '@nestjs/sequelize';
import { Post } from './post.model';
import { User } from 'src/users/users.model';
import { CreatePostDto } from './dto/create-post-dto';
import { UpdatePostDto } from './dto/update-post-dto';
@Injectable()
export class PostsService {
  constructor(@InjectModel(Post) private postModel: typeof Post) {}

  async createPost(dto: CreatePostDto & { userId: number }): Promise<Post> {
    const post = await this.postModel.create(dto as any);
    return post;
  }

  async putPost(dto: UpdatePostDto): Promise<Post> {
    const post = await this.postModel.findByPk(dto.id);
    if (!post) throw new NotFoundException('帖子不存在');
    await post.update(dto);
    return post;
  }

  async deletePost(id: number): Promise<void> {
    const post = await this.postModel.findByPk(id);
    if (!post) throw new NotFoundException('帖子不存在');
    await post.destroy();
  }

  async getPosts() {
    //{ all: true }
    return this.postModel.findAll({ include: [User] });
  }
}
