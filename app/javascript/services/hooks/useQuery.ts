import {
  useQuery as useRAQuery,
  OperationVariables,
  QueryHookOptions,
  QueryResult as RAQueryResult,
} from 'react-apollo';
import { DocumentNode } from 'graphql';
import isEmpty from 'lodash/isEmpty';

export type IQueryResult<TData, TVariables> = RAQueryResult<
  TData,
  TVariables
> & {
  isFirstLoading: boolean;
};

type IUseQuery = <TData = any, TVariables = OperationVariables>(
  query: DocumentNode,
  options?: QueryHookOptions<TData, TVariables>,
) => IQueryResult<TData, TVariables>;

const useQuery: IUseQuery = (query, options) => {
  const response = useRAQuery(query, options);
  const isFirstLoading = isEmpty(response.data) && response.loading;
  return { ...response, isFirstLoading };
};

export default useQuery;
