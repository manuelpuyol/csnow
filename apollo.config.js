const { resolve } = require('path');

module.exports = {
  client: {
    includes: ['./app/javascript/**/*.gql.ts'],
    service: {
      localSchemaFile: './app/graphql/schema.graphql',
    },
  },
};
