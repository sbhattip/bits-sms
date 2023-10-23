import React from 'react';
import {
  CDBSidebar,
  CDBSidebarContent,
  CDBSidebarHeader,
  CDBSidebarMenu,
  CDBSidebarMenuItem,
} from 'cdbreact';
import { NavLink } from 'react-router-dom';
import { Navbar } from 'react-bootstrap';
import logo from '../static/logo.png';
import "../App.css";


const Navigation = () => {
  return (
    <div>
      <Navbar id="my-nav" fixedTop
        style={{backgroundSize: "0", backgroundColor: "#D8D8D8"}}>
        <Navbar.Brand className="app-logo" href="/">
          <div className='logo-title'>
            <img
              src={logo}
              width="70"
              height="70"
              className="d-inline-block align-center"
              alt="React Bootstrap logo"
            />{' '}
            BITS Student Management System
          </div>
        </Navbar.Brand>
      </Navbar>
      <div className='sidebar'>
        <CDBSidebar textColor="#333" backgroundColor="#3457D5">
          <CDBSidebarHeader prefix={<i className="fa fa-bars" />} className="nav-head-text">
            Navigation
          </CDBSidebarHeader>
          <CDBSidebarContent className="side-content-nav">
            <CDBSidebarMenu>
              <NavLink exact to="/" activeClassName="activeClicked">
                <CDBSidebarMenuItem icon="home" className="nav-text">Home</CDBSidebarMenuItem>
              </NavLink>
              <NavLink exact to="/students" activeClassName="activeClicked">
                <CDBSidebarMenuItem icon="list" className="nav-text">Students List</CDBSidebarMenuItem>
              </NavLink>
              <NavLink exact to="/manage" activeClassName="activeClicked">
                <CDBSidebarMenuItem icon="user" className="nav-text">Manage Students</CDBSidebarMenuItem>
              </NavLink>
            </CDBSidebarMenu>
          </CDBSidebarContent>
        </CDBSidebar>
      </div>
    </div>
  );
};

export default Navigation;