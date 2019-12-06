import React, { Fragment, useState } from 'react';
import { Col, Row, Input, DatePicker, Select, Button } from 'antd';
import locations from '@csnow/utils/locations';
import PageHeader from '@csnow/components/ui/PageHeader/PageHeader';
import PageContent from '@csnow/components/ui/PageContent/PageContent';
import TournamentListWithData from '@csnow/components/core/TournamentList/WithData/TournamentListWithData';
import CreateTournamentModal from '@csnow/components/core/CreateTournamentModal/CreateTournamentModal';
import {
  FiltersContainer,
  FiltersButtonContainer,
} from './TournamentsPage.style';

const InputGroup = Input.Group;
const { Option } = Select;

const TournamentsPage: React.FC = () => {
  const [name, setName] = useState<string | null>(null);
  const [location, setLocation] = useState<string | null>(null);
  const [date, setDate] = useState<string | null>(null);
  const [visible, setVisible] = useState<boolean>(false);

  let searchText: string | null = name;
  let selectedLocation: string | null = location;
  let selectedDate: string | null = date;

  const handleClick = (): void => {
    setName(searchText);
    setLocation(selectedLocation);
    setDate(selectedDate);
  };

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
    <Fragment>
      <PageHeader
        ghost={false}
        title="Tournaments"
        extra={[
          <Button type="primary" onClick={openModal}>
            Create Tournament
          </Button>,
        ]}
      />
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
              Search
            </Button>
          </FiltersButtonContainer>
        </FiltersContainer>
        <TournamentListWithData
          name={name}
          location={location}
          startDate={date}
        />
      </PageContent>
      <CreateTournamentModal
        visible={visible}
        onOk={handleOk}
        onCancel={handleCancel}
      />
    </Fragment>
  );
};

export default TournamentsPage;
