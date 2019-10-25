import React from 'react';
import { Menu, Icon } from 'antd';
import Logo from '@csnow/assets/images/logo.png';
import UserPanel from '@csnow/components/ui/UserPanel/UserPanel';
import {
  NavbarMenu,
  NavbarHeader,
  NavbarLogo,
  NavbarContainer,
  NavbarLink,
} from './Navbar.style';

export const NAVIGATION_KEYS = {
  home: 'home' as 'home',
  matches: 'matches' as 'matches',
  tournaments: 'tournaments' as 'tournaments',
};

export type NavigationKey = keyof typeof NAVIGATION_KEYS;

interface INavbarProps {
  selectedKey: NavigationKey;
}

const Navbar: React.FC<INavbarProps> = ({ selectedKey }) => (
  <NavbarHeader>
    <NavbarContainer>
      <NavbarLink to="/">
        <NavbarLogo src={Logo} />
      </NavbarLink>
      <NavbarMenu theme="dark" mode="horizontal" selectedKeys={[selectedKey]}>
        <Menu.Item key={NAVIGATION_KEYS.tournaments}>
          <NavbarLink to="/tournaments">
            <Icon type="trophy" />
            <span>Tournaments</span>
          </NavbarLink>
        </Menu.Item>
        <Menu.Item key={NAVIGATION_KEYS.matches}>
          <NavbarLink to="/matches">
            <Icon type="calendar" />
            <span>Matches</span>
          </NavbarLink>
        </Menu.Item>
      </NavbarMenu>
      <UserPanel userName="Manuel Puyol" bold />
    </NavbarContainer>
  </NavbarHeader>
);

export default Navbar;
