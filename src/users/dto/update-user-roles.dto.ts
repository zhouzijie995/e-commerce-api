import { IsArray, IsInt, ArrayNotEmpty, IsOptional } from 'class-validator';
import { Type } from 'class-transformer';

export class UpdateUserRolesDto {
  @IsOptional()
  @IsArray()
  @Type(() => Number)
  @IsInt({ each: true })
  roleIds?: number[];
}
