const { environment } = require('@rails/webpacker');
const path = require('path');

environment.loaders.append('graphql', {
  test: /\.(graphql|gql)$/,
  exclude: /node_modules/,
  loader: 'graphql-tag/loader',
});

environment.loaders.append('typescript', {
  test: /.(ts|tsx)$/,
  loader: 'ts-loader',
});

environment.config.merge({
  resolve: {
    alias: {
      '@csnow': path.resolve(__dirname, '../../app/javascript/'),
    },
  },
});

console.log(environment.toWebpackConfig());

module.exports = environment;
