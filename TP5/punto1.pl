o --> fn(_,N),fv(_,N).
fn(G,N) --> art(G,N),sust(G,N).
fv(G,N) --> verbo(N),sust(G,N).

sust(fem,plu) --> [casas];[mesas].
sust(masc,sing) --> [gato];[libro];[disco];[mundo];[pescado].
sust(masc,plu) --> [gatos];[libros];[discos];[mundos];[pescados].

verbo(sing) --> [mueve];[corre];[escribe];[toma];[come].
verbo(plu) --> [mueven];[corren];[escriben];[toman];[comen].

art(masc,plu) --> [los];[unos].
art(fem,sing) --> [la];[una].
art(masc,sing) --> [el];[uno].

