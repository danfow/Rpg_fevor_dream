#include "Login.h"



Login::Login() {


	std::string address;
	std::string user;
	std::string pass;
	int b;
	char c;
	std::ostringstream oss;



	std::ifstream fin("security.txt");
	for (int i = 0; i < 25; i++)
	{
		fin >> b;
		b = b / 3;
		c = b;
		oss << c;

	}
	address = oss.str();

	oss.str("");
	oss.clear();
	for (int i = 0; i < 6; i++)
	{
		fin >> b;
		b = b / 3;
		c = b;
		oss << c;

	}

	user = oss.str();
	oss.str("");
	oss.clear();
	for (int i = 0; i < 14; i++)
	{
		fin >> b;
		b = b / 3;
		c = b;
		oss << c;

	}
	pass = oss.str();


	oss.str("");
	oss.clear();





	driver = sql::mysql::get_driver_instance();
	database = driver->connect(address, user, pass);
	stmt = database->createStatement();
	stmt->execute("use rpg_fever_dream");




	std::cout << "																 " << std::endl;
	std::cout << "																 " << std::endl;
	std::cout << "                                      /\						 " << std::endl;
	std::cout << "                                     /`:\						 " << std::endl;
	std::cout << "                                    /`'`:\						 " << std::endl;
	std::cout << "                                   /`'`'`:\						 " << std::endl;
	std::cout << "                                  /`'`'`'`:\					 " << std::endl;
	std::cout << "                                 /`'`'`'`'`:\					 " << std::endl;
	std::cout << "                                  |`'`'`'`:|					 " << std::endl;
	std::cout << "    _ _  _  _  _                  |] ,-.  :|_  _  _  _			 " << std::endl;
	std::cout << "   ||| || || || |                 |  |_| ||| || || || |			 " << std::endl;
	std::cout << "   |`' `' `' `'.|                 | _'=' |`' `' `' `'.|			 " << std::endl;
	std::cout << "   :          .:;                 |'-'   :          .:;			 " << std::endl;
	std::cout << "    \-..____..:/  _  _  _  _  _  _| _  _'-\-..____..:/			 " << std::endl;
	std::cout << "     :--------:_,' || || || || || || || `.::--------:			 " << std::endl;
	std::cout << "     |]     .:|:.  `' `'_`' `' `' `' `'    | '-'  .:|			 " << std::endl;
	std::cout << "     |  ,-. .[|:._     '-' ____     ___    |   ,-.'-|			 " << std::endl;
	std::cout << "     |  | | .:|'--'_     ,'____`.  '---'   |   | |.:|			 " << std::endl;
	std::cout << "     |  |_| .:|:.'--' ()/,| |`|`.\()   __  |   |_|.:|			 " << std::endl;
	std::cout << "     |  '=' .:|:.     |::_|_|_|\|::   '--' |  _'='.:|			 " << std::endl;
	std::cout << "     | __   .:|:.     ;||-,-,-,-,|;        | '--' .:|			 " << std::endl;
	std::cout << "     |'--'  .:|:. _  ; ||       |:|        |      .:|			 " << std::endl;
	std::cout << "     |      .:|:.'-':  ||       |;|     _  |]     _:|			 " << std::endl;
	std::cout << "     |      '-|:.   ;  ||       :||    '-' |     '--|			 " << std::endl;
	std::cout << "     |  _   .:|].  ;   ||       ;||]       |   _  .:|			 " << std::endl;
	std::cout << "     | '-'  .:|:. :   [||      ;|||        |  '-' .:|			 " << std::endl;
	std::cout << " ,', ;._____.::-- ;---->'-,--,:-'<'--------;._____.::.`.		 " << std::endl;
	std::cout << "((  (          )_;___,' ,' ,  ; //________(          ) ))		 " << std::endl;
	std::cout << " `. _`--------' : -,' ' , ' '; //-       _ `--------' ,'		 " << std::endl;
	std::cout << "      __  .--'  ;,' ,'  ,  ': //    -.._    __  _.-  -			 " << std::endl;
	std::cout << "  `-   --    _ ;',' ,'  ,' ,;/_  -.       ---    _,				 " << std::endl;
	std::cout << "      _,.   /-:,_,_,_,_,_,_(/:-\   ,     ,.    _				 " << std::endl;
	std::cout << "    -'   `-'--'-'-'-'-'-'-'-''--'-' `-'`'  `'`' `-SSt-			 " << std::endl;
	std::cout << "	       Welcome to Fever Dream									 " << std::endl;
	std::cout << "-----------------------------------------------           		 " << std::endl;
	std::cout << "                                                              	 " << std::endl;







	std::cout << "Enter Username: " << std::endl;
	std::getline(std::cin, username);
	std::cout << "Enter password: " << std::endl;
	std::getline(std::cin, password);
}