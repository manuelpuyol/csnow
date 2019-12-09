/* tslint:disable */
/* eslint-disable */
// This file was automatically generated and should not be edited.

import { UpdateTournamentMutationInput } from "./globalTypes";

// ====================================================
// GraphQL mutation operation: UpdateTournamentMutation
// ====================================================

export interface UpdateTournamentMutation_updateTournament_tournament {
  __typename: "Tournament";
  id: string;
  name: string;
  location: string | null;
  startAt: any;
  endAt: any;
  teamsCount: number | null;
}

export interface UpdateTournamentMutation_updateTournament {
  __typename: "UpdateTournamentMutationPayload";
  tournament: UpdateTournamentMutation_updateTournament_tournament | null;
  errors: string[] | null;
}

export interface UpdateTournamentMutation {
  updateTournament: UpdateTournamentMutation_updateTournament | null;
}

export interface UpdateTournamentMutationVariables {
  input: UpdateTournamentMutationInput;
}
