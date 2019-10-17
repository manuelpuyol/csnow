import gql from 'graphql-tag';

export default gql`
  query TournamentListQuery {
    tournaments {
      id
      name
      location
      startAt
      endAt
    }
  }
`;
