import React from 'react';
import { Layout, Menu, Icon } from 'antd';
import UserPanel from '@csnow/components/ui/UserPanel/UserPanel';
import { SidebarNavigationUserPanelContainer } from './SidebarNavigation.style';

export const NAVIGATION_KEYS = {
  matches: 'matches' as 'matches',
  tournaments: 'tournaments' as 'tournaments',
};

export type NavigationKey = keyof typeof NAVIGATION_KEYS;

interface ISidebarNavigationProps {
  selectedKey: NavigationKey;
}

const SidebarNavigation: React.FC<ISidebarNavigationProps> = ({
  selectedKey,
}) => {
  const { Sider } = Layout;
  return (
    <Sider
      breakpoint="lg"
      collapsedWidth="0"
      style={{
        overflow: 'auto',
        height: '100vh',
        position: 'fixed',
        left: 0,
      }}
    >
      <SidebarNavigationUserPanelContainer>
        <UserPanel userName="Manuel Puyol" />
      </SidebarNavigationUserPanelContainer>
      <Menu theme="dark" mode="inline" selectedKeys={[selectedKey]}>
        <Menu.Item key={NAVIGATION_KEYS.tournaments}>
          <Icon type="user" />
          <span>Tournaments</span>
        </Menu.Item>
        <Menu.Item key={NAVIGATION_KEYS.matches}>
          <Icon type="user" />
          <span>Matches</span>
        </Menu.Item>
      </Menu>
    </Sider>
  );
};

export default SidebarNavigation;
