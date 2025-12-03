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
function hasPermission(userPermissions: string[], requiredPermission: string) {
  if (userPermissions.includes(requiredPermission)) {
    return true;
  }

  if (requiredPermission.endsWith('read')) {
    const writePermission = requiredPermission.replace('read', 'write');
    if (userPermissions.includes(writePermission)) {
      return true;
    }
  }

  return false;
}

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

    const res = await this.usersService.findUserWithRolesAndPermissions(userId);

    if (!res) {
      throw new UnauthorizedException('用户不存在');
    }
    const user = res.toJSON();
    const userPermissions = (user.roles || [])
      .flatMap((role) => role?.permissions)
      .map((p) => p?.key)
      .filter(Boolean);

    if (!hasPermission(userPermissions, requiredPermission)) {
      throw new ForbiddenException('权限不足');
    }
    return true;
  }
}
