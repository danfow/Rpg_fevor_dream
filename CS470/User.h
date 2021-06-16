#pragma once
#include "jdbc.h"
#include <iostream>
#include "mysql.h"



class User {



public:

	User(sql::Connection* database, std::string username, std::string password) :mode("Account"), database(database), username(username), password(password), zero(0) {}


	sql::Connection* database;

	int Location_x;
	int Location_y;
	std::string mode;
	MYSQL* connection;
	sql::ResultSet* result;
	sql::Statement* stmt;
	sql::PreparedStatement* pstmt;
	std::string username;
	std::string password;
	std::string query;
	uint64_t zero;
	int userID;
	std::string coll[10];


	/*Logs in User*/
	void Login();

	/*Creates Character*/
	void createCharacter();

	/*list chracters*/
	void listCharacters();

	/*deletes character*/
	void deleteCharacter();

	/*select character*/
	void selectCharacter();

	/* move north*/
	void north();

	/* move northeast*/
	void northeast();

	/*move northwest*/
	void northwest();

	/*move east*/
	void east();

	/*move west*/
	void west();

	/*move southwest*/
	void southwest();

	/*move southeast*/
	void southeast();

	/*move south*/
	void south();

	/*quits out*/
	void quit();

	/*Sell Item*/
	void sellItem();

	/*Diplay Inventory*/
	void displayInventory();

	/*Diplay Equipment*/
	void displayEquipment();


	/*Diplay Market*/
	void displayMarket();

	/*Join Alliance*/
	void joinAlliance();

	/*join guild*/
	void joinGuild();


	/*list guilds*/
	void listGuilds();

	/*list Alliances*/
	void listAlliances();

	/*equips equipment*/
	void equip();
	
	/*unequip equipment*/
	void unequip();

	/* buys item   */
	void buyItem();


	/*list guild memebers*/
	void listGuildMembers();

	/*Creates guild*/
	void createGuild();

	/*inact who, see everyone in current land*/
	void who();

	private:
		/*DO NOT CLEAN IF NO RESULTS****************************************************************/
		/*Cleans out results for you can do the next call*/
	void clean();
		/*Diplays prompt for player*/
	void prompt();

};