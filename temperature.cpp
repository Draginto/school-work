// Caculate the temperature from celcius to fahrenheit or f to c
#include <iostream>
#include <iomanip>
using namespace std;

int main(){
	const int F = 1, C = 2;
	double celsius, fahrenheit;
	int choice;
	
	
	cout << "Please select what you would like to convert\n" 
		 << "\t1. Convert from Celsius to Fahrenheit\n"
		 << "\t2. Convert from fahrenheit to celsius\n";
	cin >> choice;
	
	
	// Check to see if the user selected the choice given.
	cout << fixed << setprecision(5)<< endl;
	switch(choice){
		case F: cout << "Please enter a value to convert to Fahrenheit\n";
				cin >> celsius;
				fahrenheit = ((9.0/5.0)*celsius) + 32.0;
				cout << "The temperature in fahrenheit is: " << fahrenheit << endl;
				break;
		case C: cout << "Please enter a value to convert to Celsius\n";
				cin >> fahrenheit;
				celsius = 5.0/9.0*(fahrenheit-32.0);
				cout << "The temperature in Celsius is: " << celsius << endl;
				break;
		default: cout << "This is an invalid choice " << endl;
	}
	
	
	// C = 5/9*(F-32)
	// F = [(9/5)C+32
	
	return 0;
}
