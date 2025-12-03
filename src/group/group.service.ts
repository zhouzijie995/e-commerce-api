import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectModel } from '@nestjs/sequelize';
import { Group } from './group.model';
import { CreateGroupDto } from './dto/create-group.dto';
import { User } from 'src/users/users.model';
import { UpdateGroupDto } from './dto/update-group.dto';
import { Op } from 'sequelize';
@Injectable()
export class GroupService {
  constructor(
    @InjectModel(Group)
    private groupModel: typeof Group,
  ) {}
  async createGroup(dto: CreateGroupDto | { userId: number }): Promise<Group> {
    const group = await this.groupModel.create(dto as any);
    return group;
  }
  async updateGroup(dto: UpdateGroupDto): Promise<Group> {
    const group = await this.groupModel.findByPk(dto.id);
    if (!group) throw new NotFoundException('分组不存在');
    return await group.update(dto);
  }
  async getGroups(page = 1, size = 10, name?: string) {
    const offset = (page - 1) * size;
    const where: { [key: string]: unknown } = {};
    if (name) {
      where['name'] = { [Op.like]: `%${name}%` };
    }
    return this.groupModel.findAndCountAll({
      include: [
        {
          association: 'user',
          attributes: { exclude: ['password'] },
        },
      ],
      limit: size,
      offset,
      where,
      order: [['createdAt', 'DESC']],
    });
  }
  async findGroupByUser(groupId: number): Promise<Group> {
    const group = await this.groupModel.findByPk(groupId, {
      include: [{ model: User, as: 'users' }],
    });

    if (!group) throw new NotFoundException('分组不存在');
    return group;
  }
}
