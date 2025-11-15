import { extname } from 'path';

export class FileUtil {
  static generateFilename(originalName: string): string {
    const ext = extname(originalName); // 提取扩展名
    // const timestamp = Date.now(); // 当前时间戳
    const random = Math.floor(Math.random() * 1e6); // 6位随机数
    return `${random}-${originalName}`; // 拼接成新文件名
  }
}
