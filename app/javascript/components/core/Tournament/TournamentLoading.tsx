import React from 'react';
import { Skeleton } from 'antd';
import Card from '@csnow/components/ui/Card/Card';

const TournamentLoading: React.FC = () => (
  <Card>
    <Skeleton loading active />
  </Card>
);

export default TournamentLoading;
