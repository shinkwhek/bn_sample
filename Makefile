
OCB_FLAGS = -use-ocamlfind -use-menhir -I bnc

OCB = ocamlbuild $(OCB_FLAGS)

all: bin/sl 

clean:
	$(OCB) -clean

bin/sl: ifn_menhir
		$(OCB) bnc/main.native
		mv main.native bin/sl

test: ounit

ounit:
	$(OCB) -package oUnit test/unit-test.native
	./unit-test.native

ifn_menhir:
	which menhir

.PHONY:	all clean ifn_menhir bin/sl ounit test
