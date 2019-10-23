import React from 'react';
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

const Avatar: React.FC<IAvatarProps> = ({ userName }) => (
  <AntdAvatar
    style={{ backgroundColor: this.state.color, verticalAlign: 'middle' }}
    size="large"
  >
    {getInitials(userName)}
  </AntdAvatar>
);

export default Avatar;
