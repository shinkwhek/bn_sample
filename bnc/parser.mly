%{
  open Syntax
%}

%token LPAREN
%token RPAREN
%token <bool> BOOL
%token <int> INT
%token <float> FLOAT
%token PLUS
%token PLUS_DOT
%token MINUS
%token MINUS_DOT
%token TIMES
%token TIMES_DOT
%token DIVIDED
%token DIVIDED_DOT
%token DISJ
%token CONJ
%token EQUAL
%token IF
%token THEN
%token ELSE
%token <Type.n> NAME
%token LET
%token IN
%token EOF

%right lets
%left PLUS MINUS TIMES DIVIDED
%left PLUS_DOT MINUS_DOT TIMES_DOT DIVIDED_DOT

%type <Syntax.t> main
%start main

%%

main
	: e=exp EOF			{ e }
	;

simple_exp
	: LPAREN e=exp RPAREN		{ e }

  	| b=BOOL	 	      	{ Bool(b) }
  	| i=INT				{ Int(i) }
	| f=FLOAT			{ Float(f) }
	| n=NAME			{ Var(n) }

exp
	: e=simple_exp			{ e }

	| e1=exp PLUS e2=exp		{ Add(e1,e2) }
	| e1=exp PLUS_DOT e2=exp	{ Add_dot(e1,e2) }
  
	| e1=exp MINUS e2=exp		{ Minus(e1,e2) }
  	| e1=exp MINUS_DOT e2=exp	{ Minus_dot(e1, e2) }
  
	| e1=exp TIMES e2=exp		{ Times(e1,e2) }
  	| e1=exp TIMES_DOT e2=exp	{ Times_dot(e1,e2) }
  
	| e1=exp DIVIDED e2=exp		{ Divided(e1,e2) }
  	| e1=exp DIVIDED_DOT e2=exp	{ Divided_dot(e1,e2) }

  	| e1=exp DISJ e2=exp 		{ Disj(e1,e2) }
  	| e1=exp CONJ e2=exp		{ Conj(e1,e2) }

  	| e1=exp EQUAL e2=exp		  	      { Equal(e1,e2) }
  	| IF conf=exp THEN th=exp ELSE el=exp	      { If(conf,th,el) }

  	| LET n=NAME EQUAL f=exp IN next=exp
	  %prec lets
	  { App(Fun(n,next),f) }

