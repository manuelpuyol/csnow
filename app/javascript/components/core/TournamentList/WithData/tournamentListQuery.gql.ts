import gql from 'graphql-tag';
import tournamentFragment from './tournament.fragment.gql';

const tournamentListQuery = gql`
  query TournamentListQuery {
    tournaments {
      ...TournamentFragment
    }
  }
  ${tournamentFragment}
`;

export default tournamentListQuery;
