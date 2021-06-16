#pragma once

#include "jdbc.h"
#include <iostream>
#include "mysql.h"
#include <string>
#include <fstream>
#include <string>
#include <iostream>
#include <sstream>
#include <ios>

class Login {

public:

	Login();
	//#FIX ME -SECURITY ISSUE//
	sql::Statement* stmt;
	sql::mysql::MySQL_Driver* driver;
	sql::Connection* database;
	std::string username;
	std::string password;





};
