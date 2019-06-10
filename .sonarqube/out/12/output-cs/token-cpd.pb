π
ãC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Application\Behaviors\LoggingBehavior.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Application+ 6
.6 7
	Behaviors7 @
{ 
public

 

class

 
LoggingBehavior

  
<

  !
TRequest

! )
,

) *
	TResponse

+ 4
>

4 5
:

6 7
IPipelineBehavior

8 I
<

I J
TRequest

J R
,

R S
	TResponse

T ]
>

] ^
{ 
private 
readonly 
ILogger  
<  !
LoggingBehavior! 0
<0 1
TRequest1 9
,9 :
	TResponse; D
>D E
>E F
_loggerG N
;N O
public 
LoggingBehavior 
( 
ILogger &
<& '
LoggingBehavior' 6
<6 7
TRequest7 ?
,? @
	TResponseA J
>J K
>K L
loggerM S
)S T
=>U W
_loggerX _
=` a
loggerb h
;h i
public 
async 
Task 
< 
	TResponse #
># $
Handle% +
(+ ,
TRequest, 4
request5 <
,< =
CancellationToken> O
cancellationTokenP a
,a b"
RequestHandlerDelegatec y
<y z
	TResponse	z É
>
É Ñ
next
Ö â
)
â ä
{ 	
_logger 
. 
LogInformation "
(" #
$str# V
,V W
requestX _
._ `
GetGenericTypeName` r
(r s
)s t
,t u
requestv }
)} ~
;~ 
var 
response 
= 
await  
next! %
(% &
)& '
;' (
_logger 
. 
LogInformation "
(" #
$str# `
,` a
requestb i
.i j
GetGenericTypeNamej |
(| }
)} ~
,~ 
response
Ä à
)
à â
;
â ä
return 
response 
; 
} 	
} 
} Õ1
êC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Application\Behaviors\TransactionBehaviour.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Application+ 6
.6 7
	Behaviors7 @
{ 
public 

class  
TransactionBehaviour %
<% &
TRequest& .
,. /
	TResponse0 9
>9 :
:; <
IPipelineBehavior= N
<N O
TRequestO W
,W X
	TResponseY b
>b c
{ 
private 
readonly 
ILogger  
<  ! 
TransactionBehaviour! 5
<5 6
TRequest6 >
,> ?
	TResponse@ I
>I J
>J K
_loggerL S
;S T
private 
readonly (
TransacoesFinanceirasContext 5

_dbContext6 @
;@ A
private 
readonly 9
-ITransacoesFinanceirasIntegrationEventService F9
-_transacoesFinanceirasIntegrationEventServiceG t
;t u
public  
TransactionBehaviour #
(# $(
TransacoesFinanceirasContext$ @
	dbContextA J
,J K9
-ITransacoesFinanceirasIntegrationEventService 98
,transacoesFinanceirasIntegrationEventService: f
,f g
ILogger 
<  
TransactionBehaviour (
<( )
TRequest) 1
,1 2
	TResponse3 <
>< =
>= >
logger? E
)E F
{ 	

_dbContext 
= 
	dbContext "
??# %
throw& +
new, /
ArgumentException0 A
(A B
nameofB H
(H I(
TransacoesFinanceirasContextI e
)e f
)f g
;g h9
-_transacoesFinanceirasIntegrationEventService 9
=: ;8
,transacoesFinanceirasIntegrationEventService< h
??i k
throwl q
newr u
ArgumentException	v á
(
á à
nameof
à é
(
é è:
,transacoesFinanceirasIntegrationEventService
è ª
)
ª º
)
º Ω
;
Ω æ
_logger 
= 
logger 
?? 
throw  %
new& )
ArgumentException* ;
(; <
nameof< B
(B C
ILoggerC J
)J K
)K L
;L M
} 	
public 
async 
Task 
< 
	TResponse #
># $
Handle% +
(+ ,
TRequest, 4
request5 <
,< =
CancellationToken> O
cancellationTokenP a
,a b"
RequestHandlerDelegatec y
<y z
	TResponse	z É
>
É Ñ
next
Ö â
)
â ä
{ 	
var   
response   
=   
default   "
(  " #
	TResponse  # ,
)  , -
;  - .
var!! 
typeName!! 
=!! 
request!! "
.!!" #
GetGenericTypeName!!# 5
(!!5 6
)!!6 7
;!!7 8
try## 
{$$ 
if%% 
(%% 

_dbContext%% 
.%%  
HasActiveTransaction%% 3
)%%3 4
{&& 
return'' 
await''  
next''! %
(''% &
)''& '
;''' (
}(( 
var** 
strategy** 
=** 

_dbContext** )
.**) *
Database*** 2
.**2 3#
CreateExecutionStrategy**3 J
(**J K
)**K L
;**L M
await,, 
strategy,, 
.,, 
ExecuteAsync,, +
(,,+ ,
async,,, 1
(,,2 3
),,3 4
=>,,5 7
{-- 
Guid.. 
transactionId.. &
;..& '
using00 
(00 
var00 
transaction00 *
=00+ ,
await00- 2

_dbContext003 =
.00= >!
BeginTransactionAsync00> S
(00S T
)00T U
)00U V
using11 
(11 

LogContext11 %
.11% &
PushProperty11& 2
(112 3
$str113 G
,11G H
transaction11I T
.11T U
TransactionId11U b
)11b c
)11c d
{22 
_logger33 
.33  
LogInformation33  .
(33. /
$str33/ w
,33w x
transaction	33y Ñ
.
33Ñ Ö
TransactionId
33Ö í
,
33í ì
typeName
33î ú
,
33ú ù
request
33û •
)
33• ¶
;
33¶ ß
response55  
=55! "
await55# (
next55) -
(55- .
)55. /
;55/ 0
_logger77 
.77  
LogInformation77  .
(77. /
$str77/ k
,77k l
transaction77m x
.77x y
TransactionId	77y Ü
,
77Ü á
typeName
77à ê
)
77ê ë
;
77ë í
await99 

_dbContext99 (
.99( )"
CommitTransactionAsync99) ?
(99? @
transaction99@ K
)99K L
;99L M
transactionId;; %
=;;& '
transaction;;( 3
.;;3 4
TransactionId;;4 A
;;;A B
}<< 
await>> 9
-_transacoesFinanceirasIntegrationEventService>> G
.>>G H-
!PublishEventsThroughEventBusAsync>>H i
(>>i j
transactionId>>j w
)>>w x
;>>x y
}?? 
)?? 
;?? 
returnAA 
responseAA 
;AA  
}BB 
catchCC 
(CC 
	ExceptionCC 
exCC 
)CC  
{DD 
_loggerEE 
.EE 
LogErrorEE  
(EE  !
exEE! #
,EE# $
$strEE% `
,EE` a
typeNameEEb j
,EEj k
requestEEl s
)EEs t
;EEt u
throwGG 
;GG 
}HH 
}II 	
}JJ 
}KK ﬁ 
çC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Application\Behaviors\ValidatorBehavior.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Application+ 6
.6 7
	Behaviors7 @
{ 
public 

class 
ValidatorBehavior "
<" #
TRequest# +
,+ ,
	TResponse- 6
>6 7
:8 9
IPipelineBehavior: K
<K L
TRequestL T
,T U
	TResponseV _
>_ `
{ 
private 
readonly 
ILogger  
<  !
ValidatorBehavior! 2
<2 3
TRequest3 ;
,; <
	TResponse= F
>F G
>G H
_loggerI P
;P Q
private 
readonly 

IValidator #
<# $
TRequest$ ,
>, -
[- .
]. /
_validators0 ;
;; <
public 
ValidatorBehavior  
(  !

IValidator! +
<+ ,
TRequest, 4
>4 5
[5 6
]6 7

validators8 B
,B C
ILoggerD K
<K L
ValidatorBehaviorL ]
<] ^
TRequest^ f
,f g
	TResponseh q
>q r
>r s
loggert z
)z {
{ 	
_validators 
= 

validators $
;$ %
_logger 
= 
logger 
; 
} 	
public 
async 
Task 
< 
	TResponse #
># $
Handle% +
(+ ,
TRequest, 4
request5 <
,< =
CancellationToken> O
cancellationTokenP a
,a b"
RequestHandlerDelegatec y
<y z
	TResponse	z É
>
É Ñ
next
Ö â
)
â ä
{ 	
var 
typeName 
= 
request "
." #
GetGenericTypeName# 5
(5 6
)6 7
;7 8
_logger 
. 
LogInformation "
(" #
$str# K
,K L
typeNameM U
)U V
;V W
var 
failures 
= 
_validators &
. 
Select 
( 
v 
=> 
v 
. 
Validate '
(' (
request( /
)/ 0
)0 1
.   

SelectMany   
(   
result   "
=>  # %
result  & ,
.  , -
Errors  - 3
)  3 4
.!! 
Where!! 
(!! 
error!! 
=>!! 
error!!  %
!=!!& (
null!!) -
)!!- .
."" 
ToList"" 
("" 
)"" 
;"" 
if$$ 
($$ 
failures$$ 
.$$ 
Any$$ 
($$ 
)$$ 
)$$ 
{%% 
_logger&& 
.&& 

LogWarning&& "
(&&" #
$str&&# z
,&&z {
typeName	&&| Ñ
,
&&Ñ Ö
request
&&Ü ç
,
&&ç é
failures
&&è ó
)
&&ó ò
;
&&ò ô
throw(( 
new(( 0
$TransacoesFinanceirasDomainException(( >
(((> ?
$")) /
#Command Validation Errors for type )) 9
{))9 :
typeof)): @
())@ A
TRequest))A I
)))I J
.))J K
Name))K O
}))O P
"))P Q
,))Q R
new))S V
ValidationException))W j
())j k
$str	))k Å
,
))Å Ç
failures
))É ã
)
))ã å
)
))å ç
;
))ç é
}** 
return,, 
await,, 
next,, 
(,, 
),, 
;,,  
}-- 	
}.. 
}// Ç
êC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Application\Command\CriarConsumidorCommand.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Application+ 6
.6 7
Command7 >
{ 
[ 
DataContract 
] 
public 

class "
CriarConsumidorCommand '
:			 

IRequest		 
<		 
bool		 
>		 
{

 
[ 	

DataMember	 
] 
public 
string 
Nome 
{ 
get  
;  !
set" %
;% &
}' (
[ 	

DataMember	 
] 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
[ 	

DataMember	 
] 
public 
int 
LoginId 
{ 
get  
;  !
set" %
;% &
}' (
[ 	

DataMember	 
] 
public 
bool 
Ativo 
{ 
get 
;  
set! $
;$ %
}& '
public "
CriarConsumidorCommand %
(% &
)& '
{ 	
} 	
public "
CriarConsumidorCommand %
(% &
string 
nome 
, 
string 
email 
, 
int 
loginId 
, 
bool 
ativo 
= 
true 
) 
{ 	
Nome 
= 
nome 
; 
Email   
=   
email   
;   
LoginId!! 
=!! 
loginId!! 
;!! 
Ativo"" 
="" 
ativo"" 
;"" 
}## 	
}$$ 
}%%  5
óC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Application\Command\CriarConsumidorCommandHandler.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Application+ 6
.6 7
Command7 >
{ 
public 

class )
CriarConsumidorCommandHandler .
:	 

IRequestHandler 
< "
CriarConsumidorCommand 1
,1 2
bool3 7
>7 8
{ 
private 
readonly !
IConsumidorRepository .!
_consumidorRepository/ D
;D E
private 
readonly 
IIdentityService )
_identityService* :
;: ;
private 
readonly 
	IMediator "
	_mediator# ,
;, -
private 
readonly 9
-ITransacoesFinanceirasIntegrationEventService F9
-_transacoesFinanceirasIntegrationEventServiceG t
;t u
private 
readonly 
ILogger  
<  !)
CriarConsumidorCommandHandler! >
>> ?
_logger@ G
;G H
public )
CriarConsumidorCommandHandler ,
(, -
	IMediator- 6
mediator7 ?
,? @9
-ITransacoesFinanceirasIntegrationEventService 98
,transacoesFinanceirasIntegrationEventService: f
,f g!
IConsumidorRepository ! 
consumidorRepository" 6
,6 7
IIdentityService 
identityService ,
,, -
ILogger 
< )
CriarConsumidorCommandHandler 1
>1 2
logger3 9
)9 :
{ 	!
_consumidorRepository !
=" # 
consumidorRepository$ 8
??9 ;
throw< A
newB E!
ArgumentNullExceptionF [
([ \
nameof\ b
(b c 
consumidorRepositoryc w
)w x
)x y
;y z
_identityService 
= 
identityService .
??/ 1
throw2 7
new8 ;!
ArgumentNullException< Q
(Q R
nameofR X
(X Y
identityServiceY h
)h i
)i j
;j k
	_mediator   
=   
mediator    
??  ! #
throw  $ )
new  * -!
ArgumentNullException  . C
(  C D
nameof  D J
(  J K
mediator  K S
)  S T
)  T U
;  U V9
-_transacoesFinanceirasIntegrationEventService!! 9
=!!: ;8
,transacoesFinanceirasIntegrationEventService!!< h
??!!i k
throw!!l q
new!!r u"
ArgumentNullException	!!v ã
(
!!ã å
nameof
!!å í
(
!!í ì:
,transacoesFinanceirasIntegrationEventService
!!ì ø
)
!!ø ¿
)
!!¿ ¡
;
!!¡ ¬
_logger"" 
="" 
logger"" 
??"" 
throw""  %
new""& )!
ArgumentNullException""* ?
(""? @
nameof""@ F
(""F G
logger""G M
)""M N
)""N O
;""O P
}## 	
public%% 
async%% 
Task%% 
<%% 
bool%% 
>%% 
Handle%%  &
(%%& '"
CriarConsumidorCommand%%' =
message%%> E
,%%E F
CancellationToken%%G X
cancellationToken%%Y j
)%%j k
{&& 	
var'' 

consumidor'' 
='' 
new''  

Consumidor''! +
(''+ ,
message'', 3
.''3 4
Nome''4 8
,''8 9
message'': A
.''A B
Email''B G
,''G H
message''I P
.''P Q
LoginId''Q X
)''X Y
;''Y Z
var)) 
user)) 
=)) 
_identityService)) '
.))' (!
GetUserIdentityServer))( =
())= >
)))> ?
;))? @
var** 
loginid** 
=** 
user** 
.** 
SUB** "
;**" #
var++ 
	loginname++ 
=++ 
user++  
.++  !
	Client_Id++! *
;++* +
_logger-- 
.-- 
LogInformation-- "
(--" #
$str	--# Ç
,
--Ç É
loginid
--Ñ ã
,
--ã å
	loginname
--ç ñ
,
--ñ ó

consumidor
--ò ¢
)
--¢ £
;
--£ §!
_consumidorRepository// !
.//! "
Add//" %
(//% &

consumidor//& 0
)//0 1
;//1 2
var11 !
ConsumidorCriadoEvent11 %
=11& '
new11( +!
ConsumidorCriadoEvent11, A
(11A B
message11B I
.11I J
LoginId11J Q
)11Q R
;11R S
_logger22 
.22 
LogInformation22 "
(22" #
$str	22# Å
,
22Å Ç
loginid
22É ä
,
22ä ã
	loginname
22å ï
,
22ï ñ

consumidor
22ó °
)
22° ¢
;
22¢ £
await33 9
-_transacoesFinanceirasIntegrationEventService33 ?
.33? @ 
AddAndSaveEventAsync33@ T
(33T U!
ConsumidorCriadoEvent33U j
)33j k
;33k l
return55 
await55 
Task55 
.55 

FromResult55 (
(55( )
true55) -
)55- .
;55. /
}66 	
}88 
public:: 

