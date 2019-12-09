import gql from 'graphql-tag';
import tournamentFragment from '../../TournamentList/WithData/tournamentFragment.gql';

const updateTournamentMutation = gql`
  mutation UpdateTournamentMutation($input: UpdateTournamentMutationInput!) {
    updateTournament(input: $input) {
      tournament {
        ...TournamentFragment
      }
      errors
    }
  }
  ${tournamentFragment}
`;

export default updateTournamentMutation;
