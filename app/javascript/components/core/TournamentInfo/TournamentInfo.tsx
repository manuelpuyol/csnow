import React, { Fragment } from 'react';
import { Col, Row } from 'antd';
import { TournamentInfoFragment } from '@csnow/schema/TournamentInfoFragment';
import { MatchFragment } from '@csnow/schema/MatchFragment';
import PageHeader from '@csnow/components/ui/PageHeader/PageHeader';
import PageContent from '@csnow/components/ui/PageContent/PageContent';
import Card from '@csnow/components/ui/Card/Card';
import Roster from '../Match/Roster/Roster';
import Match from '../Match/Match';

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
  winner: findRoster(match.winnerId, tournament),
  rosters: [
    findRoster(match.upperRosterId, tournament),
    findRoster(match.lowerRosterId, tournament),
  ],
  tournament,
});

const TournamentInfo: React.FC<ITournamentInfoProps> = ({ tournament }) => {
  const title = tournament.name;

  return (
    <Fragment>
      <PageHeader ghost={false} title={title} />
      <PageContent>
        <Row gutter={20}>
          <Col span={12}>
            <Card title="Participating rosters">
              {tournament.rosters.map(roster => (
                <Roster key={roster.id} roster={roster} winner />
              ))}
            </Card>
          </Col>
          <Col span={12}>
            <Card title="Matches">
              {tournament.matches.map(match => (
                <Match key={match.id} match={buildMatch(tournament, match)} />
              ))}
            </Card>
          </Col>
        </Row>
      </PageContent>
    </Fragment>
  );
};

export default TournamentInfo;
