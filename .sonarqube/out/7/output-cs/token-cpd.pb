¶1
µC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras.Infrastructure\DataBase\Migrations\TransacoesFinanceiras\20190530084452_Initial.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Infrastructure+ 9
.9 :
DataBase: B
.B C

MigrationsC M
.M N!
TransacoesFinanceirasN c
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
$str -
)- .
;. /
migrationBuilder 
. 
EnsureSchema )
() *
name 
: 
$str 
)  
;  !
migrationBuilder 
. 
CreateSequence +
(+ ,
name 
: 
$str %
,% &
schema 
: 
$str /
,/ 0

startValue 
: 
int 
.  
MinValue  (
,( )
maxValue 
: 
int 
. 
MaxValue &
,& '
incrementBy 
: 
$num 
) 
;  
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str "
," #
schema 
: 
$str /
,/ 0
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
int& )
>) *
(* +
nullable+ 3
:3 4
false5 :
): ;
,; <
Nome 
= 
table  
.  !
Column! '
<' (
string( .
>. /
(/ 0
nullable0 8
:8 9
true: >
)> ?
,? @
Email 
= 
table !
.! "
Column" (
<( )
string) /
>/ 0
(0 1
nullable1 9
:9 :
true; ?
)? @
,@ A
LoginId 
= 
table #
.# $
Column$ *
<* +
int+ .
>. /
(/ 0
nullable0 8
:8 9
false: ?
)? @
,@ A
Ativo   
=   
table   !
.  ! "
Column  " (
<  ( )
bool  ) -
>  - .
(  . /
nullable  / 7
:  7 8
false  9 >
)  > ?
}!! 
,!! 
constraints"" 
:"" 
table"" "
=>""# %
{## 
table$$ 
.$$ 

PrimaryKey$$ $
($$$ %
$str$$% 4
,$$4 5
x$$6 7
=>$$8 :
x$$; <
.$$< =
Id$$= ?
)$$? @
;$$@ A
}%% 
)%% 
;%% 
migrationBuilder'' 
.'' 
CreateIndex'' (
(''( )
name(( 
:(( 
$str(( -
,((- .
schema)) 
:)) 
$str)) /
,))/ 0
table** 
:** 
$str** #
,**# $
column++ 
:++ 
$str++ !
,++! "
unique,, 
:,, 
true,, 
),, 
;,, 
migrationBuilder.. 
... 
CreateTable.. (
(..( )
name// 
:// 
$str//  
,//  !
schema00 
:00 
$str00 !
,00! "
columns11 
:11 
table11 
=>11 !
new11" %
{22 
Id33 
=33 
table33 
.33 
Column33 %
<33% &
Guid33& *
>33* +
(33+ ,
nullable33, 4
:334 5
false336 ;
)33; <
,33< =
Name44 
=44 
table44  
.44  !
Column44! '
<44' (
string44( .
>44. /
(44/ 0
nullable440 8
:448 9
false44: ?
)44? @
,44@ A
Time55 
=55 
table55  
.55  !
Column55! '
<55' (
DateTime55( 0
>550 1
(551 2
nullable552 :
:55: ;
false55< A
)55A B
}66 
,66 
constraints77 
:77 
table77 "
=>77# %
{88 
table99 
.99 

PrimaryKey99 $
(99$ %
$str99% 2
,992 3
x994 5
=>996 8
x999 :
.99: ;
Id99; =
)99= >
;99> ?
}:: 
):: 
;:: 
};; 	
	protected== 
override== 
void== 
Down==  $
(==$ %
MigrationBuilder==% 5
migrationBuilder==6 F
)==F G
{>> 	
migrationBuilder?? 
.?? 
	DropTable?? &
(??& '
name@@ 
:@@ 
$str@@ "
,@@" #
schemaAA 
:AA 
$strAA /
)AA/ 0
;AA0 1
migrationBuilderCC 
.CC 
	DropTableCC &
(CC& '
nameDD 
:DD 
$strDD  
,DD  !
schemaEE 
:EE 
$strEE !
)EE! "
;EE" #
migrationBuilderGG 
.GG 
DropSequenceGG )
(GG) *
nameHH 
:HH 
$strHH %
,HH% &
schemaII 
:II 
$strII /
)II/ 0
;II0 1
}JJ 	
}KK 
}LL ·
ÆC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras.Infrastructure\EntityConfigurations\ClientRequestEntityTypeConfiguration.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Infrastructure+ 9
.9 : 
EntityConfigurations: N
{ 
class 	0
$ClientRequestEntityTypeConfiguration
 .
:		 	$
IEntityTypeConfiguration		
 "
<		" #
ClientRequest		# 0
>		0 1
{

 
public 
void 
	Configure 
( 
EntityTypeBuilder /
</ 0
ClientRequest0 =
>= > 
requestConfiguration? S
)S T
{ 	 
requestConfiguration  
.  !
ToTable! (
(( )
$str) 3
,3 4
$str5 >
)> ?
;? @ 
requestConfiguration  
.  !
HasKey! '
(' (
cr( *
=>+ -
cr. 0
.0 1
Id1 3
)3 4
;4 5 
requestConfiguration  
.  !
Property! )
() *
cr* ,
=>- /
cr0 2
.2 3
Name3 7
)7 8
.8 9

IsRequired9 C
(C D
)D E
;E F 
requestConfiguration  
.  !
Property! )
() *
cr* ,
=>- /
cr0 2
.2 3
Time3 7
)7 8
.8 9

