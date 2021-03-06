import React, { Fragment, useState } from 'react';
import { Col, Row, Button } from 'antd';
import { TournamentInfoFragment } from '@csnow/schema/TournamentInfoFragment';
import { MatchFragment } from '@csnow/schema/MatchFragment';
import Card from '@csnow/components/ui/Card/Card';
import Roster from '../Match/Roster/Roster';
import Match from '../Match/Match';
import MatchListEmpty from '../MatchList/MatchListEmpty';
import { MatchContainer } from './TournamentInfo.style';
import AddMatchModal from './Modal/AddMatchModal';
import TournamentInfoEmptyRosters from './TournamentInfoEmptyRosters';

interface ITournamentInfoProps {
  tournament: TournamentInfoFragment;
}

const findRoster = (id, tournament) => {
  if (!id) return null;

  return tournament.rosters.find(roster => roster.id === id);
};

const buildMatch = (tournament, match): MatchFragment => ({
  __typename: 'Match',
  id: match.id,
  startAt: match.startAt,
  endAt: match.endAt,
  winnerId: match.winnerId,
  upperRosterId: match.upperRosterId,
  lowerRosterId: match.lowerRosterId,
  rosters: [
    findRoster(match.upperRosterId, tournament),
    findRoster(match.lowerRosterId, tournament),
  ],
  tournament,
});

const findPlacement = (id, tournament) => {
  return tournament.tournamentPlacements.find(
    placement => placement.rosterId === id,
  );
};

const buildPlacement = (id, tournament): React.ReactNode => {
  const placement = findPlacement(id, tournament);

  if (!placement) return <div />;

  return (
    <div>{`Placement: ${placement.place} - Prize: $${placement.prize}`}</div>
  );
};

const TournamentInfo: React.FC<ITournamentInfoProps> = ({ tournament }) => {
  const [visible, setVisible] = useState<boolean>(false);

  const openModal = (): void => {
    setVisible(true);
  };

  const handleCancel = (): void => {
    setVisible(false);
  };

  const handleOk = (match): void => {
    tournament.matches.unshift(match);
    setVisible(false);
  };

  return (
    <Fragment>
      <Row gutter={20}>
        <Col span={12}>
          <Card title="Participating rosters">
            {tournament.rosters.map(roster => (
              <MatchContainer key={roster.id}>
                <Roster roster={roster} winner />
                {buildPlacement(roster.id, tournament)}
              </MatchContainer>
            ))}
            {tournament.rosters.length === 0 && <TournamentInfoEmptyRosters />}
          </Card>
        </Col>
        <Col span={12}>
          <Card
            title="Matches"
            extra={
              <Button type="primary" onClick={openModal}>
                Add Match
              </Button>
            }
          >
            {tournament.matches.map(match => (
              <Match key={match.id} match={buildMatch(tournament, match)} />
            ))}
            {tournament.matches.length === 0 && <MatchListEmpty />}
          </Card>
        </Col>
      </Row>
      <AddMatchModal
        tournamentId={tournament.id}
        rosters={tournament.rosters}
        visible={visible}
        onOk={handleOk}
        onCancel={handleCancel}
      />
    </Fragment>
  );
};

export default TournamentInfo;
