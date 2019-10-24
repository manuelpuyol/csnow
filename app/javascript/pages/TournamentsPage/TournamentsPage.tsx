import React, { Fragment } from 'react';
import { NAVIGATION_KEYS } from '@csnow/components/core/Navbar/Navbar';
import { PageHeader } from 'antd';
import App from '@csnow/components/core/App/App';
import PageContent from '@csnow/components/ui/PageContent/PageContent';
import TournamentListWithData from '@csnow/components/core/TournamentList/WithData/TournamentListWithData';

const TournamentsPage: React.FC = () => (
  <App selectedKey={NAVIGATION_KEYS.tournaments}>
    <Fragment>
      <PageHeader
        ghost={false}
        onBack={() => window.history.back()}
        title="Tournaments"
      />
      <PageContent>
        <TournamentListWithData />
      </PageContent>
    </Fragment>
  </App>
);

export default TournamentsPage;
