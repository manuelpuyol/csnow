import React, { Fragment } from 'react';
import { Button } from 'antd';
import moment from 'moment';
import { TournamentFragment } from '@csnow/schema/TournamentFragment';
import Card from '@csnow/components/ui/Card/Card';
import { Text } from '@csnow/components/ui/Typography/Typography';
import CountryFlag from '@csnow/components/ui/CountryFlag/CountryFlag';
import {
  TournamentContainer,
  TournamentFlagContainer,
  TournamentTeamCountContainer,
  TournamentActionsContainer,
} from './Tournament.style';

interface ITournamentProps {
  tournament: TournamentFragment;
}

const Tournament: React.FC<ITournamentProps> = ({ tournament }) => (
  <Card key={tournament.id}>
    <TournamentContainer>
      <div>
        <Text fontSize="24px" weight="bold">
          <Fragment>
            <TournamentFlagContainer>
              <CountryFlag location={tournament.location} />
            </TournamentFlagContainer>
            {tournament.name}
          </Fragment>
        </Text>
        <div>
          {`${moment(tournament.startAt).format('MMM Do YYYY')} - ${moment(
            tournament.endAt,
          ).format('MMM Do YYYY')}`}
        </div>
      </div>
      <TournamentTeamCountContainer>
        <Text fontSize="24px" weight="bold">
          {tournament.teamsCount}
        </Text>
        <span>Teams</span>
      </TournamentTeamCountContainer>
    </TournamentContainer>
    <TournamentActionsContainer>
      <Button type="primary" href={`/tournament/${tournament.id}`}>
        View
      </Button>
      <Button type="danger">Delete</Button>
    </TournamentActionsContainer>
  </Card>
);

export default Tournament;
