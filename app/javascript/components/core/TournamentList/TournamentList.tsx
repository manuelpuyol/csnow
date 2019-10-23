import React, { Fragment } from 'react';
import { TournamentFragment } from '@csnow/schema/TournamentFragment';
import { TournamentCard } from './TournamentList.style';

interface ITournamentList {
  tournaments: TournamentFragment[];
}

const TournamentList: React.FC<ITournamentList> = ({ tournaments }) => (
  <Fragment>
    {tournaments.map(tournament => (
      <TournamentCard key={tournament.id}>
        <pre>{JSON.stringify(tournament, null, 2)}</pre>
      </TournamentCard>
    ))}
  </Fragment>
);

export default TournamentList;