IsRequired9 C
(C D
)D E
;E F
} 	
} 
} …
´C:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras.Infrastructure\EntityConfigurations\ConsumidorEntityTypeConfiguration.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Infrastructure+ 9
.9 : 
EntityConfigurations: N
{ 
class 	-
!ConsumidorEntityTypeConfiguration
 +
:		 	$
IEntityTypeConfiguration		
 "
<		" #

Consumidor		# -
>		- .
{

 
public 
void 
	Configure 
( 
EntityTypeBuilder /
</ 0

Consumidor0 :
>: ;
configuration< I
)I J
{ 	
configuration 
. 
ToTable !
(! "
$str" .
,. /(
TransacoesFinanceirasContext0 L
.L M
DEFAULT_SCHEMAM [
)[ \
;\ ]
configuration 
. 
HasKey  
(  !
b! "
=># %
b& '
.' (
Id( *
)* +
;+ ,
configuration 
. 
Ignore  
(  !
b! "
=># %
b& '
.' (
DomainEvents( 4
)4 5
;5 6
configuration 
. 
Property "
(" #
b# $
=>% '
b( )
.) *
Id* ,
), -
. '
ForSqlServerUseSequenceHiLo ,
(, -
$str- <
,< =(
TransacoesFinanceirasContext> Z
.Z [
DEFAULT_SCHEMA[ i
)i j
;j k
configuration 
. 
Property "
(" #
b# $
=>% '
b( )
.) *
LoginId* 1
)1 2
. 

IsRequired 
( 
) 
; 
configuration 
. 
HasIndex "
(" #
$str# ,
), -
. 
IsUnique 
( 
true 
) 
; 
configuration 
. 
Property "
(" #
b# $
=>% '
b( )
.) *
Nome* .
). /
;/ 0
} 	
}   
}!! ü
éC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras.Infrastructure\Idempotency\ClientRequest.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Infrastructure+ 9
.9 :
Idempotency: E
{ 
public 

class 
ClientRequest 
{ 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public		 
DateTime		 
Time		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
}

 
} ¬
êC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras.Infrastructure\Idempotency\IRequestManager.cs
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
Idempotency: E
{ 
public 

	interface 
IRequestManager $
{ 
Task		 
<		 
bool		 
>		 

ExistAsync		 
(		 
Guid		 "
id		# %
)		% &
;		& '
Task (
CreateRequestForCommandAsync )
<) *
T* +
>+ ,
(, -
Guid- 1
id2 4
)4 5
;5 6
} 
} Í
èC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras.Infrastructure\Idempotency\RequestManager.cs
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
Idempotency: E
{ 
public 

class 
RequestManager 
:  !
IRequestManager" 1
{		 
private

 
readonly

 (
TransacoesFinanceirasContext

 5
_context

6 >
;

> ?
public 
RequestManager 
( (
TransacoesFinanceirasContext :
context; B
)B C
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
public 
async 
Task 
< 
bool 
> 

ExistAsync  *
(* +
Guid+ /
id0 2
)2 3
{ 	
var 
request 
= 
await 
_context  (
.( )
	FindAsync 
< 
ClientRequest '
>' (
(( )
id) +
)+ ,
;, -
return 
request 
!= 
null "
;" #
} 	
public 
async 
Task (
CreateRequestForCommandAsync 6
<6 7
T7 8
>8 9
(9 :
Guid: >
id? A
)A B
{ 	
var 
exists 
= 
await 

ExistAsync )
() *
id* ,
), -
;- .
var 
request 
= 
exists  
?! "
throw 
new 0
$TransacoesFinanceirasDomainException >
(> ?
$"? A
Request with A N
{N O
idO Q
}Q R
 already existsR a
"a b
)b c
:d e
new   
ClientRequest   !
(  ! "
)  " #
{!! 
Id"" 
="" 
id"" 
,"" 
Name## 
=## 
typeof## !
(##! "
T##" #
)### $
.##$ %
Name##% )
,##) *
Time$$ 
=$$ 
DateTime$$ #
.$$# $
UtcNow$$$ *
}%% 
;%% 
_context'' 
.'' 
Add'' 
('' 
request''  
)''  !
;''! "
await)) 
_context)) 
.)) 
SaveChangesAsync)) +
())+ ,
))), -
;))- .
}** 	
}++ 
},, –
ÜC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras.Infrastructure\MediatorExtension.cs
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
static		 

