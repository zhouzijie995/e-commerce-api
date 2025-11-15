import { IsString, IsOptional, IsNotEmpty } from 'class-validator';
import { Type } from 'class-transformer';
import e from 'express';
import { CreatePostDto } from './create-post-dto';

export class UpdatePostDto extends CreatePostDto {
  @IsString()
  @IsNotEmpty()
  id: string;
}
