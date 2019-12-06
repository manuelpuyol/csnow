import gql from 'graphql-tag';

const tournamentInfoFragment = gql`
  fragment TournamentInfoFragment on Tournament {
    id
    name
    location
    startAt
    endAt
    matches {
      id
      upperRosterId
      lowerRosterId
      winnerId
    }
    rosters {
      id
      name
      logo
    }
  }
`;

export default tournamentInfoFragment;
