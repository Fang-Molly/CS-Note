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


































