import styled from 'styled-components';

export const UserPanelContainer = styled.div`
  display: flex;
  align-items: center;
`;

export const UserPanelAvatarContainer = styled.div`
  margin-right: 8px;
`;

export const UserPanelUserName = styled.span<{ bold: boolean }>`
  font-weight: ${props => (props.bold ? 'bold' : 'regular')};
  color: #ffffff;
`;
