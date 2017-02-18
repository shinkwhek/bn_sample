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
%token REC
%token IN
%token EOF

%right lets
%left PLUS MINUS TIMES DIVIDED
%left PLUS_DOT MINUS_DOT TIMES_DOT DIVIDED_DOT
%left apps

%type <Syntax.t> exp
%start exp

%%

simple_exp:
  | LPAREN exp RPAREN
    { $2 }

  | BOOL
    { Bool($1) }
  | INT
    { Int($1) }
  | FLOAT
    { Float($1) }
  | NAME
    { Var($1) }

exp:
  | simple_exp
      { $1 }
  
  | exp PLUS exp
      { Add ($1, $3) }
  | exp PLUS_DOT exp
      { Add_dot ($1, $3) }
  
  | exp MINUS exp
      { Minus ($1, $3) }
  | exp MINUS_DOT exp
      { Minus_dot ($1, $3) }
  
  | exp TIMES exp
      { Times ($1, $3) }
  | exp TIMES_DOT exp
      { Times_dot ($1, $3) }
  
  | exp DIVIDED exp
      { Divided ($1, $3) }
  | exp DIVIDED_DOT exp
      { Divided_dot ($1, $3) }

  | exp DISJ exp
      { Disj($1, $3) }
  | exp CONJ exp
      { Conj($1, $3) }

  | exp EQUAL exp
      { Equal($1, $3) }
  | IF exp THEN exp ELSE exp
      { If($2, $4, $6) }

  | LET NAME EQUAL exp IN exp
      { App( Fun($2,$6), $4) }


