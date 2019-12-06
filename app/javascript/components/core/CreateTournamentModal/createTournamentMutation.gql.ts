import gql from 'graphql-tag';

const createTournamentMutation = gql`
  mutation CreateTournamentMutation($input: CreateTournamentMutationInput!) {
    createTournament(input: $input) {
      tournament {
        id
      }
    }
  }
`;

export default createTournamentMutation;
