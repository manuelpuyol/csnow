import React, { Fragment } from 'react';
import { TournamentFragment } from '@csnow/schema/TournamentFragment';
import Card from '@csnow/components/ui/Card/Card';

interface ITournamentListProps {
  tournaments: TournamentFragment[];
}

const TournamentList: React.FC<ITournamentListProps> = ({ tournaments }) => (
  <Fragment>
    {tournaments.map(tournament => (
      <Card key={tournament.id}>
        <pre>{JSON.stringify(tournament, null, 2)}</pre>
      </Card>
    ))}
  </Fragment>
);

export default TournamentList;
