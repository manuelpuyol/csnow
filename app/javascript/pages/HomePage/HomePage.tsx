import React, { Fragment } from 'react';
import PageContent from '@csnow/components/ui/PageContent/PageContent';
import PageHeader from '@csnow/components/ui/PageHeader/PageHeader';
import TournamentListWithData from '@csnow/components/core/TournamentList/WithData/TournamentListWithData';

const TournamentsPage: React.FC = () => (
  <Fragment>
    <PageHeader ghost={false} title="News" />
    <PageContent>
      <div>Home</div>
    </PageContent>
  </Fragment>
);

export default TournamentsPage;
