/* tslint:disable */
/* eslint-disable */
// This file was automatically generated and should not be edited.

// ====================================================
// GraphQL fragment: TournamentInfoFragment
// ====================================================

export interface TournamentInfoFragment_matches {
  __typename: "Match";
  id: string;
  upperRosterId: string;
  lowerRosterId: string;
  winnerId: string | null;
  startAt: any;
  endAt: any | null;
}

export interface TournamentInfoFragment_tournamentPlacements {
  __typename: "TournamentPlacement";
  rosterId: string;
  prize: number | null;
  place: number;
}

export interface TournamentInfoFragment_rosters {
  __typename: "Roster";
  id: string;
  name: string | null;
  logo: string | null;
}

export interface TournamentInfoFragment {
  __typename: "Tournament";
  id: string;
  name: string;
  location: string | null;
  startAt: any;
  endAt: any;
  matches: TournamentInfoFragment_matches[];
  tournamentPlacements: TournamentInfoFragment_tournamentPlacements[];
  rosters: TournamentInfoFragment_rosters[];
}
