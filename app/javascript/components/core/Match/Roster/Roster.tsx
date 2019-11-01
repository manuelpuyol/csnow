import React, { Fragment } from 'react';
import { MatchFragment_rosters } from '@csnow/schema/MatchFragment';
import { Text } from '@csnow/components/ui/Typography/Typography';
import { RosterImage, RosterContainer } from './Roster.style';

interface IRosterProps {
  roster?: MatchFragment_rosters;
  winner: boolean;
}

const Roster: React.FC<IRosterProps> = ({ roster, winner }) =>
  roster ? (
    <RosterContainer>
      <RosterImage src={roster.logo} />
      <Text fontSize="24px" weight={winner ? 'bold' : 'normal'}>
        {roster.name}
      </Text>
    </RosterContainer>
  ) : (
    <Text fontSize="24px" weight="bold">
      TBD
    </Text>
  );

export default Roster;
