import {
  Controller,
  Post,
  Get,
  Body,
  Request,
  Param,
  Put,
  Query,
  Inject,
} from '@nestjs/common';
import { GroupService } from './group.service';
import { CreateGroupDto } from './dto/create-group.dto';
import { UpdateGroupDto } from './dto/update-group.dto';
import { log } from 'console';

@Controller('group')
export class GroupController {
  constructor(private readonly groupService: GroupService) {}

  @Post()
  async createGroup(@Body() body: CreateGroupDto, @Request() req) {
    return await this.groupService.createGroup({
      ...body,
      userId: req.user.id,
    });
  }
  @Put()
  async updateGroup(@Body() body: UpdateGroupDto) {
    return await this.groupService.updateGroup(body);
  }
  @Get()
  async getGroups(
    @Query('page') page,
    @Query('size') size,
    @Query('name') name,
  ) {
    return await this.groupService.getGroups(page, size, name);
  }

  @Get(':id')
  async findGroup(@Param('id') id: number) {
    return await this.groupService.findGroupByUser(id);
  }
}
