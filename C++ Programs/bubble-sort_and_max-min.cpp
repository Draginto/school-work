#include <iostream>
using namespace std;

void bubbleSort(int[], int);

int main(){
	int d[100];
	int n;
	cout << "How many items in list? ";
	cin >> n;
	for(int i = 0; i < n; i++){
		cout << "Enter a value for " << i << endl;
		cin >> d[i];	
	}
	
	cout << "\nUnsorted List" << endl;
	for(int i = 0; i < n; i++){
		cout << d[i];
	}
	cout << "\nSorted Array: " << endl;
	bubbleSort(d, n);
	for(int i =0; i <= n; i++){
		cout << " " << d[i] << endl;
	}
	
	
	
	return 0;
}


void bubbleSort(int arr[], int n){
	 int k, t;
	 for(i = 1; k < n; i++){
	 	flag = 0;
	 	for(int pass = 1; pass < (n-1); pass++){
	 		if(arr[pass] > arr[pass+1]){
	 		t = arr[pass];
			arr[pass+1] = t;
			flag = 1; 
		 }
	 }
	 if(flag==0) 
	 break;
	 }
}

int findMax(int arr[])
{
	int max;
	
	return max;
}
