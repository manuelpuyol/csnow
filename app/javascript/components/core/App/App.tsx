import 'antd/dist/antd.css';
import React from 'react';
import { Layout, Menu, Icon } from 'antd';
import SidebarNavigation, {
  NavigationKey,
} from '@csnow/components/core/SidebarNavigation/SidebarNavigation';
import Provider from '@csnow/components/core/Provider/Provider';
import { AppContainer, AppContentContainer } from './App.style';

interface IAppProps {
  selectedKey: NavigationKey;
  children: React.ReactNode;
}

const App: React.FC<IAppProps> = ({ selectedKey, children }) => {
  const { Header, Footer, Content } = Layout;
  return (
    <Provider>
      <AppContainer>
        <SidebarNavigation selectedKey={selectedKey} />
        <AppContentContainer>{children}</AppContentContainer>
      </AppContainer>
    </Provider>
  );
};

export default App;