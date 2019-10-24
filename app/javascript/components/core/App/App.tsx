import 'antd/dist/antd.css';
import 'bootstrap/dist/css/bootstrap-grid.min.css';
import React from 'react';
import Container from 'react-bootstrap/Container';
import { Layout, Menu, Icon } from 'antd';
import Navbar, { NavigationKey } from '@csnow/components/core/Navbar/Navbar';
import Provider from '@csnow/components/core/Provider/Provider';
import { AppContainer } from './App.style';

interface IAppProps {
  selectedKey: NavigationKey;
  children: React.ReactNode;
}

const App: React.FC<IAppProps> = ({ selectedKey, children }) => {
  const { Header, Footer, Content } = Layout;
  return (
    <Provider>
      <AppContainer>
        <Navbar selectedKey={selectedKey} />
        <Container>{children}</Container>
      </AppContainer>
    </Provider>
  );
};

export default App;
