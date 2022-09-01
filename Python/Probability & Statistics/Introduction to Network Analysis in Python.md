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

	* Network = Graph = (nodes, edges)

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

>>> G
<networkx.classes.graph.Graph object at 0x104512d60>
>>> type(G)
<class 'networkx.classes.graph.Graph'>
>>> len(G.nodes())
3
>>> len(G.edges())
1

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
		* Betweenness centrality

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

	* The breadth-first search algorithm was first developed in the 1950s as a way of finding the shortest path out of a maze. 
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

{0: 0.0, 1: 0.0, 2: 0.0, 3: 0.0, 4: 0.5333333333333333, 6: 0.5333333333333333, 7: 0.0, 8: 0.0, 9: 0.0, 10: 0.0, 5: 0.5555555555555556}
```

# 3. Structures

## 3.1 Communities & cliques

* **Cliques**

	* Social cliques: tightly-knit groups
	* Network cliques: completely connected graphs

```python
from itertools import combinations
for n1, n2 in combinations(G.nodes(), 2):
	print(n1, n2)
```

## 3.2 Maximal cliques

* **Maximal cliques

	* Definition: a clique that, when extended by one node is no longer a clique

	* Applications: community finding

* **Communities**

	* Find cliques
	* Find unions of cliques

* **NetworkX API**

	* `find_cliques` finds all maximal cliques

```python
>>> import networkx as nx
>>> G = nx.barbell_graph(m1=5, m2=1)
>>> nx.find_cliques(G)
<generator object find_cliques at 0x10587ccf0>
>>> list(nx.find_cliques(G))
[[4, 0, 1, 2, 3], [4, 5], [6, 5], [6, 7, 8, 9, 10]]
```

## 3.3 Subgraphs

* **Subgraphs**

	* Visualize portions of a large graph
		* Paths
		* Communities/cliques
		* Degrees of separation from a node
	
```python
import networkx as nx
G = nx.erdos_renyi_graph(n=20, p=0.2)
G.nodes()

NodeView((0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19))

G.edges()

EdgeView([(0, 2), (0, 6), (0, 14), (0, 15), (0, 19), (1, 5), (1, 10), (2, 16), (3, 6), (3, 8), (3, 10), (3, 14), (4, 8), (4, 11), (4, 15), (4, 16), (5, 17), (5, 18), (5, 19), (6, 10), (7, 17), (7, 18), (8, 9), (8, 13), (8, 14), (8, 15), (11, 12), (11, 15), (11, 16), (11, 19), (12, 13), (12, 15), (12, 19), (13, 14), (13, 18)])

nodes = G.neighbors(8)
nodes

[3, 4, 9, 13, 14, 15]

nodes.append(8)

G_eight = G.subgraph(nodes)
G_eight.edges()

nx.draw(G_eight, with_labels=True)
```

# 4. Case study

```python
>>> import networkx as nx
>>> G = nx.erdos_renyi_graph(n=20, p=0.2)
>>> len(G.edges())
46
>>> len(G.nodes())
20
>>> nx.degree_centrality(G)
{0: 0.2631578947368421, 1: 0.10526315789473684, 2: 0.3157894736842105, 3: 0.21052631578947367, 4: 0.21052631578947367, 5: 0.2631578947368421, 6: 0.15789473684210525, 7: 0.15789473684210525, 8: 0.42105263157894735, 9: 0.10526315789473684, 10: 0.2631578947368421, 11: 0.42105263157894735, 12: 0.2631578947368421, 13: 0.2631578947368421, 14: 0.2631578947368421, 15: 0.15789473684210525, 16: 0.2631578947368421, 17: 0.2631578947368421, 18: 0.21052631578947367, 19: 0.2631578947368421}
>>> nx.betweenness_centrality(G)
{0: 0.05029239766081871, 1: 0.00619604566972988, 2: 0.09477861319966584, 3: 0.0378724589250905, 4: 0.013157894736842105, 5: 0.05633528265107212, 6: 0.029156223893065998, 7: 0.01111111111111111, 8: 0.1527429685324422, 9: 0.00935672514619883, 10: 0.03329156223893066, 11: 0.14959621275410748, 12: 0.042495126705653016, 13: 0.05800612642717905, 14: 0.08432191590086326, 15: 0.025898078529657476, 16: 0.1021164021164021, 17: 0.04085213032581454, 18: 0.021832358674463936, 19: 0.08000556947925368}

# Import necessary modules
import matplotlib.pyplot as plt

# Plot the degree distribution of the GitHub collaboration network
plt.hist(list(nx.degree_centrality(G).values()))
plt.show()
```

```python
import networkx as nx
import nxviz as nv
G = nx.erdos_renyi_graph(n=20, p=0.3)
circ = nv.CircosPlot(G, node_color='key', node_group='key')
circ.draw()
```

```python
import networkx as nx
G = nx.erdos_renyi_graph(n=20, p=0.03)
A=list(G.subgraph(c) for c in nx.connected_components(G))

for g in A:
	print(len(g.nodes()))
```

* MatrixPlot

```python
# Import necessary modules
from nxviz import MatrixPlot
import matplotlib.pyplot as plt

# Calculate the largest connected component subgraph: largest_ccs
largest_ccs = sorted(nx.connected_component_subgraphs(G), key=lambda x: len(x))[-1]

# Create the customized MatrixPlot object: h
h = MatrixPlot(graph=largest_ccs, node_grouping='grouping')

# Draw the MatrixPlot to the screen
h.draw()
plt.show()
```

* ArcPlot

```python
# Import necessary modules
from nxviz.plots import ArcPlot
import matplotlib.pyplot as plt

# Iterate over all the nodes in G, including the metadata
for n, d in G.nodes(data=True):

    # Calculate the degree of each node: G.node[n]['degree']
    G.node[n]['degree'] = nx.degree(G, n)

# Create the ArcPlot object: a
a = ArcPlot(graph=G, node_order='degree')

# Draw the ArcPlot to the screen
a.draw()
plt.show()
```

* CircosPlot

```python
# Import necessary modules
from nxviz import CircosPlot
import matplotlib.pyplot as plt

# Iterate over all the nodes, including the metadata
for n, d in G.nodes(data=True):

    # Calculate the degree of each node: G.node[n]['degree']
    G.node[n]['degree'] = nx.degree(G, n)

# Create the CircosPlot object: c
c = CircosPlot(G, node_order='degree', node_grouping='grouping', node_color='grouping')

# Draw the CircosPlot object to the screen
c.draw()
plt.show()
```








