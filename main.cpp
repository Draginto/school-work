#include <iostream>
using namespace std;

int returnMinIndex(int[], int);
int returnMaxIndex(int[], int);
double getAverage(int[], int, int, int);

int main(){
    // Define array to store 10 integers
    int SIZE = 10;
    int test_grades[SIZE], minimumIndex, maximumIndex;
    double averagedValue;
    
    for(int count = 0; count < SIZE; count++){
        cout << "Enter the exam score " << (count + 1) << " \n";
        cin >> test_grades[count];
        if(test_grades[count] < 0 || test_grades[count] > 100){
            cout << "Invalid test score\n Please enter a test score between 0 and 100" << endl;
            cin >> test_grades[count];
        }
    }
    
    minimumIndex = returnMinIndex(test_grades, SIZE);
    cout << "the smallest value was at index " << minimumIndex
         << " the value was " << test_grades[minimumIndex] << endl;
    maximumIndex = returnMaxIndex(test_grades, SIZE);
    cout << "the largest value was at index " << maximumIndex
         << " the value was " << test_grades[maximumIndex] << endl;
    averagedValue = getAverage(test_grades, SIZE, maximumIndex, minimumIndex);
    cout << "The average was: " << averagedValue << endl;
    return 0;
 }

int returnMinIndex(int arr[], int size){
    int minIndex = 0;
    for(int i = 0; i < size; i++){
        if(arr[i] < arr[minIndex]){
            minIndex = i;
        }
    }
    return minIndex;
}
int returnMaxIndex(int arr[], int size){
    int maxIndex = 0;
    for(int i = 0; i < size; i++){
        if(arr[i] > arr[maxIndex]){
            maxIndex = i;
        }
    }
    return maxIndex;
}

// Get the average
double getAverage(int arr[], int size, int maxIndex, int minIndex){
    double average = 0;
    double total = 0;
    for(int i = 0; i < size; i++){
        if(arr[i] == arr[minIndex]){
            arr[i]--;
        }else{
            total += arr[i];
        }
        average = total / (size - 1);
    }
    return average;
}
