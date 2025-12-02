import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectModel } from '@nestjs/sequelize';
import { User } from './users.model';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { Group } from 'src/group/group.model';
import { Op } from 'sequelize';
import { Role } from 'src/roles/roles.model';
import { Permission } from 'src/permissions/permissions.model';
@Injectable()
export class UsersService {
  constructor(
    @InjectModel(User)
    private userModel: typeof User,
  ) {}

  async createUser(dto: CreateUserDto): Promise<User> {
    const user = await this.userModel.create(dto as any);
    return user;
  }

  async getUsers(page = 1, size = 10, name?: string, age?: number) {
    const offset = (page - 1) * size;
    // Op.eq 等于 =
    // Op.ne 不等于 !=
    // Op.gt 大于 >
    // Op.gte 大于等于 >=
    // Op.lt 小于 <
    // Op.lte 小于等于 <=
    // Op.like 模糊匹配 LIKE
    // Op.in 在某个数组内
    const where: any = {};
    if (name) {
      where.name = { [Op.like]: `%${name}%` };
    }
    if (age) {
      where.age = age;
    }
    const result = await this.userModel.findAndCountAll({
      limit: size,
      offset,
      where,
      order: [['createdAt', 'DESC']],
    });

    return {
      total: result.count,
      data: result.rows,
      page,
      size,
    };
  }

  async findUser(id: number): Promise<User> {
    const user = await this.userModel.findByPk(id, { include: [Group] });
    if (!user) throw new NotFoundException('用户不存在');
    return user;
  }
  async findUserByName(name: string): Promise<User | null> {
    return await this.userModel.findOne({ where: { name } });
  }

  async updateUser(id: number, dto: UpdateUserDto): Promise<User> {
    const user = await this.findUser(id);
    return await user.update(dto);
  }

  async deleteUser(id: number): Promise<void> {
    const user = await this.findUser(id);
    await user.destroy();
  }
  async findUserWithRolesAndPermissions(id: number): Promise<User | null> {
    return await this.userModel.findByPk(id, {
      include: [
        {
          model: Role,
          include: [Permission],
        },
      ],
    });
  }
  async findUserWithRoles(id: number): Promise<User> {
    const user = await this.userModel.findByPk(id, {
      include: [
        {
          model: Role,
          as: 'roles',
          through: { attributes: [] },
          attributes: { exclude: ['createdAt', 'updatedAt'] },
          include: [
            {
              model: Permission,
              as: 'permissions',
              through: { attributes: [] },
              attributes: { exclude: ['createdAt', 'updatedAt'] },
            },
          ],
        },
      ],
    });
    if (!user) throw new NotFoundException('用户不存在');
    return user;
  }

  async updateUserRoles(userId: number, roleIds: number[]): Promise<void> {
    const user = await this.findUserWithRoles(userId);
    console.log(roleIds, 'roleIds');

    const roles = await Role.findAll({
      where: { id: { [Op.in]: roleIds } },
    });

    await user.$set('roles', []);
    await user.$add('roles', roles);
  }
}
