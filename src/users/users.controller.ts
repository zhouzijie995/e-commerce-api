import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  ParseIntPipe,
  Post,
  Put,
  Query,
  Req,
  UsePipes,
  ValidationPipe,
} from '@nestjs/common';
import { UsersService } from './users.service';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { UpdateUserRolesDto } from './dto/update-user-roles.dto';

@Controller('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Post()
  @UsePipes(new ValidationPipe({ whitelist: true, transform: true }))
  async create(@Body() body: CreateUserDto) {
    const user = await this.usersService.createUser(body);
    return user;
  }

  @Get()
  async findAll(
    @Query('page') page,
    @Query('size') size,
    @Query('name') name,
    @Query('age') age,
  ) {
    return this.usersService.getUsers(page, size, name, age);
  }

  @Get(':id')
  async findOne(@Param('id', ParseIntPipe) id: number) {
    return this.usersService.findUser(id);
  }
  @Get('userInfo/:id')
  async userInfo(@Param('id', ParseIntPipe) id: number) {
    return this.usersService.findUserWithRoles(id);
  }
  @Put(':id')
  @UsePipes(new ValidationPipe({ whitelist: true, transform: true }))
  async update(
    @Param('id', ParseIntPipe) id: number,
    @Body() body: UpdateUserDto,
  ) {
    return this.usersService.updateUser(id, body);
  }

  @Delete(':id')
  async remove(@Param('id', ParseIntPipe) id: number) {
    await this.usersService.deleteUser(id);
    return { message: '删除成功' };
  }

  @Put(':id/roles')
  async updateUserRoles(
    @Param('id', ParseIntPipe) id: number,
    @Body() body: UpdateUserRolesDto,
  ) {
    await this.usersService.updateUserRoles(id, body?.roleIds ?? []);
    return { message: '用户角色更新成功' };
  }
}
