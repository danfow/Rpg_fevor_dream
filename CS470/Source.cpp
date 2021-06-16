

#include "jdbc.h"
#include <iostream>
#include "mysql.h"
#include "Login.h"
#include "User.h"
#include "Commands.h"

int main() {
    try {
        sql::mysql::MySQL_Driver* driver;
        sql::Connection* database;
        sql::PreparedStatement* pstmt;
        sql::ResultSet* result;
        sql::Statement* stmt;
        std::string name = "Nikolai Gogol";
        std::string coll[4];

        Login login;
        User* user;
        user = new User(login.database, login.username, login.password);
        user->Login();

       
        while (true) {


            std::cout << ">>";
            std::getline(std::cin, Commands::input);

            Commands::switchFuction(user);


            if (Commands::input == "quit")
                break;

        }

        delete user;
        user = nullptr;


    }

    catch(sql::SQLException &e)
    {
        std::cout << "# ERR: SQLException in " << __FILE__;
        std::cout << "(" << __FUNCTION__ << """) on line" << __LINE__ << std::endl;
        std::cout << "#ERR: " << e.what();
        std::cout << " (MySQL error code: " << e.getErrorCode();
        std::cout << ", sQLState: " << e.getSQLState() << " )" << std::endl;
                
    }


}
