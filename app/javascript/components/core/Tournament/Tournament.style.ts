import styled from 'styled-components';
import { Button } from 'antd';

export const TournamentFlagContainer = styled.div`
  display: inline-block;
  margin-right: 12px;
`;

export const TournamentContainer = styled.div`
  display: flex;
  justify-content: space-between;
`;

export const TournamentTeamCountContainer = styled.div`
  display: flex;
  align-items: center;
  flex-direction: column;
`;

export const TournamentActionsContainer = styled.div`
  text-align: right;
  margin-top: 8px;
`;

export const ActionButton = styled(Button)`
  margin-left: 8px;
  cursor: pointer;
`;
