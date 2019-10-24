import { Layout, Menu } from 'antd';
import styled from 'styled-components';

const { Header } = Layout;

export const NavbarContainer = styled.div`
  display: flex;
  align-items: center;
  margin-top: -16px;
`;

export const NavbarLogo = styled.img`
  height: 95px;
  width: 125px;
  margin-right: 50px;
`;

export const NavbarHeader = styled(Header)`
  position: fixed;
  z-index: 1;
  width: 100%;
  top: 0;
`;

export const NavbarMenu = styled(Menu)`
  line-height: 64px;
  flex: 1;
`;
