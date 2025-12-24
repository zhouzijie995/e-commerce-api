/* eslint-disable @typescript-eslint/no-var-requires */
'use strict';

require('ts-node').register({
  transpileOnly: true,
});

const { PERMISSION_LIST } = require('../../permissions/permissions.constants');

module.exports = {
  async up(queryInterface) {
    console.log('同步permissions');

    const now = new Date();

    for (const p of PERMISSION_LIST) {
      await queryInterface.sequelize.query(
        `
        INSERT INTO permissions ("key", "name", "createdAt", "updatedAt")
        VALUES (:key, :name, :createdAt, :updatedAt)
        ON CONFLICT ("key")
        DO UPDATE SET
          "name" = EXCLUDED."name",
          "updatedAt" = EXCLUDED."updatedAt"
        `,
        {
          replacements: {
            key: p.key,
            name: p.name,
            createdAt: now,
            updatedAt: now,
          },
        },
      );
    }

    console.log('permissions同步完成');
  },

  async down() {},
};
