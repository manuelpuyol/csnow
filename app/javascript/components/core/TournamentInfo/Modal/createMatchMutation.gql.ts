import gql from 'graphql-tag';
import matchFragment from '../../MatchList/WithData/matchFragment.gql';

const createMatchMutation = gql`
  mutation CreateMatchMutation($input: CreateMatchMutationInput!) {
    createMatch(input: $input) {
      match {
        ...MatchFragment
      }
    }
  }
  ${matchFragment}
`;

export default createMatchMutation;
