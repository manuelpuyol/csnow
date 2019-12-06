import React, { Fragment } from 'react';
import TournamentInfoWithData from '@csnow/components/core/TournamentInfo/WithData/TournamentInfoWithData';

interface ITournamentPageProps {
  tournamentId: string;
}

const TournamentPage: React.FC<ITournamentPageProps> = ({ tournamentId }) => {
  return (
    <Fragment>
      <TournamentInfoWithData id={tournamentId} />
    </Fragment>
  );
};

export default TournamentPage;
