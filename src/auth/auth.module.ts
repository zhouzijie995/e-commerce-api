import { Module } from '@nestjs/common';
import { JwtModule } from '@nestjs/jwt';
import { PassportModule } from '@nestjs/passport';
import { SequelizeModule } from '@nestjs/sequelize';
import { AuthService } from './auth.service';
import { AuthController } from './auth.controller';
import { User } from '../users/users.model';
import { JwtStrategy } from './jwt.strategy';
import { UsersModule } from 'src/users/users.module';
import { JwtAuthGuard } from './auth-guard';
@Module({
  imports: [
    UsersModule,
    PassportModule,
    JwtModule.register({
      secret: 'MY_SECRET_KEY', // JWT 加密秘钥（开发阶段写死，生产放 .env）
      signOptions: { expiresIn: '24h' }, // Token 有效期 1 小时
    }),
    SequelizeModule.forFeature([User]),
  ],
  providers: [AuthService, JwtStrategy, JwtAuthGuard],
  controllers: [AuthController],
})
export class AuthModule {}
