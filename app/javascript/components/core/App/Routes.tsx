import React from 'react';
import { Switch, Route } from 'react-router-dom';
import {
  NavigationKey,
  NAVIGATION_KEYS,
} from '@csnow/components/core/Navbar/Navbar';
import TournamentsPage from '@csnow/pages/TournamentsPage/TournamentsPage';
import MatchesPage from '@csnow/pages/MatchesPage/MatchesPage';
import TournamentPage from '@csnow/pages/TournamentPage/TournamentPage';

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
        return <TournamentsPage />;
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
    <Route
      path="/tournament/:id"
      exact
      render={props => {
        onRouteChange(NAVIGATION_KEYS.tournaments);
        return <TournamentPage tournamentId={props.match.params.id} />;
      }}
    />
  </Switch>
);

export default Routes;
