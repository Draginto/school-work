#include <iostream>
#include <cstdlib>
#include <ctime>
using namespace std;

void showMenu();
int assignMove(int);
bool checkChoice(int, int);

int main(){
	// This program will play rock, paper, scissors against the computer
	int cpuChoice, humanChoice;
	srand(time(0));
	
	// Computer generates a number
	showMenu();
	cin >> humanChoice;
	assignMove(humanChoice);
	cpuChoice = rand() % 3 + 1;
	if(!(checkChoice(cpuChoice, humanChoice)))
	return 0;
}

void showMenu(){
	cout << "1.\t Do you choose rock?\n"
		 << "2.\t Do you choose Paper?\n"
		 << "3.\t Do you choose Scissors?\n";
}

int assignMove(int choice){
	int userChoice;
	const int ROCK = 1, PAPER = 2, SCISSOR = 3;
	switch(choice){
		case ROCK: cout << "Your choice was rock \n";
						userChoice = choice;
						break;
		case PAPER: cout << "Your choice was paper \n";
						userChoice = choice;
						break;
		case SCISSOR: cout << "Your choice was scissor \n";
						userChoice = choice;
						break;
	}
	return userChoice;
}

bool checkChoice(int comChoice, int humChoice, int &winner){
	
	while(comChoice != humChoice){
		if(humChoice == 1 && comChoice == 2){
			cout << "you lost! the computer's paper wins" << endl;
			return true;
		}else if(humChoice == 1 && comChoice ==3){
			cout << "You win! Player one's Rock wins" << endl;
			return true;
		}else if(humChoice == 2 && comChoice == 1){
			cout << "You won! Player one's rock won!" << endl;
			return true;
		}else if(humChoice == 2 && comChoice == 3){
			cout << "You lost! the computer's scissor won!" << endl;
			return true;
		}else if(humChoice == 3 && comChoice == 1){
			cout << "You lost! the computer's rock won!" << endl;
			return true;
		}else if (humChoice == 3 && comChoice == 2){
			cout << "You won! player one's scissor won!" << endl;
		}
	}
	return false;
}
