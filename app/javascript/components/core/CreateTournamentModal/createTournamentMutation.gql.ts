import gql from 'graphql-tag';

const createTournamentMutation = gql`
  mutation CreateTournamentMutation($input: CreateTournamentMutationInput!) {
    createTournament(input: $input) {
      tournament {
        id
        name
      }
      errors
    }
  }
`;

export default createTournamentMutation;