class:: 3
'CriarConsumidorIdentifiedCommandHandler:: 8
:::9 :$
IdentifiedCommandHandler::; S
<::S T"
CriarConsumidorCommand::T j
,::j k
bool::l p
>::p q
{;; 
public<< 3
'CriarConsumidorIdentifiedCommandHandler<< 6
(<<6 7
	IMediator== 
mediator== 
,== 
IRequestManager>> 
requestManager>> *
,>>* +
ILogger?? 
<?? $
IdentifiedCommandHandler?? ,
<??, -"
CriarConsumidorCommand??- C
,??C D
bool??E I
>??I J
>??J K
logger??L R
)??R S
:@@ 
base@@ 
(@@ 
mediator@@ 
,@@ 
requestManager@@ +
,@@+ ,
logger@@- 3
)@@3 4
{AA 	
}BB 	
	protectedDD 
overrideDD 
boolDD +
CreateResultForDuplicateRequestDD  ?
(DD? @
)DD@ A
{EE 	
returnFF 
trueFF 
;FF 
}GG 	
}HH 
}II ∫
ëC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Application\Command\EditarConsumidorCommand.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Application+ 6
.6 7
Command7 >
{ 
public 

class #
EditarConsumidorCommand (
:) *
IRequest+ 3
<3 4
bool4 8
>8 9
{ 
[		 	

DataMember			 
]		 
public

 
int

 
Id

 
{

 
get

 
;

 
private

 $
set

% (
;

( )
}

* +
[ 	

DataMember	 
] 
public 
string 
Nome 
{ 
get  
;  !
set" %
;% &
}' (
[ 	

DataMember	 
] 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
[ 	

DataMember	 
] 
public 
int 
LoginId 
{ 
get  
;  !
private" )
set* -
;- .
}/ 0
[ 	

DataMember	 
] 
public 
bool 
Ativo 
{ 
get 
;  
set! $
;$ %
}& '
public #
EditarConsumidorCommand &
(& '
int' *
id+ -
,- .
string 
nome 
, 
string 
email 
, 
int 
loginId 
, 
bool 
ativo 
= 
true 
) 
{ 	
Id 
= 
id 
; 
Nome 
= 
nome 
; 
Email 
= 
email 
; 
LoginId 
= 
loginId 
; 
Ativo 
= 
ativo 
; 
}   	
}!! 
}"" ü3
òC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Application\Command\EditarConsumidorCommandHandler.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Application+ 6
.6 7
Command7 >
{ 
public 

class *
EditarConsumidorCommandHandler /
:0 1
IRequestHandler2 A
<A B#
EditarConsumidorCommandB Y
,Y Z
bool[ _
>_ `
{ 
private 
readonly 
	IMediator "
	_mediator# ,
;, -
private 
readonly 
IIdentityService )
_identityService* :
;: ;
private 
readonly !
IConsumidorRepository .!
_consumidorRepository/ D
;D E
private 
readonly 9
-ITransacoesFinanceirasIntegrationEventService F9
-_transacoesFinanceirasIntegrationEventServiceG t
;t u
private 
readonly 
ILogger  
<  !*
EditarConsumidorCommandHandler! ?
>? @
_loggerA H
;H I
public *
EditarConsumidorCommandHandler -
(- .
	IMediator 
mediator 
, 
IIdentityService 
identityService ,
,, -!
IConsumidorRepository ! 
consumidorRepository" 6
,6 79
-ITransacoesFinanceirasIntegrationEventService 98
,transacoesFinanceirasIntegrationEventService: f
,f g
ILogger 
< *
EditarConsumidorCommandHandler 2
>2 3
logger4 :
): ;
{ 	
	_mediator 
= 
mediator  
;  !
_identityService 
= 
identityService .
;. /!
_consumidorRepository !
=" # 
consumidorRepository$ 8
;8 99
-_transacoesFinanceirasIntegrationEventService   9
=  : ;8
,transacoesFinanceirasIntegrationEventService  < h
;  h i
_logger!! 
=!! 
logger!! 
;!! 
}"" 	
public)) 
async)) 
Task)) 
<)) 
bool)) 
>)) 
Handle))  &
())& '#
EditarConsumidorCommand))' >
command))? F
,))F G
CancellationToken))H Y
cancellationToken))Z k
)))k l
{** 	
var++ 
consumidorToUpdate++ "
=++# $
await++% *!
_consumidorRepository+++ @
.++@ A
FindByIdAsync++A N
(++N O
command++O V
.++V W
Id++W Y
)++Y Z
;++Z [
if,, 
(,, 
consumidorToUpdate,, "
==,,# %
null,,& *
),,* +
{-- 
return.. 
false.. 
;.. 
}// 
var11 
user11 
=11 
_identityService11 '
.11' (!
GetUserIdentityServer11( =
(11= >
)11> ?
;11? @
var22 
loginid22 
=22 
user22 
.22 
SUB22 "
;22" #
var33 
	loginname33 
=33 
user33  
.33  !
	Client_Id33! *
;33* +
_logger55 
.55 
LogInformation55 "
(55" #
$str	55# Å
,
55Å Ç
loginid
55É ä
,
55ä ã
	loginname
55å ï
,
55ï ñ
command
55ó û
)
55û ü
;
55ü †
var77 
consumidorEditado77 !
=77" #!
_consumidorRepository77$ 9
.779 :
Update77: @
(77@ A
new77A D

Consumidor77E O
(77O P
id88 
:88 
command88 
.88 
Id88 
,88 
nome99 
:99 
command99 
.99 
Nome99 "
,99" #
email:: 
::: 
command:: 
.:: 
Email:: $
,::$ %
loginid;; 
:;; 
command;;  
.;;  !
LoginId;;! (
);;( )
);;) *
;;;* +
_logger== 
.== 
LogInformation== "
(==" #
$str	==# Ä
,
==Ä Å
loginid
==Ç â
,
==â ä
	loginname
==ã î
,
==î ï
command
==ñ ù
)
==ù û
;
==û ü
var>> "
consumidorEditadoEvent>> &
=>>' (
new>>) ,"
ConsumidorEditadoEvent>>- C
(>>C D
consumidorEditado>>D U
.>>U V
Id>>V X
)>>X Y
;>>Y Z
await?? 9
-_transacoesFinanceirasIntegrationEventService?? ?
.??? @ 
AddAndSaveEventAsync??@ T
(??T U"
consumidorEditadoEvent??U k
)??k l
;??l m
returnAA 
awaitAA !
_consumidorRepositoryAA .
.AA. /

UnitOfWorkAA/ 9
.AA9 :
SaveEntitiesAsyncAA: K
(AAK L
cancellationTokenAAL ]
)AA] ^
;AA^ _
}BB 	
}CC 
publicEE 

classEE 4
(EditarConsumidorIdentifiedCommandHandlerEE 9
:EE: ;$
IdentifiedCommandHandlerEE< T
<EET U#
EditarConsumidorCommandEEU l
,EEl m
boolEEn r
>EEr s
{FF 
publicGG 4
(EditarConsumidorIdentifiedCommandHandlerGG 7
(GG7 8
	IMediatorHH 
mediatorHH 
,HH 
IRequestManagerII 
requestManagerII *
,II* +
ILoggerJJ 
<JJ $
IdentifiedCommandHandlerJJ ,
<JJ, -#
EditarConsumidorCommandJJ- D
,JJD E
boolJJF J
>JJJ K
>JJK L
loggerJJM S
)JJS T
:KK 
baseKK 
(KK 
mediatorKK 
,KK 
requestManagerKK +
,KK+ ,
loggerKK- 3
)KK3 4
{LL 	
}MM 	
	protectedOO 
overrideOO 
boolOO +
CreateResultForDuplicateRequestOO  ?
(OO? @
)OO@ A
{PP 	
returnQQ 
trueQQ 
;QQ 
}RR 	
}SS 
}TT È
íC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Application\Command\ExcluirConsumidorCommand.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Application+ 6
.6 7
Command7 >
{ 
public 

class $
ExcluirConsumidorCommand )
:* +
IRequest, 4
<4 5
bool5 9
>9 :
{ 
[		 	

DataMember			 
]		 
public

 
int

 
Id

 
{

 
get

 
;

 
private

 $
set

% (
;

( )
}

* +
public $
ExcluirConsumidorCommand '
(' (
int( +
id, .
). /
{ 	
Id 
= 
id 
; 
} 	
} 
} ˚/
ôC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Application\Command\ExcluirConsumidorCommandHandler.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Application+ 6
.6 7
Command7 >
{ 
public 

class +
ExcluirConsumidorCommandHandler 0
:1 2
IRequestHandler3 B
<B C$
ExcluirConsumidorCommandC [
,[ \
bool] a
>a b
{ 
private 
readonly 
	IMediator "
	_mediator# ,
;, -
private 
readonly 
IIdentityService )
_identityService* :
;: ;
private 
readonly !
IConsumidorRepository .!
_consumidorRepository/ D
;D E
private 
readonly 9
-ITransacoesFinanceirasIntegrationEventService F9
-_transacoesFinanceirasIntegrationEventServiceG t
;t u
private 
readonly 
ILogger  
<  !+
ExcluirConsumidorCommandHandler! @
>@ A
_loggerB I
;I J
public +
ExcluirConsumidorCommandHandler .
(. /
	IMediator 
mediator 
, 
IIdentityService 
identityService ,
,, -!
IConsumidorRepository ! 
consumidorRepository" 6
,6 79
-ITransacoesFinanceirasIntegrationEventService 98
,transacoesFinanceirasIntegrationEventService: f
,f g
ILogger 
< +
ExcluirConsumidorCommandHandler 3
>3 4
logger5 ;
); <
{ 	
	_mediator 
= 
mediator  
;  !
_identityService 
= 
identityService .
;. /!
_consumidorRepository !
=" # 
consumidorRepository$ 8
;8 99
-_transacoesFinanceirasIntegrationEventService   9
=  : ;8
,transacoesFinanceirasIntegrationEventService  < h
;  h i
_logger!! 
=!! 
logger!! 
;!! 
}"" 	
public)) 
async)) 
Task)) 
<)) 
bool)) 
>)) 
Handle))  &
())& '$
ExcluirConsumidorCommand))' ?
command))@ G
,))G H
CancellationToken))I Z
cancellationToken))[ l
)))l m
{** 	
var++ 
consumidorToDelete++ "
=++# $
await++% *!
_consumidorRepository+++ @
.++@ A
FindByIdAsync++A N
(++N O
command++O V
.++V W
Id++W Y
)++Y Z
;++Z [
if,, 
(,, 
consumidorToDelete,, "
==,,# %
null,,& *
),,* +
{-- 
return.. 
false.. 
;.. 
}// 
var11 
user11 
=11 
_identityService11 '
.11' (!
GetUserIdentityServer11( =
(11= >
)11> ?
;11? @
var22 
loginid22 
=22 
user22 
.22 
SUB22 "
;22" #
var33 
	loginname33 
=33 
user33  
.33  !
	Client_Id33! *
;33* +
_logger55 
.55 
LogInformation55 "
(55" #
$str	55# Ç
,
55Ç É
loginid
55Ñ ã
,
55ã å
	loginname
55ç ñ
,
55ñ ó
command
55ò ü
)
55ü †
;
55† °
var77 
consumidorExcluido77 "
=77# $!
_consumidorRepository77% :
.77: ;
Remove77; A
(77A B
consumidorToDelete77B T
)77T U
;77U V
_logger99 
.99 
LogInformation99 "
(99" #
$str	99# Å
,
99Å Ç
loginid
99É ä
,
99ä ã
	loginname
99å ï
,
99ï ñ
command
99ó û
)
99û ü
;
99ü †
var;; #
consumidorExcluidoEvent;; '
=;;( )
new;;* -#
ConsumidorExcluidoEvent;;. E
(;;E F
consumidorExcluido;;F X
.;;X Y
Id;;Y [
);;[ \
;;;\ ]
await<< 9
-_transacoesFinanceirasIntegrationEventService<< ?
.<<? @ 
AddAndSaveEventAsync<<@ T
(<<T U#
consumidorExcluidoEvent<<U l
)<<l m
;<<m n
return>> 
await>> !
_consumidorRepository>> .
.>>. /

UnitOfWork>>/ 9
.>>9 :
SaveEntitiesAsync>>: K
(>>K L
cancellationToken>>L ]
)>>] ^
;>>^ _
}?? 	
}@@ 
publicBB 

classBB 5
)ExcluirConsumidorIdentifiedCommandHandlerBB :
:BB; <$
IdentifiedCommandHandlerBB= U
<BBU V$
ExcluirConsumidorCommandBBV n
,BBn o
boolBBp t
>BBt u
{CC 
publicDD 5
)ExcluirConsumidorIdentifiedCommandHandlerDD 8
(DD8 9
	IMediatorEE 
mediatorEE 
,EE 
IRequestManagerFF 
requestManagerFF *
,FF* +
ILoggerGG 
<GG $
IdentifiedCommandHandlerGG ,
<GG, -$
ExcluirConsumidorCommandGG- E
,GGE F
boolGGG K
>GGK L
>GGL M
loggerGGN T
)GGT U
:HH 
baseHH 
(HH 
mediatorHH 
,HH 
requestManagerHH +
,HH+ ,
loggerHH- 3
)HH3 4
{II 	
}JJ 	
	protectedLL 
overrideLL 
boolLL +
CreateResultForDuplicateRequestLL  ?
(LL? @
)LL@ A
{MM 	
returnNN 
trueNN 
;NN 
}OO 	
}PP 
}QQ ò

ãC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Application\Command\IdentifiedCommand.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Application+ 6
.6 7
Command7 >
{ 
public 

class 
IdentifiedCommand "
<" #
T# $
,$ %
R& '
>' (
:) *
IRequest+ 3
<3 4
R4 5
>5 6
where 
T 
: 
IRequest 
< 
R 
> 
{		 
public

 
T

 
Command

 
{

 
get

 
;

 
}

  !
public 
Guid 
Id 
{ 
get 
; 
} 
public 
IdentifiedCommand  
(  !
T! "
command# *
,* +
Guid, 0
id1 3
)3 4
{ 	
Command 
= 
command 
; 
Id 
= 
id 
; 
} 	
} 
} Ì.
íC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Application\Command\IdentifiedCommandHandler.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Application+ 6
.6 7
Command7 >
{ 
public 

class $
IdentifiedCommandHandler )
<) *
T* +
,+ ,
R- .
>. /
:0 1
IRequestHandler2 A
<A B
IdentifiedCommandB S
<S T
TT U
,U V
RW X
>X Y
,Y Z
R[ \
>\ ]
where 
T 
: 
IRequest 
< 
R  
>  !
{ 
private 
readonly 
	IMediator "
	_mediator# ,
;, -
private 
readonly 
IRequestManager (
_requestManager) 8
;8 9
private 
readonly 
ILogger  
<  !$
IdentifiedCommandHandler! 9
<9 :
T: ;
,; <
R= >
>> ?
>? @
_loggerA H
;H I
public $
IdentifiedCommandHandler '
(' (
	IMediator 
mediator 
, 
IRequestManager 
requestManager *
,* +
ILogger 
< $
IdentifiedCommandHandler ,
<, -
T- .
,. /
R0 1
>1 2
>2 3
logger4 :
): ;
{ 	
	_mediator 
= 
mediator  
;  !
_requestManager 
= 
requestManager ,
;, -
_logger 
= 
logger 
?? 
throw  %
new& )
System* 0
.0 1!
ArgumentNullException1 F
(F G
nameofG M
(M N
loggerN T
)T U
)U V
;V W
} 	
	protected 
virtual 
R +
CreateResultForDuplicateRequest ;
(; <
)< =
{ 	
return 
default 
; 
} 	
public!! 
async!! 
Task!! 
<!! 
R!! 
>!! 
Handle!! #
(!!# $
IdentifiedCommand!!$ 5
<!!5 6
T!!6 7
,!!7 8
R!!9 :
>!!: ;
message!!< C
,!!C D
CancellationToken!!E V
cancellationToken!!W h
)!!h i
{"" 	
var## 
alreadyExists## 
=## 
await##  %
_requestManager##& 5
.##5 6

ExistAsync##6 @
(##@ A
message##A H
.##H I
Id##I K
)##K L
;##L M
if$$ 
($$ 
alreadyExists$$ 
)$$ 
{%% 
return&& +
CreateResultForDuplicateRequest&& 6
(&&6 7
)&&7 8
;&&8 9
}'' 
else(( 
{)) 
await** 
_requestManager** %
.**% &(
CreateRequestForCommandAsync**& B
<**B C
T**C D
>**D E
(**E F
message**F M
.**M N
Id**N P
)**P Q
;**Q R
try++ 
{,, 
var-- 
command-- 
=--  !
message--" )
.--) *
Command--* 1
;--1 2
var.. 
commandName.. #
=..$ %
command..& -
...- .
GetGenericTypeName... @
(..@ A
)..A B
;..B C
var// 

idProperty// "
=//# $
string//% +
.//+ ,
Empty//, 1
;//1 2
var00 
	commandId00 !
=00" #
string00$ *
.00* +
Empty00+ 0
;000 1
switch22 
(22 
command22 #
)22# $
{33 
case44 "
CriarConsumidorCommand44 3"
criarConsumidorCommand444 J
:44J K

idProperty55 &
=55' (
nameof55) /
(55/ 0"
criarConsumidorCommand550 F
.55F G
LoginId55G N
)55N O
;55O P
	commandId66 %
=66& '"
criarConsumidorCommand66( >
.66> ?
LoginId66? F
.66F G
ToString66G O
(66O P
)66P Q
;66Q R
break77 !
;77! "
default99 
:99  

idProperty:: &
=::' (
$str::) .
;::. /
	commandId;; %
=;;& '
$str;;( -
;;;- .
break<< !
;<<! "
}== 
_logger?? 
.?? 
LogInformation?? *
(??* +
$str@@ g
,@@g h
commandNameAA #
,AA# $

idPropertyBB "
,BB" #
	commandIdCC !
,CC! "
commandDD 
)DD  
;DD  !
varFF 
resultFF 
=FF  
awaitFF! &
	_mediatorFF' 0
.FF0 1
SendFF1 5
(FF5 6
commandFF6 =
,FF= >
cancellationTokenFF? P
)FFP Q
;FFQ R
_loggerHH 
.HH 
LogInformationHH *
(HH* +
$strII r
,IIr s
resultJJ 
,JJ 
commandNameKK #
,KK# $

idPropertyLL "
,LL" #
	commandIdMM !
,MM! "
commandNN 
)NN  
;NN  !
returnPP 
resultPP !
;PP! "
}QQ 
catchRR 
{SS 
returnTT 
defaultTT "
;TT" #
}UU 
}VV 
}WW 	
}XX 
}YY æ
ÆC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Application\IntegrationEvents\EventHandling\ConsumidorCriadoEventHandler.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Application+ 6
.6 7
IntegrationEvents7 H
.H I
EventHandlingI V
{ 
public 

class (
ConsumidorCriadoEventHandler -
:. /$
IIntegrationEventHandler0 H
<H I!
ConsumidorCriadoEventI ^
>^ _
{ 
private 
readonly 
	IMediator "
	_mediator# ,
;, -
private 
readonly 
ILogger  
<  !(
ConsumidorCriadoEventHandler! =
>= >
_logger? F
;F G
public (
ConsumidorCriadoEventHandler +
(+ ,
	IMediator 
mediator 
, 
ILogger 
< (
ConsumidorCriadoEventHandler 0
>0 1
logger2 8
)8 9
{ 	
	_mediator 
= 
mediator  
;  !
_logger 
= 
logger 
?? 
throw  %
new& )
System* 0
.0 1!
ArgumentNullException1 F
(F G
nameofG M
(M N
loggerN T
)T U
)U V
;V W
} 	
public 
async 
Task 
Handle  
(  !!
ConsumidorCriadoEvent! 6
@event7 =
)= >
{ 	
using 
( 

LogContext 
. 
PushProperty *
(* +
$str+ D
,D E
$"F H
{H I
@eventI O
.O P
IdP R
}R S
-S T
{T U
ProgramU \
.\ ]
AppName] d
}d e
"e f
)f g
)g h
{   
_logger!! 
.!! 
LogInformation!! &
(!!& '
$str	!!' Ñ
,
!!Ñ Ö
@event
!!Ü å
.
!!å ç
Id
!!ç è
,
!!è ê
Program
!!ë ò
.
!!ò ô
AppName
!!ô †
,
!!† °
@event
!!¢ ®
)
!!® ©
;
!!© ™
await"" 
Task"" 
."" 
Run"" 
("" 
(""  
)""  !
=>""" $
{""% &
}""' (
)""( )
;"") *
}## 
}$$ 	
}%% 
}&& ±
†C:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Application\IntegrationEvents\Events\ConsumidorCriadoEvent.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Application+ 6
.6 7
IntegrationEvents7 H
.H I
EventsI O
{ 
public 

class !
ConsumidorCriadoEvent &
:' (
IntegrationEvent) 9
{ 
public 
int 
LoginId 
{ 
get  
;  !
set" %
;% &
}' (
public

 !
ConsumidorCriadoEvent

 $
(

$ %
int

% (
loginId

) 0
)

0 1
=> 
LoginId 
= 
loginId  
;  !
} 
} ¥
°C:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Application\IntegrationEvents\Events\ConsumidorEditadoEvent.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Application+ 6
.6 7
IntegrationEvents7 H
.H I
EventsI O
{ 
public 

class "
ConsumidorEditadoEvent '
:( )
IntegrationEvent* :
{ 
public 
int 
ConsumidorId 
{  !
get" %
;% &
set' *
;* +
}, -
public

 "
ConsumidorEditadoEvent

 %
(

% &
int

& )
id

* ,
)

, -
=> 
ConsumidorId 
= 
id  
;  !
} 
} ∑
¢C:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Application\IntegrationEvents\Events\ConsumidorExcluidoEvent.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Application+ 6
.6 7
IntegrationEvents7 H
.H I
EventsI O
{ 
public 

class #
ConsumidorExcluidoEvent (
:) *
IntegrationEvent+ ;
{ 
public 
int 
ConsumidorId 
{  !
get" %
;% &
set' *
;* +
}, -
public

 #
ConsumidorExcluidoEvent

 &
(

& '
int

' *
id

+ -
)

- .
=> 
ConsumidorId 
= 
id  
;  !
} 
} Œ
±C:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Application\IntegrationEvents\ITransacoesFinanceirasIntegrationEventService.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Application+ 6
.6 7
IntegrationEvents7 H
{ 
public 

	interface 9
-ITransacoesFinanceirasIntegrationEventService B
{		 
Task

 -
!PublishEventsThroughEventBusAsync

 .
(

. /
Guid

/ 3
transactionId

4 A
)

A B
;

B C
Task  
AddAndSaveEventAsync !
(! "
IntegrationEvent" 2
evt3 6
)6 7
;7 8
} 
} ÿ5
∞C:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Application\IntegrationEvents\TransacoesFinanceirasIntegrationEventService.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Application+ 6
.6 7
IntegrationEvents7 H
{ 
public 

class 8
,TransacoesFinanceirasIntegrationEventService =
:> ?9
-ITransacoesFinanceirasIntegrationEventService@ m
{ 
private 
readonly 
Func 
< 
DbConnection *
,* +'
IIntegrationEventLogService, G
>G H.
"_integrationEventLogServiceFactoryI k
;k l
private 
readonly 
	IEventBus "
	_eventBus# ,
;, -
private 
readonly (
TransacoesFinanceirasContext 5
_context6 >
;> ?
private 
readonly &
IntegrationEventLogContext 3
_eventLogContext4 D
;D E
private 
readonly '
IIntegrationEventLogService 4
_eventLogService5 E
;E F
private 
readonly 
ILogger  
<  !8
,TransacoesFinanceirasIntegrationEventService! M
>M N
_loggerO V
;V W
public 8
,TransacoesFinanceirasIntegrationEventService ;
(; <
	IEventBus< E
eventBusF N
,N O(
TransacoesFinanceirasContext (
orderingContext) 8
,8 9&
IntegrationEventLogContext &
eventLogContext' 6
,6 7
Func 
< 
DbConnection 
, '
IIntegrationEventLogService :
>: ;-
!integrationEventLogServiceFactory< ]
,] ^
ILogger 
< 8
,TransacoesFinanceirasIntegrationEventService @
>@ A
loggerB H
)H I
{ 	
_context 
= 
orderingContext &
??' )
throw* /
new0 3!
ArgumentNullException4 I
(I J
nameofJ P
(P Q
orderingContextQ `
)` a
)a b
;b c
_eventLogContext 
= 
eventLogContext .
??/ 1
throw2 7
new8 ;!
ArgumentNullException< Q
(Q R
nameofR X
(X Y
eventLogContextY h
)h i
)i j
;j k.
"_integrationEventLogServiceFactory   .
=  / 0-
!integrationEventLogServiceFactory  1 R
??  S U
throw  V [
new  \ _!
ArgumentNullException  ` u
(  u v
nameof  v |
(  | }.
!integrationEventLogServiceFactory	  } û
)
  û ü
)
  ü †
