import gql from 'graphql-tag';

const matchRosterFragment = gql`
  fragment MatchRosterFragment on Roster {
    id
    name
    logo
  }
`;

export default matchRosterFragment;
