import React from 'react';
import Avatar from '@csnow/components/ui/Avatar/Avatar';
import {
  UserPanelContainer,
  UserPanelAvatarContainer,
  UserPanelUserName,
} from './UserPanel.style';

interface IUserPanelProps {
  userName: string;
  bold: boolean;
}

const UserPanel: React.FC<IUserPanelProps> = ({ userName, bold }) => (
  <UserPanelContainer>
    <UserPanelAvatarContainer>
      <Avatar userName={userName} />
    </UserPanelAvatarContainer>
    <UserPanelUserName bold={bold}>{userName}</UserPanelUserName>
  </UserPanelContainer>
);

export default UserPanel;
