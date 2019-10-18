import React, { Fragment } from 'react';
import useQuery from '@csnow/services/hooks/useQuery';
import { TournamentListQuery } from '@csnow/schema/TournamentListQuery';
import tournamentListQuery from './tournamentListQuery.gql';
import TournamentListLoading from '../TournamentListLoading';
import TournamentList from '../TournamentList';

const TournamentListWithData: React.FC = () => {
  const { data, loading } = useQuery<TournamentListQuery, {}>(
    tournamentListQuery,
  );
  return (
    <Fragment>
      {loading ? (
        <TournamentListLoading />
      ) : (
        <TournamentList tournaments={data.tournaments} />
      )}
    </Fragment>
  );
};

export default TournamentListWithData;
