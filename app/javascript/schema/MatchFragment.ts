/* tslint:disable */
/* eslint-disable */
// This file was automatically generated and should not be edited.

// ====================================================
// GraphQL fragment: MatchFragment
// ====================================================

export interface MatchFragment_rosters {
  __typename: "Roster";
  id: string;
  name: string | null;
  logo: string | null;
}

export interface MatchFragment_tournament {
  __typename: "Tournament";
  name: string;
}

export interface MatchFragment {
  __typename: "Match";
  id: string;
  startAt: any;
  endAt: any | null;
  upperRosterId: string;
  lowerRosterId: string;
  rosters: MatchFragment_rosters[];
  winnerId: string | null;
  tournament: MatchFragment_tournament;
}
