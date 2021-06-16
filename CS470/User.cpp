

#include "User.h"
#include <iomanip>
#include <ios>

void User::Login() {

	pstmt = database->prepareStatement("Call login(?,?)");

	pstmt->setString(1, username);
	pstmt->setString(2, password);
	result = pstmt->executeQuery();

	result->afterLast();
	if (result->first()) {
		coll[0] = result->getString("UserName");
		coll[1] = result->getString("Password_");
		coll[2] = result->getString("AccountType");
		coll[3] = result->getString("UserID");

	}

	if (coll[0] == username && coll[1] == password) {
		userID = std::stoi(coll[3]);
		mode = coll[2];

	}
	else
	{
		username = "";
		exit(1);
	}

	clean();

}




void User::createCharacter() {

	std::string charactername;
	std::string race;
	std::cout << "What is your name? " << std::endl;
	std::getline(std::cin, charactername);
	std::cout << "What is your race? " << std::endl;
	std::getline(std::cin, race);

	//#FIX ME//
	pstmt = database->prepareStatement("Call createCharacter(?,?,?)");

	pstmt->setString(1, username);
	pstmt->setString(2, charactername);
	pstmt->setString(3, race);

	pstmt->execute();

	listCharacters();

}

void User::listCharacters() {


	std::cout << std::setw(60) << std::setfill('*') << "" << std::endl;
	std::cout << std::setfill(' ') << std::setw(30) << std::right << "Character List" << std::endl;
	std::cout << std::setw(60) << std::setfill('*') << "" << std::endl;
	std::cout << std::setfill(' ') << std::setw(20) << "Name" << std::setw(20) << "Race" << std::setw(20) << "Level" << std::endl;
	std::cout << std::setw(60) << std::setfill('*') << "" << std::setfill(' ') << std::endl;


	pstmt = database->prepareStatement("CALL listCharacters(?)");
	pstmt->setString(1, username);
	result = pstmt->executeQuery();
	result->afterLast();
	while (result->previous()) {

		coll[0] = result->getString("CharacterName");
		coll[1] = result->getString("Race");
		coll[2] = result->getString("Level");

		std::cout << std::setfill(' ') << std::setw(20) << coll[0] << std::setw(20) << coll[1] << std::setw(20) << coll[2] << std::endl;


	}

	clean();
}

void User::deleteCharacter() {
	std::string charactername;

	std::cout << "What character would you like to delete?" << std::endl;
	std::getline(std::cin, charactername);
	pstmt = database->prepareStatement("CALL deleteCharacter(?,?)");
	pstmt->setString(1, charactername);
	pstmt->setString(2, username);
	pstmt->execute();

	listCharacters();


}


void User::selectCharacter() {
	std::string charactername;

	std::cout << "What character would you like to select?" << std::endl;
	std::getline(std::cin, charactername);
	pstmt = database->prepareStatement("CALL selectCharacter(?,?)");
	pstmt->setString(1, username);
	pstmt->setString(2, charactername);
	pstmt->execute();




	prompt();


}


void User::north() {
	pstmt = database->prepareStatement("CALL north(?)");
	pstmt->setString(1, username);
	pstmt->execute();

	prompt();

}

void User::northeast() {
	pstmt = database->prepareStatement("CALL northeast(?)");
	pstmt->setString(1, username);
	pstmt->execute();

	prompt();

}

void User::northwest() {



	pstmt = database->prepareStatement("CALL northwest(?)");
	pstmt->setString(1, username);
	pstmt->execute();

	prompt();

}

void User::east() {
	pstmt = database->prepareStatement("CALL east(?)");
	pstmt->setString(1, username);
	pstmt->execute();

	prompt();

}

void User::west() {
	pstmt = database->prepareStatement("CALL west(?)");
	pstmt->setString(1, username);
	pstmt->execute();

	prompt();

}

