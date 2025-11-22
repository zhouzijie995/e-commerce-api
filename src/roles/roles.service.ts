import { Injectable, NotFoundException } from '@nestjs/common';
import { Role } from './roles.model';
import { InjectModel } from '@nestjs/sequelize';
import { Op } from 'sequelize';
import { Permission } from 'src/permissions/permissions.model';
@Injectable()
export class RolesService {
  constructor(
    @InjectModel(Role)
    private roleModel: typeof Role,
  ) {}
  getAll(page: number = 1, size: number = 10, name?: string) {
    const offset = (page - 1) * size;
    const limit = size;
    const where: any = {};
    if (name) {
      where.name = { [Op.like]: `%${name}%` };
    }
    return this.roleModel.findAndCountAll({ where, offset, limit });
  }

  create(data: Role) {
    return this.roleModel.create(data);
  }
  update(id: number, data: Partial<Role>) {
    return this.roleModel.update(data, { where: { id } });
  }
  async assignPermissionsToRole(
    roleId: number,
    permissionIds: number[],
  ): Promise<void> {
    const role = await this.roleModel.findByPk(roleId, {
      include: [Permission],
    });
    if (!role) throw new NotFoundException('角色不存在');

    const permissions = await Permission.findAll({
      where: { id: { [Op.in]: permissionIds } },
    });

    if (!permissions.length) {
      throw new NotFoundException('没有找到对应权限');
    }

    await role.$set('permissions', []); // 删除 role_permissions 中对应记录

    await role.$add(
      'permissions',
      permissions.map((p) => p.id),
    );
  }
}
