ƒ
£C:\DEV\MAGVA\TransacoesFinanceiras\src\GlobalBase\EventBus\MAGVA.GlobalBase.IntegrationEventLogEF\Database\Migrations\IntegrationEventLog\20190530084248_Initial.cs
	namespace 	
MAGVA
 
. 

GlobalBase 
. !
IntegrationEventLogEF 0
.0 1
DataBase1 9
.9 :

Migrations: D
.D E
IntegrationEventLogE X
{ 
public 

partial 
class 
Initial  
:! "
	Migration# ,
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{		 	
migrationBuilder

 
.

 
EnsureSchema

 )
(

) *
name 
: 
$str 
)  
;  !
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str +
,+ ,
schema 
: 
$str !
,! "
columns 
: 
table 
=> !
new" %
{ 
EventId 
= 
table #
.# $
Column$ *
<* +
Guid+ /
>/ 0
(0 1
nullable1 9
:9 :
false; @
)@ A
,A B
EventTypeName !
=" #
table$ )
.) *
Column* 0
<0 1
string1 7
>7 8
(8 9
nullable9 A
:A B
falseC H
)H I
,I J
State 
= 
table !
.! "
Column" (
<( )
int) ,
>, -
(- .
nullable. 6
:6 7
false8 =
)= >
,> ?
	TimesSent 
= 
table  %
.% &
Column& ,
<, -
int- 0
>0 1
(1 2
nullable2 :
:: ;
false< A
)A B
,B C
CreationTime  
=! "
table# (
.( )
Column) /
</ 0
DateTime0 8
>8 9
(9 :
nullable: B
:B C
falseD I
)I J
,J K
Content 
= 
table #
.# $
Column$ *
<* +
string+ 1
>1 2
(2 3
nullable3 ;
:; <
false= B
)B C
,C D
TransactionId !
=" #
table$ )
.) *
Column* 0
<0 1
string1 7
>7 8
(8 9
nullable9 A
:A B
trueC G
)G H
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% =
,= >
x? @
=>A C
xD E
.E F
EventIdF M
)M N
;N O
} 
) 
; 
} 	
	protected   
override   
void   
Down    $
(  $ %
MigrationBuilder  % 5
migrationBuilder  6 F
)  F G
{!! 	
migrationBuilder"" 
."" 
	DropTable"" &
(""& '
name## 
:## 
$str## +
,##+ ,
schema$$ 
:$$ 
$str$$ !
)$$! "
;$$" #
}%% 	
}&& 
}'' á
sC:\DEV\MAGVA\TransacoesFinanceiras\src\GlobalBase\EventBus\MAGVA.GlobalBase.IntegrationEventLogEF\EventStateEnum.cs
	namespace 	
MAGVA
 
. 

GlobalBase 
. !
IntegrationEventLogEF 0
{ 
public 

enum 
EventStateEnum 
{ 
NotPublished 
= 
$num 
, 

InProgress 
= 
$num 
, 
	Published 
= 
$num 
, 
PublishedFailed		 
=		 
$num		 
}

 
} Ó;
C:\DEV\MAGVA\TransacoesFinanceiras\src\GlobalBase\EventBus\MAGVA.GlobalBase.IntegrationEventLogEF\IntegrationEventLogContext.cs
	namespace 	
MAGVA
 
. 

GlobalBase 
. !
IntegrationEventLogEF 0
{ 
public 

class &
IntegrationEventLogContext +
:, -
	DbContext. 7
{ 
public 
const 
string 
DEFAULT_SCHEMA *
=+ ,
$str- 6
;6 7
private 
readonly 
	IMediator "
	_mediator# ,
;, -
public &
IntegrationEventLogContext )
() *
DbContextOptions* :
<: ;&
IntegrationEventLogContext; U
>U V
optionsW ^
)^ _
:` a
baseb f
(f g
optionsg n
)n o
{p q
}r s
public &
IntegrationEventLogContext )
() *
DbContextOptions* :
<: ;&
IntegrationEventLogContext; U
>U V
optionsW ^
,^ _
	IMediator` i
mediatorj r
)r s
:t u
basev z
(z {
options	{ Ç
)
Ç É
{ 	
	_mediator 
= 
mediator  
??! #
throw$ )
new* -!
ArgumentNullException. C
(C D
nameofD J
(J K
mediatorK S
)S T
)T U
;U V
System 
. 
Diagnostics 
. 
Debug $
.$ %
	WriteLine% .
(. /
$str/ V
+W X
thisY ]
.] ^
GetHashCode^ i
(i j
)j k
)k l
;l m
} 	
public 
DbSet 
< $
IntegrationEventLogEntry -
>- . 
IntegrationEventLogs/ C
{D E
getF I
;I J
setK N
;N O
}P Q
	protected 
