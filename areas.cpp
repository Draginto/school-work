#include <iostream>
using namespace std;

int main(){
	// Create our needed variables for program to work.
	const double PI=3.14159;
	const int CIRCLE =1, RECTANGLE = 2, TRIANGLE = 3, QUIT = 4;
	int choice;
	double radius, base, length, height, width, area;
	
	// Introduce the menu to the user. 
	cout << "Geometry Calculator" << endl
		 << "\t1. Calculate the area of a circle" << endl
		 << "\t2. Calculate the area of a rectangle" << endl
		 << "\t3. Calculate the area of a triangle" << endl
		 << "\t4. Quit" << endl
		 << "\tEnter your choice (1-4): ";
		 
		 cin>> choice; 
		
		// User makes a choice, then continues to do the problem.
		switch(choice){
			case CIRCLE: cout << "Enter the radius of a circle: ";
						 cin >> radius;
						 area = PI * radius * radius; 
						 cout << "The area is " << area << endl;
						 break;
			case RECTANGLE: cout << "Enter the width of a rectangle: ";
						 	cin >> width;
						 	cout << "Enter the length of a rectangle: ";
						 	cin >> length;
						 	area = length * width; 
						 	cout << "The area is " << area << endl;
						 	break;
			case TRIANGLE: cout << "Enter the base: ";
						 	cin >> base;
						 	cout << "Enter the height: ";
						 	cin >> height;
						 	area = base*height*0.5; 
						 	cout << "The area is " << area << endl;
						 	break;
			case QUIT: cout << "Program is ending" << endl;
					 	break;
			default: cout << "Invalid input" << endl;
		}
	return 0;
}
