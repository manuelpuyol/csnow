import React, { Fragment } from 'react';
import PageHeader from '@csnow/components/ui/PageHeader/PageHeader';
import PageContent from '@csnow/components/ui/PageContent/PageContent';
import TournamentInfoWithData from '@csnow/components/core/TournamentInfo/WithData/TournamentInfoWithData';

interface ITournamentPageProps {
  tournamentId: string;
}

const TournamentPage: React.FC<ITournamentPageProps> = ({ tournamentId }) => {
  return (
    <Fragment>
      <PageHeader ghost={false} title="Tournament Info" />
      <PageContent>
        <TournamentInfoWithData id={tournamentId} />
      </PageContent>
    </Fragment>
  );
};

export default TournamentPage;
