import React, { Fragment } from 'react';
import useQuery from '@csnow/services/hooks/useQuery';
import {
  TournamentListQuery,
  TournamentListQueryVariables,
} from '@csnow/schema/TournamentListQuery';
import tournamentListQuery from './tournamentListQuery.gql';
import TournamentListLoading from '../TournamentListLoading';
import TournamentList from '../TournamentList';

interface ITournamentListWithDataProps {
  name: string | null;
  location: string | null;
  startDate: string | null;
}

const TournamentListWithData: React.FC<ITournamentListWithDataProps> = ({
  name,
  location,
  startDate,
}) => {
  const { data, loading } = useQuery<
    TournamentListQuery,
    TournamentListQueryVariables
  >(tournamentListQuery, {
    variables: {
      search: name,
      location,
      startDate,
    },
  });
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
