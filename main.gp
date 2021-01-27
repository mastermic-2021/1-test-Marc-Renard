str2ascii(s)=Vec(Vecsmall(s));
ascii2str(v)=strchr(v);
encode(s) = {
  [ if(c==32,0,c-96) | c <- str2ascii(s), c==32 || 97<=c && c<= 122 ];
}
decode(v) = {
  ascii2str([ if(c==0,32,c+96) | c <- v]);
}
text=readstr("input.txt")[1];
k=encode("haricot");


\\ resoudre l'exercice, bien mettre des ; a la fin des lignes

dechiffrer(c,k) = {
	\\ on va soutraire le code de k au code de c
	for(i=1,#c,if(  c[i]-k[(i-1)%(#k)+1]<0,  \\condition
		 c[i]=c[i]-k[ (i-1)%(#k)+1  ]+27, \\action si vrai   \\pour garder des entier dans Z/27Z
		 c[i]=c[i]-k[ (i-1)%(#k)+1  ])); \\ action si faux
	return(c);
}

text=encode(text);


clair=dechiffrer(text,k);

clair=decode(clair);




\\ a la fin, faire simplement
print(clair);