override 
void 
OnModelCreating  /
(/ 0
ModelBuilder0 <
builder= D
)D E
{ 	
builder 
. 
Entity 
< $
IntegrationEventLogEntry 3
>3 4
(4 5-
!ConfigureIntegrationEventLogEntry5 V
)V W
;W X
}   	
void"" -
!ConfigureIntegrationEventLogEntry"" .
("". /
EntityTypeBuilder""/ @
<""@ A$
IntegrationEventLogEntry""A Y
>""Y Z
builder""[ b
)""b c
{## 	
builder$$ 
.$$ 
ToTable$$ 
($$ 
$str$$ 1
,$$1 2
DEFAULT_SCHEMA$$3 A
)$$A B
;$$B C
builder&& 
.&& 
HasKey&& 
(&& 
e&& 
=>&& 
e&&  !
.&&! "
EventId&&" )
)&&) *
;&&* +
builder(( 
.(( 
Property(( 
((( 
e(( 
=>(( !
e((" #
.((# $
EventId(($ +
)((+ ,
.)) 

IsRequired)) 
()) 
))) 
;)) 
builder++ 
.++ 
Property++ 
(++ 
e++ 
=>++ !
e++" #
.++# $
Content++$ +
)+++ ,
.,, 

IsRequired,, 
(,, 
),, 
;,, 
builder.. 
... 
Property.. 
(.. 
e.. 
=>.. !
e.." #
...# $
CreationTime..$ 0
)..0 1
.// 

IsRequired// 
(// 
)// 
;// 
builder11 
.11 
Property11 
(11 
e11 
=>11 !
e11" #
.11# $
State11$ )
)11) *
.22 

IsRequired22 
(22 
)22 
;22 
builder44 
.44 
Property44 
(44 
e44 
=>44 !
e44" #
.44# $
	TimesSent44$ -
)44- .
.55 

IsRequired55 
(55 
)55 
;55 
builder77 
.77 
Property77 
(77 
e77 
=>77 !
e77" #
.77# $
EventTypeName77$ 1
)771 2
.88 

IsRequired88 
(88 
)88 
;88 
}:: 	
};; 
public== 

class== 5
)TransacoesFinanceirasContextDesignFactory== :
:==; <'
IDesignTimeDbContextFactory=== X
<==X Y&
IntegrationEventLogContext==Y s
>==s t
{>> 
public?? &
IntegrationEventLogContext?? )
CreateDbContext??* 9
(??9 :
string??: @
[??@ A
]??A B
args??C G
)??G H
{@@ 	
varAA 
optionsBuilderAA 
=AA  
newAA! $#
DbContextOptionsBuilderAA% <
<AA< =&
IntegrationEventLogContextAA= W
>AAW X
(AAX Y
)AAY Z
.BB 
UseSqlServerBB 
(BB 
$strBB i
)BBi j
;BBj k
returnDD 
newDD &
IntegrationEventLogContextDD 1
(DD1 2
optionsBuilderDD2 @
.DD@ A
OptionsDDA H
,DDH I
newDDJ M

NoMediatorDDN X
(DDX Y
)DDY Z
)DDZ [
;DD[ \
}EE 	
classGG 

NoMediatorGG 
:GG 
	IMediatorGG $
{HH 	
publicII 
TaskII 
PublishII 
<II  
TNotificationII  -
>II- .
(II. /
TNotificationII/ <
notificationII= I
,III J
CancellationTokenIIK \
cancellationTokenII] n
=IIo p
defaultIIq x
(IIx y
CancellationToken	IIy ä
)
IIä ã
)
IIã å
where
IIç í
TNotification
IIì †
:
II° ¢
INotification
II£ ∞
{JJ 
returnKK 
TaskKK 
.KK 
CompletedTaskKK )
;KK) *
}LL 
publicNN 
TaskNN 
<NN 
	TResponseNN !
>NN! "
SendNN# '
<NN' (
	TResponseNN( 1
>NN1 2
(NN2 3
IRequestNN3 ;
<NN; <
	TResponseNN< E
>NNE F
requestNNG N
,NNN O
CancellationTokenNNP a
cancellationTokenNNb s
=NNt u
defaultNNv }
(NN} ~
CancellationToken	NN~ è
)
NNè ê
)
NNê ë
{OO 
returnPP 
TaskPP 
.PP 

FromResultPP &
<PP& '
	TResponsePP' 0
>PP0 1
(PP1 2
defaultPP2 9
(PP9 :
	TResponsePP: C
)PPC D
)PPD E
;PPE F
}QQ 
publicSS 
TaskSS 
SendSS 
(SS 
IRequestSS %
requestSS& -
,SS- .
CancellationTokenSS/ @
cancellationTokenSSA R
=SSS T
defaultSSU \
(SS\ ]
CancellationTokenSS] n
)SSn o
)SSo p
{TT 
returnUU 
TaskUU 
.UU 
CompletedTaskUU )
;UU) *
}VV 
}WW 	
}XX 
}YY Ò
}C:\DEV\MAGVA\TransacoesFinanceiras\src\GlobalBase\EventBus\MAGVA.GlobalBase.IntegrationEventLogEF\IntegrationEventLogEntry.cs
	namespace 	
