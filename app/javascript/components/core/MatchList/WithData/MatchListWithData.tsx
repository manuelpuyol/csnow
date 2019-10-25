import React, { Fragment } from 'react';
import useQuery from '@csnow/services/hooks/useQuery';
import { MatchListQuery } from '@csnow/schema/MatchListQuery';
import matchListQuery from './matchListQuery.gql';
import MatchListLoading from '../MatchListLoading';
import MatchList from '../MatchList';

const MatchListWithData: React.FC = () => {
  const { data, loading } = useQuery<MatchListQuery, {}>(matchListQuery);
  return (
    <Fragment>
      {loading ? <MatchListLoading /> : <MatchList matches={data.matches} />}
    </Fragment>
  );
};

export default MatchListWithData;
