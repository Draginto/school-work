#include <iostream>
#include <cstring>
using namespace std;

#define VERTICES 8                                                                             // number of vertices in graph

int primsAlgorithm(int graph[][VERTICES]);

int main () {
    int totalWeightOfTree = 0;
    int graphByAdjMatrix[VERTICES][VERTICES] = {                                                      // Create our adjacency Matrix for use in Prim's Algorithm.
            {0, 1, 6, 2, 0, 0, 0, 0},
            {1, 0, 0, 9, 4, 6, 0, 0},
            {6, 0, 0, 2, 0, 0, 0, 0},
            {0, 4, 0, 5, 0, 5, 3, 0},
            {0, 6, 0, 0, 5, 0, 6, 2},
            {0, 0, 0, 7, 3, 6, 0, 0},
            {0, 0, 0, 0, 0, 2, 0, 0}
    };

    totalWeightOfTree = primsAlgorithm(graphByAdjMatrix);                               // Save the return value of primsAlgorithm to totalWeightOfTree.

    cout << "The total cost of the Minimum Spanning Tree is: " << totalWeightOfTree <<  endl;           // Print the total weight of the tree.

    return 0;
}

int primsAlgorithm(int graph[][VERTICES])
{
    const int INF = 9999999;
    char vertices[VERTICES] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'};                        // Preload the vertices for labeling.
    int total_weight = 0;
    int numberOfEdges;                                                                  // number of edge.

    int chosenVertices[VERTICES];                                                              // Create array for storing the chosenVertices vertices.

    memset (chosenVertices, false, sizeof (chosenVertices));                            // set chosenVertices false initially.

    numberOfEdges = 0;                                                                  // Set the total edges to 0.

    chosenVertices[0] = true;                                                           // Select 'A' from matrix.

    int x;            //  Row index.
    int y;            //  Col index.

    cout << "Edge" << " : " << "Weight";
    cout << endl;
    // Keep looping until we have n - 1 edges in set.
    while (numberOfEdges < VERTICES - 1) {

        int min = INF;          // Set min value to "infinity."
        x = 0;                  // Set the rows to 0.
        y = 0;                  // Set the cols to 0.

        // if the vertex is already in the set S, discard it. otherwise
        // choose another vertex nearest to chosenVertices vertex at step 1.
        for (int i = 0; i < VERTICES; i++) {
            if (chosenVertices[i]) {
                for (int j = 0; j < VERTICES; j++) {
                    if (!chosenVertices[j] && graph[i][j]) { // not in chosenVertices and there is an edge
                        if (min > graph[i][j]) {
                            min = graph[i][j];
                            x = i;
                            y = j;
                        }
                    }
                }
            }
        }
        cout << vertices[x] << vertices[y] << "   :  " << graph[x][y];
        cout << endl;
        total_weight += graph[x][y];
        chosenVertices[y] = true;
        numberOfEdges++;
    }
    return total_weight;
}