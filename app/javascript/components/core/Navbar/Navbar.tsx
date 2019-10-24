import React from 'react';
import { Layout, Menu, Icon } from 'antd';
import Logo from '@csnow/assets/images/logo.png';
import UserPanel from '@csnow/components/ui/UserPanel/UserPanel';
import { NavbarLogo, NavbarContainer } from './Navbar.style';

export const NAVIGATION_KEYS = {
  matches: 'matches' as 'matches',
  tournaments: 'tournaments' as 'tournaments',
};

export type NavigationKey = keyof typeof NAVIGATION_KEYS;

interface INavbarProps {
  selectedKey: NavigationKey;
}

const Navbar: React.FC<INavbarProps> = ({ selectedKey }) => {
  const { Header } = Layout;
  return (
    <Header style={{ position: 'fixed', zIndex: 100, width: '100%' }}>
      <NavbarContainer>
        <NavbarLogo src={Logo} />
        <Menu
          theme="dark"
          mode="horizontal"
          selectedKeys={[selectedKey]}
          style={{ lineHeight: '64px', flex: '1' }}
        >
          <Menu.Item key={NAVIGATION_KEYS.tournaments}>
            <Icon type="user" />
            <span>Tournaments</span>
          </Menu.Item>
          <Menu.Item key={NAVIGATION_KEYS.matches}>
            <Icon type="user" />
            <span>Matches</span>
          </Menu.Item>
        </Menu>
        <UserPanel userName="Manuel Puyol" bold />
      </NavbarContainer>
    </Header>
  );
};

export default Navbar;
