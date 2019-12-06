import gql from 'graphql-tag';
import tournamentInfoFragment from './tournamentInfoFragment.gql';

const tournamentInfoQuery = gql`
  query TournamentInfoQuery($id: ID!) {
    tournament(id: $id) {
      ...TournamentInfoFragment
    }
  }
  ${tournamentInfoFragment}
`;

export default tournamentInfoQuery;