void User::southwest() {
	pstmt = database->prepareStatement("CALL southwest(?)");
	pstmt->setString(1, username);
	pstmt->execute();

	prompt();

}

void User::southeast() {
	pstmt = database->prepareStatement("CALL southeast(?)");
	pstmt->setString(1, username);
	pstmt->execute();

	prompt();

}
void User::south() {
	pstmt = database->prepareStatement("CALL south(?)");
	pstmt->setString(1, username);
	pstmt->execute();

	prompt();

}


void User::quit() {
	pstmt = database->prepareStatement("CALL quit(?)");
	pstmt->setString(1, username);
	pstmt->execute();


}

void User::sellItem() {

	std::string itemName;
	int amount = 0;
	std::string trashCollection;
	std::cout << "What Item do you want to sell?" << std::endl;
	std::getline(std::cin, itemName);
	std::cout << "How many do you want to sell" << std::endl;
	std::cin >> amount;
	std::getline(std::cin, trashCollection);

	pstmt = database->prepareStatement("Call sellItem(?,?,?)");
	pstmt->setString(1, username);
	pstmt->setString(2, itemName);
	pstmt->setInt(3, amount);
	pstmt->execute();

}

void User::displayInventory() {

	std::cout << std::setw(100) << std::setfill('*') << "" << std::endl;
	std::cout << std::setfill(' ') << std::setw(50) << std::right << "Inventory" << std::endl;
	std::cout << std::setw(100) << std::setfill('*') << "" << std::endl;
	std::cout << std::setfill(' ') << std::setw(20) << "Name" << std::setw(20) << "Item Type" << std::setw(20) << "Attack" << std::setw(20) << "Defense" << std::setw(20) << "Price" << std::endl;
	std::cout << std::setw(100) << std::setfill('*') << "" << std::setfill(' ') << std::endl;
	pstmt = database->prepareStatement("Call displayInventory(?)");
	pstmt->setString(1, username);
	result = pstmt->executeQuery();

	result->afterLast();
	while (result->previous()) {

		coll[0] = result->getString("Name_");
		coll[1] = result->getString("ItemType");
		coll[2] = result->getString("Stats_Attack");
		coll[3] = result->getString("Stats_Defense");
		coll[4] = result->getString("Price");

		std::cout << std::setw(20) << coll[0] << std::setw(20) << coll[1] << std::setw(20) << coll[2] << std::setw(20) << coll[3] << std::setw(20) << coll[4] << std::endl;


	}

	clean();


}

void User::displayEquipment() {


	std::cout << std::setw(100) << std::setfill('*') << "" << std::endl;
	std::cout << std::setfill(' ') << std::setw(50) << std::right << "Equipment" << std::endl;
	std::cout << std::setw(100) << std::setfill('*') << "" << std::endl;
	std::cout << std::setfill(' ') << std::setw(20) << "Name" << std::setw(20) << "Item Type" << std::setw(20) << "Attack" << std::setw(20) << "Defense" << std::setw(20) << "Price" << std::endl;
	std::cout << std::setw(100) << std::setfill('*') << "" << std::setfill(' ') << std::endl;
	pstmt = database->prepareStatement("Call displayEquipment(?)");
	pstmt->setString(1, username);
	result = pstmt->executeQuery();

	result->afterLast();
	while (result->previous()) {

		coll[0] = result->getString("Name_");
		coll[1] = result->getString("ItemType");
		coll[2] = result->getString("Stats_Attack");
		coll[3] = result->getString("Stats_Defense");
		coll[4] = result->getString("Price");

		std::cout << std::setw(20) << coll[0] << std::setw(20) << coll[1] << std::setw(20) << coll[2] << std::setw(20) << coll[3] << std::setw(20) << coll[4] << std::endl;

	}

	clean();


}

