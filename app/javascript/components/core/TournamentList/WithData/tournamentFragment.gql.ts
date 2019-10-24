import gql from 'graphql-tag';

const tournamentFragment = gql`
  fragment TournamentFragment on Tournament {
    id
    name
    location
    startAt
    endAt
    teamsCount
  }
`;

export default tournamentFragment;
