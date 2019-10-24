import React from 'react';
import styled from 'styled-components';
import { getCode as getCountryCode } from 'country-list';
import RCFlag from 'react-country-flags';

interface ICountryFlagProps {
  location: string;
}

const getCode = (location: string): string => {
  if (location === 'Europe') return 'eu';
  if (location === 'North America') return 'us';
  if (location === 'Korea') return 'kr';
  if (location === 'United States') return 'us';
  if (location === 'United Kingdom') return 'uk';
  if (location === 'Vietnam') return 'vn';
  if (location === 'Oceania') return 'au';
  if (location === 'Czech Republic') return 'cz';

  return getCountryCode(location);
};

const Flag = styled(RCFlag)`
  width: 25px;
  border: 1px solid black;
`;

const CountryFlag: React.FC<ICountryFlagProps> = ({ location }) =>
  getCode(location) ? <Flag country={getCode(location).toLowerCase()} /> : null;

export default CountryFlag;
