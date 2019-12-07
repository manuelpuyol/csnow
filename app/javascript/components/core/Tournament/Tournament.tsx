import React, { Fragment, useState } from 'react';
import moment from 'moment';
import { useMutation } from 'react-apollo';
import { message } from 'antd';
import { TournamentFragment } from '@csnow/schema/TournamentFragment';
import Card from '@csnow/components/ui/Card/Card';
import { Text } from '@csnow/components/ui/Typography/Typography';
import CountryFlag from '@csnow/components/ui/CountryFlag/CountryFlag';
import {
  DeleteTournamentMutation,
  DeleteTournamentMutationVariables,
} from '@csnow/schema/DeleteTournamentMutation';
import {
  TournamentContainer,
  TournamentFlagContainer,
  TournamentTeamCountContainer,
  TournamentActionsContainer,
  ActionButton,
} from './Tournament.style';
import TournamentUpdateModal from './Modal/UpdateModal';
import deleteTournamentMutation from './deleteTournamentMutation.gql';

interface ITournamentProps {
  tournament: TournamentFragment;
  onDelete: (id: string) => void;
}

const Tournament: React.FC<ITournamentProps> = ({ tournament, onDelete }) => {
  const [visible, setVisible] = useState<boolean>(false);

  const [deleteTournament] = useMutation<
    DeleteTournamentMutation,
    DeleteTournamentMutationVariables
  >(deleteTournamentMutation);

  const openModal = (): void => {
    setVisible(true);
  };

  const handleCancel = (): void => {
    setVisible(false);
  };

  const handleOk = (): void => {
    setVisible(false);
  };

  const handleDelete = (): void => {
    deleteTournament({
      variables: {
        input: {
          id: tournament.id,
        },
      },
    })
      .then(response => {
        if (response.data.deleteTournament.errors) {
          message.error(
            'Oh no, something went wrong while deleting the tournament',
          );
        } else {
          onDelete(tournament.id);
          message.success(`${tournament.name} has been deleted successfully`);
        }
      })
      .catch(e => {
        message.error('Uh oh, some unexpected error happened', e);
      });
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
        <ActionButton type="danger" onClick={handleDelete}>
          Delete
        </ActionButton>
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
