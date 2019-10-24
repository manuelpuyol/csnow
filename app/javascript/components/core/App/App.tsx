import 'antd/dist/antd.css';
import 'bootstrap/dist/css/bootstrap-grid.min.css';
import React from 'react';
import Container from 'react-bootstrap/Container';
import Navbar, { NavigationKey } from '@csnow/components/core/Navbar/Navbar';
import Provider from '@csnow/components/core/Provider/Provider';
import { AppContainer, AppContent } from './App.style';

interface IAppProps {
  selectedKey?: NavigationKey;
  children: React.ReactNode;
}

const App: React.FC<IAppProps> = ({ selectedKey, children }) => (
  <Provider>
    <AppContainer>
      <Navbar selectedKey={selectedKey} />
      <AppContent>
        <Container>{children}</Container>
      </AppContent>
    </AppContainer>
  </Provider>
);

export default App;
