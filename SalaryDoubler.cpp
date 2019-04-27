//Marc Gonzalez
#include <iostream>
#include <iomanip>
using namespace std;

int main(){
    int days, space1 = 12, space2 = 10;
    double pennies = 0.01, totalSalary = 0.0, currentDayValue = 0.0;
    
    // Get the users input for how many days they doubled in pay.
    cout << "For how many days will the pay double?";
    cin >> days;
    
    if(days > 0){
        cout << fixed << setprecision(2) << endl;
        cout << setw(space2) << left << "Day" << "Pay Each Day" << endl;
        cout << right << "-----------------------------" << endl;
        for(int i = 1; i < days + 1; i++){
            // Logic processing
            currentDayValue = pennies;
            pennies *= 2;
            totalSalary += currentDayValue;
            cout << setw(space2) << left << i << "$" << setw(space1) << right << currentDayValue << endl;
        }
        cout << "-----------------------------" << endl;
        cout << setw(space2) << left << "Total" << "$" << setw(space1) << right << totalSalary << endl;
    }else {
        cout << "You need to enter a value greater than 0!" << endl;
    }
    
    return 0;
}
