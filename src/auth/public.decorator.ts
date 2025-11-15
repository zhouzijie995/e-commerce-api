import { SetMetadata } from '@nestjs/common';

// 定义元数据 key
export const IS_PUBLIC_KEY = 'isPublic';

// Public 装饰器
export const Public = () => SetMetadata(IS_PUBLIC_KEY, true);
