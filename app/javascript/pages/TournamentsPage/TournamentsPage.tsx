import React, { Fragment } from 'react';
import { NAVIGATION_KEYS } from '@csnow/components/core/Navbar/Navbar';
import PageHeader from '@csnow/components/ui/PageHeader/PageHeader';
import PageContent from '@csnow/components/ui/PageContent/PageContent';
import TournamentListWithData from '@csnow/components/core/TournamentList/WithData/TournamentListWithData';

const TournamentsPage: React.FC = () => (
  <Fragment>
    <PageHeader ghost={false} title="Tournaments" />
    <PageContent>
      <TournamentListWithData />
    </PageContent>
  </Fragment>
);

export default TournamentsPage;
