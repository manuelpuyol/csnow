import React from 'react';
import { Switch, Route } from 'react-router-dom';
import {
  NavigationKey,
  NAVIGATION_KEYS,
} from '@csnow/components/core/Navbar/Navbar';
import TournamentsPage from '@csnow/pages/TournamentsPage/TournamentsPage';
import HomePage from '@csnow/pages/HomePage/HomePage';

interface IRoutesProps {
  onRouteChange: (key: NavigationKey) => void;
}

const Routes: React.FC<IRoutesProps> = ({ onRouteChange }) => (
  <Switch>
    <Route
      path="/"
      exact
      render={() => {
        onRouteChange(NAVIGATION_KEYS.home);
        return <HomePage />;
      }}
    />
    <Route
      path="/tournaments"
      exact
      render={() => {
        onRouteChange(NAVIGATION_KEYS.tournaments);
        return <TournamentsPage />;
      }}
    />
  </Switch>
);

export default Routes;
