import {
  CanActivate,
  ExecutionContext,
  Injectable,
  UnauthorizedException,
  ForbiddenException,
} from '@nestjs/common';
import { Reflector } from '@nestjs/core';
import { PERMISSION_KEY } from './require-permission-decorator';
import { JwtService } from '@nestjs/jwt';
import { UsersService } from 'src/users/users.service';

@Injectable()
export class PermissionGuard implements CanActivate {
  constructor(
    private reflector: Reflector,
    private jwtService: JwtService,
    private usersService: UsersService,
  ) {}

  async canActivate(context: ExecutionContext): Promise<boolean> {
    const requiredPermission = this.reflector.get<string>(
      PERMISSION_KEY,
      context.getHandler(),
    );

    if (!requiredPermission) {
      return true;
    }

    const request = context.switchToHttp().getRequest();
    const token = request.headers.authorization?.replace('Bearer ', '');

    if (!token) {
      throw new UnauthorizedException('请先登录');
    }

    const payload = this.jwtService.verify(token);
    const userId = payload.sub;

    const user =
      await this.usersService.findUserWithRolesAndPermissions(userId);

    if (!user) {
      throw new UnauthorizedException('用户不存在');
    }

    const userPermissions = (user.roles || [])
      .flatMap((role) => role?.permissions)
      .map((p) => p?.key)
      .filter(Boolean);

    if (!userPermissions.includes(requiredPermission)) {
      throw new ForbiddenException('权限不足');
    }
    return true;
  }
}
