import React, { Fragment, useState } from 'react';
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
  ActionButton,
} from './Tournament.style';
import TournamentUpdateModal from './Modal/UpdateModal';

interface ITournamentProps {
  tournament: TournamentFragment;
}

const Tournament: React.FC<ITournamentProps> = ({ tournament }) => {
  const [visible, setVisible] = useState<boolean>(false);

  const openModal = (): void => {
    setVisible(true);
  };

  const handleCancel = (): void => {
    setVisible(false);
  };

  const handleOk = (): void => {
    setVisible(false);
  };

  return (
    <Card key={tournament.id}>
      <TournamentContainer>
        <div>
          <Text fontSize="24px" weight="bold">
            <Fragment>
              <TournamentFlagContainer>
                {tournament.location && (
                  <CountryFlag location={tournament.location} />
                )}
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
        <ActionButton type="primary" href={`/tournament/${tournament.id}`}>
          View
        </ActionButton>
        <ActionButton onClick={openModal}>Update</ActionButton>
        <ActionButton type="danger">Delete</ActionButton>
      </TournamentActionsContainer>
      <TournamentUpdateModal
        tournament={tournament}
        visible={visible}
        onOk={handleOk}
        onCancel={handleCancel}
      />
    </Card>
  );
};

export default Tournament;
