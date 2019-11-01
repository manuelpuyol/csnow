import styled from 'styled-components';

interface IText {
  fontSize: '14px' | '16px' | '20px' | '24px';
  color?: string;
  weight: '600' | 'bold' | 'normal';
}

export const Text = styled.span<IText>`
  font-size: ${props => props.fontSize || '14px'};
  ${props => (props.color ? `color: ${props.color};` : '')};
  ${props => (props.weight ? `font-weight: ${props.weight};` : '')};
`;
