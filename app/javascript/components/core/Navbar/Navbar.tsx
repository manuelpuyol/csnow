import React from 'react';
import { Menu, Icon } from 'antd';
import Logo from '@csnow/assets/images/logo.png';
import UserPanel from '@csnow/components/ui/UserPanel/UserPanel';
import {
  NavbarMenu,
  NavbarHeader,
  NavbarLogo,
  NavbarContainer,
} from './Navbar.style';

export const NAVIGATION_KEYS = {
  matches: 'matches' as 'matches',
  tournaments: 'tournaments' as 'tournaments',
};

export type NavigationKey = keyof typeof NAVIGATION_KEYS;

interface INavbarProps {
  selectedKey?: NavigationKey;
}

const Navbar: React.FC<INavbarProps> = ({ selectedKey }) => (
  <NavbarHeader>
    <NavbarContainer>
      <NavbarLogo src={Logo} />
      <NavbarMenu theme="dark" mode="horizontal" selectedKeys={[selectedKey]}>
        <Menu.Item key={NAVIGATION_KEYS.tournaments}>
          <Icon type="user" />
          <span>Tournaments</span>
        </Menu.Item>
        <Menu.Item key={NAVIGATION_KEYS.matches}>
          <Icon type="user" />
          <span>Matches</span>
        </Menu.Item>
      </NavbarMenu>
      <UserPanel userName="Manuel Puyol" bold />
    </NavbarContainer>
  </NavbarHeader>
);

export default Navbar;
