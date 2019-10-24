import React, { Fragment } from 'react';
import { NAVIGATION_KEYS } from '@csnow/components/core/Navbar/Navbar';
import App from '@csnow/components/core/App/App';
import PageHeader from '@csnow/components/ui/PageHeader/PageHeader';
import PageContent from '@csnow/components/ui/PageContent/PageContent';
import TournamentListWithData from '@csnow/components/core/TournamentList/WithData/TournamentListWithData';

const TournamentsPage: React.FC = () => (
  <App selectedKey={NAVIGATION_KEYS.tournaments}>
    <Fragment>
      <PageHeader ghost={false} title="Tournaments" />
      <PageContent>
        <TournamentListWithData />
      </PageContent>
    </Fragment>
  </App>
);

export default TournamentsPage;
