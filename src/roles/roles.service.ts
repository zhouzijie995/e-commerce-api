import { Injectable } from '@nestjs/common';
import { Role } from './roles.model';
import { InjectModel } from '@nestjs/sequelize';
import { Op } from 'sequelize';
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
}
