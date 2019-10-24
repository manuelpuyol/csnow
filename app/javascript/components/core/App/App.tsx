import 'antd/dist/antd.css';
import 'bootstrap/dist/css/bootstrap-grid.min.css';
import React, { useState } from 'react';
import { BrowserRouter as Router } from 'react-router-dom';
import Container from 'react-bootstrap/Container';
import Navbar, { NavigationKey } from '@csnow/components/core/Navbar/Navbar';
import Provider from '@csnow/components/core/Provider/Provider';
import TournamentsPage from '@csnow/pages/TournamentsPage/TournamentsPage';
import HomePage from '@csnow/pages/HomePage/HomePage';
import { AppContainer, AppContent } from './App.style';
import Routes from './Routes';

const App: React.FC = () => {
  const [selectedKey, setSelectedKey] = useState<NavigationKey>(null);
  const handleRouteChange = (key: NavigationKey): void => {
    setSelectedKey(key);
  };

  return (
    <Provider>
      <Router>
        <AppContainer>
          <Navbar selectedKey={selectedKey} />
          <AppContent>
            <Container>
              <Routes onRouteChange={handleRouteChange} />
            </Container>
          </AppContent>
        </AppContainer>
      </Router>
    </Provider>
  );
};

export default App;
