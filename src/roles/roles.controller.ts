import { Body, Controller, Get, Param, Post, Put, Query } from '@nestjs/common';
import { RolesService } from './roles.service';

@Controller('roles')
export class RolesController {
  constructor(private readonly rolesService: RolesService) {}

  @Get()
  async getAllRoles(
    @Query('page') page,
    @Query('size') size,
    @Query('name') name,
  ) {
    return this.rolesService.getAll(page, size, name);
  }

  @Post()
  async createRole(@Body() body) {
    return this.rolesService.create(body);
  }

  @Put()
  async updateRole(@Body() body) {
    console.log(body, 'body');

    const { id, ...data } = body;
    return this.rolesService.update(id, data);
  }
}
