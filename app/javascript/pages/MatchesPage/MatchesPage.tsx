import React, { Fragment } from 'react';
import PageContent from '@csnow/components/ui/PageContent/PageContent';
import PageHeader from '@csnow/components/ui/PageHeader/PageHeader';
import MatchListWithData from '@csnow/components/core/MatchList/WithData/MatchListWithData';

const MatchesPage: React.FC = () => (
  <Fragment>
    <PageHeader ghost={false} title="Matches" />
    <PageContent>
      <MatchListWithData />
    </PageContent>
  </Fragment>
);

export default MatchesPage;
