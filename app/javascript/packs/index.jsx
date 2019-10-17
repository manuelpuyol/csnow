import React from 'react';
import { render } from 'react-dom';
import Provider from '../components/Provider';
import TournamentList from '../components/TournamentList';

render(
  <Provider>
    <TournamentList />
  </Provider>,
  document.querySelector('#root'),
);