;
  † °
	_eventBus!! 
=!! 
eventBus!!  
??!!! #
throw!!$ )
new!!* -!
ArgumentNullException!!. C
(!!C D
nameof!!D J
(!!J K
eventBus!!K S
)!!S T
)!!T U
;!!U V
_eventLogService"" 
="" .
"_integrationEventLogServiceFactory"" A
(""A B
_context""B J
.""J K
Database""K S
.""S T
GetDbConnection""T c
(""c d
)""d e
)""e f
;""f g
_logger## 
=## 
logger## 
??## 
throw##  %
new##& )!
ArgumentNullException##* ?
(##? @
nameof##@ F
(##F G
logger##G M
)##M N
)##N O
;##O P
}$$ 	
public&& 
async&& 
Task&& -
!PublishEventsThroughEventBusAsync&& ;
(&&; <
Guid&&< @
transactionId&&A N
)&&N O
{'' 	
var(( 
pendingLogEvents((  
=((! "
await((# (
_eventLogService(() 9
.((9 :2
&RetrieveEventLogsPendingToPublishAsync((: `
(((` a
transactionId((a n
)((n o
;((o p
foreach** 
(** 
var** 
logEvt** 
in**  "
pendingLogEvents**# 3
)**3 4
{++ 
_logger,, 
.,, 
LogInformation,, &
(,,& '
$str	,,' à
,
,,à â
logEvt
,,ä ê
.
,,ê ë
EventId
,,ë ò
,
,,ò ô
Program
,,ö °
.
,,° ¢
AppName
,,¢ ©
,
,,© ™
logEvt
,,´ ±
.
,,± ≤
IntegrationEvent
,,≤ ¬
)
,,¬ √
;
,,√ ƒ
try.. 
{// 
await00 
_eventLogService00 *
.00* +&
MarkEventAsInProgressAsync00+ E
(00E F
logEvt00F L
.00L M
EventId00M T
)00T U
;00U V
	_eventBus11 
.11 
Publish11 %
(11% &
logEvt11& ,
.11, -
IntegrationEvent11- =
)11= >
;11> ?
await22 
_eventLogService22 *
.22* +%
MarkEventAsPublishedAsync22+ D
(22D E
logEvt22E K
.22K L
EventId22L S
)22S T
;22T U
}33 
catch44 
(44 
	Exception44  
ex44! #
)44# $
{55 
_logger66 
.66 
LogError66 $
(66$ %
ex66% '
,66' (
$str66) r
,66r s
logEvt66t z
.66z {
EventId	66{ Ç
,
66Ç É
Program
66Ñ ã
.
66ã å
AppName
66å ì
)
66ì î
;
66î ï
await88 
_eventLogService88 *
.88* +"
MarkEventAsFailedAsync88+ A
(88A B
logEvt88B H
.88H I
EventId88I P
)88P Q
;88Q R
}99 
}:: 
};; 	
public== 
async== 
Task==  
AddAndSaveEventAsync== .
(==. /
IntegrationEvent==/ ?
evt==@ C
)==C D
{>> 	
_logger?? 
.?? 
LogInformation?? "
(??" #
$str??# 
,	?? Ä
evt
??Å Ñ
.
??Ñ Ö
Id
??Ö á
,
??á à
evt
??â å
)
??å ç
;
??ç é
awaitAA 
_eventLogServiceAA "
.AA" #
SaveEventAsyncAA# 1
(AA1 2
evtAA2 5
,AA5 6
_contextAA7 ?
.AA? @!
GetCurrentTransactionAA@ U
(AAU V
)AAV W
)AAW X
;AAX Y
}BB 	
}CC 
}DD å0
ãC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Application\Queries\ConsumidorQueries.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Application+ 6
.6 7
Queries7 >
{ 
public

 

class

 
ConsumidorQueries

 "
: 	
IConsumidorQueries
 
{ 
private 
string 
_connectionString (
=) *
string+ 1
.1 2
Empty2 7
;7 8
public 
ConsumidorQueries  
(  !
string! '
constr( .
). /
{ 	
_connectionString 
= 
!  !
string! '
.' (
IsNullOrWhiteSpace( :
(: ;
constr; A
)A B
?C D
constrE K
:L M
throwN S
newT W!
ArgumentNullExceptionX m
(m n
nameofn t
(t u
constru {
){ |
)| }
;} ~
} 	
public 
async 
Task 
< 

Consumidor $
>$ %
GetConsumidorAsync& 8
(8 9
int9 <
loginid= D
)D E
{ 	
using 
( 
var 

connection !
=" #
new$ '
SqlConnection( 5
(5 6
_connectionString6 G
)G H
)H I
{ 

connection 
. 
Open 
(  
)  !
;! "
var 
result 
= 
await "

connection# -
.- .

QueryAsync. 8
<8 9
dynamic9 @
>@ A
(A B
$str" ;
,""; <
new""= @
{""A B
loginid""C J
}""K L
)## 
;## 
if%% 
(%% 
result%% 
.%% 
AsList%% !
(%%! "
)%%" #
.%%# $
Count%%$ )
==%%* ,
$num%%- .
)%%. /
return&& 
null&& 
;&&  
return(( 
MapConsumidor(( $
((($ %
result((% +
)((+ ,
;((, -
})) 
}** 	
public,, 
async,, 
Task,, 
<,, 
List,, 
<,, 

Consumidor,, )
>,,) *
>,,* + 
GetConsumidoresAsync,,, @
(,,@ A
),,A B
{-- 	
using.. 
(.. 
var.. 

connection.. !
=.." #
new..$ '
SqlConnection..( 5
(..5 6
_connectionString..6 G
)..G H
)..H I
{// 

connection00 
.00 
Open00 
(00  
)00  !
;00! "
var22 
result22 
=22 
await22 "

connection22# -
.22- .

QueryAsync22. 8
<228 9
dynamic229 @
>22@ A
(22A B
$str38 P
)99 
;99 
if;; 
(;; 
result;; 
.;; 
AsList;; !
(;;! "
);;" #
.;;# $
Count;;$ )
==;;* ,
$num;;- .
);;. /
return<< 
new<< 
List<< #
<<<# $

Consumidor<<$ .
><<. /
(<</ 0
)<<0 1
;<<1 2
return>> 
MapConsumidores>> &
(>>& '
result>>' -
)>>- .
;>>. /
}?? 
}@@ 	
privateBB 

ConsumidorBB 
MapConsumidorBB (
(BB( )
dynamicBB) 0
itemBB1 5
)BB5 6
{CC 	
returnDD 
newDD 

ConsumidorDD !
(DD! "
)DD" #
{EE 
IdFF 
=FF 
itemFF 
[FF 
$numFF 
]FF 
.FF 
IdFF 
,FF  
NomeGG 
=GG 
itemGG 
[GG 
$numGG 
]GG 
.GG 
NomeGG #
,GG# $
EmailHH 
=HH 
itemHH 
[HH 
$numHH 
]HH 
.HH  
EmailHH  %
,HH% &
LoginIdII 
=II 
itemII 
[II 
$numII  
]II  !
.II! "
LoginIdII" )
,II) *
AtivoJJ 
=JJ 
itemJJ 
[JJ 
$numJJ 
]JJ 
.JJ  
AtivoJJ  %
}KK 
;KK 
}LL 	
privateNN 
ListNN 
<NN 

ConsumidorNN 
>NN  
MapConsumidoresNN! 0
(NN0 1
dynamicNN1 8

collectionNN9 C
)NNC D
{OO 	
varPP 
consumidoresPP 
=PP 
newPP "
ListPP# '
<PP' (

ConsumidorPP( 2
>PP2 3
(PP3 4
)PP4 5
;PP5 6
foreachRR 
(RR 
dynamicRR 
itemRR !
inRR" $

collectionRR% /
)RR/ 0
{SS 
consumidoresTT 
.TT 
AddTT  
(TT  !
newTT! $

ConsumidorTT% /
{UU 
IdVV 
=VV 
itemVV 
.VV 
IdVV  
,VV  !
NomeWW 
=WW 
itemWW 
.WW  
NomeWW  $
,WW$ %
EmailXX 
=XX 
itemXX  
.XX  !
EmailXX! &
,XX& '
LoginIdYY 
=YY 
itemYY "
.YY" #
LoginIdYY# *
,YY* +
AtivoZZ 
=ZZ 
itemZZ  
.ZZ  !
AtivoZZ! &
}[[ 
)[[ 
;[[ 
}\\ 
return^^ 
consumidores^^ 
;^^  
}__ 	
}`` 
}aa ¡	
çC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Application\Queries\ConsumidorViewModel.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Application+ 6
.6 7
Queries7 >
{ 
public 

class 

Consumidor 
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Nome 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public		 
int		 
LoginId		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 
bool

 
Ativo

 
{

 
get

 
;

  
set

! $
;

$ %
}

& '
} 
} €
åC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Application\Queries\IConsumidorQueries.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Application+ 6
.6 7
Queries7 >
{ 
public 

	interface 
IConsumidorQueries '
{ 
Task		 
<		 

Consumidor		 
>		 
GetConsumidorAsync		 +
(		+ ,
int		, /
loginid		0 7
)		7 8
;		8 9
Task

 
<

 
List

 
<

 

Consumidor

 
>

 
>

  
GetConsumidoresAsync

 3
(

3 4
)

4 5
;

5 6
} 
} µ
ùC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Application\Validations\CriarConsumidorCommandValidator.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Application+ 6
.6 7
Validations7 B
{ 
public 

class +
CriarConsumidorCommandValidator 0
:1 2
AbstractValidator3 D
<D E"
CriarConsumidorCommandE [
>[ \
{		 
public

 +
CriarConsumidorCommandValidator

 .
(

. /
ILogger

/ 6
<

6 7+
CriarConsumidorCommandValidator

7 V
>

V W
logger

X ^
)

^ _
{ 	
RuleFor 
( 
command 
=> 
command &
.& '
Nome' +
)+ ,
., -
NotEmpty- 5
(5 6
)6 7
.7 8
WithMessage8 C
(C D
$strD z
)z {
;{ |
RuleFor 
( 
command 
=> 
command &
.& '
Email' ,
), -
.- .
NotEmpty. 6
(6 7
)7 8
.8 9
WithMessage9 D
(D E
$strE }
)} ~
;~ 
;
Ä Å
logger 
. 
LogTrace 
( 
$str B
,B C
GetTypeD K
(K L
)L M
.M N
NameN R
)R S
;S T
} 	
} 
} ÿ
ûC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Application\Validations\EditarConsumidorCommandValidator.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Application+ 6
.6 7
Validations7 B
{ 
public 

class ,
 EditarConsumidorCommandValidator 1
:2 3
AbstractValidator4 E
<E F#
EditarConsumidorCommandF ]
>] ^
{		 
public

 ,
 EditarConsumidorCommandValidator

 /
(

/ 0
ILogger

0 7
<

7 8,
 EditarConsumidorCommandValidator

8 X
>

X Y
logger

Z `
)

` a
{ 	
RuleFor 
( 
command 
=> 
command &
.& '
Id' )
)) *
.* +
NotEmpty+ 3
(3 4
)4 5
.5 6
WithMessage6 A
(A B
$strB |
)| }
;} ~
RuleFor 
( 
command 
=> 
command &
.& '
Nome' +
)+ ,
., -
NotEmpty- 5
(5 6
)6 7
.7 8
WithMessage8 C
(C D
$strD u
)u v
;v w
RuleFor 
( 
command 
=> 
command &
.& '
Email' ,
), -
.- .
NotEmpty. 6
(6 7
)7 8
.8 9
WithMessage9 D
(D E
$strE x
)x y
;y z
RuleFor 
( 
command 
=> 
command &
.& '
LoginId' .
). /
./ 0
NotEmpty0 8
(8 9
)9 :
.: ;
WithMessage; F
(F G
$str	G ä
)
ä ã
;
ã å
RuleFor 
( 
command 
=> 
command &
.& '
Ativo' ,
), -
.- .
NotEmpty. 6
(6 7
)7 8
.8 9
WithMessage9 D
(D E
$strE {
){ |
;| }
logger 
. 
LogTrace 
( 
$str B
,B C
GetTypeD K
(K L
)L M
.M N
NameN R
)R S
;S T
} 	
} 
} Û

üC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Application\Validations\ExcluirConsumidorCommandValidator.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Application+ 6
.6 7
Validations7 B
{ 
public 

class -
!ExcluirConsumidorCommandValidator 2
:3 4
AbstractValidator5 F
<F G$
ExcluirConsumidorCommandG _
>_ `
{		 
public

 -
!ExcluirConsumidorCommandValidator

 0
(

0 1
ILogger

1 8
<

8 9-
!ExcluirConsumidorCommandValidator

9 Z
>

Z [
logger

\ b
)

b c
{ 	
RuleFor 
( 
command 
=> 
command &
.& '
Id' )
)) *
.* +
NotEmpty+ 3
(3 4
)4 5
.5 6
WithMessage6 A
(A B
$strB }
)} ~
;~ 
logger 
. 
LogTrace 
( 
$str B
,B C
GetTypeD K
(K L
)L M
.M N
NameN R
)R S
;S T
} 	
} 
} ∑ÿ
ÅC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Base\CustomExtensionMethods.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Base+ /
{ 
public!! 

static!! 
class!! "
CustomExtensionMethods!! .
{"" 
public## 
static## 
IServiceCollection## (
AddCustomMvc##) 5
(##5 6
this##6 :
IServiceCollection##; M
services##N V
)##V W
{$$ 	
services%% 
.%% 
AddMvc%% 
(%% 
options%% #
=>%%$ &
{&& 
options'' 
.'' 
Filters'' 
.''  
Add''  #
(''# $
typeof''$ *
(''* +%
HttpGlobalExceptionFilter''+ D
)''D E
)''E F
;''F G
}(( 
)(( 
.)) #
SetCompatibilityVersion)) (
())( ) 
CompatibilityVersion))) =
.))= >
Version_2_2))> I
)))I J
.** $
AddControllersAsServices** )
(**) *
)*** +
;**+ ,
services,, 
.,, 
AddCors,, 
(,, 
options,, $
=>,,% '
{-- 
options.. 
... 
	AddPolicy.. !
(..! "
$str.." .
,... /
builder// 
=>// 
builder// &
.00 
SetIsOriginAllowed00 '
(00' (
(00( )
host00) -
)00- .
=>00/ 1
true002 6
)006 7
.11 
AllowAnyMethod11 #
(11# $
)11$ %
.22 
AllowAnyHeader22 #
(22# $
)22$ %
.33 
AllowCredentials33 %
(33% &
)33& '
)33' (
;33( )
}44 
)44 
;44 
return66 
services66 
;66 
}77 	
public99 
static99 
IServiceCollection99 (
AddHealthChecks99) 8
(998 9
this999 =
IServiceCollection99> P
services99Q Y
,99Y Z
IConfiguration99[ i
configuration99j w
)99w x
{:: 	
var;; 
	hcBuilder;; 
=;; 
services;; $
.;;$ %
AddHealthChecks;;% 4
(;;4 5
);;5 6
;;;6 7
	hcBuilder== 
.== 
AddCheck== 
(== 
$str== %
,==% &
(==' (
)==( )
=>==* ,
HealthCheckResult==- >
.==> ?
Healthy==? F
(==F G
)==G H
)==H I
;==I J
	hcBuilder?? 
.@@ 
AddSqlServer@@ 
(@@ 
configurationAA !
[AA! "
$strAA" 4
]AA4 5
,AA5 6
nameBB 
:BB 
$strBB +
,BB+ ,
tagsCC 
:CC 
newCC 
stringCC $
[CC$ %
]CC% &
{CC' (
$strCC) F
}CCG H
)CCH I
;CCI J
	hcBuilderEE 
.FF 
AddRedisFF 
(FF 
configurationGG !
[GG! "
$strGG" 9
]GG9 :
,GG: ;
nameHH 
:HH 
$strHH '
,HH' (
tagsII 
:II 
newII 
stringII $
[II$ %
]II% &
{II' (
$strII) 0
}II1 2
)II2 3
;II3 4
	hcBuilderWW 
.XX 
AddRabbitMQXX 
(XX 
$"YY 
amqp://YY 
{YY 
configurationYY +
[YY+ ,
$strYY, @
]YY@ A
}YYA B
"YYB C
,YYC D
nameZZ 
:ZZ 
$strZZ -
,ZZ- .
tags[[ 
:[[ 
new[[ 
string[[ $
[[[$ %
][[% &
{[[' (
$str[[) 6
}[[7 8
)[[8 9
;[[9 :
return^^ 
services^^ 
;^^ 
}__ 	
publicaa 
staticaa 
IServiceCollectionaa ("
AddApplicationInsightsaa) ?
(aa? @
thisaa@ D
IServiceCollectionaaE W
servicesaaX `
,aa` a
IConfigurationaab p
configurationaaq ~
)aa~ 
{bb 	
servicescc 
.cc +
AddApplicationInsightsTelemetrycc 4
(cc4 5
configurationcc5 B
)ccB C
;ccC D
vardd 
orchestratorTypedd  
=dd! "
configurationdd# 0
.dd0 1
GetValuedd1 9
<dd9 :
stringdd: @
>dd@ A
(ddA B
$strddB T
)ddT U
;ddU V
ifff 
(ff 
orchestratorTypeff  
?ff  !
.ff! "
ToUpperff" )
(ff) *
)ff* +
==ff, .
$strff/ 4
)ff4 5
{gg 
serviceshh 
.hh 4
(AddApplicationInsightsKubernetesEnricherhh A
(hhA B
)hhB C
;hhC D
}ii 
ifjj 
(jj 
orchestratorTypejj  
?jj  !
.jj! "
ToUpperjj" )
(jj) *
)jj* +
==jj, .
$strjj/ 3
)jj3 4
{kk 
servicesll 
.ll 
AddSingletonll %
<ll% &!
ITelemetryInitializerll& ;
>ll; <
(ll< =
(ll= >
serviceProviderll> M
)llM N
=>llO Q
newmm &
FabricTelemetryInitializermm 2
(mm2 3
)mm3 4
)mm4 5
;mm5 6
}nn 
returnpp 
servicespp 
;pp 
}qq 	
publicss 
staticss 
IServiceCollectionss (
AddCustomDbContextss) ;
(ss; <
thisss< @
IServiceCollectionssA S
servicesssT \
,ss\ ]
IConfigurationss^ l
configurationssm z
)ssz {
{tt 	
servicesuu 
.uu '
AddEntityFrameworkSqlServeruu 0
(uu0 1
)uu1 2
.vv 
AddDbContextvv  
<vv  !(
TransacoesFinanceirasContextvv! =
>vv= >
(vv> ?
optionsvv? F
=>vvG I
{ww 
optionsxx 
.xx 
UseSqlServerxx +
(xx+ ,
configurationxx, 9
[xx9 :
$strxx: L
]xxL M
,xxM N"
sqlServerOptionsActionyy 1
:yy1 2

sqlOptionsyy3 =
=>yy> @
{zz 

sqlOptions{{ )
.{{) *
MigrationsAssembly{{* <
({{< =
$str{{= n
){{n o
;{{o p

sqlOptions|| )
.||) * 
EnableRetryOnFailure||* >
(||> ?
maxRetryCount||? L
:||L M
$num||N P
,||P Q
maxRetryDelay||R _
:||_ `
TimeSpan||a i
.||i j
FromSeconds||j u
(||u v
$num||v x
)||x y
,||y z
errorNumbersToAdd	||{ å
:
||å ç
null
||é í
)
||í ì
;
||ì î
}}} 
)}} 
;}} 
}~~ 
,~~ 
ServiceLifetime "
." #
Scoped# )
)) *
;* +
services
ÅÅ 
.
ÅÅ 
AddDbContext
ÅÅ !
<
ÅÅ! "(
IntegrationEventLogContext
ÅÅ" <
>
ÅÅ< =
(
ÅÅ= >
options
ÅÅ> E
=>
ÅÅF H
{
ÇÇ 
options
ÉÉ 
.
ÉÉ 
UseSqlServer
ÉÉ $
(
ÉÉ$ %
configuration
ÉÉ% 2
[
ÉÉ2 3
$str
ÉÉ3 E
]
ÉÉE F
,
ÉÉF G$
sqlServerOptionsAction
ÑÑ *
:
ÑÑ* +

sqlOptions
ÑÑ, 6
=>
ÑÑ7 9
{
ÖÖ 

sqlOptions
ÜÜ "
.
ÜÜ" # 
MigrationsAssembly
ÜÜ# 5
(
ÜÜ5 6
$str
ÜÜ6 ^
)
ÜÜ^ _
;
ÜÜ_ `

sqlOptions
áá "
.
áá" #"
EnableRetryOnFailure
áá# 7
(
áá7 8
maxRetryCount
áá8 E
:
ááE F
$num
ááG I
,
ááI J
maxRetryDelay
ááK X
:
ááX Y
TimeSpan
ááZ b
.
ááb c
FromSeconds
áác n
(
áán o
$num
ááo q
)
ááq r
,
áár s 
errorNumbersToAddáát Ö
:ááÖ Ü
nullááá ã
)ááã å
;ááå ç
}
àà 
)
àà 
;
àà 
}
ââ 
)
ââ 
;
ââ 
return
ãã 
services
ãã 
;
ãã 
}
åå 	
public
éé 
static
éé  
IServiceCollection
éé (
AddCustomSwagger
éé) 9
(
éé9 :
this
éé: > 
IServiceCollection
éé? Q
services
ééR Z
,
ééZ [
IConfiguration
éé\ j
configuration
éék x
)
ééx y
{
èè 	
services
êê 
.
êê 
AddSwaggerGen
êê "
(
êê" #
options
êê# *
=>
êê+ -
{
ëë 
options
íí 
.
íí '
DescribeAllEnumsAsStrings
íí 1
(
íí1 2
)
íí2 3
;
íí3 4
options
ìì 
.
ìì 

SwaggerDoc
ìì "
(
ìì" #
$str
ìì# '
,
ìì' (
new
ìì) ,
Info
ìì- 1
{
îî 
Title
ïï 
=
ïï 
$str
ïï ;
,
ïï; <
Version
ññ 
=
ññ 
$str
ññ "
,
ññ" #
Description
óó 
=
óó  !
$str
óó" Q
,
óóQ R
TermsOfService
òò "
=
òò# $
$str
òò% :
}
ôô 
)
ôô 
;
ôô 
options
õõ 
.
õõ #
AddSecurityDefinition
õõ -
(
õõ- .
$str
õõ. 6
,
õõ6 7
new
õõ8 ;
OAuth2Scheme
õõ< H
{
úú 
Type
ùù 
=
ùù 
$str
ùù #
,
ùù# $
Flow
ûû 
=
ûû 
$str
ûû %
,
ûû% &
AuthorizationUrl
üü $
=
üü% &
$"
üü' )
{
üü) *
configuration
üü* 7
.
üü7 8
GetValue
üü8 @
<
üü@ A
string
üüA G
>
üüG H
(
üüH I
$str
üüI ^
)
üü^ _
}
üü_ ` 
/connect/authorize
üü` r
"
üür s
,
üüs t
TokenUrl
†† 
=
†† 
$"
†† !
{
††! "
configuration
††" /
.
††/ 0
GetValue
††0 8
<
††8 9
string
††9 ?
>
††? @
(
††@ A
$str
††A V
)
††V W
}
††W X
/connect/token
††X f
"
††f g
,
††g h
Scopes
°° 
=
°° 
new
°°  

Dictionary
°°! +
<
°°+ ,
string
°°, 2
,
°°2 3
string
°°4 :
>
°°: ;
(
°°; <
)
°°< =
{
¢¢ 
{
§§ 
$str
§§ 1
,
§§1 2
$str
§§3 K
}
§§L M
,
§§M N
{
•• 
$str
•• (
,
••( )
$str
••* O
}
••P Q
}
¶¶ 
}
ßß 
)
ßß 
;
ßß 
options
©© 
.
©© 
OperationFilter
©© '
<
©©' (+
AuthorizeCheckOperationFilter
©©( E
>
©©E F
(
©©F G
)
©©G H
;
©©H I
}
™™ 
)
™™ 
;
™™ 
return
¨¨ 
services
¨¨ 
;
¨¨ 
}
≠≠ 	
public
ØØ 
static
ØØ  
IServiceCollection
ØØ (#
AddCustomIntegrations
ØØ) >
(
ØØ> ?
this
ØØ? C 
IServiceCollection
ØØD V
services
ØØW _
,
ØØ_ `
IConfiguration
ØØa o
configuration
ØØp }
)
ØØ} ~
{
∞∞ 	
services
±± 
.
±± 
AddSingleton
±± !
<
±±! ""
IHttpContextAccessor
±±" 6
,
±±6 7!
HttpContextAccessor
±±8 K
>
±±K L
(
±±L M
)
±±M N
;
±±N O
services
≤≤ 
.
≤≤ 
AddTransient
≤≤ !
<
≤≤! "
IIdentityService
≤≤" 2
,
≤≤2 3
IdentityService
≤≤4 C
>
≤≤C D
(
≤≤D E
)
≤≤E F
;
≤≤F G
services
≥≥ 
.
≥≥ 
AddTransient
≥≥ !
<
≥≥! "
Func
≥≥" &
<
≥≥& '
DbConnection
≥≥' 3
,
≥≥3 4)
IIntegrationEventLogService
≥≥5 P
>
≥≥P Q
>
≥≥Q R
(
≥≥R S
sp
¥¥ 
=>
¥¥ 
(
¥¥ 
DbConnection
¥¥ #
c
¥¥$ %
)
¥¥% &
=>
¥¥' )
new
¥¥* -(
IntegrationEventLogService
¥¥. H
(
¥¥H I
c
¥¥I J
)
¥¥J K
)
¥¥K L
;
¥¥L M
services
∂∂ 
.
∂∂ 
AddTransient
∂∂ !
<
∂∂! ";
-ITransacoesFinanceirasIntegrationEventService
∂∂" O
,
∂∂O P:
,TransacoesFinanceirasIntegrationEventService
∂∂Q }
>
∂∂} ~
(
∂∂~ 
)∂∂ Ä
;∂∂Ä Å
if
∏∏ 
(
∏∏ 
configuration
∏∏ 
.
∏∏ 
GetValue
∏∏ &
<
∏∏& '
bool
∏∏' +
>
∏∏+ ,
(
∏∏, -
$str
∏∏- E
)
∏∏E F
)
∏∏F G
{
ππ 
services
∫∫ 
.
∫∫ 
AddSingleton
∫∫ %
<
∫∫% &,
IServiceBusPersisterConnection
∫∫& D
>
∫∫D E
(
∫∫E F
sp
∫∫F H
=>
∫∫I K
{
ªª 
var
ºº 
logger
ºº 
=
ºº  
sp
ºº! #
.
ºº# $ 
GetRequiredService
ºº$ 6
<
ºº6 7
ILogger
ºº7 >
<
ºº> ?2
$DefaultServiceBusPersisterConnection
ºº? c
>
ººc d
>
ººd e
(
ººe f
)
ººf g
;
ººg h
var
ææ (
serviceBusConnectionString
ææ 2
=
ææ3 4
configuration
ææ5 B
[
ææB C
$str
ææC W
]
ææW X
;
ææX Y
var
øø "
serviceBusConnection
øø ,
=
øø- .
new
øø/ 2/
!ServiceBusConnectionStringBuilder
øø3 T
(
øøT U(
serviceBusConnectionString
øøU o
)
øøo p
;
øøp q
return
¡¡ 
new
¡¡ 2
$DefaultServiceBusPersisterConnection
¡¡ C
(
¡¡C D"
serviceBusConnection
¡¡D X
,
¡¡X Y
logger
¡¡Z `
)
¡¡` a
;
¡¡a b
}
¬¬ 
)
¬¬ 
;
¬¬ 
}
√√ 
else
ƒƒ 
{
≈≈ 
services
∆∆ 
.
∆∆ 
AddSingleton
∆∆ %
<
∆∆% &+
IRabbitMQPersistentConnection
∆∆& C
>
∆∆C D
(
∆∆D E
sp
∆∆E G
=>
∆∆H J
{
«« 
var
»» 
logger
»» 
=
»»  
sp
»»! #
.
»»# $ 
GetRequiredService
»»$ 6
<
»»6 7
ILogger
»»7 >
<
»»> ?1
#DefaultRabbitMQPersistentConnection
»»? b
>
»»b c
>
»»c d
(
»»d e
)
»»e f
;
»»f g
var
ÀÀ 
factory
ÀÀ 
=
ÀÀ  !
new
ÀÀ" %
ConnectionFactory
ÀÀ& 7
(
ÀÀ7 8
)
ÀÀ8 9
{
ÃÃ 
HostName
ÕÕ  
=
ÕÕ! "
configuration
ÕÕ# 0
[
ÕÕ0 1
$str
ÕÕ1 E
]
ÕÕE F
,
ÕÕF G$
DispatchConsumersAsync
ŒŒ .
=
ŒŒ/ 0
true
ŒŒ1 5
}
œœ 
;
œœ 
if
—— 
(
—— 
!
—— 
string
—— 
.
——  
IsNullOrEmpty
——  -
(
——- .
configuration
——. ;
[
——; <
$str
——< N
]
——N O
)
——O P
)
——P Q
{
““ 
factory
”” 
.
””  
UserName
””  (
=
””) *
configuration
””+ 8
[
””8 9
$str
””9 K
]
””K L
;
””L M
}
‘‘ 
if
÷÷ 
(
÷÷ 
!
÷÷ 
string
÷÷ 
.
÷÷  
IsNullOrEmpty
÷÷  -
(
÷÷- .
configuration
÷÷. ;
[
÷÷; <
$str
÷÷< N
]
÷÷N O
)
÷÷O P
)
÷÷P Q
{
◊◊ 
factory
ÿÿ 
.
ÿÿ  
Password
ÿÿ  (
=
ÿÿ) *
configuration
ÿÿ+ 8
[
ÿÿ8 9
$str
ÿÿ9 K
]
ÿÿK L
;
ÿÿL M
}
ŸŸ 
var
€€ 

retryCount
€€ "
=
€€# $
$num
€€% &
;
€€& '
if
‹‹ 
(
‹‹ 
!
‹‹ 
string
‹‹ 
.
‹‹  
IsNullOrEmpty
‹‹  -
(
‹‹- .
configuration
‹‹. ;
[
‹‹; <
$str
‹‹< P
]
‹‹P Q
)
‹‹Q R
)
‹‹R S
{
›› 

retryCount
ﬁﬁ "
=
ﬁﬁ# $
int
ﬁﬁ% (
.
ﬁﬁ( )
Parse
ﬁﬁ) .
(
ﬁﬁ. /
configuration
ﬁﬁ/ <
[
ﬁﬁ< =
$str
ﬁﬁ= Q
]
ﬁﬁQ R
)
ﬁﬁR S
;
ﬁﬁS T
}
ﬂﬂ 
return
·· 
new
·· 1
#DefaultRabbitMQPersistentConnection
·· B
(
··B C
factory
··C J
,
··J K
logger
··L R
,
··R S

retryCount
··T ^
)
··^ _
;
··_ `
}
‚‚ 
)
‚‚ 
;
‚‚ 
}
„„ 
return
ÂÂ 
services
ÂÂ 
;
ÂÂ 
}
ÊÊ 	
public
ËË 
static
ËË  
IServiceCollection
ËË ($
AddCustomConfiguration
ËË) ?
(
ËË? @
this
ËË@ D 
IServiceCollection
ËËE W
services
ËËX `
,
ËË` a
IConfiguration
ËËb p
configuration
ËËq ~
)
ËË~ 
{
ÈÈ 	
services
ÍÍ 
.
ÍÍ 

AddOptions
ÍÍ 
(
ÍÍ  
)
ÍÍ  !
;
ÍÍ! "
services
ÎÎ 
.
ÎÎ 
	Configure
ÎÎ 
<
ÎÎ 
ProgramSettings
ÎÎ .
>
ÎÎ. /
(
ÎÎ/ 0
configuration
ÎÎ0 =
)
ÎÎ= >
;
ÎÎ> ?
services
ÏÏ 
.
ÏÏ 
	Configure
ÏÏ 
<
ÏÏ  
ApiBehaviorOptions
ÏÏ 1
>
ÏÏ1 2
(
ÏÏ2 3
options
ÏÏ3 :
=>
ÏÏ; =
{
ÌÌ 
options
ÓÓ 
.
ÓÓ .
 InvalidModelStateResponseFactory
ÓÓ 8
=
ÓÓ9 :
context
ÓÓ; B
=>
ÓÓC E
{
ÔÔ 
var
 
problemDetails
 &
=
' (
new
) ,&
ValidationProblemDetails
- E
(
E F
context
F M
.
M N

ModelState
N X
)
X Y
{
ÒÒ 
Instance
ÚÚ  
=
ÚÚ! "
context
ÚÚ# *
.
ÚÚ* +
HttpContext
ÚÚ+ 6
.
ÚÚ6 7
Request
ÚÚ7 >
.
ÚÚ> ?
Path
ÚÚ? C
,
ÚÚC D
Status
ÛÛ 
=
ÛÛ  
StatusCodes
ÛÛ! ,
.
ÛÛ, -!
Status400BadRequest
ÛÛ- @
,
ÛÛ@ A
Detail
ÙÙ 
=
ÙÙ  
$str
ÙÙ! ^
}
ıı 
;
ıı 
return
˜˜ 
new
˜˜ $
BadRequestObjectResult
˜˜ 5
(
˜˜5 6
problemDetails
˜˜6 D
)
˜˜D E
{
¯¯ 
ContentTypes
˘˘ $
=
˘˘% &
{
˘˘' (
$str
˘˘) C
,
˘˘C D
$str
˘˘E ^
}
˘˘_ `
}
˙˙ 
;
˙˙ 
}
˚˚ 
;
˚˚ 
}
¸¸ 
)
¸¸ 
;
¸¸ 
return
˛˛ 
services
˛˛ 
;
˛˛ 
}
ˇˇ 	
public
ÅÅ 
static
ÅÅ  
IServiceCollection
ÅÅ (
AddEventBus
ÅÅ) 4
(
ÅÅ4 5
this
ÅÅ5 9 
IServiceCollection
ÅÅ: L
services
ÅÅM U
,
ÅÅU V
IConfiguration
ÅÅW e
configuration
ÅÅf s
)
ÅÅs t
{
ÇÇ 	
var
ÉÉ $
subscriptionClientName
ÉÉ &
=
ÉÉ' (
configuration
ÉÉ) 6
[
ÉÉ6 7
$str
ÉÉ7 O
]
ÉÉO P
;
ÉÉP Q
if
ÖÖ 
(
ÖÖ 
configuration
ÖÖ 
.
ÖÖ 
GetValue
ÖÖ &
<
ÖÖ& '
bool
ÖÖ' +
>
ÖÖ+ ,
(
ÖÖ, -
$str
ÖÖ- E
)
ÖÖE F
)
ÖÖF G
{
ÜÜ 
services
áá 
.
áá 
AddSingleton
áá %
<
áá% &
	IEventBus
áá& /
,
áá/ 0 
EventBusServiceBus
áá1 C
>
ááC D
(
ááD E
sp
ááE G
=>
ááH J
{
àà 
var
ââ +
serviceBusPersisterConnection
ââ 5
=
ââ6 7
sp
ââ8 :
.
ââ: ; 
GetRequiredService
ââ; M
<
ââM N,
IServiceBusPersisterConnection
ââN l
>
ââl m
(
ââm n
)
âân o
;
ââo p
var
ää 
iLifetimeScope
ää &
=
ää' (
sp
ää) +
.
ää+ , 
GetRequiredService
ää, >
<
ää> ?
ILifetimeScope
ää? M
>
ääM N
(
ääN O
)
ääO P
;
ääP Q
var
ãã 
logger
ãã 
=
ãã  
sp
ãã! #
.
ãã# $ 
GetRequiredService
ãã$ 6
<
ãã6 7
ILogger
ãã7 >
<
ãã> ? 
EventBusServiceBus
ãã? Q
>
ããQ R
>
ããR S
(
ããS T
)
ããT U
;
ããU V
var
åå )
eventBusSubcriptionsManager
åå 3
=
åå4 5
sp
åå6 8
.
åå8 9 
GetRequiredService
åå9 K
<
ååK L+
IEventBusSubscriptionsManager
ååL i
>
ååi j
(
ååj k
)
ååk l
;
åål m
return
éé 
new
éé  
EventBusServiceBus
éé 1
(
éé1 2+
serviceBusPersisterConnection
éé2 O
,
ééO P
logger
ééQ W
,
ééW X)
eventBusSubcriptionsManager
èè 3
,
èè3 4$
subscriptionClientName
èè5 K
,
èèK L
iLifetimeScope
èèM [
)
èè[ \
;
èè\ ]
}
êê 
)
êê 
;
êê 
}
ëë 
else
íí 
{
ìì 
services
îî 
.
îî 
AddSingleton
îî %
<
îî% &
	IEventBus
îî& /
,
îî/ 0
EventBusRabbitMQ
îî1 A
>
îîA B
(
îîB C
sp
îîC E
=>
îîF H
{
ïï 
var
ññ *
rabbitMQPersistentConnection
ññ 4
=
ññ5 6
sp
ññ7 9
.
ññ9 : 
GetRequiredService
ññ: L
<
ññL M+
IRabbitMQPersistentConnection
ññM j
>
ññj k
(
ññk l
)
ññl m
;
ññm n
var
óó 
iLifetimeScope
óó &
=
óó' (
sp
óó) +
.
óó+ , 
GetRequiredService
óó, >
<
óó> ?
ILifetimeScope
óó? M
>
óóM N
(
óóN O
)
óóO P
;
óóP Q
var
òò 
logger
òò 
=
òò  
sp
òò! #
.
òò# $ 
GetRequiredService
òò$ 6
<
òò6 7
ILogger
òò7 >
<
òò> ?
EventBusRabbitMQ
òò? O
>
òòO P
>
òòP Q
(
òòQ R
)
òòR S
;
òòS T
var
ôô )
eventBusSubcriptionsManager
ôô 3
=
ôô4 5
sp
ôô6 8
.
ôô8 9 
GetRequiredService
ôô9 K
<
ôôK L+
IEventBusSubscriptionsManager
ôôL i
>
ôôi j
(
ôôj k
)
ôôk l
;
ôôl m
var
õõ 

retryCount
õõ "
=
õõ# $
$num
õõ% &
;
õõ& '
if
úú 
(
úú 
!
úú 
string
úú 
.
úú  
IsNullOrEmpty
úú  -
(
úú- .
configuration
úú. ;
[
úú; <
$str
úú< P
]
úúP Q
)
úúQ R
)
úúR S
{
ùù 

retryCount
ûû "
=
ûû# $
int
ûû% (
.
ûû( )
Parse
ûû) .
(
ûû. /
configuration
ûû/ <
[
ûû< =
$str
ûû= Q
]
ûûQ R
)
ûûR S
;
ûûS T
}
üü 
return
°° 
new
°° 
EventBusRabbitMQ
°° /
(
°°/ 0*
rabbitMQPersistentConnection
°°0 L
,
°°L M
logger
°°N T
,
°°T U
iLifetimeScope
°°V d
,
°°d e*
eventBusSubcriptionsManager°°f Å
,°°Å Ç&
subscriptionClientName°°É ô
,°°ô ö

retryCount°°õ •
)°°• ¶
;°°¶ ß
}
¢¢ 
)
¢¢ 
;
¢¢ 
}
££ 
services
•• 
.
•• 
AddSingleton
•• !
<
••! "+
IEventBusSubscriptionsManager
••" ?
,
••? @2
$InMemoryEventBusSubscriptionsManager
••A e
>
••e f
(
••f g
)
••g h
;
••h i
return
ßß 
services
ßß 
;
ßß 
}
®® 	
public
™™ 
static
™™  
IServiceCollection
™™ (%
AddCustomAuthentication
™™) @
(
™™@ A
this
™™A E 
IServiceCollection
™™F X
services
™™Y a
,
™™a b
IConfiguration
™™c q
configuration
™™r 
)™™ Ä
{
´´ 	%
JwtSecurityTokenHandler
¨¨ #
.
¨¨# $(
DefaultInboundClaimTypeMap
¨¨$ >
.
¨¨> ?
Remove
¨¨? E
(
¨¨E F
$str
¨¨F K
)
¨¨K L
;
¨¨L M
var
ÆÆ 
identityUrl
ÆÆ 
=
ÆÆ 
configuration
ÆÆ +
.
ÆÆ+ ,
GetValue
ÆÆ, 4
<
ÆÆ4 5
string
ÆÆ5 ;
>
ÆÆ; <
(
ÆÆ< =
$str
ÆÆ= J
)
ÆÆJ K
;
ÆÆK L
var
ØØ 
apiresourcename
ØØ 
=
ØØ  !
configuration
ØØ" /
.
ØØ/ 0
GetValue
ØØ0 8
<
ØØ8 9
string
ØØ9 ?
>
ØØ? @
(
ØØ@ A
$str
ØØA R
)
ØØR S
;
ØØS T
services
±± 
.
±± 
AddAuthentication
±± &
(
±±& '
options
±±' .
=>
±±/ 1
{
≤≤ 
options
≥≥ 
.
≥≥ '
DefaultAuthenticateScheme
≥≥ 1
=
≥≥2 3
JwtBearerDefaults
≥≥4 E
.
≥≥E F"
AuthenticationScheme
≥≥F Z
;
≥≥Z [
options
¥¥ 
.
¥¥ $
DefaultChallengeScheme
¥¥ .
=
¥¥/ 0
JwtBearerDefaults
¥¥1 B
.
¥¥B C"
AuthenticationScheme
¥¥C W
;
¥¥W X
}
∂∂ 
)
∂∂ 
.
∂∂ 
AddJwtBearer
∂∂ 
(
∂∂ 
options
∂∂ #
=>
∂∂$ &
{
∑∑ 
options
∏∏ 
.
∏∏ 
	Authority
∏∏ !
=
∏∏" #
identityUrl
∏∏$ /
;
∏∏/ 0
options
ππ 
.
ππ "
RequireHttpsMetadata
ππ ,
=
ππ- .
false
ππ/ 4
;
ππ4 5
options
∫∫ 
.
∫∫ 
Audience
∫∫  
=
∫∫! "
apiresourcename
∫∫# 2
;
∫∫2 3
}
ªª 
)
ªª 
;
ªª 
return
ΩΩ 
services
ΩΩ 
;
ΩΩ 
}
ææ 	
}
øø 
}¿¿ …b
ÜC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Controllers\ConsumidorController.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Controllers+ 6
{ 
[ 
Route 

(
 
$str  
)  !
]! "
[ 
	Authorize 
( 
) 
] 
[ 
ApiController 
] 
public 

class  
ConsumidorController %
:& '
ControllerBase( 6
{ 
private 
readonly 
	IMediator "
	_mediator# ,
;, -
private 
readonly 
IConsumidorQueries +
_consumidorQueries, >
;> ?
private 
readonly 
IIdentityService )
_identityService* :
;: ;
private 
readonly 
ILogger  
<  ! 
ConsumidorController! 5
>5 6
_logger7 >
;> ?
public  
ConsumidorController #
(# $
	IMediator 
mediator 
, 
IConsumidorQueries 
orderQueries +
,+ ,
IIdentityService 
identityService ,
,, -
ILogger 
<  
ConsumidorController (
>( )
logger* 0
)0 1
{   	
	_mediator!! 
=!! 
mediator!!  
??!!! #
throw!!$ )
new!!* -!
ArgumentNullException!!. C
(!!C D
nameof!!D J
(!!J K
mediator!!K S
)!!S T
)!!T U
;!!U V
_consumidorQueries"" 
=""  
orderQueries""! -
??"". 0
throw""1 6
new""7 :!
ArgumentNullException""; P
(""P Q
nameof""Q W
(""W X
orderQueries""X d
)""d e
)""e f
;""f g
_identityService## 
=## 
identityService## .
??##/ 1
throw##2 7
new##8 ;!
ArgumentNullException##< Q
(##Q R
nameof##R X
(##X Y
identityService##Y h
)##h i
)##i j
;##j k
_logger$$ 
=$$ 
logger$$ 
??$$ 
throw$$  %
new$$& )!
ArgumentNullException$$* ?
($$? @
nameof$$@ F
($$F G
logger$$G M
)$$M N
)$$N O
;$$O P
}%% 	
['' 	
HttpGet''	 
]'' 
[(( 	 
ProducesResponseType((	 
((( 
typeof(( $
((($ %
IEnumerable((% 0
<((0 1

Consumidor((1 ;
>((; <
)((< =
,((= >
(((? @
int((@ C
)((C D
HttpStatusCode((D R
.((R S
OK((S U
)((U V
]((V W
[)) 	 
ProducesResponseType))	 
()) 
()) 
int)) "
)))" #
HttpStatusCode))# 1
.))1 2
NotFound))2 :
))): ;
])); <
public** 
async** 
Task** 
<** 
ActionResult** &
>**& ' 
GetConsumidoresAsync**( <
(**< =
)**= >
{++ 	
try,, 
{-- 
var.. 
userid.. 
=.. 
_identityService.. -
...- .
GetUserIdentity... =
(..= >
)..> ?
;..? @
var// 
consumidores//  
=//! "
await//# (
_consumidorQueries//) ;
.//; < 
GetConsumidoresAsync//< P
(//P Q
)//Q R
;//R S
return11 
Ok11 
(11 
consumidores11 &
)11& '
;11' (
}22 
catch33 
{44 
return55 
NotFound55 
(55  
)55  !
;55! "
}66 
}77 	
[99 	
Route99	 
(99 
$str99 
)99 
]99  
[:: 	
HttpGet::	 
]:: 
[;; 	 
ProducesResponseType;;	 
(;; 
typeof;; $
(;;$ %

Consumidor;;% /
);;/ 0
,;;0 1
(;;2 3
int;;3 6
);;6 7
HttpStatusCode;;7 E
.;;E F
OK;;F H
);;H I
];;I J
[<< 	 
ProducesResponseType<<	 
(<< 
(<< 
int<< "
)<<" #
HttpStatusCode<<# 1
.<<1 2
NotFound<<2 :
)<<: ;
]<<; <
public== 
async== 
Task== 
<== 
ActionResult== &
>==& '
GetConsumidorAsync==( :
(==: ;
int==; >
loginid==? F
)==F G
{>> 	
try?? 
{@@ 
varAA 

consumidorAA 
=AA  
awaitAA! &
_consumidorQueriesAA' 9
.AA9 :
GetConsumidorAsyncAA: L
(AAL M
loginidAAM T
)AAT U
;AAU V
returnCC 
OkCC 
(CC 

consumidorCC $
)CC$ %
;CC% &
}DD 
catchEE 
{FF 
returnGG 
NotFoundGG 
(GG  
)GG  !
;GG! "
}HH 
}II 	
[KK 	
HttpPostKK	 
]KK 
publicLL 
asyncLL 
TaskLL 
<LL 
ActionResultLL &
<LL& '
boolLL' +
>LL+ ,
>LL, - 
CriarConsumidorAsyncLL. B
(LLB C
[LLC D
FromBodyLLD L
]LLL M"
CriarConsumidorCommandLLN d"
criarConsumidorCommandLLe {
)LL{ |
{MM 	
_loggerNN 
.NN 
LogInformationNN "
(NN" #
$strOO _
,OO_ `"
criarConsumidorCommandPP &
.PP& '
GetGenericTypeNamePP' 9
(PP9 :
)PP: ;
,PP; <
nameofQQ 
(QQ "
criarConsumidorCommandQQ -
.QQ- .
LoginIdQQ. 5
)QQ5 6
,QQ6 7"
criarConsumidorCommandRR &
.RR& '
LoginIdRR' .
,RR. /"
criarConsumidorCommandSS &
)SS& '
;SS' (
returnUU 
awaitUU 
	_mediatorUU "
.UU" #
SendUU# '
(UU' ("
criarConsumidorCommandUU( >
)UU> ?
;UU? @
}VV 	
[XX 	
HttpPutXX	 
]XX 
[YY 	 
ProducesResponseTypeYY	 
(YY 
(YY 
intYY "
)YY" #
HttpStatusCodeYY# 1
.YY1 2
OKYY2 4
)YY4 5
]YY5 6
[ZZ 	 
ProducesResponseTypeZZ	 
(ZZ 
(ZZ 
intZZ "
)ZZ" #
HttpStatusCodeZZ# 1
.ZZ1 2

BadRequestZZ2 <
)ZZ< =
]ZZ= >
public[[ 
async[[ 
Task[[ 
<[[ 
IActionResult[[ '
>[[' (!
EditarConsumidorAsync[[) >
([[> ?
[[[? @
FromBody[[@ H
][[H I#
EditarConsumidorCommand[[I `#
editarConsumidorCommand[[a x
,[[x y
[[[z {

FromHeader	[[{ Ö
(
[[Ö Ü
Name
[[Ü ä
=
[[ã å
$str
[[ç ö
)
[[ö õ
]
[[õ ú
string
[[ù £
	requestId
[[§ ≠
)
[[≠ Æ
{\\ 	
bool]] 
commandResult]] 
=]]  
false]]! &
;]]& '
if__ 
(__ 
Guid__ 
.__ 
TryParse__ 
(__ 
	requestId__ '
,__' (
out__) ,
Guid__- 1
guid__2 6
)__6 7
&&__8 :
guid__; ?
!=__@ B
Guid__C G
.__G H
Empty__H M
)__M N
{`` 
varaa #
requestEditarConsumidoraa +
=aa, -
newaa. 1
IdentifiedCommandaa2 C
<aaC D#
EditarConsumidorCommandaaD [
,aa[ \
boolaa] a
>aaa b
(aab c#
editarConsumidorCommandaac z
,aaz {
guid	aa| Ä
)
aaÄ Å
;
aaÅ Ç
_loggercc 
.cc 
LogInformationcc &
(cc& '
$strdd c
,ddc d#
requestEditarConsumidoree +
.ee+ ,
GetGenericTypeNameee, >
(ee> ?
)ee? @
,ee@ A
nameofff 
(ff #
requestEditarConsumidorff 2
.ff2 3
Commandff3 :
.ff: ;
Idff; =
)ff= >
,ff> ?#
requestEditarConsumidorgg +
.gg+ ,
Commandgg, 3
.gg3 4
Idgg4 6
,gg6 7#
requestEditarConsumidorhh +
)hh+ ,
;hh, -
commandResultjj 
=jj 
awaitjj  %
	_mediatorjj& /
.jj/ 0
Sendjj0 4
(jj4 5#
requestEditarConsumidorjj5 L
)jjL M
;jjM N
}kk 
ifmm 
(mm 
!mm 
commandResultmm 
)mm 
{nn 
returnoo 

BadRequestoo !
(oo! "
)oo" #
;oo# $
}pp 
returnrr 
Okrr 
(rr 
)rr 
;rr 
}ss 	
[uu 	

HttpDeleteuu	 
]uu 
[vv 	 
ProducesResponseTypevv	 
(vv 
(vv 
intvv "
)vv" #
HttpStatusCodevv# 1
.vv1 2
OKvv2 4
)vv4 5
]vv5 6
[ww 	 
ProducesResponseTypeww	 
(ww 
(ww 
intww "
)ww" #
HttpStatusCodeww# 1
.ww1 2

BadRequestww2 <
)ww< =
]ww= >
publicxx 
asyncxx 
Taskxx 
<xx 
IActionResultxx '
>xx' (!
DeleteConsumidorAsyncxx) >
(xx> ?
[xx? @
FromBodyxx@ H
]xxH I$
ExcluirConsumidorCommandxxI a$
excluirConsumidorCommandxxb z
,xxz {
[xx| }

FromHeader	xx} á
(
xxá à
Name
xxà å
=
xxç é
$str
xxè ú
)
xxú ù
]
xxù û
string
xxü •
	requestId
xx¶ Ø
)
xxØ ∞
{yy 	
boolzz 
commandResultzz 
=zz  
falsezz! &
;zz& '
if|| 
(|| 
Guid|| 
.|| 
TryParse|| 
(|| 
	requestId|| '
,||' (
out||) ,
Guid||- 1
guid||2 6
)||6 7
&&||8 :
guid||; ?
!=||@ B
Guid||C G
.||G H
Empty||H M
)||M N
{}} 
var~~ $
requestExcluirConsumidor~~ ,
=~~- .
new~~/ 2
IdentifiedCommand~~3 D
<~~D E$
ExcluirConsumidorCommand~~E ]
,~~] ^
bool~~_ c
>~~c d
(~~d e$
excluirConsumidorCommand~~e }
,~~} ~
guid	~~ É
)
~~É Ñ
;
~~Ñ Ö
_logger
ÄÄ 
.
ÄÄ 
LogInformation
ÄÄ &
(
ÄÄ& '
$str
ÅÅ c
,
ÅÅc d&
requestExcluirConsumidor
ÇÇ ,
.
ÇÇ, - 
GetGenericTypeName
ÇÇ- ?
(
ÇÇ? @
)
ÇÇ@ A
,
ÇÇA B
nameof
ÉÉ 
(
ÉÉ &
requestExcluirConsumidor
ÉÉ 3
.
ÉÉ3 4
Command
ÉÉ4 ;
.
ÉÉ; <
Id
ÉÉ< >
)
ÉÉ> ?
,
ÉÉ? @&
requestExcluirConsumidor
ÑÑ ,
.
ÑÑ, -
Command
ÑÑ- 4
.
ÑÑ4 5
Id
ÑÑ5 7
,
ÑÑ7 8&
requestExcluirConsumidor
ÖÖ ,
)
ÖÖ, -
;
ÖÖ- .
commandResult
áá 
=
áá 
await
áá  %
	_mediator
áá& /
.
áá/ 0
Send
áá0 4
(
áá4 5&
requestExcluirConsumidor
áá5 M
)
ááM N
;
ááN O
}
àà 
if
ää 
(
ää 
!
ää 
commandResult
ää 
)
ää 
{
ãã 
return
åå 

BadRequest
åå !
(
åå! "
)
åå" #
;
åå# $
}
çç 
return
èè 
Ok
èè 
(
èè 
)
èè 
;
èè 
}
êê 	
}
íí 
}ìì ∆
ÄC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Controllers\HomeController.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Controllers+ 6
{ 
public 

class 
HomeController 
:  !

Controller" ,
{ 
public		 
IActionResult		 
Index		 "
(		" #
)		# $
{

 	
return 
new 
RedirectResult %
(% &
$str& 1
)1 2
;2 3
} 	
} 
} ⁄.
ÖC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Extensions\LinqSelectExtensions.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +

Extensions+ 5
{ 
public 

static 
class  
LinqSelectExtensions ,
{		 
public

 
static

 
IEnumerable

 !
<

! "
SelectTryResult

" 1
<

1 2
TSource

2 9
,

9 :
TResult

; B
>

B C
>

C D
	SelectTry

E N
<

N O
TSource

O V
,

V W
TResult

X _
>

_ `
(

` a
this

a e
IEnumerable

f q
<

q r
TSource

r y
>

y z

enumerable	

{ Ö
,


Ö Ü
Func


á ã
<


ã å
TSource


å ì
,


ì î
TResult


ï ú
>


ú ù
selector


û ¶
)


¶ ß
{ 	
foreach 
( 
TSource 
element $
in% '

enumerable( 2
)2 3
{ 
SelectTryResult 
<  
TSource  '
,' (
TResult) 0
>0 1
returnedValue2 ?
;? @
try 
{ 
returnedValue !
=" #
new$ '
SelectTryResult( 7
<7 8
TSource8 ?
,? @
TResultA H
>H I
(I J
elementJ Q
,Q R
selectorS [
([ \
element\ c
)c d
,d e
nullf j
)j k
;k l
} 
catch 
( 
	Exception  
ex! #
)# $
{ 
returnedValue !
=" #
new$ '
SelectTryResult( 7
<7 8
TSource8 ?
,? @
TResultA H
>H I
(I J
elementJ Q
,Q R
defaultS Z
(Z [
TResult[ b
)b c
,c d
exe g
)g h
;h i
} 
yield 
return 
returnedValue *
;* +
} 
} 	
public 
static 
IEnumerable !
<! "
TResult" )
>) *
OnCaughtException+ <
<< =
TSource= D
,D E
TResultF M
>M N
(N O
thisO S
IEnumerableT _
<_ `
SelectTryResult` o
<o p
TSourcep w
,w x
TResult	y Ä
>
Ä Å
>
Å Ç

enumerable
É ç
,
ç é
Func
è ì
<
ì î
	Exception
î ù
,
ù û
TResult
ü ¶
>
¶ ß
exceptionHandler
® ∏
)
∏ π
{ 	
return 

enumerable 
. 
Select $
($ %
x% &
=>' )
x* +
.+ ,
CaughtException, ;
==< >
null? C
?D E
xF G
.G H
ResultH N
:O P
exceptionHandlerQ a
(a b
xb c
.c d
CaughtExceptiond s
)s t
)t u
;u v
} 	
public   
static   
IEnumerable   !
<  ! "
TResult  " )
>  ) *
OnCaughtException  + <
<  < =
TSource  = D
,  D E
TResult  F M
>  M N
(  N O
this  O S
IEnumerable  T _
<  _ `
SelectTryResult  ` o
<  o p
TSource  p w
,  w x
TResult	  y Ä
>
  Ä Å
>
  Å Ç

enumerable
  É ç
,
  ç é
Func
  è ì
<
  ì î
TSource
  î õ
,
  õ ú
	Exception
  ù ¶
,
  ¶ ß
TResult
  ® Ø
>
  Ø ∞
exceptionHandler
  ± ¡
)
  ¡ ¬
{!! 	
return"" 

enumerable"" 
."" 
Select"" $
(""$ %
x""% &
=>""' )
x""* +
.""+ ,
CaughtException"", ;
==""< >
null""? C
?""D E
x""F G
.""G H
Result""H N
:""O P
exceptionHandler""Q a
(""a b
x""b c
.""c d
Source""d j
,""j k
x""l m
.""m n
CaughtException""n }
)""} ~
)""~ 
;	"" Ä
}## 	
public%% 
class%% 
SelectTryResult%% $
<%%$ %
TSource%%% ,
,%%, -
TResult%%. 5
>%%5 6
{&& 	
internal'' 
SelectTryResult'' $
(''$ %
TSource''% ,
source''- 3
,''3 4
TResult''5 <
result''= C
,''C D
	Exception''E N
	exception''O X
)''X Y
{(( 
Source)) 
=)) 
source)) 
;))  
Result** 
=** 
result** 
;**  
CaughtException++ 
=++  !
	exception++" +
;+++ ,
},, 
public.. 
TSource.. 
Source.. !
{.." #
get..$ '
;..' (
private..) 0
set..1 4
;..4 5
}..6 7
public// 
TResult// 
Result// !
{//" #
get//$ '
;//' (
private//) 0
set//1 4
;//4 5
}//6 7
public00 
	Exception00 
CaughtException00 ,
{00- .
get00/ 2
;002 3
private004 ;
set00< ?
;00? @
}00A B
}11 	
}22 
}33 ®
¢C:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Infrastructure\ActionResults\InternalServerErrorObjectResult.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Infrastructure+ 9
.9 :
ActionResults: G
{ 
public 

class +
InternalServerErrorObjectResult 0
:1 2
ObjectResult3 ?
{ 
public		 +
InternalServerErrorObjectResult		 .
(		. /
object		/ 5
error		6 ;
)		; <
:

 
base

 
(

 
error

 
)

 
{ 	

StatusCode 
= 
StatusCodes $
.$ %(
Status500InternalServerError% A
;A B
} 	
} 
} ò
ïC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Infrastructure\AutofacModules\ApplicationModule.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Infrastructure+ 9
.9 :
AutofacModules: H
{ 
public 

class 
ApplicationModule "
: 	
Autofac
 
. 
Module 
{ 
public 
string #
QueriesConnectionString -
{. /
get0 3
;3 4
}5 6
public 
ApplicationModule  
(  !
string! '
qconstr( /
)/ 0
{ 	#
QueriesConnectionString #
=$ %
qconstr& -
;- .
} 	
	protected 
override 
void 
Load  $
($ %
ContainerBuilder% 5
builder6 =
)= >
{ 	
builder 
. 
Register 
( 
c 
=> !
new" %
ConsumidorQueries& 7
(7 8#
QueriesConnectionString8 O
)O P
)P Q
. 
As 
< 
IConsumidorQueries &
>& '
(' (
)( )
. $
InstancePerLifetimeScope )
() *
)* +
;+ ,
builder 
. 
RegisterType  
<  ! 
ConsumidorRepository! 5
>5 6
(6 7
)7 8
.   
As   
<   !
IConsumidorRepository   )
>  ) *
(  * +
)  + ,
.!! $
InstancePerLifetimeScope!! )
(!!) *
)!!* +
;!!+ ,
builder$$ 
.$$ 
RegisterType$$  
<$$  !
RequestManager$$! /
>$$/ 0
($$0 1
)$$1 2
.%% 
As%% 
<%% 
IRequestManager%% "
>%%" #
(%%# $
)%%$ %
.&& $
InstancePerLifetimeScope&& (
(&&( )
)&&) *
;&&* +
builder(( 
.(( !
RegisterAssemblyTypes(( )
((() *
typeof((* 0
(((0 1)
CriarConsumidorCommandHandler((1 N
)((N O
.((O P
GetTypeInfo((P [
((([ \
)((\ ]
.((] ^
Assembly((^ f
)((f g
.)) 
AsClosedTypesOf))  
())  !
typeof))! '
())' ($
IIntegrationEventHandler))( @
<))@ A
>))A B
)))B C
)))C D
;))D E
}++ 	
},, 
}-- ‘5
íC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Infrastructure\AutofacModules\MediatorModule.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Infrastructure+ 9
.9 :
AutofacModules: H
{ 
public 

class 
MediatorModule 
:  !
Autofac" )
.) *
Module* 0
{ 
	protected 
override 
void 
Load  $
($ %
ContainerBuilder% 5
builder6 =
)= >
{ 	
builder 
. !
RegisterAssemblyTypes )
() *
typeof* 0
(0 1
	IMediator1 :
): ;
.; <
GetTypeInfo< G
(G H
)H I
.I J
AssemblyJ R
)R S
. #
AsImplementedInterfaces (
(( )
)) *
;* +
builder 
. !
RegisterAssemblyTypes )
() *
typeof* 0
(0 1"
CriarConsumidorCommand1 G
)G H
.H I
GetTypeInfoI T
(T U
)U V
.V W
AssemblyW _
)_ `
. 
AsClosedTypesOf  
(  !
typeof! '
(' (
IRequestHandler( 7
<7 8
,8 9
>9 :
): ;
); <
;< =
builder 
. !
RegisterAssemblyTypes &
(& '
typeof' -
(- .+
CriarConsumidorCommandValidator. M
)M N
.N O
GetTypeInfoO Z
(Z [
)[ \
.\ ]
Assembly] e
)e f
. 
Where 
( 
t 
=> 
t 
. 
IsClosedTypeOf ,
(, -
typeof- 3
(3 4

IValidator4 >
<> ?
>? @
)@ A
)A B
)B C
. #
AsImplementedInterfaces (
(( )
)) *
;* +
builder 
. !
RegisterAssemblyTypes )
() *
typeof* 0
(0 1#
EditarConsumidorCommand1 H
)H I
.I J
GetTypeInfoJ U
(U V
)V W
.W X
AssemblyX `
)` a
.   
AsClosedTypesOf    
(    !
typeof  ! '
(  ' (
IRequestHandler  ( 7
<  7 8
,  8 9
>  9 :
)  : ;
)  ; <
;  < =
builder"" 
.## !
RegisterAssemblyTypes## &
(##& '
typeof##' -
(##- .,
 EditarConsumidorCommandValidator##. N
)##N O
.##O P
GetTypeInfo##P [
(##[ \
)##\ ]
.##] ^
Assembly##^ f
)##f g
.$$ 
Where$$ 
($$ 
t$$ 
=>$$ 
t$$ 
.$$ 
IsClosedTypeOf$$ ,
($$, -
typeof$$- 3
($$3 4

IValidator$$4 >
<$$> ?
>$$? @
)$$@ A
)$$A B
)$$B C
.%% #
AsImplementedInterfaces%% (
(%%( )
)%%) *
;%%* +
builder)) 
.)) !
RegisterAssemblyTypes)) )
())) *
typeof))* 0
())0 1$
ExcluirConsumidorCommand))1 I
)))I J
.))J K
GetTypeInfo))K V
())V W
)))W X
.))X Y
Assembly))Y a
)))a b
.** 
AsClosedTypesOf**  
(**  !
typeof**! '
(**' (
IRequestHandler**( 7
<**7 8
,**8 9
>**9 :
)**: ;
)**; <
;**< =
builder,, 
.-- !
RegisterAssemblyTypes-- &
(--& '
typeof--' -
(--- .-
!ExcluirConsumidorCommandValidator--. O
)--O P
.--P Q
GetTypeInfo--Q \
(--\ ]
)--] ^
.--^ _
Assembly--_ g
)--g h
... 
Where.. 
(.. 
t.. 
=>.. 
t.. 
... 
IsClosedTypeOf.. ,
(.., -
typeof..- 3
(..3 4

IValidator..4 >
<..> ?
>..? @
)..@ A
)..A B
)..B C
.// #
AsImplementedInterfaces// (
(//( )
)//) *
;//* +
_22 
=22 
builder22 
.22 
Register22  
<22  !
ServiceFactory22! /
>22/ 0
(220 1
context221 8
=>229 ;
{33 
var44 
componentContext44 &
=44' (
context44) 0
.440 1
Resolve441 8
<448 9
IComponentContext449 J
>44J K
(44K L
)44L M
;44M N
return55 
t55 
=>55 
{55 
object55  &
o55' (
;55( )
return55* 0
componentContext551 A
.55A B

TryResolve55B L
(55L M
t55M N
,55N O
out55P S
o55T U
)55U V
?55W X
o55Y Z
:55[ \
null55] a
;55a b
}55c d
;55d e
}66 
)66 
;66 
builder88 
.88 
RegisterGeneric88 #
(88# $
typeof88$ *
(88* +
LoggingBehavior88+ :
<88: ;
,88; <
>88< =
)88= >
)88> ?
.88? @
As88@ B
(88B C
typeof88C I
(88I J
IPipelineBehavior88J [
<88[ \
,88\ ]
>88] ^
)88^ _
)88_ `
;88` a
builder99 
.99 
RegisterGeneric99 #
(99# $
typeof99$ *
(99* +
ValidatorBehavior99+ <
<99< =
,99= >
>99> ?
)99? @
)99@ A
.99A B
As99B D
(99D E
typeof99E K
(99K L
IPipelineBehavior99L ]
<99] ^
,99^ _
>99_ `
)99` a
)99a b
;99b c
builder:: 
.:: 
RegisterGeneric:: #
(::# $
typeof::$ *
(::* + 
TransactionBehaviour::+ ?
<::? @
,::@ A
>::A B
)::B C
)::C D
.::D E
As::E G
(::G H
typeof::H N
(::N O
IPipelineBehavior::O `
<::` a
,::a b
>::b c
)::c d
)::d e
;::e f
}<< 	
}== 
}>> Ø	
èC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Infrastructure\Exceptions\DomainException.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Infrastructure+ 9
.9 :

Exceptions: D
{ 
public 

class 
DomainException  
:! "
	Exception# ,
{ 
public 
DomainException 
( 
)  
{		 	
}		
 
public 
DomainException 
( 
string %
message& -
)- .
: 
base 
( 
message 
) 
{ 	
}
 
public 
DomainException 
( 
string %
message& -
,- .
	Exception/ 8
innerException9 G
)G H
: 
base 
( 
message 
, 
innerException *
)* +
{ 	
}
 
} 
} ë
•C:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Infrastructure\Exceptions\FailingMiddlewareAppBuilderExtensions.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Infrastructure+ 9
.9 :
Middlewares: E
{ 
public 

static 
class 1
%FailingMiddlewareAppBuilderExtensions =
{ 
public		 
static		 
IApplicationBuilder		 ) 
UseFailingMiddleware		* >
(		> ?
this		? C
IApplicationBuilder		D W
builder		X _
)		_ `
{

 	
return  
UseFailingMiddleware '
(' (
builder( /
,/ 0
null1 5
)5 6
;6 7
} 	
public 
static 
IApplicationBuilder ) 
UseFailingMiddleware* >
(> ?
this? C
IApplicationBuilderD W
builderX _
,_ `
Actiona g
<g h
FailingOptionsh v
>v w
actionx ~
)~ 
{ 	
var 
options 
= 
new 
FailingOptions ,
(, -
)- .
;. /
action 
? 
. 
Invoke 
( 
options "
)" #
;# $
builder 
. 
UseMiddleware !
<! "
FailingMiddleware" 3
>3 4
(4 5
options5 <
)< =
;= >
return 
builder 
; 
} 	
} 
} ·
öC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Infrastructure\Filters\AuthorizeCheckOperationFilter.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Infrastructure+ 9
.9 :
Filters: A
{ 
public

 

class

 )
AuthorizeCheckOperationFilter

 .
:

/ 0
IOperationFilter

1 A
{ 
public 
void 
Apply 
( 
	Operation #
	operation$ -
,- ."
OperationFilterContext/ E
contextF M
)M N
{ 	
var 
hasAuthorize 
= 
context &
.& '

MethodInfo' 1
.1 2
DeclaringType2 ?
.? @
GetCustomAttributes@ S
(S T
trueT X
)X Y
.Y Z
OfTypeZ `
<` a
AuthorizeAttributea s
>s t
(t u
)u v
.v w
Anyw z
(z {
){ |
||} 
context &
.& '

MethodInfo' 1
.1 2
GetCustomAttributes2 E
(E F
trueF J
)J K
.K L
OfTypeL R
<R S
AuthorizeAttributeS e
>e f
(f g
)g h
.h i
Anyi l
(l m
)m n
;n o
if 
( 
! 
hasAuthorize 
) 
return %
;% &
	operation 
. 
	Responses 
.  
TryAdd  &
(& '
$str' ,
,, -
new. 1
Response2 :
{; <
Description= H
=I J
$strK Y
}Z [
)[ \
;\ ]
	operation 
. 
	Responses 
.  
TryAdd  &
(& '
$str' ,
,, -
new. 1
Response2 :
{; <
Description= H
=I J
$strK V
}W X
)X Y
;Y Z
	operation 
. 
Security 
=  
new! $
List% )
<) *
IDictionary* 5
<5 6
string6 <
,< =
IEnumerable> I
<I J
stringJ P
>P Q
>Q R
>R S
{ 
new 

Dictionary 
< 
string %
,% &
IEnumerable' 2
<2 3
string3 9
>9 :
>: ;
{ 
{ 
$str 
, 
new  #
[$ %
]% &
{' (
$str) C
}D E
}F G
} 
} 
; 
} 	
} 
}   –!
ñC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Infrastructure\Filters\HttpGlobalExceptionFilter.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Infrastructure+ 9
.9 :
Filters: A
{ 
public 

partial 
class %
HttpGlobalExceptionFilter 2
:3 4
IExceptionFilter5 E
{ 
private 
readonly 
IHostingEnvironment ,
env- 0
;0 1
private 
readonly 
ILogger  
<  !%
HttpGlobalExceptionFilter! :
>: ;
logger< B
;B C
public %
HttpGlobalExceptionFilter (
(( )
IHostingEnvironment) <
env= @
,@ A
ILoggerB I
<I J%
HttpGlobalExceptionFilterJ c
>c d
loggere k
)k l
{ 	
this 
. 
env 
= 
env 
; 
this 
. 
logger 
= 
logger  
;  !
} 	
public 
void 
OnException 
(  
ExceptionContext  0
context1 8
)8 9
{ 	
logger 
. 
LogError 
( 
new 
EventId  '
(' (
context( /
./ 0
	Exception0 9
.9 :
HResult: A
)A B
,B C
context 
. 
	Exception !
,! "
context 
. 
	Exception !
.! "
Message" )
)) *
;* +
if 
( 
context 
. 
	Exception !
.! "
GetType" )
() *
)* +
==, .
typeof/ 5
(5 6
DomainException6 E
)E F
)F G
{ 
var 
json 
= 
new 
JsonErrorResponse 0
{   
Messages!! 
=!! 
new!! "
[!!" #
]!!# $
{!!% &
context!!' .
.!!. /
	Exception!!/ 8
.!!8 9
Message!!9 @
}!!A B
}"" 
;"" 
context$$ 
.$$ 
Result$$ 
=$$  
new$$! $"
BadRequestObjectResult$$% ;
($$; <
json$$< @
)$$@ A
;$$A B
context%% 
.%% 
HttpContext%% #
.%%# $
Response%%$ ,
.%%, -

StatusCode%%- 7
=%%8 9
(%%: ;
int%%; >
)%%> ?
HttpStatusCode%%? M
.%%M N

BadRequest%%N X
;%%X Y
}&& 
else'' 
{(( 
var)) 
json)) 
=)) 
new)) 
JsonErrorResponse)) 0
{** 
Messages++ 
=++ 
new++ "
[++" #
]++# $
{++% &
$str++' I
}++J K
},, 
;,, 
if.. 
(.. 
env.. 
... 
IsDevelopment.. %
(..% &
)..& '
)..' (
{// 
json00 
.00 
DeveloperMessage00 )
=00* +
context00, 3
.003 4
	Exception004 =
;00= >
}11 
context33 
.33 
Result33 
=33  
new33! $+
InternalServerErrorObjectResult33% D
(33D E
json33E I
)33I J
;33J K
context44 
.44 
HttpContext44 #
.44# $
Response44$ ,
.44, -

StatusCode44- 7
=448 9
(44: ;
int44; >
)44> ?
HttpStatusCode44? M
.44M N
InternalServerError44N a
;44a b
}55 
context66 
.66 
ExceptionHandled66 $
=66% &
true66' +
;66+ ,
}77 	
}88 
}99 ∑
éC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Infrastructure\Filters\JsonErrorResponse.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Infrastructure+ 9
.9 :
Filters: A
{ 
public 

class 
JsonErrorResponse "
{ 
public 
string 
[ 
] 
Messages  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
object 
DeveloperMessage &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
}		 
}

 π
ïC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Infrastructure\Filters\ValidateModelStateFilter.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Infrastructure+ 9
.9 :
Filters: A
{ 
public 

class $
ValidateModelStateFilter )
:* +!
ActionFilterAttribute, A
{ 
public		 
override		 
void		 
OnActionExecuting		 .
(		. /"
ActionExecutingContext		/ E
context		F M
)		M N
{

 	
if 
( 
context 
. 

ModelState "
." #
IsValid# *
)* +
{ 
return 
; 
} 
var 
validationErrors  
=! "
context# *
.* +

ModelState+ 5
. 
Keys 
. 

SelectMany 
( 
k 
=>  
context! (
.( )

ModelState) 3
[3 4
k4 5
]5 6
.6 7
Errors7 =
)= >
. 
Select 
( 
e 
=> 
e 
. 
ErrorMessage +
)+ ,
. 
ToArray 
( 
) 
; 
var 
json 
= 
new 
JsonErrorResponse ,
{ 
Messages 
= 
validationErrors +
} 
; 
context 
. 
Result 
= 
new  "
BadRequestObjectResult! 7
(7 8
json8 <
)< =
;= >
} 	
} 
} ª4
ïC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Infrastructure\Middlewares\ByPassAuthMiddleware.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Infrastructure+ 9
.9 :
Middlewares: E
{ 
class 	 
ByPassAuthMiddleware
 
{ 
private 
readonly 
RequestDelegate (
_next) .
;. /
private 
string 
_currentUserId %
;% &
public  
ByPassAuthMiddleware #
(# $
RequestDelegate$ 3
next4 8
)8 9
{ 	
_next 
= 
next 
; 
_currentUserId 
= 
null !
;! "
} 	
public 
async 
Task 
Invoke  
(  !
HttpContext! ,
context- 4
)4 5
{ 	
var 
path 
= 
context 
. 
Request &
.& '
Path' +
;+ ,
if 
( 
path 
== 
$str !
)! "
{ 
var 
userid 
= 
context $
.$ %
Request% ,
., -
Query- 2
[2 3
$str3 ;
]; <
;< =
if 
( 
! 
string 
. 
IsNullOrEmpty )
() *
userid* 0
)0 1
)1 2
{ 
_currentUserId "
=# $
userid% +
;+ ,
}   
context!! 
.!! 
Response!!  
.!!  !

StatusCode!!! +
=!!, -
$num!!. 1
;!!1 2
context"" 
."" 
Response""  
.""  !
ContentType""! ,
=""- .
$str""/ <
;""< =
await## 
context## 
.## 
Response## &
.##& '

WriteAsync##' 1
(##1 2
$"##2 4
User set to ##4 @
{##@ A
_currentUserId##A O
}##O P
"##P Q
)##Q R
;##R S
}$$ 
else&& 
if&& 
(&& 
path&& 
==&& 
$str&& ,
)&&, -
{'' 
_currentUserId(( 
=((  
null((! %
;((% &
context)) 
.)) 
Response))  
.))  !

StatusCode))! +
=)), -
$num)). 1
;))1 2
context** 
.** 
Response**  
.**  !
ContentType**! ,
=**- .
$str**/ <
;**< =
await++ 
context++ 
.++ 
Response++ &
.++& '

WriteAsync++' 1
(++1 2
$"++2 4E
9User set to none. Token required for protected endpoints.++4 m
"++m n
)++n o
;++o p
},, 
else-- 
{.. 
var// 
currentUserId// !
=//" #
_currentUserId//$ 2
;//2 3
var00 

authHeader00 
=00  
context00! (
.00( )
Request00) 0
.000 1
Headers001 8
[008 9
$str009 H
]00H I
;00I J
if22 
(22 

authHeader22 
!=22 !
StringValues22" .
.22. /
Empty22/ 4
)224 5
{33 
var44 
header44 
=44  

authHeader44! +
.44+ ,
FirstOrDefault44, :
(44: ;
)44; <
;44< =
if55 
(55 
!55 
string55 
.55  
IsNullOrEmpty55  -
(55- .
header55. 4
)554 5
&&556 8
header559 ?
.55? @

StartsWith55@ J
(55J K
$str55K S
)55S T
&&55U W
header55X ^
.55^ _
Length55_ e
>55f g
$str55h p
.55p q
Length55q w
)55w x
{66 
currentUserId77 %
=77& '
header77( .
.77. /
	Substring77/ 8
(778 9
$str779 A
.77A B
Length77B H
)77H I
;77I J
}88 
}99 
if;; 
(;; 
!;; 
string;; 
.;; 
IsNullOrEmpty;; )
(;;) *
currentUserId;;* 7
);;7 8
);;8 9
{<< 
var== 
user== 
=== 
new== "
ClaimsIdentity==# 1
(==1 2
new==2 5
[==5 6
]==6 7
{==8 9
new>> 
Claim>> 
(>> 
$str>> &
,>>& '
currentUserId>>( 5
)>>5 6
,>>6 7
new?? 
Claim?? 
(?? 
$str?? $
,??$ %
$str??& 1
)??1 2
,??2 3
new@@ 
Claim@@ 
(@@ 
$str@@ %
,@@% &
Guid@@' +
.@@+ ,
NewGuid@@, 3
(@@3 4
)@@4 5
.@@5 6
ToString@@6 >
(@@> ?
)@@? @
)@@@ A
,@@A B
newAA 
ClaimAA 
(AA 
$strAA \
,AA\ ]
$strAA^ t
)AAt u
,AAu v
newBB 
ClaimBB 
(BB 
$strBB %
,BB% &
GuidBB' +
.BB+ ,
NewGuidBB, 3
(BB3 4
)BB4 5
.BB5 6
ToStringBB6 >
(BB> ?
)BB? @
)BB@ A
,BBA B
newCC 
ClaimCC 
(CC 
$strCC ]
,CC] ^
$strCC^ d
)CCd e
,CCe f
newDD 
ClaimDD 
(DD 
$strDD #
,DD# $
$strDD% +
)DD+ ,
,DD, -
newEE 
ClaimEE 
(EE 
$strEE _
,EE_ `
$strEE` k
)EEk l
}EEl m
,FF 
$strFF "
)FF" #
;FF# $
contextHH 
.HH 
UserHH  
=HH! "
newHH# &
ClaimsPrincipalHH' 6
(HH6 7
userHH7 ;
)HH; <
;HH< =
}II 
awaitKK 
_nextKK 
.KK 
InvokeKK "
(KK" #
contextKK# *
)KK* +
;KK+ ,
}LL 
}MM 	
}NN 
}OO Ü5
íC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Infrastructure\Middlewares\FailingMiddleware.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Infrastructure+ 9
.9 :
Middlewares: E
{ 
public		 

class		 
FailingMiddleware		 "
{

 
private 
readonly 
RequestDelegate (
_next) .
;. /
private 
bool 
	_mustFail 
; 
private 
readonly 
FailingOptions '
_options( 0
;0 1
public 
FailingMiddleware  
(  !
RequestDelegate! 0
next1 5
,5 6
FailingOptions7 E
optionsF M
)M N
{ 	
_next 
= 
next 
; 
_options 
= 
options 
; 
	_mustFail 
= 
false 
; 
} 	
public 
async 
Task 
Invoke  
(  !
HttpContext! ,
context- 4
)4 5
{ 	
var 
path 
= 
context 
. 
Request &
.& '
Path' +
;+ ,
if 
( 
path 
. 
Equals 
( 
_options $
.$ %

ConfigPath% /
,/ 0
StringComparison1 A
.A B
OrdinalIgnoreCaseB S
)S T
)T U
{ 
await  
ProcessConfigRequest *
(* +
context+ 2
)2 3
;3 4
return 
; 
} 
if 
( 
MustFail 
( 
context  
)  !
)! "
{   
context!! 
.!! 
Response!!  
.!!  !

StatusCode!!! +
=!!, -
(!!. /
int!!/ 2
)!!2 3
System!!3 9
.!!9 :
Net!!: =
.!!= >
HttpStatusCode!!> L
.!!L M
InternalServerError!!M `
;!!` a
context"" 
."" 
Response""  
.""  !
ContentType""! ,
=""- .
$str""/ ;
;""; <
await## 
context## 
.## 
Response## &
.##& '

WriteAsync##' 1
(##1 2
$str##2 \
)##\ ]
;##] ^
}$$ 
else%% 
{&& 
await'' 
_next'' 
.'' 
Invoke'' "
(''" #
context''# *
)''* +
;''+ ,
}(( 
})) 	
private++ 
async++ 
Task++  
ProcessConfigRequest++ /
(++/ 0
HttpContext++0 ;
context++< C
)++C D
{,, 	
var-- 
enable-- 
=-- 
context--  
.--  !
Request--! (
.--( )
Query--) .
.--. /
Keys--/ 3
.--3 4
Any--4 7
(--7 8
k--8 9
=>--: <
k--= >
==--? A
$str--B J
)--J K
;--K L
var.. 
disable.. 
=.. 
context.. !
...! "
Request.." )
...) *
Query..* /
.../ 0
Keys..0 4
...4 5
Any..5 8
(..8 9
k..9 :
=>..; =
k..> ?
==..@ B
$str..C L
)..L M
;..M N
if00 
(00 
enable00 
&&00 
disable00 !
)00! "
{11 
throw22 
new22 
ArgumentException22 +
(22+ ,
$str22, i
)22i j
;22j k
}33 
if55 
(55 
disable55 
)55 
{66 
	_mustFail77 
=77 
false77 !
;77! "
await88 
SendOkResponse88 $
(88$ %
context88% ,
,88, -
$str88. o
)88o p
;88p q
return99 
;99 
}:: 
if;; 
(;; 
enable;; 
);; 
{<< 
	_mustFail== 
=== 
true==  
;==  !
await>> 
SendOkResponse>> $
(>>$ %
context>>% ,
,>>, -
$str>>. p
)>>p q
;>>q r
return?? 
;?? 
}@@ 
awaitCC 
SendOkResponseCC  
(CC  !
contextCC! (
,CC( )
stringCC* 0
.CC0 1
FormatCC1 7
(CC7 8
$strCC8 R
,CCR S
	_mustFailCCT ]
?CC^ _
$strCC` i
:CCj k
$strCCl v
)CCv w
)CCw x
;CCx y
returnDD 
;DD 
}EE 	
privateGG 
asyncGG 
TaskGG 
SendOkResponseGG )
(GG) *
HttpContextGG* 5
contextGG6 =
,GG= >
stringGG? E
messageGGF M
)GGM N
{HH 	
contextII 
.II 
ResponseII 
.II 

StatusCodeII '
=II( )
(II* +
intII+ .
)II. /
SystemII/ 5
.II5 6
NetII6 9
.II9 :
HttpStatusCodeII: H
.IIH I
OKIII K
;IIK L
contextJJ 
.JJ 
ResponseJJ 
.JJ 
ContentTypeJJ (
=JJ) *
$strJJ+ 7
;JJ7 8
awaitKK 
contextKK 
.KK 
ResponseKK "
.KK" #

WriteAsyncKK# -
(KK- .
messageKK. 5
)KK5 6
;KK6 7
}LL 	
privateNN 
boolNN 
MustFailNN 
(NN 
HttpContextNN )
contextNN* 1
)NN1 2
{OO 	
returnPP 
	_mustFailPP 
&&PP 
(QQ 
_optionsQQ 
.QQ 
EndpointPathsQQ '
.QQ' (
AnyQQ( +
(QQ+ ,
xQQ, -
=>QQ. 0
xQQ1 2
==QQ3 5
contextQQ6 =
.QQ= >
RequestQQ> E
.QQE F
PathQQF J
.QQJ K
ValueQQK P
)QQP Q
||RR 
_optionsRR 
.RR 
EndpointPathsRR )
.RR) *
CountRR* /
==RR0 2
$numRR3 4
)RR4 5
;RR5 6
}SS 	
}TT 
}UU ≠
èC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Infrastructure\Middlewares\FailingOptions.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Infrastructure+ 9
.9 :
Middlewares: E
{ 
public 

class 
FailingOptions 
{ 
public 
string 

ConfigPath  
=! "
$str# -
;- .
public		 
List		 
<		 
string		 
>		 
EndpointPaths		 )
{		* +
get		, /
;		/ 0
set		1 4
;		4 5
}		6 7
=		8 9
new		: =
List		> B
<		B C
string		C I
>		I J
(		J K
)		K L
;		L M
}

 
} ∞
ïC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Infrastructure\Middlewares\FailingStartupFilter.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Infrastructure+ 9
.9 :
Middlewares: E
{ 
public 

class  
FailingStartupFilter %
:& '
IStartupFilter( 6
{		 
private

 
readonly

 
Action

 
<

  
FailingOptions

  .
>

. /
_options

0 8
;

8 9
public  
FailingStartupFilter #
(# $
Action$ *
<* +
FailingOptions+ 9
>9 :
optionsAction; H
)H I
{ 	
_options 
= 
optionsAction $
;$ %
} 	
public 
Action 
< 
IApplicationBuilder )
>) *
	Configure+ 4
(4 5
Action5 ;
<; <
IApplicationBuilder< O
>O P
nextQ U
)U V
{ 	
return 
app 
=> 
{ 
app 
.  
UseFailingMiddleware (
(( )
_options) 1
)1 2
;2 3
next 
( 
app 
) 
; 
} 
; 
} 	
} 
} Ã

öC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Infrastructure\Middlewares\WebHostBuildertExtensions.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Infrastructure+ 9
.9 :
Middlewares: E
{ 
public 

static 
class %
WebHostBuildertExtensions 1
{		 
public

 
static

 
IWebHostBuilder

 %

UseFailing

& 0
(

0 1
this

1 5
IWebHostBuilder

6 E
builder

F M
,

M N
Action

O U
<

U V
FailingOptions

V d
>

d e
options

f m
)

m n
{ 	
builder 
. 
ConfigureServices %
(% &
services& .
=>/ 1
{ 
services 
. 
AddSingleton %
<% &
IStartupFilter& 4
>4 5
(5 6
new6 9 
FailingStartupFilter: N
(N O
optionsO V
)V W
)W X
;X Y
} 
) 
; 
return 
builder 
; 
} 	
} 
} Ä/
çC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Infrastructure\Services\IdentityService.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Infrastructure+ 9
.9 :
Services: B
{ 
public 

class 
IdentityService  
:! "
IIdentityService# 3
{		 
private

  
IHttpContextAccessor

 $
_context

% -
;

- .
public 
IdentityService 
(  
IHttpContextAccessor 3
context4 ;
); <
{ 	
_context 
= 
context 
?? !
throw" '
new( +!
ArgumentNullException, A
(A B
nameofB H
(H I
contextI P
)P Q
)Q R
;R S
} 	
public 
UserIdentityServer !!
GetUserIdentityServer" 7
(7 8
)8 9
=> 
new 
UserIdentityServer %
(% &
_context& .
.. /
HttpContext/ :
.: ;
User; ?
)? @
;@ A
public 
string 
GetUserIdentity %
(% &
)& '
=> 
_context 
. 
HttpContext #
.# $
User$ (
.( )
	FindFirst) 2
(2 3
$str3 8
)8 9
.9 :
Value: ?
;? @
public 
string 
GetUserName !
(! "
)" #
=> 
_context 
. 
HttpContext #
.# $
User$ (
.( )
Identity) 1
.1 2
Name2 6
;6 7
} 
public 

class 
UserIdentityServer #
{ 
public 
string 
NBF 
{ 
get 
;  
private! (
set) ,
;, -
}. /
public 
string 
EXP 
{ 
get 
;  
private! (
set) ,
;, -
}. /
public 
string 
ISS 
{ 
get 
;  
private! (
set) ,
;, -
}. /
public   
List   
<   
string   
>   
AUD   
{    !
get  " %
;  % &
private  ' .
set  / 2
;  2 3
}  4 5
public!! 
string!! 
	Client_Id!! 
{!!  !
get!!" %
;!!% &
private!!' .
set!!/ 2
;!!2 3
}!!4 5
public"" 
string"" 
SUB"" 
{"" 
get"" 
;""  
private""! (
set"") ,
;"", -
}"". /
public## 
string## 
	Auth_Time## 
{##  !
get##" %
;##% &
private##' .
set##/ 2
;##2 3
}##4 5
public$$ 
List$$ 
<$$ 
string$$ 
>$$ 
Scope$$ !
{$$" #
get$$$ '
;$$' (
private$$) 0
set$$1 4
;$$4 5
}$$6 7
public&& 
UserIdentityServer&& !
(&&! "
System&&" (
.&&( )
Security&&) 1
.&&1 2
Claims&&2 8
.&&8 9
ClaimsPrincipal&&9 H
claims&&I O
)&&O P
{'' 	
NBF(( 
=(( 
claims(( 
.(( 
	FindFirst(( "
(((" #
$str((# (
)((( )
.(() *
Value((* /
;((/ 0
EXP)) 
=)) 
claims)) 
.)) 
	FindFirst)) "
())" #
$str))# (
)))( )
.))) *
Value))* /
;))/ 0
ISS** 
=** 
claims** 
.** 
	FindFirst** "
(**" #
$str**# (
)**( )
.**) *
Value*** /
;**/ 0
	Client_Id++ 
=++ 
claims++ 
.++ 
	FindFirst++ (
(++( )
$str++) 4
)++4 5
.++5 6
Value++6 ;
;++; <
SUB,, 
=,, 
claims,, 
.,, 
	FindFirst,, "
(,," #
$str,,# (
),,( )
.,,) *
Value,,* /
;,,/ 0
	Auth_Time-- 
=-- 
claims-- 
.-- 
	FindFirst-- (
(--( )
$str--) 4
)--4 5
.--5 6
Value--6 ;
;--; <
AUD// 
=// 
new// 
List// 
<// 
string// !
>//! "
(//" #
)//# $
;//$ %
foreach00 
(00 
var00 
claim00 
in00 !
claims00" (
.00( )
FindAll00) 0
(000 1
$str001 6
)006 7
)007 8
AUD11 
.11 
Add11 
(11 
claim11 
.11 
Value11 #
)11# $
;11$ %
Scope33 
=33 
new33 
List33 
<33 
string33 #
>33# $
(33$ %
)33% &
;33& '
foreach44 
(44 
var44 
claim44 
in44 !
claims44" (
.44( )
FindAll44) 0
(440 1
$str441 8
)448 9
)449 :
Scope55 
.55 
Add55 
(55 
claim55 
.55  
Value55  %
)55% &
;55& '
}66 	
}77 
}88 Ö
éC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Infrastructure\Services\IIdentityService.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Infrastructure+ 9
.9 :
Services: B
{ 
public 

	interface 
IIdentityService %
{ 
UserIdentityServer !
GetUserIdentityServer 0
(0 1
)1 2
;2 3
string 
GetUserIdentity 
( 
)  
;  !
string		 
GetUserName		 
(		 
)		 
;		 
}

 
} —

ïC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Infrastructure\TransacoesFinanceirasContextSeed.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Infrastructure+ 9
{ 
public

 

class

 ,
 TransacoesFinanceirasContextSeed

 1
{ 
public 
async 
Task 
	SeedAsync #
(# $(
TransacoesFinanceirasContext$ @
contextA H
,H I
IHostingEnvironmentJ ]
env^ a
,a b
IOptionsc k
<k l
ProgramSettingsl {
>{ |
settings	} Ö
,
Ö Ü
ILogger
á é
<
é è.
 TransacoesFinanceirasContextSeed
è Ø
>
Ø ∞
logger
± ∑
)
∑ ∏
{ 	
using 
( 
context 
) 
{ 
context 
. 
Database  
.  !
Migrate! (
(( )
)) *
;* +
await 
context 
. 
SaveChangesAsync .
(. /
)/ 0
;0 1
} 
} 	
} 
} ≈D
mC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Program.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
{ 
public 

static 
class 
Program 
{ 
public 
static 
readonly 
string %
	Namespace& /
=0 1
typeof2 8
(8 9
Program9 @
)@ A
.A B
	NamespaceB K
;K L
public 
static 
readonly 
string %
AppName& -
=. /
	Namespace0 9
.9 :
	Substring: C
(C D
	NamespaceD M
.M N
LastIndexOfN Y
(Y Z
$charZ ]
,] ^
	Namespace_ h
.h i
LastIndexOfi t
(t u
$charu x
)x y
-z {
$num| }
)} ~
+	 Ä
$num
Å Ç
)
Ç É
;
É Ñ
public 
static 
int 
Main 
( 
string %
[% &
]& '
args( ,
), -
{ 	
var 
configuration 
= 
GetConfiguration  0
(0 1
)1 2
;2 3
Serilog 
. 
ILogger 
log 
=  !
CreateSerilogLogger" 5
(5 6
configuration6 C
)C D
;D E
Log 
. 
Logger 
= 
log 
; 
try 
{ 
Log 
. 
Information 
(  
$str  P
,P Q
AppNameR Y
)Y Z
;Z [
var   
host   
=   
BuildWebHost   '
(  ' (
configuration  ( 5
,  5 6
log  7 :
,  : ;
args  < @
)  @ A
;  A B
Log"" 
."" 
Information"" 
(""  
$str""  O
,""O P
AppName""Q X
)""X Y
;""Y Z
_## 
=## 
host## 
.## 
MigrateDbContext## )
<##) *(
TransacoesFinanceirasContext##* F
>##F G
(##G H
(##H I
context##I P
,##P Q
services##R Z
)##Z [
=>##\ ^
{$$ 
var%% 
env%% 
=%% 
services%%  (
.%%( )

GetService%%) 3
<%%3 4
IHostingEnvironment%%4 G
>%%G H
(%%H I
)%%I J
;%%J K
var&& 
settings&& "
=&&# $
services&&% -
.&&- .

GetService&&. 8
<&&8 9
IOptions&&9 A
<&&A B
ProgramSettings&&B Q
>&&Q R
>&&R S
(&&S T
)&&T U
;&&U V
var'' 
logger''  
=''! "
services''# +
.''+ ,

GetService'', 6
<''6 7
ILogger''7 >
<''> ?,
 TransacoesFinanceirasContextSeed''? _
>''_ `
>''` a
(''a b
)''b c
;''c d
new)) ,
 TransacoesFinanceirasContextSeed)) :
()): ;
))); <
.** 
	SeedAsync** $
(**$ %
context**% ,
,**, -
env**. 1
,**1 2
settings**3 ;
,**; <
logger**= C
)**C D
.++ 
Wait++ 
(++  
)++  !
;++! "
},, 
),, 
.-- 
MigrateDbContext-- !
<--! "&
IntegrationEventLogContext--" <
>--< =
(--= >
(--> ?
_--? @
,--@ A
__--B D
)--D E
=>--F H
{--I J
}--K L
)--L M
;--M N
Log00 
.00 
Information00 
(00  
$str00  M
,00M N
AppName00O V
)00V W
;00W X
host11 
.11 
Run11 
(11 
)11 
;11 
return33 
$num33 
;33 
}44 
catch55 
(55 
	Exception55 
ex55 
)55  
{66 
Log77 
.77 
Fatal77 
(77 
ex77 
,77 
$str77 W
,77W X
AppName77Y `
)77` a
;77a b
return88 
$num88 
;88 
}99 
finally:: 
{;; 
Log<< 
.<< 
CloseAndFlush<< !
(<<! "
)<<" #
;<<# $
}== 
}>> 	
private@@ 
static@@ 
IWebHost@@ 
BuildWebHost@@  ,
(@@, -
IConfiguration@@- ;
configuration@@< I
,@@I J
Serilog@@K R
.@@R S
ILogger@@S Z
logger@@[ a
,@@a b
string@@c i
[@@i j
]@@j k
args@@l p
)@@p q
=>@@r t
WebHostAA 
.AA  
CreateDefaultBuilderAA 0
(AA0 1
argsAA1 5
)AA5 6
.BB  
CaptureStartupErrorsBB -
(BB- .
falseBB. 3
)BB3 4
.CC 

UseFailingCC #
(CC# $
optionsCC$ +
=>CC, .
optionsCC/ 6
.CC6 7

ConfigPathCC7 A
=CCB C
$strCCD N
)CCN O
.DD 

UseStartupDD #
<DD# $
StartupDD$ +
>DD+ ,
(DD, -
)DD- .
.EE "
UseApplicationInsightsEE /
(EE/ 0
)EE0 1
.FF 
UseContentRootFF '
(FF' (
	DirectoryFF( 1
.FF1 2
GetCurrentDirectoryFF2 E
(FFE F
)FFF G
)FFG H
.GG 
UseConfigurationGG )
(GG) *
configurationGG* 7
)GG7 8
.HH 

UseSerilogHH #
(HH# $
loggerHH$ *
)HH* +
.II 
BuildII 
(II 
)II  
;II  !
privateKK 
staticKK 
SerilogKK 
.KK 
ILoggerKK &
CreateSerilogLoggerKK' :
(KK: ;
IConfigurationKK; I
configurationKKJ W
)KKW X
{LL 	
varMM 
logstashUrlMM 
=MM 
configurationMM +
[MM+ ,
$strMM, B
]MMB C
;MMC D
returnNN 
newNN 
LoggerConfigurationNN *
(NN* +
)NN+ ,
.OO 
MinimumLevelOO 
.OO 
DebugOO #
(OO# $
)OO$ %
.PP 
EnrichPP 
.PP 
WithPropertyPP $
(PP$ %
$strPP% 9
,PP9 :
AppNamePP; B
)PPB C
.QQ 
EnrichQQ 
.QQ 
FromLogContextQQ &
(QQ& '
)QQ' (
.RR 
WriteToRR 
.RR 
ConsoleRR  
(RR  !
)RR! "
.SS 
WriteToSS 
.SS 
HttpSS 
(SS 
stringSS $
.SS$ %
IsNullOrWhiteSpaceSS% 7
(SS7 8
logstashUrlSS8 C
)SSC D
?SSE F
stringSSG M
.SSM N
EmptySSN S
:SST U
logstashUrlSSV a
)SSa b
.TT 
ReadFromTT 
.TT 
ConfigurationTT '
(TT' (
configurationTT( 5
)TT5 6
.UU 
CreateLoggerUU 
(UU 
)UU 
;UU  
}VV 	
privateXX 
staticXX 
IConfigurationXX %
GetConfigurationXX& 6
(XX6 7
)XX7 8
{YY 	
varZZ 
builderZZ 
=ZZ 
newZZ  
ConfigurationBuilderZZ 2
(ZZ2 3
)ZZ3 4
.[[ 
SetBasePath[[ 
([[ 
	Directory[[ &
.[[& '
GetCurrentDirectory[[' :
([[: ;
)[[; <
)[[< =
.\\ 
AddJsonFile\\ 
(\\ 
$str\\ /
,\\/ 0
optional\\1 9
:\\9 :
false\\; @
,\\@ A
reloadOnChange\\B P
:\\P Q
true\\R V
)\\V W
.]] #
AddEnvironmentVariables]] (
(]]( )
)]]) *
;]]* +
return__ 
builder__ 
.__ 
Build__  
(__  !
)__! "
;__" #
}`` 	
}aa 
}bb ˛
uC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\ProgramSettings.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
{ 
public 

class 
ProgramSettings  
{ 
public 
bool  
UseCustomizationData (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
string 
ConnectionString &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
string 
EventBusConnection (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public		 
int		 
CheckUpdateTime		 "
{		# $
get		% (
;		( )
set		* -
;		- .
}		/ 0
}

 
} ü?
mC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras\Startup.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
{ 
public 

class 
Startup 
{ 
private 
const 
string 
PATHLIVENESS )
=* +
$str, 7
;7 8
private 
const 
string 
PATHHC #
=$ %
$str& +
;+ ,
private 
const 
string 
KEYCONNECTIONSTRING 0
=1 2
$str3 E
;E F
private 
const 
string 
KEYPATHBASE (
=) *
$str+ 6
;6 7
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public   
IConfiguration   
Configuration   +
{  , -
get  . 1
;  1 2
}  3 4
public"" 
IServiceProvider"" 
ConfigureServices""  1
(""1 2
IServiceCollection""2 D
services""E M
)""M N
{## 	
services$$ 
.$$ "
AddApplicationInsights$$ +
($$+ ,
Configuration$$, 9
)$$9 :
.%% 
AddCustomMvc%% 
(%% 
)%% 
.&& 
AddHealthChecks&&  
(&&  !
Configuration&&! .
)&&. /
.'' 
AddCustomDbContext'' #
(''# $
Configuration''$ 1
)''1 2
.(( 
AddCustomSwagger(( !
(((! "
Configuration((" /
)((/ 0
.)) !
AddCustomIntegrations)) &
())& '
Configuration))' 4
)))4 5
.** "
AddCustomConfiguration** '
(**' (
Configuration**( 5
)**5 6
.++ 
AddEventBus++ 
(++ 
Configuration++ *
)++* +
.,, #
AddCustomAuthentication,, (
(,,( )
Configuration,,) 6
),,6 7
;,,7 8
var.. 
	container.. 
=.. 
new.. 
ContainerBuilder..  0
(..0 1
)..1 2
;..2 3
	container// 
.// 
Populate// 
(// 
services// '
)//' (
;//( )
	container11 
.11 
RegisterModule11 $
(11$ %
new11% (
MediatorModule11) 7
(117 8
)118 9
)119 :
;11: ;
	container22 
.22 
RegisterModule22 $
(22$ %
new22% (
ApplicationModule22) :
(22: ;
Configuration22; H
[22H I
KEYCONNECTIONSTRING22I \
]22\ ]
)22] ^
)22^ _
;22_ `
return44 
new44 "
AutofacServiceProvider44 -
(44- .
	container44. 7
.447 8
Build448 =
(44= >
)44> ?
)44? @
;44@ A
}55 	
public77 
void77 
	Configure77 
(77 
IApplicationBuilder77 1
app772 5
,775 6
ILoggerFactory777 E
loggerFactory77F S
)77S T
{88 	
var99 
pathBase99 
=99 
Configuration99 (
[99( )
KEYPATHBASE99) 4
]994 5
;995 6
if:: 
(:: 
!:: 
string:: 
.:: 
IsNullOrEmpty:: %
(::% &
pathBase::& .
)::. /
)::/ 0
{;; 
loggerFactory<< 
.<< 
CreateLogger<< *
<<<* +
Startup<<+ 2
><<2 3
(<<3 4
)<<4 5
.<<5 6
LogDebug<<6 >
(<<> ?
$str<<? ]
,<<] ^
pathBase<<_ g
)<<g h
;<<h i
app== 
.== 
UsePathBase== 
(==  
pathBase==  (
)==( )
;==) *
}>> 
app@@ 
.@@ 
UseCors@@ 
(@@ 
$str@@ $
)@@$ %
;@@% &
appBB 
.BB 
UseHealthChecksBB 
(BB  
PATHLIVENESSBB  ,
,BB, -
newBB. 1
HealthCheckOptionsBB2 D
{CC 
	PredicateDD 
=DD 
rDD 
=>DD  
rDD! "
.DD" #
NameDD# '
.DD' (
ContainsDD( 0
(DD0 1
$strDD1 7
)DD7 8
}EE 
)EE 
;EE 
appGG 
.GG 
UseHealthChecksGG 
(GG  
PATHHCGG  &
,GG& '
newGG( +
HealthCheckOptionsGG, >
(GG> ?
)GG? @
{HH 
	PredicateII 
=II 
_II 
=>II  
trueII! %
,II% &
ResponseWriterJJ 
=JJ  
UIResponseWriterJJ! 1
.JJ1 2&
WriteHealthCheckUIResponseJJ2 L
}KK 
)KK 
;KK 
ConfigureAuthMM 
(MM 
appMM 
)MM 
;MM 
appOO 
.OO "
UseMvcWithDefaultRouteOO &
(OO& '
)OO' (
;OO( )
appQQ 
.QQ 

UseSwaggerQQ 
(QQ 
)QQ 
.RR 
UseSwaggerUIRR 
(RR 
cRR 
=>RR !
{SS 
cTT 
.TT 
SwaggerEndpointTT $
(TT$ %
$"TT% '
{TT' (
(TT) *
!TT* +
stringTT+ 1
.TT1 2
IsNullOrEmptyTT2 ?
(TT? @
pathBaseTT@ H
)TTH I
?TTJ K
pathBaseTTL T
:TTU V
stringTTW ]
.TT] ^
EmptyTT^ c
)TTc d
}TTe f$
/swagger/v1/swagger.jsonTTf ~
"TT~ 
,	TT Ä
$str
TTÅ †
)
TT† °
;
TT° ¢
cUU 
.UU 
OAuthClientIdUU "
(UU" #
$strUU# C
)UUC D
;UUD E
cVV 
.VV 
OAuthAppNameVV !
(VV! "
$strVV" K
)VVK L
;VVL M
}WW 
)WW 
;WW 
ConfigureEventBusYY 
(YY 
appYY !
)YY! "
;YY" #
}ZZ 	
private\\ 
void\\ 
ConfigureEventBus\\ &
(\\& '
IApplicationBuilder\\' :
app\\; >
)\\> ?
{]] 	
var^^ 
eventBus^^ 
=^^ 
app^^ 
.^^ 
ApplicationServices^^ 2
.^^2 3
GetRequiredService^^3 E
<^^E F
	IEventBus^^F O
>^^O P
(^^P Q
)^^Q R
;^^R S
eventBus`` 
.`` 
	Subscribe`` 
<`` !
ConsumidorCriadoEvent`` 4
,``4 5$
IIntegrationEventHandler``6 N
<``N O!
ConsumidorCriadoEvent``O d
>``d e
>``e f
(``f g
)``g h
;``h i
}bb 	
	protecteddd 
virtualdd 
voiddd 
ConfigureAuthdd ,
(dd, -
IApplicationBuilderdd- @
appddA D
)ddD E
{ee 	
ifff 
(ff 
Configurationff 
.ff 
GetValueff &
<ff& '
boolff' +
>ff+ ,
(ff, -
$strff- :
)ff: ;
)ff; <
{gg 
apphh 
.hh 
UseMiddlewarehh !
<hh! " 
ByPassAuthMiddlewarehh" 6
>hh6 7
(hh7 8
)hh8 9
;hh9 :
}ii 
appkk 
.kk 
UseAuthenticationkk !
(kk! "
)kk" #
;kk# $
}ll 	
}mm 
}oo 