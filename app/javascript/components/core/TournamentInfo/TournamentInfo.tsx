import React, { Fragment } from 'react';
import { TournamentInfoFragment } from '@csnow/schema/TournamentInfoFragment';

interface ITournamentInfoProps {
  tournament: TournamentInfoFragment;
}

const TournamentInfo: React.FC<ITournamentInfoProps> = ({ tournament }) => (
  <Fragment>
    <div>{tournament.id}</div>
  </Fragment>
);

export default TournamentInfo;