class		 
MediatorExtension		 "
{

 
public 
static 
async 
Task  %
DispatchDomainEventsAsync! :
(: ;
this; ?
	IMediator@ I
mediatorJ R
,R S(
TransacoesFinanceirasContextT p
ctxq t
)t u
{ 	
var 
domainEntities 
=  
ctx! $
.$ %
ChangeTracker% 2
. 
Entries 
< 
Entity 
>  
(  !
)! "
. 
Where 
( 
x 
=> 
x 
. 
Entity $
.$ %
DomainEvents% 1
!=2 4
null5 9
&&: <
x= >
.> ?
Entity? E
.E F
DomainEventsF R
.R S
AnyS V
(V W
)W X
)X Y
;Y Z
var 
domainEvents 
= 
domainEntities -
. 

SelectMany 
( 
x 
=>  
x! "
." #
Entity# )
.) *
DomainEvents* 6
)6 7
. 
ToList 
( 
) 
; 
domainEntities 
. 
ToList !
(! "
)" #
. 
ForEach 
( 
entity 
=>  "
entity# )
.) *
Entity* 0
.0 1
ClearDomainEvents1 B
(B C
)C D
)D E
;E F
var 
tasks 
= 
domainEvents $
. 
Select 
( 
async 
( 
domainEvent *
)* +
=>, .
{ 
await 
mediator "
." #
Publish# *
(* +
domainEvent+ 6
)6 7
;7 8
} 
) 
; 
await 
Task 
. 
WhenAll 
( 
tasks $
)$ %
;% &
} 	
}   
}!! ⁄ 
ñC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras.Infrastructure\Repositories\ConsumidorRepository.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Infrastructure+ 9
.9 :
Repositories: F
{ 
public 

class  
ConsumidorRepository %
: 	!
IConsumidorRepository
 
{ 
private 
readonly (
TransacoesFinanceirasContext 5
_context6 >
;> ?
public 
IUnitOfWork 

UnitOfWork %
{ 	
get 
{ 
return 
_context 
;  
} 
} 	
public  
ConsumidorRepository #
(# $(
TransacoesFinanceirasContext$ @
contextA H
)H I
{ 	
_context 
= 
context 
?? !
throw" '
new( +!
ArgumentNullException, A
(A B
nameofB H
(H I
contextI P
)P Q
)Q R
;R S
} 	
public 

Consumidor 
Add 
( 

Consumidor (

consumidor) 3
)3 4
{ 	
if 
( 

consumidor 
. 
IsTransient &
(& '
)' (
)( )
{ 
return   
_context   
.    
Consumidores    ,
.!! 
Add!! 
(!! 

consumidor!! #
)!!# $
."" 
Entity"" 
;"" 
}## 
else$$ 
{%% 
return&& 

consumidor&& !
;&&! "
}'' 
}(( 	
public** 

Consumidor** 
Update**  
(**  !

Consumidor**! +

consumidor**, 6
)**6 7
{++ 	
return,, 
_context,, 
.,, 
Consumidores,, (
.-- 
Update-- 
(-- 

consumidor-- &
)--& '
... 
Entity.. 
;.. 
}// 	
public11 

Consumidor11 
Remove11  
(11  !

Consumidor11! +

consumidor11, 6
)116 7
{22 	
return33 
_33 
=33 
_context33 
.33  
Consumidores33  ,
.44 
Remove44 
(44 

consumidor44 &
)44& '
.55 
Entity55 
;55 
}66 	
public88 
async88 
Task88 
<88 

Consumidor88 $
>88$ %
	FindAsync88& /
(88/ 0
int880 3
loginid884 ;
)88; <
{99 	
var:: 

consumidor:: 
=:: 
await:: "
_context::# +
.::+ ,
Consumidores::, 8
.;; 
Where;; 
(;; 
b;; 
=>;; 
b;; 
.;; 
LoginId;; %
==;;& (
loginid;;) 0
);;0 1
.<<  
SingleOrDefaultAsync<< %
(<<% &
)<<& '
;<<' (
return>> 

consumidor>> 
;>> 
}?? 	
publicAA 
asyncAA 
TaskAA 
<AA 

ConsumidorAA $
>AA$ %
FindByIdAsyncAA& 3
(AA3 4
intAA4 7
idAA8 :
)AA: ;
{BB 	
varCC 

consumidorCC 
=CC 
awaitCC "
_contextCC# +
.CC+ ,
ConsumidoresCC, 8
.DD 
WhereDD 
(DD 
bDD 
=>DD 
bDD 
.DD 
IdDD  
==DD! #
idDD$ &
)DD& '
.EE  
SingleOrDefaultAsyncEE %
(EE% &
)EE& '
;EE' (
returnGG 

consumidorGG 
;GG 
}HH 	
}II 
}JJ ﬁO
ëC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras.Infrastructure\TransacoesFinanceirasContext.cs
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
public 

class (
TransacoesFinanceirasContext -
:. /
	DbContext0 9
,9 :
IUnitOfWork; F
{ 
public 
const 
string 
DEFAULT_SCHEMA *
=+ ,
$str- D
;D E
public 
DbSet 
< 

Consumidor 
>  
Consumidores! -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
private 
readonly 
	IMediator "
	_mediator# ,
;, -
private !
IDbContextTransaction %
_currentTransaction& 9
;9 :
public !
IDbContextTransaction $!
GetCurrentTransaction% :
(: ;
); <
=>= ?
_currentTransaction@ S
;S T
public (
TransacoesFinanceirasContext +
(+ ,
DbContextOptions, <
<< =(
TransacoesFinanceirasContext= Y
>Y Z
options[ b
)b c
:d e
basef j
(j k
optionsk r
)r s
{t u
}v w
public 
bool  
HasActiveTransaction (
=>) +
_currentTransaction, ?
!=@ B
nullC G
;G H
public (
TransacoesFinanceirasContext +
(+ ,
DbContextOptions, <
<< =(
TransacoesFinanceirasContext= Y
>Y Z
options[ b
,b c
	IMediatord m
mediatorn v
)v w
:x y
basez ~
(~ 
options	 Ü
)
Ü á
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
;!!U V
System## 
.## 
Diagnostics## 
.## 
Debug## $
.##$ %
	WriteLine##% .
(##. /
$str##/ V
+##W X
this##Y ]
.##] ^
GetHashCode##^ i
(##i j
)##j k
)##k l
;##l m
}$$ 	
	protected&& 
override&& 
void&& 
OnModelCreating&&  /
(&&/ 0
ModelBuilder&&0 <
modelBuilder&&= I
)&&I J
{'' 	
modelBuilder(( 
.(( 
ApplyConfiguration(( +
(((+ ,
new((, /0
$ClientRequestEntityTypeConfiguration((0 T
(((T U
)((U V
)((V W
;((W X
modelBuilder)) 
.)) 
ApplyConfiguration)) +
())+ ,
new)), /-
!ConsumidorEntityTypeConfiguration))0 Q
())Q R
)))R S
)))S T
;))T U
}** 	
public,, 
async,, 
Task,, 
<,, 
bool,, 
>,, 
SaveEntitiesAsync,,  1
(,,1 2
CancellationToken,,2 C
cancellationToken,,D U
=,,V W
default,,X _
(,,_ `
CancellationToken,,` q
),,q r
),,r s
{-- 	
await.. 
	_mediator.. 
... %
DispatchDomainEventsAsync.. 5
(..5 6
this..6 :
)..: ;
;..; <
_// 
=// 
await// 
base// 
.// 
SaveChangesAsync// +
(//+ ,
cancellationToken//, =
)//= >
;//> ?
return11 
true11 
;11 
}22 	
public44 
async44 
Task44 
<44 !
IDbContextTransaction44 /
>44/ 0!
BeginTransactionAsync441 F
(44F G
)44G H
{55 	
if66 
(66 
_currentTransaction66 #
!=66$ &
null66' +
)66+ ,
return66- 3
null664 8
;668 9
_currentTransaction88 
=88  !
await88" '
Database88( 0
.880 1!
BeginTransactionAsync881 F
(88F G
IsolationLevel88G U
.88U V
ReadCommitted88V c
)88c d
;88d e
return:: 
_currentTransaction:: &
;::& '
};; 	
public== 
void== 
RollbackTransaction== '
(==' (
)==( )
{>> 	
try?? 
{@@ 
_currentTransactionAA #
?AA# $
.AA$ %
RollbackAA% -
(AA- .
)AA. /
;AA/ 0
}BB 
finallyCC 
{DD 
ifEE 
(EE 
_currentTransactionEE '
!=EE( *
nullEE+ /
)EE/ 0
{FF 
_currentTransactionGG '
.GG' (
DisposeGG( /
(GG/ 0
)GG0 1
;GG1 2
_currentTransactionHH '
=HH( )
nullHH* .
;HH. /
}II 
}JJ 
}KK 	
publicMM 
asyncMM 
TaskMM "
CommitTransactionAsyncMM 0
(MM0 1!
IDbContextTransactionMM1 F
transactionMMG R
)MMR S
{NN 	
ifOO 
(OO 
transactionOO 
==OO 
nullOO #
)OO# $
throwOO% *
newOO+ .!
ArgumentNullExceptionOO/ D
(OOD E
nameofOOE K
(OOK L
transactionOOL W
)OOW X
)OOX Y
;OOY Z
ifPP 
(PP 
transactionPP 
!=PP 
_currentTransactionPP 2
)PP2 3
throwPP4 9
newPP: =%
InvalidOperationExceptionPP> W
(PPW X
$"PPX Z
Transaction PPZ f
{PPf g
transactionPPg r
.PPr s
TransactionId	PPs Ä
}
PPÄ Å
 is not current
PPÅ ê
"
PPê ë
)
PPë í
;
PPí ì
tryRR 
{SS 
awaitTT 
SaveChangesAsyncTT &
(TT& '
)TT' (
;TT( )
transactionUU 
.UU 
CommitUU "
(UU" #
)UU# $
;UU$ %
}VV 
catchWW 
{XX 
RollbackTransactionYY #
(YY# $
)YY$ %
;YY% &
throwZZ 
;ZZ 
}[[ 
finally\\ 
{]] 
if^^ 
(^^ 
_currentTransaction^^ '
!=^^( *
null^^+ /
)^^/ 0
{__ 
_currentTransaction`` '
.``' (
Dispose``( /
(``/ 0
)``0 1
;``1 2
_currentTransactionaa '
=aa( )
nullaa* .
;aa. /
}bb 
}cc 
}dd 	
}ee 
publicgg 

classgg 5
)TransacoesFinanceirasContextDesignFactorygg :
:gg; <'
IDesignTimeDbContextFactorygg= X
<ggX Y(
TransacoesFinanceirasContextggY u
>ggu v
{hh 
publicii (
TransacoesFinanceirasContextii +
CreateDbContextii, ;
(ii; <
stringii< B
[iiB C
]iiC D
argsiiE I
)iiI J
{jj 	
varkk 
optionsBuilderkk 
=kk  
newkk! $#
DbContextOptionsBuilderkk% <
<kk< =(
TransacoesFinanceirasContextkk= Y
>kkY Z
(kkZ [
)kk[ \
.ll 
UseSqlServerll 
(ll 
$strll i
)lli j
;llj k
returnnn 
newnn (
TransacoesFinanceirasContextnn 3
(nn3 4
optionsBuildernn4 B
.nnB C
OptionsnnC J
,nnJ K
newnnL O

NoMediatornnP Z
(nnZ [
)nn[ \
)nn\ ]
;nn] ^
}oo 	
classqq 

NoMediatorqq 
:qq 
	IMediatorqq $
{rr 	
publicss 
Taskss 
Publishss 
<ss  
TNotificationss  -
>ss- .
(ss. /
TNotificationss/ <
notificationss= I
,ssI J
CancellationTokenssK \
cancellationTokenss] n
=sso p
defaultssq x
(ssx y
CancellationToken	ssy ä
)
ssä ã
)
ssã å
where
ssç í
TNotification
ssì †
:
ss° ¢
INotification
ss£ ∞
{tt 
returnuu 
Taskuu 
.uu 
CompletedTaskuu )
;uu) *
}vv 
publicxx 
Taskxx 
<xx 
	TResponsexx !
>xx! "
Sendxx# '
<xx' (
	TResponsexx( 1
>xx1 2
(xx2 3
IRequestxx3 ;
<xx; <
	TResponsexx< E
>xxE F
requestxxG N
,xxN O
CancellationTokenxxP a
cancellationTokenxxb s
=xxt u
defaultxxv }
(xx} ~
CancellationToken	xx~ è
)
xxè ê
)
xxê ë
{yy 
returnzz 
Taskzz 
.zz 

FromResultzz &
<zz& '
	TResponsezz' 0
>zz0 1
(zz1 2
defaultzz2 9
(zz9 :
	TResponsezz: C
)zzC D
)zzD E
;zzE F
}{{ 
public}} 
Task}} 
Send}} 
(}} 
IRequest}} %
request}}& -
,}}- .
CancellationToken}}/ @
cancellationToken}}A R
=}}S T
default}}U \
(}}\ ]
CancellationToken}}] n
)}}n o
)}}o p
{~~ 
return 
Task 
. 
CompletedTask )
;) *
}
ÄÄ 
}
ÅÅ 	
}
ÇÇ 
}ÉÉ 