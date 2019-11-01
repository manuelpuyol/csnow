import React from 'react';
import { MatchRosterFragment } from '@csnow/schema/MatchRosterFragment';
import { Text } from '@csnow/components/ui/Typography/Typography';
import { RosterImage, RosterContainer } from './Roster.style';

interface IRosterProps {
  roster?: MatchRosterFragment;
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
