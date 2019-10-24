import React, { Fragment } from 'react';
import { Typography } from 'antd';
import { TournamentFragment } from '@csnow/schema/TournamentFragment';
import Card from '@csnow/components/ui/Card/Card';
import CountryFlag from '@csnow/components/ui/CountryFlag/CountryFlag';
import { TournamentFlagContainer } from './TournamentList.style';

interface ITournamentListProps {
  tournaments: TournamentFragment[];
}

const TournamentList: React.FC<ITournamentListProps> = ({ tournaments }) => {
  const { Title } = Typography;
  return (
    <Fragment>
      {tournaments.map(tournament => (
        <Card key={tournament.id}>
          <Title level={4}>
            <Fragment>
              <TournamentFlagContainer>
                <CountryFlag location={tournament.location} />
              </TournamentFlagContainer>
              {tournament.name}
            </Fragment>
          </Title>

          <pre>{JSON.stringify(tournament, null, 2)}</pre>
        </Card>
      ))}
    </Fragment>
  );
};

export default TournamentList;
