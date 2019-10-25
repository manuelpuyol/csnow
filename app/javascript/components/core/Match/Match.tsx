import React from 'react';
import moment from 'moment';
import { MatchFragment } from '@csnow/schema/MatchFragment';
import Card from '@csnow/components/ui/Card/Card';

interface IMatchListProps {
  match: MatchFragment;
}

const MatchList: React.FC<IMatchListProps> = ({ match }) => {
  return (
    <Card key={match.id}>
      <pre>{JSON.stringify(match, null, 2)}</pre>
    </Card>
  );
};

export default MatchList;
