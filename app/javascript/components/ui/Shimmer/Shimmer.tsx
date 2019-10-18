import styled, { keyframes } from 'styled-components';

interface IShimmerProps {
  height?: string;
  width?: string;
  circle?: boolean;
  className?: string;
}

const shimmerAnimation = keyframes`
  0% {
    background-position: -468px 0;
  }

  100% {
    background-position: 468px 0;
  }
`;

const Shimmer = styled.div<IShimmerProps>`
  height: ${props => props.height || '20px'};
  width: ${props => props.width || '100%'};
  border-radius: ${props => (props.circle ? '50%' : null)};
  background: #f3f5f7;
  background-image: linear-gradient(
    to right,
    #f3f5f7 0%,
    #ececec 20%,
    #f3f5f7 40%,
    #f3f5f7 100%
  );
  background-repeat: no-repeat;
  background-size: 800px 1000px;
  display: block;
  position: relative;

  animation-duration: 1s;
  animation-fill-mode: forwards;
  animation-iteration-count: infinite;
  animation-name: ${shimmerAnimation};
  animation-timing-function: linear;
`;

export default Shimmer;
