import gql from 'graphql-tag';

const tournamentFragment = gql`
  fragment TournamentFragment on Tournament {
    id
    name
    location
    startAt
    endAt
  }
`;

export default tournamentFragment;
