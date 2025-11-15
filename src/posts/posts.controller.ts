import { Controller, Delete, Param, Post, Put } from '@nestjs/common';
import { CreatePostDto } from './dto/create-post-dto';
import { Body, Get, Request, UsePipes, ValidationPipe } from '@nestjs/common';
import { PostsService } from './posts.service';
@Controller('posts')
export class PostsController {
  constructor(private readonly postsService: PostsService) {}
  @Post()
  async create(@Body() body: CreatePostDto, @Request() req) {
    const post = await this.postsService.createPost({
      ...body,
      userId: req.user.id,
    });
    return post;
  }

  @Get()
  async findAll() {
    return this.postsService.getPosts();
  }

  @Put()
  async update(@Body() body) {
    return this.postsService.putPost(body);
  }
  @Delete(':id')
  async remove(@Param('id') id: number) {
    await this.postsService.deletePost(id);
    return { message: '删除成功' };
  }
}
