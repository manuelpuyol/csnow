/* tslint:disable */
/* eslint-disable */
// This file was automatically generated and should not be edited.

import { CreateTournamentMutationInput } from "./globalTypes";

// ====================================================
// GraphQL mutation operation: CreateTournamentMutation
// ====================================================

export interface CreateTournamentMutation_createTournament_tournament {
  __typename: "Tournament";
  id: string;
  name: string;
}

export interface CreateTournamentMutation_createTournament {
  __typename: "CreateTournamentMutationPayload";
  tournament: CreateTournamentMutation_createTournament_tournament | null;
  errors: string[] | null;
}

export interface CreateTournamentMutation {
  createTournament: CreateTournamentMutation_createTournament | null;
}

export interface CreateTournamentMutationVariables {
  input: CreateTournamentMutationInput;
}
