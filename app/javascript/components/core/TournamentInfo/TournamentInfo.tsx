import React, { Fragment, useState } from 'react';
import { Col, Row, Button } from 'antd';
import { TournamentInfoFragment } from '@csnow/schema/TournamentInfoFragment';
import { MatchFragment } from '@csnow/schema/MatchFragment';
import PageHeader from '@csnow/components/ui/PageHeader/PageHeader';
import PageContent from '@csnow/components/ui/PageContent/PageContent';
import Card from '@csnow/components/ui/Card/Card';
import Roster from '../Match/Roster/Roster';
import Match from '../Match/Match';
import { MatchContainer } from './TournamentInfo.style';
import AddMatchModal from './Modal/AddMatchModal';

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
  const title = tournament.name;

  const [visible, setVisible] = useState<boolean>(false);

  const openModal = (): void => {
    setVisible(true);
  };

  const handleCancel = (): void => {
    setVisible(false);
  };

  const handleOk = (match): void => {
    debugger;
    tournament.matches.unshift(match);
    setVisible(false);
  };

  return (
    <Fragment>
      <PageHeader ghost={false} title={title} />
      <PageContent>
        <Row gutter={20}>
          <Col span={12}>
            <Card title="Participating rosters">
              {tournament.rosters.map(roster => (
                <MatchContainer key={roster.id}>
                  <Roster roster={roster} winner />
                  {buildPlacement(roster.id, tournament)}
                </MatchContainer>
              ))}
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
            </Card>
          </Col>
        </Row>
      </PageContent>
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
