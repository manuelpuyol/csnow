/* tslint:disable */
/* eslint-disable */
// This file was automatically generated and should not be edited.

// ====================================================
// GraphQL query operation: MatchListQuery
// ====================================================

export interface MatchListQuery_matches_rosters {
  __typename: "Roster";
  id: string;
  name: string | null;
  logo: string | null;
}

export interface MatchListQuery_matches_tournament {
  __typename: "Tournament";
  name: string;
}

export interface MatchListQuery_matches {
  __typename: "Match";
  id: string;
  startAt: any;
  endAt: any | null;
  upperRosterId: string;
  lowerRosterId: string;
  rosters: MatchListQuery_matches_rosters[];
  winnerId: string | null;
  tournament: MatchListQuery_matches_tournament;
}

export interface MatchListQuery {
  matches: MatchListQuery_matches[];
}
