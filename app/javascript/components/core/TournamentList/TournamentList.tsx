import React, { Fragment, useState } from 'react';
import { TournamentFragment } from '@csnow/schema/TournamentFragment';
import Tournament from '@csnow/components/core/Tournament/Tournament';
import TournamentListEmpty from './TournamentListEmpty';

interface ITournamentListProps {
  tournaments: TournamentFragment[];
}

const TournamentList: React.FC<ITournamentListProps> = ({ tournaments }) => {
  const [listedTournaments, setListedTournaments] = useState<
    TournamentFragment[]
  >(tournaments);

  const handleDelete = (id: string): void => {
    const newListedTournaments = tournaments.filter(
      tournament => tournament.id !== id,
    );

    setListedTournaments(newListedTournaments);
  };
  return (
    <Fragment>
      {listedTournaments.map(tournament => (
        <Tournament
          tournament={tournament}
          onDelete={handleDelete}
          key={tournament.id}
        />
      ))}
      {tournaments.length === 0 && <TournamentListEmpty />}
    </Fragment>
  );
};

export default TournamentList;
