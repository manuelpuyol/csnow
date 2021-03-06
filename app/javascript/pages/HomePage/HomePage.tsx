import React, { Fragment } from 'react';
import PageContent from '@csnow/components/ui/PageContent/PageContent';
import PageHeader from '@csnow/components/ui/PageHeader/PageHeader';

const HomePage: React.FC = () => (
  <Fragment>
    <PageHeader ghost={false} title="Home" />
    <PageContent>
      <div>Home</div>
    </PageContent>
  </Fragment>
);

export default HomePage;
