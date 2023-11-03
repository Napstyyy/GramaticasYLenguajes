start: logicalexpression;

logicalexpression:
    inparsentence
    | notsentence
    | binaryexpression
    | dimp
    | imp
    | variable
    | regularconditionalstatement
    | elseconditionalstatement
    ;

inparsentence: OPAR logicalexpression CPAR;
notsentence: '!' logicalexpression;

variable: WORD;

WORD: '[a-z]+'(%unless
        ANDW: 'and';
        ANDO: '\*';
        ORW: 'or';
        ORO: '\+';
        IMP: '=>';
        DIMP: '<=>';
        OPAR: '\(';
        CPAR: '\)';
        IF:  'if';
        ELSE: 'else';
        THEN: 'then';
    );

binaryexpression:
    logicalexpression ands logicalexpression | logicalexpression ors logicalexpression;

imp: logicalexpression IMP logicalexpression;
dimp: logicalexpression DIMP logicalexpression;
ors: ORW | ORO;
ands: ANDW | ANDO;

regularconditionalstatement: IF logicalexpression THEN logicalexpression;
elseconditionalstatement: IF logicalexpression THEN logicalexpression ELSE logicalexpression;

OPC: '/\*';
CPC: '\*/';
COMMENT : OPC '.*' CPC (%ignore);

WS: '[ \t\r\n]+' (%ignore);
