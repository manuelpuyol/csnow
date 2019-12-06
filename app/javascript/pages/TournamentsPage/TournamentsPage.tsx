import React, { Fragment, useState } from 'react';
import { Col, Row, Input, DatePicker, Select, Button } from 'antd';
import PageHeader from '@csnow/components/ui/PageHeader/PageHeader';
import PageContent from '@csnow/components/ui/PageContent/PageContent';
import TournamentListWithData from '@csnow/components/core/TournamentList/WithData/TournamentListWithData';
import {
  FiltersContainer,
  FiltersButtonContainer,
} from './TournamentsPage.style';

const InputGroup = Input.Group;
const { Option } = Select;

const locations = [
  'Argentina',
  'Australia',
  'Belgium',
  'Brazil',
  'China',
  'Czech Republic',
  'Denmark',
  'Europe',
  'Finland',
  'Hungary',
  'India',
  'Indonesia',
  'Japan',
  'Korea',
  'Mongolia',
  'Netherlands',
  'North America',
  'Oceania',
  'Other',
  'Philippines',
  'Poland',
  'Singapore',
  'South Africa',
  'South America',
  'Sweden',
  'Thailand',
  'Turkey',
  'United Arab Emirates',
  'United Kingdom',
  'United States',
  'Vietnam',
];

const TournamentsPage: React.FC = () => {
  const [name, setName] = useState<string | null>(null);
  const [location, setLocation] = useState<string | null>(null);
  const [date, setDate] = useState<string | null>(null);

  let searchText: string | null = name;
  let selectedLocation: string | null = location;
  let selectedDate: string | null = date;

  const handleClick = (): void => {
    setName(searchText);
    setLocation(selectedLocation);
    setDate(selectedDate);
  };

  return (
    <Fragment>
      <PageHeader ghost={false} title="Tournaments" />
      <PageContent>
        <FiltersContainer>
          <InputGroup>
            <Row gutter={12}>
              <Col span={8}>
                <Input
                  allowClear
                  placeholder="Search by tournament name"
                  defaultValue={searchText}
                  onChange={e => {
                    searchText = e.target.value;
                  }}
                />
              </Col>
              <Col span={8}>
                <Select
                  allowClear
                  showSearch
                  placeholder="Select tournament location"
                  style={{ width: '100%' }}
                  onChange={loc => {
                    selectedLocation = loc as string;
                  }}
                >
                  {locations.map(loc => (
                    <Option value={loc} key={loc}>
                      {loc}
                    </Option>
                  ))}
                </Select>
              </Col>
              <Col span={8}>
                <DatePicker
                  allowClear
                  placeholder="Tournaments starting after date"
                  style={{ width: '100%' }}
                  onChange={d => {
                    if (d) selectedDate = d.utc().toISOString();
                    else selectedDate = null;
                  }}
                />
              </Col>
            </Row>
          </InputGroup>
          <FiltersButtonContainer>
            <Button type="primary" htmlType="submit" onClick={handleClick}>
              Filter
            </Button>
          </FiltersButtonContainer>
        </FiltersContainer>
        <TournamentListWithData
          name={name}
          location={location}
          startDate={date}
        />
      </PageContent>
    </Fragment>
  );
};

export default TournamentsPage;
