import gql from 'graphql-tag';
import matchFragment from './matchFragment.gql';

const matchListQuery = gql`
  query MatchListQuery {
    matches {
      ...MatchFragment
    }
  }
  ${matchFragment}
`;

export default matchListQuery;
