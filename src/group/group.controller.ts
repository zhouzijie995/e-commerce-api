import {
  Controller,
  Post,
  Get,
  Body,
  Request,
  Param,
  Put,
  Query,
  UseGuards,
} from '@nestjs/common';
import { GroupService } from './group.service';
import { CreateGroupDto } from './dto/create-group.dto';
import { UpdateGroupDto } from './dto/update-group.dto';
import { RequirePermission } from 'src/permissions/require-permission-decorator';
import { PermissionGuard } from 'src/permissions/permission.guard';
@UseGuards(PermissionGuard)
@Controller('group')
export class GroupController {
  constructor(private readonly groupService: GroupService) {}

  @RequirePermission('group.write')
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
