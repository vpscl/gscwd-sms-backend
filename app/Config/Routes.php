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
$routes->resource('sub_task');
$routes->resource('user');  
$routes->resource('task'); 
$routes->resource('ticket'); 
$routes->resource('admin');
$routes->resource('office'); 
$routes->resource('department'); 
$routes->resource('division'); 
$routes->resource('incident');
$routes->get('view/(:segment)', 'ticket::view/$1');
//          ('url/id' , 'controller::function/id)
$routes->get('check', 'user::check');
$routes->get('done/(:segment)/(:segment)', 'ticket::done/$1/$2');
$routes->get('category/(:segment)/(:segment)', 'ticket::category/$1/$2');
$routes->get('pending/(:segment)/(:segment)', 'ticket::pending/$1/$2');
$routes->get('ticket2/(:segment)/(:segment)', 'ticket::ticket2/$1/$2');
$routes->get('pending2/(:segment)/(:segment)/(:segment)', 'ticket::pending2/$1/$2/$3');
$routes->get('pending3/(:segment)/(:segment)', 'ticket::pending3/$1/$2');
$routes->get('slip_status/(:segment)/(:segment)/(:segment)', 'ticket::slip_status/$1/$2/$3');
$routes->get('donestaff/(:segment)/(:segment)/(:segment)', 'ticket::done2/$1/$2/$3');
$routes->get('print-done/(:segment)/(:segment)', 'ticket::done4/$1/$2');
$routes->get('print-done/staff/(:segment)/(:segment)', 'ticket::done5/$1/$2');
$routes->get('print-done2/(:segment)/(:segment)/(:segment)', 'ticket::done3/$1/$2/$3');
$routes->get('done-all/(:segment)', 'ticket::done6/$1');
$routes->get('report/month/(:segment)', 'ticket::all_month/$1');
$routes->get('report/(:segment)/(:segment)', 'ticket::cat/$1/$2');
$routes->get('report/staff/(:segment)/(:segment)/(:segment)/(:segment)', 'ticket::all/$1/$2/$3/$4');
$routes->get('report-ticket/(:segment)', 'ticket::index2/$1');
$routes->get('pending/(:segment)', 'ticket::pending4/$1');
$routes->get('staff/(:segment)/(:segment)/(:segment)', 'ticket::staff/$1/$2/$3');

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
