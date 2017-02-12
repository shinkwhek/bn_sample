%{
  open Syntax
%}

%token <bool> BOOL
%token <int> INT
%token PLUS
%token EOF

%left PLUS

%type <Syntax.t> exp
%start exp

%%

simple_exp:
  | BOOL
    { Bool($1) }
  | INT
    { Int($1) }

exp:
  | simple_exp
      { $1 }
  | exp PLUS exp
      { Add ($1, $3) }
