import React from 'react';
import { Switch, Route } from 'react-router-dom';
import {
  NavigationKey,
  NAVIGATION_KEYS,
} from '@csnow/components/core/Navbar/Navbar';
import HomePage from '@csnow/pages/HomePage/HomePage';
import TournamentsPage from '@csnow/pages/TournamentsPage/TournamentsPage';
import MatchesPage from '@csnow/pages/MatchesPage/MatchesPage';

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
    <Route
      path="/matches"
      exact
      render={() => {
        onRouteChange(NAVIGATION_KEYS.matches);
        return <MatchesPage />;
      }}
    />
  </Switch>
);

export default Routes;
