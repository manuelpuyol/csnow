import gql from 'graphql-tag';

const deleteTournamentMutation = gql`
  mutation DeleteTournamentMutation($input: DeleteTournamentMutationInput!) {
    deleteTournament(input: $input) {
      errors
    }
  }
`;

export default deleteTournamentMutation;
