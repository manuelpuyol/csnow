import gql from 'graphql-tag';

const matchFragment = gql`
  fragment MatchFragment on Match {
    id
    startAt
    endAt
    rosters {
      id
      name
      logo
    }
    winner {
      id
    }
    tournament {
      name
    }
  }
`;

export default matchFragment;
