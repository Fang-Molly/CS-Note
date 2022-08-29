Introduction to Network Analysis in Python
==========================================

# 1. Introduction to Networks

## 1.1 Introduction to Networks

* **Networks**

	* Examples: 
		* Social network: model the relationships between people
		* Transportation network: model the connectivity between locations.

	* Networks are a useful tool for modeling relationships between entities.

* **Network Structure**

	* **Node**

	* **Edge** 

* **NetworkX API Basics**

	* NetworkX: a library allows us to manipulate, analyze and model graph data.

```python
# import networkx library
import networkx as nx

# initialize an empty graph
G = nx.Graph()

# add nodes
G.add_nodes_from([1, 2, 3])
G.nodes()

NodeView((1, 2, 3))

# add edges
G.add_edge(1, 2)
G.edges()

EdgeView([(1, 2)])

# add label to nodes
G.nodes[1]['label'] = 'blue'
G.nodes(data=True)

NodeDataView({1: {'label': 'blue'}, 2: {}, 3: {}})

# display the graph
nx.draw(G)
import matplotlib.pyplot as plt
plt.show()
```

## 1.2 Types of graphs

* **Undirected graphs**
	* Undirected graphs are comprised of edges that don't have any inherent directionality associated with them. 
	* Example: Facebook social graph

```python
import networkx as nx
G = nx.Graph()
type(G)

<class 'networkx.classes.graph.Graph'>
```

* **Directed graphs**
	* There is an inherent directionality associated with the graph
	* Example: Twitter's social graph

```python
import networkx as nx
D = nx.DiGraph()
type(D)

<class 'networkx.classes.digraph.DiGraph'>
```

* **Multi-edge graphs**

```python
import networkx as nx

# Multi Undirected
M = nx.MultiGraph()
type(M)

<class 'networkx.classes.multigraph.MultiGraph'>

# Multi Directed
MD = nx.MultiDiGraph()
type(MD)

<class 'networkx.classes.multidigraph.MultiDiGraph'>
```

* **Weighs on graphs**

	* Collapse multiple edges per pair of nodes into a single edge that contains a metadata summary of the original

```python
# Set the weight of the edge
T.edges[1, 10]['weight'] = 2

# Iterate over all the edges (with metadata)
for u, v, d in T.edges(data=True):

    # Check if node 293 is involved
    if 293 in [u, v]:

        # Set the weight to 1.1
        T.edges[u, v]['weight'] = 1.1
```

* **Self-loops**

	* Nodes that are connected to themselves

```python
# Define find_selfloop_nodes()
def find_selfloop_nodes(G):
    """
    Finds all nodes that have self-loops in the graph G.
    """
    nodes_in_selfloops = []

    # Iterate over all the edges of G
    for u, v in G.edges():

        # Check if node u and node v are the same
        if u == v:

            # Append node u to nodes_in_selfloops
            nodes_in_selfloops.append(u)

    return nodes_in_selfloops

# Check whether number of self loops equals the number of nodes in self loops
assert T.number_of_selfloops() == len(find_selfloop_nodes(T))
```

## 1.3 Network visualization

* **Irrational vs. Rational visualizations**

* **Visualizing networks**

	* **Matrix plots**

		* In a Matrix Plot, nodes are the rows and columns of a matrix, and cells are filled in according to whether an edge exists between the pairs of nodes. 
		* Undirected matrices: the matrix is symmetrical around the diagonal
		* Directed matrices: the matrix representation is not symmetrical
	
	* **Arc plots**

		* An Arc Plot is a transformation of the node-link diagram layout, in which nodes are ordered along one axis of the plot, and edges are drawn using circular arcs from one node to another. 

	* **Circos plots**

		* A CircosPlot is a transformation of the ArcPlot, such that the two ends of the ArcPlot are joined together into a circle. 

* **nxviz API**

```python
import nxviz as nv
import matplotlib.pyplot as plt
ap = nv.ArcPlot(G)
ap.draw()
plt.show()
```

# 2. Important nodes

## 2.1 Degree centrality

* **Important nodes**

	* Which nodes are important?
		* Degree centrality
		*  

	* Which center node might be more important?

* **Degree centrality**

	* Definition: Number of Neighbors I Have / Number of Neighbors I Could Possibly Have
	
	* Examples of node with high degree centrality:
		* Twitter broadcasters
		* Airport transportation hubs
		* Disease super-spreaders

* **Number of neighbors**

```python
>>> G.nodes()
NodeView((1, 2, 3, 4, 5, 6, 7, 8, 9))
>>> G.edges()
EdgeView([(1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7), (1, 8), (1, 9)])
>>> G.neighbors(1)
[2, 3, 4, 5, 6, 7, 8, 9]
>>> G.neighbors(10)
NetworkXError: The node 10 is not in the graph.

>>> nx.degree_centrality(G)
{1: 1.0, 2: 0.125, 3: 0.125, 4: 0.125, 5: 0.125, 6: 0.125, 7: 0.125, 8: 0.125, 9: 0.125}
```

## 2.2 Graph algorithms

* **Finding paths**

	* Pathfinding is important for
		* Optimization: e.g. shortest transport paths
		* Modeling: e.g. disease spread, information passing
	* Algorithm: Breadth-first search

* **Breadth-first search (BFS)**

	* Example: Shortest path between two nodes

## 2.3 Betweenness centrality

* **All shortest paths**

	* Set of paths
	* Each path is shortest path between a given pair of nodes
	* Done for all node pairs

* **Betweenness centrality**

	* Definition: num.shortest paths through node / all possible shortest paths
	* Application: 
		* Bridges between liberal- and conservative-leaning Twitter users
		* Critical information transfer links

* **Examples**

	* Singapore: Raffles Place & Jurong East

	* High betweenness centrality, low degree centrality?

* **Betweenness centrality**

```python
import networkx as nx
G = nx.barbell_graph(m1=5, m2=1)
nx.betweenness_centrality(G)
```






























