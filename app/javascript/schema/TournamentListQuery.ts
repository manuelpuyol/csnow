/* tslint:disable */
/* eslint-disable */
// This file was automatically generated and should not be edited.

// ====================================================
// GraphQL query operation: TournamentListQuery
// ====================================================

export interface TournamentListQuery_tournaments {
  __typename: "Tournament";
  id: string;
  name: string;
  location: string | null;
  startAt: any;
  endAt: any;
}

export interface TournamentListQuery {
  tournaments: TournamentListQuery_tournaments[];
}
