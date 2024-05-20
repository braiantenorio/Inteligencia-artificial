o(o(FN,FV)) --> fn(FN,_,N),fv(FV,N).

fn(fn(A,S),G,N) --> art(A,G,N),sust(S,G,N).
fn(fn(Nom),G,N) --> nombre(Nom,G,N).
fv(fv(V,FP),N) --> verbo(V,N),fp(FP,_,_).
fp(fp(P,FN),G,N) --> prep(P),fn(FN,G,N).

sust(sust(casa),fem,sing) --> [casa].
sust(sust(mesa),fem,sing) --> [mesa].

nombre(nombre(pedro),masc,sing) --> [pedro].
nombre(nombre(eduardo),masc,sing) --> [eduardo].

verbo(verbo(mueve),sing) --> [mueve].
verbo(verbo(corre),sing) --> [corre].



