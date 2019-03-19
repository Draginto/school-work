#include <iostream>
using namespace std;

int main(){
	double cost = 88.67, tax, tip, total;
	const double TAX_RATE = 0.0675;
	const double TIP_RATE = 0.20;
	
	cout << "Meal: $" << cost << endl; 
	tax = cost * TAX_RATE; 
	cout << "Tax: $" << tax << endl;
	return 0;
}
