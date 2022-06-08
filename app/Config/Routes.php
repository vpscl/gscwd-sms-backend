<?php

namespace Config;

// Create a new instance of our RouteCollection class.
$routes = Services::routes();

// Load the system's routing file first, so that the app and ENVIRONMENT
// can override as needed.
if (file_exists(SYSTEMPATH . 'Config/Routes.php')) {
    require SYSTEMPATH . 'Config/Routes.php';
}

/*
 * --------------------------------------------------------------------
 * Router Setup
 * --------------------------------------------------------------------
 */
$routes->setDefaultNamespace('App\Controllers');
$routes->setDefaultController('Home');
$routes->setDefaultMethod('index');
$routes->setTranslateURIDashes(false);
$routes->set404Override();
$routes->setAutoRoute(true);

/*
 * --------------------------------------------------------------------
 * Route Definitions
 * --------------------------------------------------------------------
 */

// We get a performance increase by specifying the default
// route since we don't have to scan directories.
// $routes->get('/', 'Home::index');
$routes->resource('Sub_task');
$routes->resource('User');  
$routes->resource('Task'); 
$routes->resource('Ticket'); 
$routes->resource('Admin');
$routes->resource('Office'); 
$routes->resource('Department'); 
$routes->resource('Division'); 
$routes->resource('Incident');
$routes->get('view/(:segment)', 'Ticket::view/$1');
//          ('url/id' , 'controller::function/id)
$routes->get('check', 'User::check');
$routes->get('done/(:segment)/(:segment)', 'Ticket::done/$1/$2');
$routes->get('category/(:segment)/(:segment)', 'Ticket::category/$1/$2');
$routes->get('pending/(:segment)/(:segment)', 'Ticket::pending/$1/$2');
$routes->get('ticket2/(:segment)/(:segment)', 'Ticket::ticket2/$1/$2');
$routes->get('pending2/(:segment)/(:segment)/(:segment)', 'Ticket::pending2/$1/$2/$3');
$routes->get('pending3/(:segment)/(:segment)', 'Ticket::pending3/$1/$2');
$routes->get('slip_status/(:segment)/(:segment)/(:segment)', 'Ticket::slip_status/$1/$2/$3');
$routes->get('donestaff/(:segment)/(:segment)/(:segment)', 'Ticket::done2/$1/$2/$3');
$routes->get('print-done/(:segment)/(:segment)', 'Ticket::done4/$1/$2');
$routes->get('print-done/staff/(:segment)/(:segment)', 'Ticket::done5/$1/$2');
$routes->get('print-done2/(:segment)/(:segment)/(:segment)', 'Ticket::done3/$1/$2/$3');
$routes->get('done-all/(:segment)', 'Ticket::done6/$1');
$routes->get('report/month/(:segment)', 'Ticket::all_month/$1');
$routes->get('report/(:segment)/(:segment)', 'Ticket::cat/$1/$2');
$routes->get('report/staff/(:segment)/(:segment)/(:segment)/(:segment)', 'Ticket::all/$1/$2/$3/$4');
$routes->get('report-ticket/(:segment)', 'Ticket::index2/$1');
$routes->get('pending/(:segment)', 'Ticket::pending4/$1');
$routes->get('staff/(:segment)/(:segment)/(:segment)', 'Ticket::staff/$1/$2/$3');

/*
 * --------------------------------------------------------------------
 * Additional Routing
 * --------------------------------------------------------------------
 *
 * There will often be times that you need additional routing and you
 * need it to be able to override any defaults in this file. Environment
 * based routes is one such time. require() additional route files here
 * to make that happen.
 *
 * You will have access to the $routes object within that file without
 * needing to reload it.
 */
if (file_exists(APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php')) {
    require APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php';
}
