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
      startAt
      endAt
    }
    tournamentPlacements {
      rosterId
      prize
      place
    }
    rosters {
      id
      name
      logo
    }
  }
`;

export default tournamentInfoFragment;