MAGVA
 
. 

GlobalBase 
. !
IntegrationEventLogEF 0
{ 
public

 

class

 $
IntegrationEventLogEntry

 )
{ 
private $
IntegrationEventLogEntry (
(( )
)) *
{+ ,
}- .
public $
IntegrationEventLogEntry '
(' (
IntegrationEvent( 8
@event9 ?
,? @
GuidA E
transactionIdF S
)S T
{ 	
EventId 
= 
@event 
. 
Id 
;  
CreationTime 
= 
@event !
.! "
CreationDate" .
;. /
EventTypeName 
= 
@event "
." #
GetType# *
(* +
)+ ,
., -
FullName- 5
;5 6
Content 
= 
JsonConvert !
.! "
SerializeObject" 1
(1 2
@event2 8
)8 9
;9 :
State 
= 
EventStateEnum "
." #
NotPublished# /
;/ 0
	TimesSent 
= 
$num 
; 
TransactionId 
= 
transactionId )
.) *
ToString* 2
(2 3
)3 4
;4 5
} 	
public 
Guid 
EventId 
{ 
get !
;! "
private# *
set+ .
;. /
}0 1
public 
string 
EventTypeName #
{$ %
get& )
;) *
private+ 2
set3 6
;6 7
}8 9
[ 	
	NotMapped	 
] 
public 
string 
EventTypeShortName (
=>) +
EventTypeName, 9
.9 :
Split: ?
(? @
$char@ C
)C D
?D E
.E F
LastF J
(J K
)K L
;L M
[ 	
	NotMapped	 
] 
public 
IntegrationEvent 
IntegrationEvent  0
{1 2
get3 6
;6 7
private8 ?
set@ C
;C D
}E F
public 
EventStateEnum 
State #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
int 
	TimesSent 
{ 
get "
;" #
set$ '
;' (
}) *
public   
DateTime   
CreationTime   $
{  % &
get  ' *
;  * +
private  , 3
set  4 7
;  7 8
}  9 :
public!! 
string!! 
Content!! 
{!! 
get!!  #
;!!# $
private!!% ,
set!!- 0
;!!0 1
}!!2 3
public"" 
string"" 
TransactionId"" #
{""$ %
get""& )
;"") *
private""+ 2
set""3 6
;""6 7
}""8 9
public$$ $
IntegrationEventLogEntry$$ '"
DeserializeJsonContent$$( >
($$> ?
Type$$? C
type$$D H
)$$H I
{%% 	
IntegrationEvent&& 
=&& 
JsonConvert&& *
.&&* +
DeserializeObject&&+ <
(&&< =
Content&&= D
,&&D E
type&&F J
)&&J K
as&&L N
IntegrationEvent&&O _
;&&_ `
return'' 
this'' 
;'' 
}(( 	
})) 
}++ ÷

âC:\DEV\MAGVA\TransacoesFinanceiras\src\GlobalBase\EventBus\MAGVA.GlobalBase.IntegrationEventLogEF\Services\IIntegrationEventLogService.cs
	namespace 	
MAGVA
 
. 

GlobalBase 
. !
IntegrationEventLogEF 0
.0 1
Services1 9
{ 
public

 

	interface

 '
IIntegrationEventLogService

 0
{ 
Task 
< 
IEnumerable 
< $
IntegrationEventLogEntry 1
>1 2
>2 32
&RetrieveEventLogsPendingToPublishAsync4 Z
(Z [
Guid[ _
transactionId` m
)m n
;n o
Task 
SaveEventAsync 
( 
IntegrationEvent ,
@event- 3
,3 4!
IDbContextTransaction5 J
transactionK V
)V W
;W X
Task %
MarkEventAsPublishedAsync &
(& '
Guid' +
eventId, 3
)3 4
;4 5
Task &
MarkEventAsInProgressAsync '
(' (
Guid( ,
eventId- 4
)4 5
;5 6
Task "
MarkEventAsFailedAsync #
(# $
Guid$ (
eventId) 0
)0 1
;1 2
} 
} Ø@
àC:\DEV\MAGVA\TransacoesFinanceiras\src\GlobalBase\EventBus\MAGVA.GlobalBase.IntegrationEventLogEF\Services\IntegrationEventLogService.cs
	namespace 	
