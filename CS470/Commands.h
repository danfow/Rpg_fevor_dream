#pragma once
#include <map>
#include <string>
#include "User.h"
#include <iostream>

namespace Commands {

	std::string input;
	std::map<std::string, int> usermap = {
		{"create character",1},
		{"list characters",2},
		{"quit",3},
		{"delete character",4},
		{"List Commands",5},
		{"select character",6},
		{"",7},
		{"north",8},
		{"east",9},
		{"south",10},
		{"west",11},
		{"northwest",12},
		{"northeast",13},
		{"southeast",14},
		{"southwest",15},
		{"buy item",16},
		{"sell item",17},
		{"display inventory",18},
		{"display equipment",19},
		{"display market",20},
		{"join alliance",21},
		{"join guild",22},
		{"list alliances",23},
		{"list guildmembers",24},
		{"list guilds",25},
		{"equip",26},
		{"unequip",27},
		{"create guild",28},
		{"who",29}


	};

	int commandLine(std::string input, std::map<std::string, int> usermap) {
		if (usermap.count(input)) {
			return usermap[input];
		}
		else
			return -1;

	}

	void listCommands(void) {

		for (auto& const ptr : usermap) {
			std::cout << ptr.first << std::endl;

		}

	}

	void switchFuction(User* user) {


		switch (Commands::commandLine(Commands::input, Commands::usermap)) {
		case 1:
			user->createCharacter();
			break;
		case 2:
			user->listCharacters();
			break;
		case 3:
			user->quit();
			break;
		case 4:
			user->deleteCharacter();
			break;
		case 5:
			listCommands();
			break;
		case 6:
			user->selectCharacter();
		case 7://empty string does nothing
			break;
		case 8:
			user->north();
			break;
		case 9:
			user->east();
			break;
		case 10:
			user->south();
			break;
		case 11:
			user->west();
			break;
		case 12:
			user->northwest();
			break;
		case 13:
			user->northeast();
			break;
		case 14:
			user->southeast();
			break;
		case 15:
			user->southwest();
			break;
		case 16:
			user->buyItem();
			break;
		case 17:
			user->sellItem();
			break;
		case 18:
			user->displayInventory();
			break;
		case 19:
			user->displayEquipment();
			break;
		case 20:
			user->displayMarket();
			break;
		case 21:
			user->joinAlliance();
			break;
		case 22:
			user->joinGuild();
			break;
		case 23:
			user->listAlliances();
			break;
		case 24:
			user->listGuildMembers();
			break;
		case 25:
			user->listGuilds();
			break;
		case 26:
			user->equip();
			break;
		case 27:
			user->unequip();
			break;
		case 28:
			user->createGuild();
			break;
		case 29:
			user->who();
			break;
		case -1:
			std::cout << "Not a valid Command Try again, or type <List Commands>" << std::endl;
			break;
		default:
			std::cout << "Something went wrong, try again" << std::endl;
			break;
		}






	}




}








