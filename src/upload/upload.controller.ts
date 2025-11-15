import {
  Controller,
  Post,
  UploadedFile,
  UseInterceptors,
  Req,
} from '@nestjs/common';

import { Public } from '../auth/public.decorator';
import { FileInterceptor } from '@nestjs/platform-express';
import { diskStorage } from 'multer';

import { FileUtil } from './utils';
import { log } from 'console';
@Controller('upload')
export class UploadController {
  @Public()
  @Post()
  @UseInterceptors(
    FileInterceptor('file', {
      storage: diskStorage({
        destination: './uploads',
        filename: (req, file, cb) => {
          try {
            const uploadName = FileUtil.generateFilename(file.originalname);
            cb(null, uploadName);
          } catch (error) {
            cb(error, null);
          }
        },
      }),
    }),
  )
  async uploadFile(@UploadedFile() file: any, @Req() req) {
    const fileUrl = `${req.protocol}://${req.get('host')}/uploads/${file.filename}`;

    return {
      url: fileUrl,
      filename: file.filename,
      // size: file.size,
      // mimetype: file.mimetype,
    };
  }
}
