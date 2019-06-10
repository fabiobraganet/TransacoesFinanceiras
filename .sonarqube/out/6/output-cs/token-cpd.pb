¿9
õC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras.Domain\AggregatesModel\ConsumidorAggregate\Consumidor.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Domain+ 1
.1 2
AggregatesModel2 A
.A B
ConsumidorAggregateB U
{ 
public		 

class		 

Consumidor		 
:

 
Entity

 
,

 
IAggregateRoot

 
{ 
public 
string 
Nome 
{ 
get  
;  !
private" )
set* -
;- .
}/ 0
public 
string 
Email 
{ 
get !
;! "
private# *
set+ .
;. /
}0 1
public 
int 
LoginId 
{ 
get  
;  !
private" )
set* -
;- .
}/ 0
public 
bool 
Ativo 
{ 
get 
;  
set! $
;$ %
}& '
	protected 

Consumidor 
( 
) 
{ 	
} 	
public 

Consumidor 
( 
string  
nome! %
,% &
string' -
email. 3
,3 4
int5 8
loginid9 @
)@ A
:B C
thisD H
(H I
)I J
{ 	
LoginId 
= 
loginid 
> 
$num  !
?" #
loginid$ +
:, -
throw. 3
new4 7!
ArgumentNullException8 M
(M N
nameofN T
(T U
loginidU \
)\ ]
)] ^
;^ _
Nome 
= 
! 
string 
. 
IsNullOrWhiteSpace -
(- .
nome. 2
)2 3
?4 5
nome6 :
:; <
throw= B
newC F!
ArgumentNullExceptionG \
(\ ]
nameof] c
(c d
nomed h
)h i
)i j
;j k
Email 
= 
! 
string 
. 
IsNullOrWhiteSpace .
(. /
email/ 4
)4 5
?6 7
email8 =
:> ?
throw@ E
newF I!
ArgumentNullExceptionJ _
(_ `
nameof` f
(f g
emailg l
)l m
)m n
;n o
Ativo 
= 
true 
; 
Auditar 
( 
) 
; 
} 	
public 

