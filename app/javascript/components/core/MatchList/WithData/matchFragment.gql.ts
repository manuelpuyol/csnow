import gql from 'graphql-tag';
import matchRosterFragment from './matchRosterFragment.gql';

const matchFragment = gql`
  fragment MatchFragment on Match {
    id
    startAt
    endAt
    rosters {
      ...MatchRosterFragment
    }
    winner {
      id
    }
    tournament {
      name
    }
  }
  ${matchRosterFragment}
`;

export default matchFragment;
