import React, { Fragment } from 'react';
import { Typography } from 'antd';
import moment from 'moment';
import { TournamentFragment } from '@csnow/schema/TournamentFragment';
import Card from '@csnow/components/ui/Card/Card';
import CountryFlag from '@csnow/components/ui/CountryFlag/CountryFlag';
import {
  TournamentContainer,
  TournamentFlagContainer,
  TournamentTeamCountContainer,
} from './Tournament.style';

interface ITournamentProps {
  tournament: TournamentFragment;
}

const Tournament: React.FC<ITournamentProps> = ({ tournament }) => {
  const { Title } = Typography;
  return (
    <Card key={tournament.id}>
      <TournamentContainer>
        <div>
          <Title level={4}>
            <Fragment>
              <TournamentFlagContainer>
                <CountryFlag location={tournament.location} />
              </TournamentFlagContainer>
              {tournament.name}
            </Fragment>
          </Title>
          <div>
            {`${moment(tournament.startAt).format('MMM Do YYYY')} - ${moment(
              tournament.endAt,
            ).format('MMM Do YYYY')}`}
          </div>
        </div>
        <TournamentTeamCountContainer>
          <Title level={4}>{tournament.teamsCount}</Title>
          <span>Teams</span>
        </TournamentTeamCountContainer>
      </TournamentContainer>
    </Card>
  );
};

export default Tournament;
