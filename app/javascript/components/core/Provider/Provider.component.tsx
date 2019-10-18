import React from 'react';
import { ApolloProvider } from 'react-apollo';
import { createCache, createClient } from '@csnow/utils/apollo';

interface IApolloProvider {
  children: React.ReactNode;
}

const Provider: React.FC<IApolloProvider> = ({ children }) => (
  <ApolloProvider client={createClient(createCache())}>
    {children}
  </ApolloProvider>
);

export default Provider;
