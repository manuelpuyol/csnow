import React from 'react';
import styled from 'styled-components';
import { Avatar as AntdAvatar } from 'antd';

interface IAvatarProps {
  userName: string;
}

const getInitials = (fullName: string): string => {
  const names = fullName.split(' ');
  let initials = names[0].substring(0, 1).toUpperCase();

  if (names.length > 1) {
    initials += names[names.length - 1].substring(0, 1).toUpperCase();
  }
  return initials;
};

const AvatarStyled = styled(AntdAvatar)`
  background-color: #1890ff !important;
  vertical-align: middle;
  font-weight: bold;
`;

const Avatar: React.FC<IAvatarProps> = ({ userName }) => (
  <AvatarStyled size="large">{getInitials(userName)}</AvatarStyled>
);

export default Avatar;
