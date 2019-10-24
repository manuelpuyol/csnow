import React from 'react';
import styled from 'styled-components';
import { getCode as getCountryCode } from 'country-list';
import RCFlag from 'react-country-flags';

interface ICountryFlagProps {
  location: string;
}

const getCode = (location: string): string => {
  if (location === 'Europe') {
    return 'eu';
  } else if (location === 'North America') {
    return 'us';
  } else if (location === 'Korea') {
    return 'kr';
  } else if (location === 'United States') {
    return 'us';
  } else if (location === 'United Kingdom') {
    return 'uk';
  } else if (location === 'Vietnam') {
    return 'vn';
  } else if (location === 'Oceania') {
    return 'au';
  } else if (location === 'Czech Republic') {
    return 'cz';
  }

  return getCountryCode(location);
};

const Flag = styled(RCFlag)`
  width: 25px;
  border: 1px solid black;
`;

const CountryFlag: React.FC<ICountryFlagProps> = ({ location }) =>
  getCode(location) ? <Flag country={getCode(location).toLowerCase()} /> : null;

export default CountryFlag;
