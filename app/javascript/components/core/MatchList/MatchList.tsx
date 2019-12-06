import React, { Fragment } from 'react';
import { MatchFragment } from '@csnow/schema/MatchFragment';
import Match from '@csnow/components/core/Match/Match';
import MatchListEmpty from './MatchListEmpty';

interface IMatchListProps {
  matches: MatchFragment[];
}

const MatchList: React.FC<IMatchListProps> = ({ matches }) => (
  <Fragment>
    {matches.map(match => (
      <Match match={match} key={match.id} />
    ))}
    {matches.length === 0 && <MatchListEmpty />}
  </Fragment>
);

export default MatchList;
