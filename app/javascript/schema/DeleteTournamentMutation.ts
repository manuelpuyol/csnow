/* tslint:disable */
/* eslint-disable */
// This file was automatically generated and should not be edited.

import { DeleteTournamentMutationInput } from "./globalTypes";

// ====================================================
// GraphQL mutation operation: DeleteTournamentMutation
// ====================================================

export interface DeleteTournamentMutation_deleteTournament {
  __typename: "DeleteTournamentMutationPayload";
  errors: boolean;
}

export interface DeleteTournamentMutation {
  deleteTournament: DeleteTournamentMutation_deleteTournament | null;
}

export interface DeleteTournamentMutationVariables {
  input: DeleteTournamentMutationInput;
}