Consumidor 
( 
int 
id  
,  !
string" (
nome) -
,- .
string/ 5
email6 ;
,; <
int= @
loginidA H
)H I
:J K
thisL P
(P Q
)Q R
{ 	
Id 
= 
id 
; 
LoginId   
=   
loginid   
>   
$num    !
?  " #
loginid  $ +
:  , -
throw  . 3
new  4 7!
ArgumentNullException  8 M
(  M N
nameof  N T
(  T U
loginid  U \
)  \ ]
)  ] ^
;  ^ _
Nome!! 
=!! 
!!! 
string!! 
.!! 
IsNullOrWhiteSpace!! -
(!!- .
nome!!. 2
)!!2 3
?!!4 5
nome!!6 :
:!!; <
throw!!= B
new!!C F!
ArgumentNullException!!G \
(!!\ ]
nameof!!] c
(!!c d
nome!!d h
)!!h i
)!!i j
;!!j k
Email"" 
="" 
!"" 
string"" 
."" 
IsNullOrWhiteSpace"" .
("". /
email""/ 4
)""4 5
?""6 7
email""8 =
:""> ?
throw""@ E
new""F I!
ArgumentNullException""J _
(""_ `
nameof""` f
(""f g
email""g l
)""l m
)""m n
;""n o
Ativo## 
=## 
true## 
;## 
Auditar$$ 
($$ 
)$$ 
;$$ 
}%% 	
public'' 
void'' 
Ativar'' 
('' 
)'' 
=>'' 
Ativo(( 
=(( 
true(( 
;(( 
public** 
void** 
	Desativar** 
(** 
)** 
=>**  "
Ativo++ 
=++ 
false++ 
;++ 
private-- 
void-- 
Auditar-- 
(-- 
)-- 
{.. 	
AuditarNome// 
(// 
)// 
;// 
}00 	
private22 
void22 
AuditarNome22  
(22  !
)22! "
{33 	
if44 
(44 
Nome44 
.44 
Length44 
>44 
$num44  
)44  !
{55 
AddDomainEvent66 
(66 
new66 "0
$ConsumidorRequerAuditoriaDomainEvent66# G
(66G H
this66H L
,66L M
$"66N PI
<Foi identificado que o nome do consumidor √© longo demais. (	66P ã
{
66ã å
Nome
66å ê
}
66ê ë
)
66ë í
"
66í ì
)
66ì î
)
66î ï
;
66ï ñ
return77 
;77 
}88 
foreach:: 
(:: 
var:: 
parte:: 
in:: !
Nome::" &
.::& '
Split::' ,
(::, -
$char::- 0
)::0 1
)::1 2
{;; 
if<< 
(<< 
parte<< 
.<< 
Length<<  
><<! "
$num<<# %
)<<% &
{== 
AddDomainEvent>> "
(>>" #
new>># &0
$ConsumidorRequerAuditoriaDomainEvent>>' K
(>>K L
this>>L P
,>>P Q
$">>R T[
NFoi identificado que uma parte do nome do consumidor √© longa demais. Parte: (	>>T °
{
>>° ¢
parte
>>¢ ß
}
>>ß ®
)
>>® ©
"
>>© ™
)
>>™ ´
)
>>´ ¨
;
>>¨ ≠
return?? 
;?? 
}@@ 
}AA 
ifCC 
(CC 
!CC 
RegexCC 
.CC 
IsMatchCC 
(CC 
NomeCC #
,CC# $
$strCC% 3
)CC3 4
)CC4 5
{DD 
AddDomainEventEE 
(EE 
newEE "0
$ConsumidorRequerAuditoriaDomainEventEE# G
(EEG H
thisEEH L
,EEL M
$"EEN PH
;Foi identificado que o nome cont√©m caracteres suspeitos. (	EEP ä
{
EEä ã
Nome
EEã è
}
EEè ê
)
EEê ë
"
EEë í
)
EEí ì
)
EEì î
;
EEî ï
returnFF 
;FF 
}GG 
}HH 	
}JJ 
}KK Ç
¶C:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras.Domain\AggregatesModel\ConsumidorAggregate\IConsumidorRepository.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Domain+ 1
.1 2
AggregatesModel2 A
.A B
ConsumidorAggregateB U
{ 
public 

	interface !
IConsumidorRepository *
:+ ,
IRepository- 8
<8 9

Consumidor9 C
>C D
{ 

Consumidor		 
Add		 
(		 

Consumidor		 !

consumidor		" ,
)		, -
;		- .

Consumidor

 
Update

 
(

 

Consumidor

 $

consumidor

% /
)

/ 0
;

0 1

Consumidor 
Remove 
( 

Consumidor $

consumidor% /
)/ 0
;0 1
Task 
< 

Consumidor 
> 
	FindAsync "
(" #
int# &
loginid' .
). /
;/ 0
Task 
< 

Consumidor 
> 
FindByIdAsync &
(& '
int' *
id+ -
)- .
;. /
} 
} í
òC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras.Domain\Events\ConsumidorRequerAuditoriaDomainEvent.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Domain+ 1
.1 2
Events2 8
{ 
public 

class 0
$ConsumidorRequerAuditoriaDomainEvent 5
:		 	
INotification		
 
{

 
public 

Consumidor 

Consumidor $
{% &
get' *
;* +
private, 3
set4 7
;7 8
}9 :
public 
string 
Motivo 
{ 
get "
;" #
private$ +
set, /
;/ 0
}1 2
public 
DateTime 
Data 
{ 
get "
;" #
private$ +
set, /
;/ 0
}1 2
public 0
$ConsumidorRequerAuditoriaDomainEvent 3
(3 4

Consumidor4 >

consumidor? I
,I J
stringK Q
motivoR X
)X Y
{ 	

Consumidor 
= 

consumidor #
;# $
Motivo 
= 
motivo 
; 
Data 
= 
DateTime 
. 
UtcNow "
;" #
} 	
} 
} à

úC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras.Domain\Exceptions\TransacoesFinanceirasDomainException.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Domain+ 1
.1 2

Exceptions2 <
{ 
public 

class 0
$TransacoesFinanceirasDomainException 5
:6 7
	Exception8 A
{ 
public 0
$TransacoesFinanceirasDomainException 3
(3 4
)4 5
{		 	
}		
 
public 0
$TransacoesFinanceirasDomainException 3
(3 4
string4 :
message; B
)B C
: 
base 
( 
message 
) 
{ 	
}
 
public 0
$TransacoesFinanceirasDomainException 3
(3 4
string4 :
message; B
,B C
	ExceptionD M
innerExceptionN \
)\ ]
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
} Ü2
|C:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras.Domain\SeedWork\Entity.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Domain+ 1
.1 2
Seedwork2 :
{ 
public 

abstract 
class 
Entity  
{		 
int

 
?

 
_requestedHashCode

 
;

  
int 
_Id 
; 
public 
virtual 
int 
Id 
{ 	
get 
{ 
return 
_Id 
; 
} 
	protected 
set 
{ 
_Id 
= 
value 
; 
} 
} 	
private 
List 
< 
INotification "
>" #
_domainEvents$ 1
;1 2
public 
IReadOnlyCollection "
<" #
INotification# 0
>0 1
DomainEvents2 >
=>? A
_domainEventsB O
?O P
.P Q

AsReadOnlyQ [
([ \
)\ ]
;] ^
public 
void 
AddDomainEvent "
(" #
INotification# 0
	eventItem1 :
): ;
{ 	
_domainEvents 
= 
_domainEvents )
??* ,
new- 0
List1 5
<5 6
INotification6 C
>C D
(D E
)E F
;F G
_domainEvents 
. 
Add 
( 
	eventItem '
)' (
;( )
} 	
public!! 
void!! 
RemoveDomainEvent!! %
(!!% &
INotification!!& 3
	eventItem!!4 =
)!!= >
{"" 	
_domainEvents## 
?## 
.## 
Remove## !
(##! "
	eventItem##" +
)##+ ,
;##, -
}$$ 	
public&& 
void&& 
ClearDomainEvents&& %
(&&% &
)&&& '
{'' 	
_domainEvents(( 
?(( 
.(( 
Clear((  
(((  !
)((! "
;((" #
})) 	
public++ 
bool++ 
IsTransient++ 
(++  
)++  !
{,, 	
return-- 
this-- 
.-- 
Id-- 
==-- 
default-- %
(--% &
Int32--& +
)--+ ,
;--, -
}.. 	
public00 
override00 
bool00 
Equals00 #
(00# $
object00$ *
obj00+ .
)00. /
{11 	
if22 
(22 
obj22 
==22 
null22 
||22 
!22  
(22  !
obj22! $
is22% '
Entity22( .
)22. /
)22/ 0
return33 
false33 
;33 
if55 
(55 
Object55 
.55 
ReferenceEquals55 &
(55& '
this55' +
,55+ ,
obj55- 0
)550 1
)551 2
return66 
true66 
;66 
if88 
(88 
this88 
.88 
GetType88 
(88 
)88 
!=88 !
obj88" %
.88% &
GetType88& -
(88- .
)88. /
)88/ 0
return99 
false99 
;99 
Entity;; 
item;; 
=;; 
(;; 
Entity;; !
);;! "
obj;;" %
;;;% &
if== 
(== 
item== 
.== 
IsTransient==  
(==  !
)==! "
||==# %
this==& *
.==* +
IsTransient==+ 6
(==6 7
)==7 8
)==8 9
return>> 
false>> 
;>> 
else?? 
return@@ 
item@@ 
.@@ 
Id@@ 
==@@ !
this@@" &
.@@& '
Id@@' )
;@@) *
}AA 	
publicCC 
overrideCC 
intCC 
GetHashCodeCC '
(CC' (
)CC( )
{DD 	
ifEE 
(EE 
!EE 
IsTransientEE 
(EE 
)EE 
)EE 
{FF 
ifGG 
(GG 
!GG 
_requestedHashCodeGG '
.GG' (
HasValueGG( 0
)GG0 1
_requestedHashCodeHH &
=HH' (
thisHH) -
.HH- .
IdHH. 0
.HH0 1
GetHashCodeHH1 <
(HH< =
)HH= >
^HH? @
$numHHA C
;HHC D
returnJJ 
_requestedHashCodeJJ )
.JJ) *
ValueJJ* /
;JJ/ 0
}KK 
elseLL 
returnMM 
baseMM 
.MM 
GetHashCodeMM '
(MM' (
)MM( )
;MM) *
}OO 	
publicPP 
staticPP 
boolPP 
operatorPP #
==PP$ &
(PP& '
EntityPP' -
leftPP. 2
,PP2 3
EntityPP4 :
rightPP; @
)PP@ A
{QQ 	
ifRR 
(RR 
ObjectRR 
.RR 
EqualsRR 
(RR 
leftRR "
,RR" #
nullRR$ (
)RR( )
)RR) *
returnSS 
(SS 
ObjectSS 
.SS 
EqualsSS %
(SS% &
rightSS& +
,SS+ ,
nullSS- 1
)SS1 2
)SS2 3
?SS4 5
trueSS6 :
:SS; <
falseSS= B
;SSB C
elseTT 
returnUU 
leftUU 
.UU 
EqualsUU "
(UU" #
rightUU# (
)UU( )
;UU) *
}VV 	
publicXX 
staticXX 
boolXX 
operatorXX #
!=XX$ &
(XX& '
EntityXX' -
leftXX. 2
,XX2 3
EntityXX4 :
rightXX; @
)XX@ A
{YY 	
returnZZ 
!ZZ 
(ZZ 
leftZZ 
==ZZ 
rightZZ "
)ZZ" #
;ZZ# $
}[[ 	
}\\ 
}]] Ü;
ÅC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras.Domain\SeedWork\Enumeration.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Domain+ 1
.1 2
Seedwork2 :
{ 
public		 

abstract		 
class		 
Enumeration		 %
:		& '
IComparable		( 3
{

 
public 
string 
Name 
{ 
get  
;  !
private" )
set* -
;- .
}/ 0
public 
int 
Id 
{ 
get 
; 
private $
set% (
;( )
}* +
	protected 
Enumeration 
( 
int !
id" $
,$ %
string& ,
name- 1
)1 2
{ 	
Id 
= 
id 
; 
Name 
= 
name 
; 
} 	
public 
override 
string 
ToString '
(' (
)( )
=>* ,
Name- 1
;1 2
public 
static 
IEnumerable !
<! "
T" #
># $
GetAll% +
<+ ,
T, -
>- .
(. /
)/ 0
where1 6
T7 8
:9 :
Enumeration; F
{ 	
var 
fields 
= 
typeof 
(  
T  !
)! "
." #
	GetFields# ,
(, -
BindingFlags- 9
.9 :
Public: @
|A B
BindingFlagsC O
.O P
StaticP V
|W X
BindingFlagsY e
.e f
DeclaredOnlyf r
)r s
;s t
return 
fields 
. 
Select  
(  !
f! "
=># %
f& '
.' (
GetValue( 0
(0 1
null1 5
)5 6
)6 7
.7 8
Cast8 <
<< =
T= >
>> ?
(? @
)@ A
;A B
} 	
public 
override 
bool 
Equals #
(# $
object$ *
obj+ .
). /
{ 	
var   

otherValue   
=   
obj    
as  ! #
Enumeration  $ /
;  / 0
if"" 
("" 

otherValue"" 
=="" 
null"" "
)""" #
return## 
false## 
;## 
var%% 
typeMatches%% 
=%% 
GetType%% %
(%%% &
)%%& '
.%%' (
Equals%%( .
(%%. /
obj%%/ 2
.%%2 3
GetType%%3 :
(%%: ;
)%%; <
)%%< =
;%%= >
var&& 
valueMatches&& 
=&& 
Id&& !
.&&! "
Equals&&" (
(&&( )

otherValue&&) 3
.&&3 4
Id&&4 6
)&&6 7
;&&7 8
return(( 
typeMatches(( 
&&(( !
valueMatches((" .
;((. /
})) 	
public++ 
override++ 
int++ 
GetHashCode++ '
(++' (
)++( )
=>++* ,
Id++- /
.++/ 0
GetHashCode++0 ;
(++; <
)++< =
;++= >
public-- 
static-- 
int-- 
AbsoluteDifference-- ,
(--, -
Enumeration--- 8

firstValue--9 C
,--C D
Enumeration--E P
secondValue--Q \
)--\ ]
{.. 	
var// 
absoluteDifference// "
=//# $
Math//% )
.//) *
Abs//* -
(//- .

firstValue//. 8
.//8 9
Id//9 ;
-//< =
secondValue//> I
.//I J
Id//J L
)//L M
;//M N
return00 
absoluteDifference00 %
;00% &
}11 	
public33 
static33 
T33 
	FromValue33 !
<33! "
T33" #
>33# $
(33$ %
int33% (
value33) .
)33. /
where330 5
T336 7
:338 9
Enumeration33: E
{44 	
var55 
matchingItem55 
=55 
Parse55 $
<55$ %
T55% &
,55& '
int55( +
>55+ ,
(55, -
value55- 2
,552 3
$str554 ;
,55; <
item55= A
=>55B D
item55E I
.55I J
Id55J L
==55M O
value55P U
)55U V
;55V W
return66 
matchingItem66 
;66  
}77 	
public99 
static99 
T99 
FromDisplayName99 '
<99' (
T99( )
>99) *
(99* +
string99+ 1
displayName992 =
)99= >
where99? D
T99E F
:99G H
Enumeration99I T
{:: 	
var;; 
matchingItem;; 
=;; 
Parse;; $
<;;$ %
T;;% &
,;;& '
string;;( .
>;;. /
(;;/ 0
displayName;;0 ;
,;;; <
$str;;= K
,;;K L
item;;M Q
=>;;R T
item;;U Y
.;;Y Z
Name;;Z ^
==;;_ a
displayName;;b m
);;m n
;;;n o
return<< 
matchingItem<< 
;<<  
}== 	
private?? 
static?? 
T?? 
Parse?? 
<?? 
T??  
,??  !
K??" #
>??# $
(??$ %
K??% &
value??' ,
,??, -
string??. 4
description??5 @
,??@ A
Func??B F
<??F G
T??G H
,??H I
bool??J N
>??N O
	predicate??P Y
)??Y Z
where??[ `
T??a b
:??c d
Enumeration??e p
{@@ 	
varAA 
matchingItemAA 
=AA 
GetAllAA %
<AA% &
TAA& '
>AA' (
(AA( )
)AA) *
.AA* +
FirstOrDefaultAA+ 9
(AA9 :
	predicateAA: C
)AAC D
;AAD E
ifCC 
(CC 
matchingItemCC 
==CC 
nullCC  $
)CC$ %
throwDD 
newDD %
InvalidOperationExceptionDD 3
(DD3 4
$"DD4 6
'DD6 7
{DD7 8
valueDD8 =
}DD= >
' is not a valid DD> O
{DDO P
descriptionDDP [
}DD[ \
 in DD\ `
{DD` a
typeofDDa g
(DDg h
TDDh i
)DDi j
}DDj k
"DDk l
)DDl m
;DDm n
returnFF 
matchingItemFF 
;FF  
}GG 	
publicII 
intII 
	CompareToII 
(II 
objectII #
otherII$ )
)II) *
=>II+ -
IdII. 0
.II0 1
	CompareToII1 :
(II: ;
(II; <
(II< =
EnumerationII= H
)IIH I
otherIII N
)IIN O
.IIO P
IdIIP R
)IIR S
;IIS T
}JJ 
}KK …
ÑC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras.Domain\SeedWork\IAggregateRoot.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Domain+ 1
.1 2
Seedwork2 :
{ 
public 

	interface 
IAggregateRoot #
{$ %
}& '
} ¨
ÅC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras.Domain\SeedWork\IRepository.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Domain+ 1
.1 2
Seedwork2 :
{ 
public 

	interface 
IRepository  
<  !
T! "
>" #
where$ )
T* +
:, -
IAggregateRoot. <
{ 
IUnitOfWork 

UnitOfWork 
{  
get! $
;$ %
}& '
} 
}		 √
ÅC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras.Domain\SeedWork\IUnitOfWork.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Domain+ 1
.1 2
Seedwork2 :
{ 
public 

	interface 
IUnitOfWork  
:! "
IDisposable# .
{		 
Task

 
<

 
int

 
>

 
SaveChangesAsync

 "
(

" #
CancellationToken

# 4
cancellationToken

5 F
=

G H
default

I P
(

P Q
CancellationToken

Q b
)

b c
)

c d
;

d e
Task 
< 
bool 
> 
SaveEntitiesAsync $
($ %
CancellationToken% 6
cancellationToken7 H
=I J
defaultK R
(R S
CancellationTokenS d
)d e
)e f
;f g
} 
} ò,
ÅC:\DEV\MAGVA\TransacoesFinanceiras\src\Back\TransacoesFinanceiras\MAGVA.Back.TransacoesFinanceiras.Domain\SeedWork\ValueObject.cs
	namespace 	
MAGVA
 
. 
Back 
. !
TransacoesFinanceiras *
.* +
Domain+ 1
.1 2
Seedwork2 :
{ 
public 

abstract 
class 
ValueObject %
{ 
	protected		 
static		 
bool		 
EqualOperator		 +
(		+ ,
ValueObject		, 7
left		8 <
,		< =
ValueObject		> I
right		J O
)		O P
{

 	
if 
( 
ReferenceEquals 
(  
left  $
,$ %
null& *
)* +
^, -
ReferenceEquals. =
(= >
right> C
,C D
nullE I
)I J
)J K
{ 
return 
false 
; 
} 
return 
ReferenceEquals "
(" #
left# '
,' (
null) -
)- .
||/ 1
left2 6
.6 7
Equals7 =
(= >
right> C
)C D
;D E
} 	
	protected 
static 
bool 
NotEqualOperator .
(. /
ValueObject/ :
left; ?
,? @
ValueObjectA L
rightM R
)R S
{ 	
return 
! 
( 
EqualOperator "
(" #
left# '
,' (
right) .
). /
)/ 0
;0 1
} 	
	protected 
abstract 
IEnumerable &
<& '
object' -
>- .
GetAtomicValues/ >
(> ?
)? @
;@ A
public 
override 
bool 
Equals #
(# $
object$ *
obj+ .
). /
{ 	
if 
( 
obj 
== 
null 
|| 
obj "
." #
GetType# *
(* +
)+ ,
!=- /
GetType0 7
(7 8
)8 9
)9 :
{ 
return 
false 
; 
} 
ValueObject 
other 
= 
(  !
ValueObject! ,
), -
obj- 0
;0 1
IEnumerator   
<   
object   
>   

thisValues    *
=  + ,
GetAtomicValues  - <
(  < =
)  = >
.  > ?
GetEnumerator  ? L
(  L M
)  M N
;  N O
IEnumerator!! 
<!! 
object!! 
>!! 
otherValues!!  +
=!!, -
other!!. 3
.!!3 4
GetAtomicValues!!4 C
(!!C D
)!!D E
.!!E F
GetEnumerator!!F S
(!!S T
)!!T U
;!!U V
while"" 
("" 

thisValues"" 
."" 
MoveNext"" &
(""& '
)""' (
&&"") +
otherValues"", 7
.""7 8
MoveNext""8 @
(""@ A
)""A B
)""B C
{## 
if$$ 
($$ 
ReferenceEquals$$ #
($$# $

thisValues$$$ .
.$$. /
Current$$/ 6
,$$6 7
null$$8 <
)$$< =
^$$> ?
ReferenceEquals$$@ O
($$O P
otherValues$$P [
.$$[ \
Current$$\ c
,$$c d
null$$e i
)$$i j
)$$j k
{%% 
return&& 
false&&  
;&&  !
}'' 
if(( 
((( 

thisValues(( 
.(( 
Current(( &
!=((' )
null((* .
&&((/ 1
!((2 3

thisValues((3 =
.((= >
Current((> E
.((E F
Equals((F L
(((L M
otherValues((M X
.((X Y
Current((Y `
)((` a
)((a b
{)) 
return** 
false**  
;**  !
}++ 
},, 
return-- 
!-- 

thisValues-- 
.-- 
MoveNext-- '
(--' (
)--( )
&&--* ,
!--- .
otherValues--. 9
.--9 :
MoveNext--: B
(--B C
)--C D
;--D E
}.. 	
public00 
override00 
int00 
GetHashCode00 '
(00' (
)00( )
{11 	
return22 
GetAtomicValues22 "
(22" #
)22# $
.33 
Select33 
(33 
x33 
=>33 
x33 
!=33 
null33 #
?33$ %
x33& '
.33' (
GetHashCode33( 3
(333 4
)334 5
:336 7
$num338 9
)339 :
.44 
	Aggregate44 
(44 
(44 
x44 
,44 
y44 
)44 
=>44 !
x44" #
^44$ %
y44& '
)44' (
;44( )
}55 	
public77 
ValueObject77 
GetCopy77 "
(77" #
)77# $
{88 	
return99 
this99 
.99 
MemberwiseClone99 '
(99' (
)99( )
as99* ,
ValueObject99- 8
;998 9
}:: 	
};; 
}<< 