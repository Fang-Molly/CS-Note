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


