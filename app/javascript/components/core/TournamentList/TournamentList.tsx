import React, { Fragment } from 'react';
import { TournamentFragment } from '@csnow/schema/TournamentFragment';

interface ITournamentList {
  tournaments: TournamentFragment[];
}

const TournamentList: React.FC<ITournamentList> = ({ tournaments }) => (
  <Fragment>
    {tournaments.map(tournament => (
      <div key={tournament.id}>
        <pre>{JSON.stringify(tournament, null, 2)}</pre>
      </div>
    ))}
  </Fragment>
);

export default TournamentList;
