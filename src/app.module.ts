import { Module } from '@nestjs/common';
import { SequelizeModule } from '@nestjs/sequelize';
import { UsersModule } from './users/users.module';
import { User } from './users/users.model';
import { AuthModule } from './auth/auth.module';
import { PostsModule } from './posts/posts.module';
import { Post } from './posts/post.model';
import { GroupModule } from './group/group.module';
import { Group } from './group/group.model';
import { ServeStaticModule } from '@nestjs/serve-static';
import { join } from 'path';
import { UploadModule } from './upload/upload.module';

import { UploadController } from './upload/upload.controller';
import { PermissionsService } from './permissions/permissions.service';
import { Permission } from './permissions/permissions.model';
import { Role } from './roles/roles.model';
import { RolePermission } from './roles/role-permission.model';

@Module({
  imports: [
    SequelizeModule.forRoot({
      dialect: 'postgres',
      host: 'localhost',
      port: 5432,
      username: 'nest_user',
      password: '123456',
      database: 'nest_demo',
      models: [User, Post, Group, Permission, Role, RolePermission],
      autoLoadModels: true,
      synchronize: true,
      logging: console.log,
    }),
    ServeStaticModule.forRoot({
      rootPath: join(__dirname, '..', 'uploads'),
      serveRoot: '/uploads',
    }),
    UploadModule,
    GroupModule,
    UsersModule,
    AuthModule,
    PostsModule,
  ],
  providers: [PermissionsService],
  controllers: [UploadController],
})
export class AppModule {}
