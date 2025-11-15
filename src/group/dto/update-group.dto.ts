import { PartialType } from '@nestjs/mapped-types';
import { CreateGroupDto } from './create-group.dto';
import { IsNotEmpty, IsOptional, IsString } from 'class-validator';

export class UpdateGroupDto extends PartialType(CreateGroupDto) {
  @IsString()
  @IsOptional()
  name?: string;

  @IsString()
  @IsNotEmpty()
  id: number;

  @IsString()
  @IsOptional()
  description?: string;
}
