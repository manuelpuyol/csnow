import React from 'react';
import { render } from 'react-dom';
import App from '../components/core/App/App';
import { NAVIGATION_KEYS } from '../components/core/SidebarNavigation/SidebarNavigation';

render(
  <App selectedKey={NAVIGATION_KEYS.matches}>
    <div>top</div>
  </App>,
  document.querySelector('#root'),
);
