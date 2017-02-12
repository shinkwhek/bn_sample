%{
  open Syntax
%}

%token <bool> BOOL
%token <int> INT
%token PLUS

%type <Syntax.t> exp
%start exp

%%

simple_exp:
  | BOOL          { Bool($1) }
  | INT           { Int($1) }


exp:
  | exp PLUS exp
                  { Add ($1, $3) }
