import React, { Fragment } from 'react';
import { Col, Row, Skeleton } from 'antd';
import Card from '@csnow/components/ui/Card/Card';
import MatchListLoading from '../MatchList/MatchListLoading';

const TournamentInfoLoading: React.FC = () => (
  <Fragment>
    <Row gutter={20}>
      <Col span={12}>
        <Card title="Participating rosters">
          <Skeleton loading active paragraph={{ rows: 1 }} title={false} />
          <Skeleton loading active paragraph={{ rows: 1 }} title={false} />
          <Skeleton loading active paragraph={{ rows: 1 }} title={false} />
          <Skeleton loading active paragraph={{ rows: 1 }} title={false} />
          <Skeleton loading active paragraph={{ rows: 1 }} title={false} />
          <Skeleton loading active paragraph={{ rows: 1 }} title={false} />
        </Card>
      </Col>
      <Col span={12}>
        <Card title="Matches">
          <MatchListLoading />
        </Card>
      </Col>
    </Row>
  </Fragment>
);

export default TournamentInfoLoading;