MAGVA
 
. 

GlobalBase 
. !
IntegrationEventLogEF 0
.0 1
Services1 9
{ 
public 

class &
IntegrationEventLogService +
:, -'
IIntegrationEventLogService. I
{ 
private 
readonly &
IntegrationEventLogContext 3'
_integrationEventLogContext4 O
;O P
private 
readonly 
DbConnection %
_dbConnection& 3
;3 4
private 
readonly 
List 
< 
Type "
>" #
_eventTypes$ /
;/ 0
public &
IntegrationEventLogService )
() *
DbConnection* 6
dbConnection7 C
)C D
{ 	
_dbConnection 
= 
dbConnection (
??) +
throw, 1
new2 5!
ArgumentNullException6 K
(K L
nameofL R
(R S
dbConnectionS _
)_ `
)` a
;a b'
_integrationEventLogContext '
=( )
new* -&
IntegrationEventLogContext. H
(H I
new #
DbContextOptionsBuilder +
<+ ,&
IntegrationEventLogContext, F
>F G
(G H
)H I
. 
UseSqlServer !
(! "
_dbConnection" /
)/ 0
. 
ConfigureWarnings &
(& '
warnings' /
=>0 2
warnings3 ;
.; <
Throw< A
(A B
RelationalEventIdB S
.S T(
QueryClientEvaluationWarningT p
)p q
)q r
. 
Options 
) 
; 
_eventTypes 
= 
Assembly "
." #
Load# '
(' (
Assembly( 0
.0 1
GetEntryAssembly1 A
(A B
)B C
.C D
FullNameD L
)L M
. 
GetTypes 
( 
) 
.   
Where   
(   
t   
=>   
t   
.   
Name   "
.  " #
EndsWith  # +
(  + ,
nameof  , 2
(  2 3
IntegrationEvent  3 C
)  C D
)  D E
)  E F
.!! 
ToList!! 
(!! 
)!! 
;!! 
}"" 	
public$$ 
async$$ 
Task$$ 
<$$ 
IEnumerable$$ %
<$$% &$
IntegrationEventLogEntry$$& >
>$$> ?
>$$? @2
&RetrieveEventLogsPendingToPublishAsync$$A g
($$g h
Guid$$h l
transactionId$$m z
)$$z {
{%% 	
var&& 
tid&& 
=&& 
transactionId&& #
.&&# $
ToString&&$ ,
(&&, -
)&&- .
;&&. /
return(( 
await(( '
_integrationEventLogContext(( 4
.((4 5 
IntegrationEventLogs((5 I
.)) 
Where)) 
()) 
e)) 
=>)) 
e)) 
.)) 
TransactionId)) +
==)), .
tid))/ 2
&&))3 5
e))6 7
.))7 8
State))8 =
==))> @
EventStateEnum))A O
.))O P
NotPublished))P \
)))\ ]
.** 
OrderBy** 
(** 
o** 
=>** 
o** 
.**  
CreationTime**  ,
)**, -
.++ 
Select++ 
(++ 
e++ 
=>++ 
e++ 
.++ "
DeserializeJsonContent++ 5
(++5 6
_eventTypes++6 A
.++A B
Find++B F
(++F G
t++G H
=>++I K
t++L M
.++M N
Name++N R
==++S U
e++V W
.++W X
EventTypeShortName++X j
)++j k
)++k l
)++l m
.,, 
ToListAsync,, 
(,, 
),, 
;,, 
}-- 	
public// 
Task// 
SaveEventAsync// "
(//" #
IntegrationEvent//# 3
@event//4 :
,//: ;!
IDbContextTransaction//< Q
transaction//R ]
)//] ^
{00 	
if11 
(11 
transaction11 
==11 
null11 #
)11# $
throw11% *
new11+ .!
ArgumentNullException11/ D
(11D E
nameof11E K
(11K L
transaction11L W
)11W X
)11X Y
;11Y Z
var33 
eventLogEntry33 
=33 
new33  #$
IntegrationEventLogEntry33$ <
(33< =
@event33= C
,33C D
transaction33E P
.33P Q
TransactionId33Q ^
)33^ _
;33_ `'
_integrationEventLogContext55 '
.55' (
Database55( 0
.550 1
UseTransaction551 ?
(55? @
transaction55@ K
.55K L
GetDbTransaction55L \
(55\ ]
)55] ^
)55^ _
;55_ `'
_integrationEventLogContext66 '
.66' ( 
IntegrationEventLogs66( <
.66< =
Add66= @
(66@ A
eventLogEntry66A N
)66N O
;66O P
return88 '
_integrationEventLogContext88 .
.88. /
SaveChangesAsync88/ ?
(88? @
)88@ A
;88A B
}99 	
public;; 
Task;; %
MarkEventAsPublishedAsync;; -
(;;- .
Guid;;. 2
eventId;;3 :
);;: ;
{<< 	
return== 
UpdateEventStatus== $
(==$ %
eventId==% ,
,==, -
EventStateEnum==. <
.==< =
	Published=== F
)==F G
;==G H
}>> 	
public@@ 
Task@@ &
MarkEventAsInProgressAsync@@ .
(@@. /
Guid@@/ 3
eventId@@4 ;
)@@; <
{AA 	
returnBB 
UpdateEventStatusBB $
(BB$ %
eventIdBB% ,
,BB, -
EventStateEnumBB. <
.BB< =

InProgressBB= G
)BBG H
;BBH I
}CC 	
publicEE 
TaskEE "
MarkEventAsFailedAsyncEE *
(EE* +
GuidEE+ /
eventIdEE0 7
)EE7 8
{FF 	
returnGG 
UpdateEventStatusGG $
(GG$ %
eventIdGG% ,
,GG, -
EventStateEnumGG. <
.GG< =
PublishedFailedGG= L
)GGL M
;GGM N
}HH 	
privateJJ 
TaskJJ 
UpdateEventStatusJJ &
(JJ& '
GuidJJ' +
eventIdJJ, 3
,JJ3 4
EventStateEnumJJ5 C
statusJJD J
)JJJ K
{KK 	
varLL 
eventLogEntryLL 
=LL '
_integrationEventLogContextLL  ;
.LL; < 
IntegrationEventLogsLL< P
.LLP Q
SingleLLQ W
(LLW X
ieLLX Z
=>LL[ ]
ieLL^ `
.LL` a
EventIdLLa h
==LLi k
eventIdLLl s
)LLs t
;LLt u
eventLogEntryMM 
.MM 
StateMM 
=MM  !
statusMM" (
;MM( )
ifOO 
(OO 
statusOO 
==OO 
EventStateEnumOO (
.OO( )

InProgressOO) 3
)OO3 4
eventLogEntryPP 
.PP 
	TimesSentPP '
++PP' )
;PP) *'
_integrationEventLogContextRR '
.RR' ( 
IntegrationEventLogsRR( <
.RR< =
UpdateRR= C
(RRC D
eventLogEntryRRD Q
)RRQ R
;RRR S
returnTT '
_integrationEventLogContextTT .
.TT. /
SaveChangesAsyncTT/ ?
(TT? @
)TT@ A
;TTA B
}UU 	
}VV 
}WW ü
ÉC:\DEV\MAGVA\TransacoesFinanceiras\src\GlobalBase\EventBus\MAGVA.GlobalBase.IntegrationEventLogEF\Utilities\ResilientTransaction.cs
	namespace 	
