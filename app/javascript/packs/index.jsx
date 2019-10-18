import React from 'react';
import { render } from 'react-dom';
import Provider from '../components/Provider/Provider.component';
import TournamentListWithData from '../components/TournamentList/WithData/TournamentListWithData';

render(
  <Provider>
    <TournamentListWithData />
  </Provider>,
  document.querySelector('#root'),
);
