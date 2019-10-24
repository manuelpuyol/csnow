import React, { Fragment } from 'react';
import { TournamentFragment } from '@csnow/schema/TournamentFragment';
import Tournament from '@csnow/components/core/Tournament/Tournament';

interface ITournamentListProps {
  tournaments: TournamentFragment[];
}

const TournamentList: React.FC<ITournamentListProps> = ({ tournaments }) => (
  <Fragment>
    {tournaments.map(tournament => (
      <Tournament tournament={tournament} key={tournament.id} />
    ))}
  </Fragment>
);

export default TournamentList;
