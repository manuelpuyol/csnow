import React, { Fragment, useState } from 'react';

interface ITournamentPageProps {
  tournamentId: string;
}

const TournamentPage: React.FC<ITournamentPageProps> = ({ tournamentId }) => {
  return (
    <Fragment>
      <div>{tournamentId}</div>
    </Fragment>
  );
};

export default TournamentPage;
