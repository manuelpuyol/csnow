import React from 'react';
import moment from 'moment';
import { MatchFragment } from '@csnow/schema/MatchFragment';
import { Text } from '@csnow/components/ui/Typography/Typography';
import Card from '@csnow/components/ui/Card/Card';
import { RostersContainer, MatchVersusContainer } from './Match.style';
import Roster from './Roster/Roster';

interface IMatchProps {
  match: MatchFragment;
}

const Match: React.FC<IMatchProps> = ({ match }) => {
  const leftRoster = match.rosters[0];
  const rightRoster = match.rosters[1];
  const winnerId = match.winner && match.winner.id;

  return (
    <Card key={match.id}>
      <RostersContainer>
        <div>
          <Roster
            roster={leftRoster}
            winner={winnerId && leftRoster && leftRoster.id === winnerId}
          />
        </div>
        <MatchVersusContainer>
          <Text fontSize="14px" weight="bold">
            vs
          </Text>
        </MatchVersusContainer>
        <div>
          <Roster
            roster={rightRoster}
            winner={winnerId && rightRoster && rightRoster.id === winnerId}
          />
        </div>
      </RostersContainer>
      <div>
        {`${match.tournament.name} - ${moment(match.startAt).format(
          'MMM Do YYYY',
        )}`}
      </div>
    </Card>
  );
};

export default Match;
