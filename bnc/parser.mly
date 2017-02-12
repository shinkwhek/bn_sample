%{


%}

%token <Tconst> LCONST
%token EOF LPLUS LMINUS

%start program
%type <int> program

%%

expr :
|  
