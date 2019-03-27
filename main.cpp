#include <iostream>
#include <iomanip>
#include <string>
using namespace std;

int main(){
    double const STATE_TAX = 0.04;
    double const COUNTY_TAX = 0.02;
    double totalAmountCollected, totalSalesTax, salesTax, totalCountyTax, totalStateTax, totalSales;
    string month, year;
    
    cout << fixed << setprecision(2) << endl;
    cout << "Please enter a month, year and the total amount collected" << endl;
    getline(cin, month);
    getline(cin, year);
    cout << "Month: " << month << setw(12) << "Year: " << year << endl;
    cout << "---------------"<< endl; // Ask professor about this line of code.
    cin >> totalAmountCollected;
    
    // Calculations will take place here.
    salesTax = 1 + (STATE_TAX + COUNTY_TAX);
    totalSales = totalAmountCollected / salesTax;  // Total sales is calculated by total amount collected divided by 1+state and county tax.
    totalStateTax = totalSales * STATE_TAX;
    totalCountyTax = totalSales * COUNTY_TAX;
    totalSalesTax = totalCountyTax + totalStateTax;
    
    // Output information to the stream.
    cout  << "Total Collected:" << right << setw(12) << "$" << setw(12) << totalAmountCollected << endl;
    cout  <<"Sales:" << right << setw(22) << "$" << setw(12) << totalSales << endl;
    cout  << "County Sales Tax:" << right << setw(11) << "$"<< setw(12) <<totalCountyTax << endl;
    cout  << "State Sales Tax:" << right << setw(12) << "$"  << setw(12) << totalStateTax << endl;
    cout  << "Total Sales Tax:" << right<< setw(12) << "$" << setw(12) << totalSalesTax << endl;
    return 0;
}
