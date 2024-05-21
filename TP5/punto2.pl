o --> fn(_,_),fv(_).
fn(G,N) --> art(G,N),sust(G,N).
fv(N) --> verbo(N),fp(_,N).
fp(G,N) --> det(G,N),sust(G,N).

sust(fem,plu) --> [casas];[mesas];[profesoras].
sust(masc,sing) --> [gato];[libro];[disco];[mundo];[profesor].
sust(masc,plu) --> [profesores].

verbo(sing) --> [lee];[corre];[escribe];[toma].
verbo(plu) --> [leen];[corren];[escriben];[toman].

art(masc,plu) --> [los];[unos].
art(fem,sing) --> [la];[una].

det(masc,sing) --> [un].
det(masc,plu) --> [unos].
det(fem,sing) --> [una].

