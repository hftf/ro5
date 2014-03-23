FirstSeq[n_] := Range@n - 1;
NextSeq[Null] := Null;
NextSeq[s_] := Module[{next, n = Length@s, j, k},
  next = ConstantArray[0, n];
  If[ s[[n]] - s[[1]] <= 1,
   Return[ Null] ,
   k = LengthWhile[s[[n]] - s, # >= 2 &];
   next[[;; k - 1]] = s[[;; k - 1]];
   next[[k]] = s[[k]] + 1;
   j = k + 1;
   While[j <= n && Total@next[[;; j]] < Binomial[j, 2];
    	next[[j]] = s[[k]] + 1;
    j++;
    ];
   If[j <= n,
    next[[j]] = Binomial[j, 2] - Total@next[[;; j]];
    ];
   If[j < n,
    next[[j + 1 ;;]] = Range[j, n - 1];
    ]
   ];
  next
  ]
NestList[NextSeq, FirstSeq[5], 6]
