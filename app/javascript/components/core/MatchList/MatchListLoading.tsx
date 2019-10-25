import React, { Fragment } from 'react';
import MatchLoading from '@csnow/components/core/Match/MatchLoading';

const MatchListLoading: React.FC = () => (
  <Fragment>
    {[1, 2, 3, 4, 5].map(i => (
      <MatchLoading key={i} />
    ))}
  </Fragment>
);

export default MatchListLoading;
