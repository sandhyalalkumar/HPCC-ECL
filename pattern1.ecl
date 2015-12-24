rs := RECORD
STRING100 line;
END;

//d := dataset('~thor::in::imdbdata::actors.list', rs,csv);

dat := DATASET([{'the fox; and the hen; hen is a bird and hen gives eggs'},
                {'the fox; and the hen; hen is a bird and hen gives eggs'},
                {'the fox; and the hen; hen is a bird and hen gives eggs'},
                {'the in the mirror is my enemy and friend and both'}], rs);

//dat := choosen(d,100);


//PATTERN ws := PATTERN('[\t\r\n]');
PATTERN Alpha := PATTERN('[A-Za-z]');
PATTERN Word := Alpha+;
//PATTERN Article := ['the', 'A'];
//PATTERN JustAWord := Word PENALTY(1);
//PATTERN notHen := VALIDATE(Word, MATCHTEXT != 'hen');
//PATTERN NoHenWord := notHen PENALTY(1);
//RULE NounPhraseComponent1 := JustAWord | Article ws Word;
//RULE NounPhraseComponent2 := NoHenWord | Article ws Word;

RULE NounPhraseComponent2 := word;

//ps1 := RECORD
//          out1 := MATCHTEXT(NounPhraseComponent1);/
//END;

ps2 := RECORD
   string out2 := MATCHTEXT(NounPhraseComponent2);
END;

//p1 := PARSE(dat, line, NounPhraseComponent1, ps1, BEST, MANY, NOCASE);
p2 := PARSE(dat, line, NounPhraseComponent2, ps2, BEST, MANY, NOCASE);

//ps4 := table(p2, {out2, c := count(group, out2)}, out2);


rec2:= record
   p2.out2;
   c := count(group);
end;

t1 := table(p2, rec2, out2);


/*ps3 := table(project(p2, transform({string str2, integer c},
               self.str2 := left.out2,
               self.c := 1;
                                  )), { word := str2, co := sum(group, c)}, str2);


*/
sort(t1,c);
//ps3;
//OUTPUT(p1);
//OUTPUT(p2);           