/* tslint:disable */
/* eslint-disable */
// This file was automatically generated and should not be edited.

import { CreateMatchMutationInput } from "./globalTypes";

// ====================================================
// GraphQL mutation operation: CreateMatchMutation
// ====================================================

export interface CreateMatchMutation_createMatch_match_rosters {
  __typename: "Roster";
  id: string;
  name: string | null;
  logo: string | null;
}

export interface CreateMatchMutation_createMatch_match_winner {
  __typename: "Roster";
  id: string;
}

export interface CreateMatchMutation_createMatch_match_tournament {
  __typename: "Tournament";
  name: string;
}

export interface CreateMatchMutation_createMatch_match {
  __typename: "Match";
  id: string;
  startAt: any;
  endAt: any | null;
  rosters: CreateMatchMutation_createMatch_match_rosters[];
  winner: CreateMatchMutation_createMatch_match_winner | null;
  tournament: CreateMatchMutation_createMatch_match_tournament;
}

export interface CreateMatchMutation_createMatch {
  __typename: "CreateMatchMutationPayload";
  match: CreateMatchMutation_createMatch_match;
}

export interface CreateMatchMutation {
  createMatch: CreateMatchMutation_createMatch | null;
}

export interface CreateMatchMutationVariables {
  input: CreateMatchMutationInput;
}
