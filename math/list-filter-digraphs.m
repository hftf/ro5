AllOrientedQ = ! 
    Or @@ (MatchQ[#, {h_[a_, b_], h_[b_, a_]}] & /@ Subsets[#, {2}]) &;
With[{n = 4},
 graphs = Combinatorica`ListGraphs[n, Binomial[n, 2], Directed];
 gs = Apply[DirectedEdge, ToOrderedPairs /@ graphs, {2}];
 ]
nomultiedges = System`Graph /@ Select[gs, AllOrientedQ];
completes = 
  Select[nomultiedges, Composition[CompleteGraphQ, UndirectedGraph]];
gms = MatrixForm /@ AdjacencyMatrix /@ completes
LayeredGraphPlot[#, ImageSize -> 130, 
   PlotStyle -> {Arrowheads[Medium]}] & /@ nomultiedges
