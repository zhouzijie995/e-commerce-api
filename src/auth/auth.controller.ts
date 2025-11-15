import {
  Controller,
  Post,
  Body,
  UseGuards,
  Get,
  Request,
} from '@nestjs/common';
import { AuthService } from './auth.service';
import { Public } from './public.decorator';
import { CreateUserDto } from 'src/users/dto/create-user.dto';
@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}
  @Public()
  @Post('register') // 注册接口 POST /auth/register
  register(@Body() body: CreateUserDto) {
    return this.authService.register(body.name, body.password); // 调用注册逻辑
  }
  @Public()
  @Post('login')
  login(@Body() body: { name: string; password: string }) {
    return this.authService.login(body.name, body.password);
  }

  @Get('profile')
  getProfile(@Request() req) {
    return req.user;
  }
}
