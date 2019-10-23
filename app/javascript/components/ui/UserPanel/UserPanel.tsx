import React from 'react';
import Avatar from '@csnow/components/ui/Avatar/Avatar';
import {
  UserPanelContainer,
  UserPanelAvatarContainer,
  UserPanelUserName,
} from './UserPanel.style';

interface IUserPanelProps {
  userName: string;
}

const UserPanel: React.FC<IUserPanelProps> = ({ userName }) => (
  <UserPanelContainer>
    <UserPanelAvatarContainer>
      <Avatar userName={userName} />
    </UserPanelAvatarContainer>
    <UserPanelUserName>{userName}</UserPanelUserName>
  </UserPanelContainer>
);

export default UserPanel;
