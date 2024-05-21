o --> fn(_,N),fv(N).
fn(G,N) --> art(G,N),sust(G,N).
fv(N) --> verbo(N),fp(_,_).
fp(G,N) --> det(G,N),sust(G,N).

sust(fem,plu) --> [casas];[mesas];[profesoras].
sust(fem,sing) --> [profesora];[gata];[casa].
sust(masc,sing) --> [gato];[libro];[disco];[mundo];[profesor].
sust(masc,plu) --> [profesores];[discos].

verbo(sing) --> [lee];[corre];[escribe].
verbo(plu) --> [leen];[corren];[escriben].

art(masc,plu) --> [los].
art(masc,sing) --> [el].
art(fem,sing) --> [la].
art(fem,plu) --> [las].

det(masc,sing) --> [un].
det(masc,plu) --> [unos].
det(fem,sing) --> [una].
det(fem,plu) --> [unas].