void User::displayMarket() {

	
	std::cout << std::setw(100) << std::setfill('*') << "" << std::endl;
	std::cout <<std::setfill(' ') <<std::setw(50) << std::right << "Market" << std::endl;
	std::cout << std::setw(100) << std::setfill('*') << "" << std::endl;
	std::cout << std::setfill(' ') << std::setw(20) << "Name" << std::setw(20) << "Item Type" << std::setw(20) << "Attack" << std::setw(20) << "Defense" << std::setw(20) << "Price" << std::endl;
	std::cout << std::setw(100) << std::setfill('*') << "" <<std::setfill(' ')<< std::endl;
	pstmt = database->prepareStatement("Call displayMarket()");
	result = pstmt->executeQuery();

	result->afterLast();
	while (result->previous()) {

		coll[0] = result->getString("Name_");
		coll[1] = result->getString("ItemType");
		coll[2] = result->getString("Stats_Attack");
		coll[3] = result->getString("Stats_Defense");
		coll[4] = result->getString("Price");

		
		std::cout << std::setw(20) << coll[0] << std::setw(20) << coll[1] << std::setw(20) << coll[2] << std::setw(20) << coll[3] << std::setw(20) << coll[4] << std::endl;

	}

	clean();


}


		/*DO NOT CLEAN IF NO RESULTS*/
		void User::clean() {

			while (pstmt->getMoreResults()) {
				result = pstmt->getResultSet();
			}

			result->close();
			pstmt->close();

			delete result;
			delete pstmt;

		}

		void User::prompt() {


			pstmt = database->prepareStatement("Call prompt(?)");

			pstmt->setString(1, username);
			result = pstmt->executeQuery();

			result->afterLast();
			if (result->first()) {
				coll[0] = result->getString("Description_");
				coll[1] = result->getString("gold");
				coll[2] = result->getString("level_");
				coll[3] = result->getString("attack");
				coll[4] = result->getString("defense");

			}

			std::cout << "[" << coll[0] << "]" << "[Gold:" << coll[1] << "]\n" << "<Level:" << coll[2] << " Attack:" << coll[3] << " Defense:" << coll[4] << ">" << std::endl;

			clean();


		}

		void User::joinAlliance() {
			std::string name;

			std::cout << "What Alliance do you want to Join?" << std::endl;
			std::getline(std::cin, name);
			pstmt = database->prepareStatement("Call joinAlliance(?,?)");
			pstmt->setString(1, username);
			pstmt->setString(2, name);
			
			pstmt->execute();

		}

		void User::joinGuild() {
			std::string name;

			std::cout << "What Alliance do you want to Join?" << std::endl;
			std::getline(std::cin, name);
			pstmt = database->prepareStatement("Call joinGuild(?,?)");
			pstmt->setString(1, username);
			pstmt->setString(2, name);

			pstmt->execute();

		}

		void User::listGuilds() {
			pstmt = database->prepareStatement("Call listGuilds()");
			result = pstmt->executeQuery();



			std::cout <<std::setw(40)<< std::setfill('*') << "" << std::setfill(' ') << std::endl;
			std::cout << std::setw(20)<<std::right<<"Guild of Fever Dream" << std::endl;
			std::cout << std::setw(40) << std::setfill('*') << "" << std::setfill(' ') << std::endl;
			std::cout << std::setw(20) << "Guild Name" << std::setw(20) << "Guild Leader" << std::endl;
			std::cout << std::setw(40) << std::setfill('*') << "" << std::setfill(' ') << std::endl;
			result->afterLast();
			while (result->previous())
			{
				coll[0] = result->getString("GuildName");
				coll[1] = result->getString("GuildLeader");

				
				std::cout << std::setw(20) << coll[0] << std::setw(20) << coll[1] << std::endl;
			}







			clean();

		}

		
		void User::listAlliances() {
			pstmt = database->prepareStatement("Call listAlliances()");
			result = pstmt->executeQuery();



			std::cout << std::setw(40) << std::setfill('*') << "" << std::setfill(' ') << std::endl;
			std::cout << std::setw(20)<<std::right<<"Alliances of Fever Dream"<< std::endl;
			std::cout << std::setw(40) << std::setfill('*') << "" << std::setfill(' ') << std::endl;
			std::cout << std::setw(20) << "Alliance Name" << std::endl;
			std::cout << std::setw(40) << std::setfill('*') << "" << std::setfill(' ') << std::endl;
			result->afterLast();
			while (result->previous())
			{
				coll[0] = result->getString("Name_");
			
				std::cout << std::setw(20) << coll[0]<< std::endl;
			}







			clean();

		
		}


	
		void User::equip() {
			std::string name;
			std::cout << "What do you want to equip?" << std::endl;
			std::getline(std::cin,name);
			pstmt = database->prepareStatement("call equip(?,?)");
			pstmt->setString(1, username);
			pstmt->setString(2, name);
			pstmt->execute();
		}

		
		void User::unequip() {
			std::string name;
			std::cout << "What do you want to unequip?" << std::endl;
			std::getline(std::cin, name);
			pstmt = database->prepareStatement("call unequip(?,?)");
			pstmt->setString(1, username);
			pstmt->setString(2, name);
			pstmt->execute();
		
		}

		void User::buyItem() {
			std::string name;
			int amount;
			int gold;
			std::string trash;
			std::cout << "What Item do you want to Buy?" << std::endl;
			std::getline(std::cin, name);
			std::cout << "How much gold are you willing to pay?" << std::endl;
			std::cin >> gold;
			std::getline(std::cin, trash);
			std::cout << "How many do you want to buy?" << std::endl;
			std::cin >> amount;
			std::getline(std::cin, trash);
			pstmt = database->prepareStatement("call buyItem(?,?,?,?)");
			pstmt->setString(1, username);
			pstmt->setString(2, name);
			pstmt->setInt(3, gold);
			pstmt->setInt(4, amount);
			pstmt->execute();
		
		}




		void User::listGuildMembers() {
		
			pstmt = database->prepareStatement("Call listGuildMembers(?)");
			pstmt->setString(1, username);
			result = pstmt->executeQuery();
			


			std::cout << std::setw(40) << std::setfill('*') << "" << std::setfill(' ') << std::endl;
			std::cout << std::setw(20) << std::right << "Your Guild" << std::endl;
			std::cout << std::setw(40) << std::setfill('*') << "" << std::setfill(' ') << std::endl;
			std::cout << std::setw(20) << "Guild Members" << std::endl;
			std::cout << std::setw(40) << std::setfill('*') << "" << std::setfill(' ') << std::endl;
			result->afterLast();
			while (result->previous())
			{
				coll[0] = result->getString("characterName");

				std::cout << std::setw(20) << coll[0] << std::endl;
			}







			clean();
		
		}

		void User::createGuild() {
			std::string name;
			std::cout << "What should the name of the guild be?" << std::endl;
			std::getline(std::cin, name);
			pstmt = database->prepareStatement("Call createGuild(?,?)");
			pstmt->setInt(1,userID );
			pstmt->setString(2, name);

			pstmt->execute();
		
		}

		void User::who() {

			pstmt = database->prepareStatement("Call Who(?)");
			pstmt->setInt(1, userID);
			result = pstmt->executeQuery();



			std::cout << std::setw(40) << std::setfill('*') << "" << std::setfill(' ') << std::endl;
			std::cout << std::setw(20) << std::right << "Everyone Around you" << std::endl;
			std::cout << std::setw(40) << std::setfill('*') << "" << std::setfill(' ') << std::endl;
			std::cout << std::setw(20) << "Names" << std::endl;
			std::cout << std::setw(40) << std::setfill('*') << "" << std::setfill(' ') << std::endl;
			result->afterLast();
			while (result->previous())
			{
				coll[0] = result->getString("CharacterName");

				std::cout << std::setw(20) << coll[0] << std::endl;
			}







			clean();


		}