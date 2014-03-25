With[{n = 5},
 Graph[#, ImageSize -> 60, GraphStyle -> "Thick", 
    EdgeStyle -> Arrowheads[Medium], 
    GraphLayout -> {"LayeredDigraphEmbedding"}] & /@
  Inner[#@#2 &,
   Prepend[#, Identity] & /@ 
    Tuples[{Identity, Reverse}, Binomial[n, 2] - 1],
   DirectedEdge @@@ Subsets[Range@n, {2}],
   List
   ]
 ]
