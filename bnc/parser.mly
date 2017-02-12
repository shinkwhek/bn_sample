%{
  open Syntax
%}

%token <bool> BOOL
%token <int> INT
%token <float> FLOAT
%token PLUS
%token MINUS
%token TIMES
%token DIVIDED
%token EOF

%left PLUS MINUS TIMES DIVIDED

%type <Syntax.t> exp
%start exp

%%

simple_exp:
  | BOOL
    { Bool($1) }
  | INT
    { Int($1) }
  | FLOAT
    { Float($1) }

exp:
  | simple_exp
      { $1 }
  | exp PLUS exp
      { Add ($1, $3) }
  | exp MINUS exp
      { Minus ($1, $3) }
  | exp TIMES exp
      { Times ($1, $3) }
  | exp DIVIDED exp
      { Divided ($1, $3) }
