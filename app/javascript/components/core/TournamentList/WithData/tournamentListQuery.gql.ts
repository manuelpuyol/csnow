import gql from 'graphql-tag';
import tournamentFragment from './tournamentFragment.gql';

const tournamentListQuery = gql`
  query TournamentListQuery(
    $search: String
    $location: String
    $startDate: Time
  ) {
    tournaments(search: $search, location: $location, startDate: $startDate) {
      ...TournamentFragment
    }
  }
  ${tournamentFragment}
`;

export default tournamentListQuery;
