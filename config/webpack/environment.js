const { environment } = require('@rails/webpacker');

environment.loaders.append('graphql', {
  test: /\.(graphql|gql)$/,
  exclude: /node_modules/,
  loader: 'graphql-tag/loader',
});

environment.loaders.append('typescript', {
  test: /.(ts|tsx)$/,
  loader: 'ts-loader',
});

module.exports = environment;
