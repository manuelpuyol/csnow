import React from 'react';
import { Query } from 'react-apollo';
import TournamentListQuery from './query.gql';

export default () => (
  <Query query={TournamentListQuery}>
    {({ data, loading }) => (
      <div>
        {loading
          ? 'loading...'
          : data.tournaments.map(tournament => (
              <div key={tournament.id}>
                <pre>{JSON.stringify(tournament, null, 2)}</pre>
              </div>
            ))}
      </div>
    )}
  </Query>
);
