import React, { Fragment } from 'react';
import PageContent from '@csnow/components/ui/PageContent/PageContent';
import PageHeader from '@csnow/components/ui/PageHeader/PageHeader';

const MatchesPage: React.FC = () => (
  <Fragment>
    <PageHeader ghost={false} title="Matches" />
    <PageContent>
      <div>Home</div>
    </PageContent>
  </Fragment>
);

export default MatchesPage;
