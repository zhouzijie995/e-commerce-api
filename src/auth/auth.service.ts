import { Injectable, UnauthorizedException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { InjectModel } from '@nestjs/sequelize';
import { User } from '../users/users.model';
import * as bcrypt from 'bcryptjs';
import { UsersService } from 'src/users/users.service';

@Injectable()
export class AuthService {
  constructor(
    @InjectModel(User) private userModel: typeof User,
    private jwtService: JwtService,
    private usersService: UsersService,
  ) {}

  async register(name: string, password: string) {
    const existingUser = await this.usersService.findUserByName(name);
    if (existingUser) throw new UnauthorizedException('用户名已存在');

    const salt = await bcrypt.genSalt(10);
    const hash = await bcrypt.hash(password, salt);

    const user = await this.usersService.createUser({
      name,
      password: hash,
    });

    return { message: '注册成功', user };
  }

  async login(name: string, password: string) {
    const user = await this.usersService.findUserByName(name);
    if (!user) throw new UnauthorizedException('用户不存在');

    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) throw new UnauthorizedException('密码错误');
    const payload = { sub: user.id, name: user.name };
    const token = this.jwtService.sign(payload);
    return { message: '登录成功', token };
  }
  async validateUser(userId: number) {
    // 验证用户是否存在（用于守卫）
    return this.userModel.findByPk(userId); // 根据 ID 查找并返回用户
  }
}
