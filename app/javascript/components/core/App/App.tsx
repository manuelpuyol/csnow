import 'antd/dist/antd.css';
import React from 'react';
import { Layout, Menu, Icon } from 'antd';
import SidebarNavigation, {
  NavigationKey,
} from '../SidebarNavigation/SidebarNavigation';
import { AppContainer, AppContentContainer } from './App.style';

interface IAppProps {
  selectedKey: NavigationKey;
  children: React.ReactNode;
}

const App: React.FC<IAppProps> = ({ selectedKey, children }) => {
  const { Header, Footer, Content } = Layout;
  return (
    <AppContainer>
      <SidebarNavigation selectedKey={selectedKey} />
      <AppContentContainer>{children}</AppContentContainer>
    </AppContainer>
  );
};

export default App;
