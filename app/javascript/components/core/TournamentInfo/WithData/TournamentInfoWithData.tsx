import React, { Fragment } from 'react';
import useQuery from '@csnow/services/hooks/useQuery';
import {
  TournamentInfoQuery,
  TournamentInfoQueryVariables,
} from '@csnow/schema/TournamentInfoQuery';
import tournamentInfoQuery from './tournamentInfoQuery.gql';
import TournamentInfoLoading from '../TournamentInfoLoading';
import TournamentInfo from '../TournamentInfo';

interface ITournamentInfoWithDataProps {
  id: string;
}

const TournamentInfoWithData: React.FC<ITournamentInfoWithDataProps> = ({
  id,
}) => {
  const { data, loading } = useQuery<
    TournamentInfoQuery,
    TournamentInfoQueryVariables
  >(tournamentInfoQuery, {
    variables: {
      id,
    },
  });
  return (
    <Fragment>
      {loading ? (
        <TournamentInfoLoading />
      ) : (
        <TournamentInfo tournament={data.tournament} />
      )}
    </Fragment>
  );
};

export default TournamentInfoWithData;
