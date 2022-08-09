Introduction to Network Analysis in Python
==========================================

# 1. Introduction to Networks

## 1.1 Introduction to Networks

* **Networks**
	* A useful tool for modeling ralationships between entities.

	* Examples:
		* Social
		* Transportation

	* Insights:
		* Important entities: influencers in social network
		* Pathfinding: most efficient transport path
		* Clustering: finding communities

* **Network Structure**

	* Networks are described by two sets of items:
		* nodes
		* edges

* **NetworkX API Basics**

	* NetworkX: A library allows us to manipulate, analyze and model graph data

```python
import networkx as nx
import matplotlib.pyplot as plt

G = nx.Graph()
G.add_nodes_from([1, 2, 3])
G.nodes()

NodeView((1, 2, 3))

G.add_edge(1, 2)
G.edges()

EdgeView([(1, 2)])

G.nodes[1]['label'] = 'blue'
G.nodes(data=True)

NodeDataView({1: {'label': 'blue'}, 2: {}, 3: {}})

nx.draw(G)

plt.show()
```

## 1.2 Types of graphs

* **Undirected graphs**

	* Facebook social gragh

```python
import networkx as nx
G = nx.Graph()
type(G)
```

* **Directed graphs**

	* Directed: Twitter social graph

```python
D = nx.DiGraph()
type(D)
```

* **Types of graphs**

	* Multi(Di)Graph: Trip records between bike sharing stations**




## 1.3 Network visualization**
























