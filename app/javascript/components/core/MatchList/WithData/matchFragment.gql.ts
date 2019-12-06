import gql from 'graphql-tag';
import matchRosterFragment from './matchRosterFragment.gql';

const matchFragment = gql`
  fragment MatchFragment on Match {
    id
    startAt
    endAt
    upperRosterId
    lowerRosterId
    rosters {
      ...MatchRosterFragment
    }
    winnerId
    tournament {
      name
    }
  }
  ${matchRosterFragment}
`;

export default matchFragment;
