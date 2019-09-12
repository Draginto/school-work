#include <iostream>
using namespace std;

int findMax(int[]);
int findMin(int[], int);

int main(){
	int d[100];
	int n, maxVal, minVal, k, t;
	cout << "How many items in list? ";
	cin >> n;
	for(int i = 0; i < n; i++){
		cout << "Enter a value for " << i << endl;
		cin >> d[i];	
	}
	
	cout << "\nUnsorted List" << endl;
	for(int i = 0; i < n; i++){
		cout << " " << d[i];
	}
	cout << "\nSorted Array: " << endl;
	bool flag; 
	 for(int k = 1; k < n; k++){
	 	flag = 0;
	 	for(int pass = 0; pass < (n-k); pass++){
	 		if(d[pass] > d[pass+1]){
	 		t = d[pass];
	 		d[pass] = d[pass+1];
	 		d[pass+1] = t;
			flag = 1; 
		 }
	 }
	 if(flag==0) 
	 break;
	}
	
	 for(int i = 0; i < n; i++){
	 	cout << " " << d[i];
	 }
	maxVal = findMax(d);
	minVal = findMin(d, n);
	
	cout << "\nHighest value is: " << maxVal
		 << "\nLowest value is: " << minVal; 
	
	return 0;
}


int findMax(int arr[])
{
	int max;
	return max = arr[0];
}

int findMin(int arr[], int n)
{
	int min;
	return min = arr[n-1];
}
