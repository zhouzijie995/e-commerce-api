import { Injectable } from '@nestjs/common';

import Redis from 'ioredis';

@Injectable()
export class RedisService {
  private client: Redis;
  constructor() {
    this.client = new Redis({
      host: '127.0.0.1',
      port: 6379,
    });
  }
  async get(key: string) {
    const data = await this.client.get(key);
    return data ? JSON.parse(data) : null;
  }
  async set(key: string, value: any, expire?: number) {
    const val = JSON.stringify(value);
    if (expire) {
      await this.client.set(key, val, 'EX', expire);
    } else {
      await this.client.set(key, val);
    }
  }
  async del(key: string) {
    await this.client.del(key);
  }
}
