import React, { Fragment } from 'react';
import TournamentLoading from '@csnow/components/core/Tournament/TournamentLoading';

const TournamentListLoading: React.FC = () => (
  <Fragment>
    {[1, 2, 3, 4, 5].map(i => (
      <TournamentLoading key={i} />
    ))}
  </Fragment>
);

export default TournamentListLoading;
