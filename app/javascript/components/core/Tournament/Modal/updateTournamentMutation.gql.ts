import gql from 'graphql-tag';
import tournamentFragment from '../../TournamentList/WithData/tournamentFragment.gql';

const tournamentQuery = gql`
  mutation UpdateTournamentMutation($input: UpdateTournamentMutationInput!) {
    updateTournament(input: $input) {
      tournament {
        ...TournamentFragment
      }
    }
  }
  ${tournamentFragment}
`;

export default tournamentQuery;
