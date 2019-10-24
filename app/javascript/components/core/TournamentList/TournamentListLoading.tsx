import React, { Fragment } from 'react';
import { Skeleton } from 'antd';
import Card from '@csnow/components/ui/Card/Card';

const TournamentListLoading: React.FC = () => (
  <Fragment>
    {[1, 2, 3, 4, 5].map(i => (
      <Card key={i}>
        <Skeleton loading active />
      </Card>
    ))}
  </Fragment>
);

export default TournamentListLoading;