MAGVA
 
. 

GlobalBase 
. !
IntegrationEventLogEF 0
.0 1
	Utilities1 :
{ 
public 

class  
ResilientTransaction %
{		 
private

 
	DbContext

 
_context

 "
;

" #
private  
ResilientTransaction $
($ %
	DbContext% .
context/ 6
)6 7
=>8 :
_context 
= 
context 
?? !
throw" '
new( +!
ArgumentNullException, A
(A B
nameofB H
(H I
contextI P
)P Q
)Q R
;R S
public 
static  
ResilientTransaction *
New+ .
(. /
	DbContext/ 8
context9 @
)@ A
=>B D
new  
ResilientTransaction $
($ %
context% ,
), -
;- .
public 
async 
Task 
ExecuteAsync &
(& '
Func' +
<+ ,
Task, 0
>0 1
action2 8
)8 9
{ 	
var 
strategy 
= 
_context #
.# $
Database$ ,
., -#
CreateExecutionStrategy- D
(D E
)E F
;F G
await 
strategy 
. 
ExecuteAsync '
(' (
async( -
(. /
)/ 0
=>1 3
{ 
using 
( 
var 
transaction &
=' (
_context) 1
.1 2
Database2 :
.: ;
BeginTransaction; K
(K L
)L M
)M N
{ 
await 
action  
(  !
)! "
;" #
transaction 
.  
Commit  &
(& '
)' (
;( )
} 
} 
) 
; 
} 	
} 
}   