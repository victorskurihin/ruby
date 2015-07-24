#!/usr/bin/python

"""
Graphs for Module 2
Queue class
"""

class Queue:
    """
    A simple implementation of a FIFO queue.
    """

    def __init__(self):
        """ 
        Initialize the queue.
        """
        self._items = []

    def __len__(self):
        """
        Return the number of items in the queue.
        """
        return len(self._items)
    
    def __iter__(self):
        """
        Create an iterator for the queue.
        """
        for item in self._items:
            yield item

    def __str__(self):
        """
        Return a string representation of the queue.
        """
        return str(self._items)

    def enqueue(self, item):
        """
        Add item to the queue.
        """        
        self._items.append(item)

    def dequeue(self):
        """
        Remove and return the least recently inserted item.
        """
        return self._items.pop(0)

    def clear(self):
        """
        Remove all items from the queue.
        """
        self._items = []

def bfs_visited(ugraph, start_node):
    """
    Breadth-first search (BFS)
    Input: A graph ugraph and a vertex start_node of ugraph
    Output: All vertices reachable from start_node labeled as discovered
    """
    visited = {}
    visited[start_node] = True
    queue = Queue()
    queue.enqueue(start_node)
    while len(queue) > 0:
        node = queue.dequeue()
        for vertex in ugraph[node]:
            if vertex not in visited:
                visited[vertex] = True
                queue.enqueue(vertex)
            #end if vertex not in visited
        #end for vertex in ugraph[node]
    #end while len(queue) > 0:
    return set(list(visited))
#end def bfs_visited(ugraph, start_node)

def cc_visited(ugraph):
    """
    Input: Undirected graph ugraph
    Output: CC: the set of connected components of graph ugraph
    """
    result_cc = []
    rem_nodes = list(ugraph.keys())
    while len(rem_nodes) > 0:
        wset = bfs_visited(ugraph, rem_nodes[0])
        result_cc += [ set(list(wset)) ]
        for itm in wset:
            rem_nodes.remove(itm)
        #end for itm in wset
    #end while len(rem_nodes) > 0
    return result_cc
#end def cc_visited(ugraph)

def largest_cc_size(ugraph):
    """
    Takes the undirected graph ugraph and returns
    the size (an integer) of the largest connected component
    in ugraph
    """
    cc_set = cc_visited(ugraph)
    max_size = 0
    for cc_itm in cc_set:
        cc_set_idx_len = len(cc_itm)
        if max_size < cc_set_idx_len:
            max_size = cc_set_idx_len
        #end if max_size < cc_set_idx_len
        # print "cc_idx = %d, len = %d" % (cc_idx, max_size)
    #end for cc_idx in cc_set
    return max_size
#end def largest_cc_size(ugraph)

def compute_resilience(ugraph, attack_order):
    """
    Takes the undirected graph ugraph, a list of nodes attack_order
    and iterates through the nodes in attack_order. For each node
    in the list, the function removes the given node and its edges
    from the graph and then computes the size of the largest connected
    component for the resulting graph.
    """
    result  = [largest_cc_size(ugraph)]
    for node in attack_order:
        # grph = copy.deepcopy(ugraph)
        grph = ugraph
        del grph[node]
        for vertex in grph:
            if node in grph[vertex]:
                grph[vertex].remove(node)
            #end if node in ugraph[vertex]
        #end for vertex in ugraph
        result += [largest_cc_size(grph)]
    #end for node in attack_order
    return result
#end def compute_resilience(ugraph, attack_order)

