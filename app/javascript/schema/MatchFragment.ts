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

export interface MatchFragment_winner {
  __typename: "Roster";
  id: string;
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
  rosters: MatchFragment_rosters[];
  winner: MatchFragment_winner | null;
  tournament: MatchFragment_tournament;
}
