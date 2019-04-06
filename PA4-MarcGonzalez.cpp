#include <iostream>
#include <cstdlib>
#include <ctime>
using namespace std;

int main(){
    // Generate a random seed to provide a new list of random numbers.
    srand(static_cast<unsigned int>(time(0)));
    int playerOne, playerTwo;
    
    // Ask the user to press enter, then assign a random # between 1-6.
    cout << "Player 1 will roll, press enter to roll." << endl;
    cin.ignore();
    playerOne = rand() % 6 + 1;
    cout << "Player 2 will roll, press enter to roll." << endl;
    cin.ignore();
    playerTwo = rand() % 6 + 1;
    
    // Output the data, after the generator runs.
    if (playerOne > playerTwo){
        cout << "Player One rolled a " << playerOne << ", player One wins!" << endl;
    }else if(playerOne < playerTwo){
        cout << "Player Two rolled a "<< playerTwo << ", player Two wins!" << endl;
    }else {
        cout << "Player One rolled a: " << playerOne << " Player Two rolled a: " << playerTwo << endl;
    }
   
    return 0;
}
