import {
  IsString,
  IsOptional,
  IsInt,
  Min,
  IsNotEmpty,
  MinLength,
} from 'class-validator';
import { Is } from 'sequelize-typescript';
export class CreateGroupDto {
  @IsString()
  @IsNotEmpty()
  name: string;

  @IsString()
  @IsOptional()
  description?: string;
}
