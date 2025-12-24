export const PERMISSIONS = {
  GROUP_READ: 'group.read',
  GROUP_WRITE: 'group.write',
  USER_READ: 'user.read',
  USER_WRITE: 'user.write',
} as const;

export const PERMISSION_NAME_MAP = {
  'group.read': '分组读取',
  'group.write': '分组写入',
  'user.read': '用户读取',
  'user.write': '用户写入',
} as const;

export const PERMISSION_LIST = Object.keys(PERMISSION_NAME_MAP).map((key) => ({
  key,
  name: PERMISSION_NAME_MAP[key],
}));
