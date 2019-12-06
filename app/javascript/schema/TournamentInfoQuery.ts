/* tslint:disable */
/* eslint-disable */
// This file was automatically generated and should not be edited.

// ====================================================
// GraphQL query operation: TournamentInfoQuery
// ====================================================

export interface TournamentInfoQuery_tournament_matches {
  __typename: "Match";
  id: string;
  upperRosterId: string;
  lowerRosterId: string;
  winnerId: string | null;
}

export interface TournamentInfoQuery_tournament_rosters {
  __typename: "Roster";
  id: string;
  name: string | null;
  logo: string | null;
}

export interface TournamentInfoQuery_tournament {
  __typename: "Tournament";
  id: string;
  name: string;
  location: string | null;
  startAt: any;
  endAt: any;
  matches: TournamentInfoQuery_tournament_matches[];
  rosters: TournamentInfoQuery_tournament_rosters[];
}

export interface TournamentInfoQuery {
  tournament: TournamentInfoQuery_tournament;
}

export interface TournamentInfoQueryVariables {
  id: string;
}
