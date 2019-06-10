≥
ÑC:\DEV\MAGVA\TransacoesFinanceiras\src\GlobalBase\EventBus\MAGVA.GlobalBase.EventBus\Abstractions\IDynamicIntegrationEventHandler.cs
	namespace 	
MAGVA
 
. 

GlobalBase 
. 
EventBus #
.# $
Abstractions$ 0
{ 
public 

	interface +
IDynamicIntegrationEventHandler 4
{ 
Task 
Handle 
( 
dynamic 
	eventData %
)% &
;& '
}		 
}

 ß
nC:\DEV\MAGVA\TransacoesFinanceiras\src\GlobalBase\EventBus\MAGVA.GlobalBase.EventBus\Abstractions\IEventBus.cs
	namespace 	
MAGVA
 
. 

GlobalBase 
. 
EventBus #
.# $
Abstractions$ 0
{ 
public 

	interface 
	IEventBus 
{ 
void 
Publish 
( 
IntegrationEvent %
@event& ,
), -
;- .
void

 
	Subscribe

 
<

 
T

 
,

 
TH

 
>

 
(

 
)

 
where 
T 
: 
IntegrationEvent &
where 
TH 
: $
IIntegrationEventHandler /
</ 0
T0 1
>1 2
;2 3
void 
SubscribeDynamic 
< 
TH  
>  !
(! "
string" (
	eventName) 2
)2 3
where 
TH 
: +
IDynamicIntegrationEventHandler 6
;6 7
void 
UnsubscribeDynamic 
<  
TH  "
>" #
(# $
string$ *
	eventName+ 4
)4 5
where 
TH 
: +
IDynamicIntegrationEventHandler 6
;6 7
void 
Unsubscribe 
< 
T 
, 
TH 
> 
(  
)  !
where 
TH 
: $
IIntegrationEventHandler /
</ 0
T0 1
>1 2
where 
T 
: 
IntegrationEvent &
;& '
} 
} ˚
}C:\DEV\MAGVA\TransacoesFinanceiras\src\GlobalBase\EventBus\MAGVA.GlobalBase.EventBus\Abstractions\IIntegrationEventHandler.cs
	namespace 	
MAGVA
 
. 

GlobalBase 
. 
EventBus #
.# $
Abstractions$ 0
{ 
public 

	interface $
IIntegrationEventHandler -
<- .
in. 0
TIntegrationEvent1 B
>B C
:D E$
IIntegrationEventHandlerF ^
where 
TIntegrationEvent 
:  !
IntegrationEvent" 2
{		 
Task

 
Handle

 
(

 
TIntegrationEvent

 %
@event

& ,
)

, -
;

- .
} 
public 

	interface $
IIntegrationEventHandler -
{ 
} 
} Ã
oC:\DEV\MAGVA\TransacoesFinanceiras\src\GlobalBase\EventBus\MAGVA.GlobalBase.EventBus\Events\IntegrationEvent.cs
	namespace 	
MAGVA
 
. 

GlobalBase 
. 
EventBus #
.# $
Events$ *
{ 
public 

class 
IntegrationEvent !
{ 
public		 
IntegrationEvent		 
(		  
)		  !
{

 	
Id 
= 
Guid 
. 
NewGuid 
( 
) 
;  
CreationDate 
= 
DateTime #
.# $
UtcNow$ *
;* +
} 	
[ 	
JsonConstructor	 
] 
public 
IntegrationEvent 
(  
Guid  $
id% '
,' (
DateTime) 1

createDate2 <
)< =
{ 	
Id 
= 
id 
; 
CreationDate 
= 

createDate %
;% &
} 	
[ 	
JsonProperty	 
] 
public 
Guid 
Id 
{ 
get 
; 
private %
set& )
;) *
}+ ,
[ 	
JsonProperty	 
] 
public 
DateTime 
CreationDate $
{% &
get' *
;* +
private, 3
set4 7
;7 8
}9 :
} 
} ò
xC:\DEV\MAGVA\TransacoesFinanceiras\src\GlobalBase\EventBus\MAGVA.GlobalBase.EventBus\Extensions\GenericTypeExtensions.cs
	namespace 	
MAGVA
 
. 

GlobalBase 
. 
EventBus #
.# $

Extensions$ .
{ 
public 

static 
class !
GenericTypeExtensions -
{ 
public		 
static		 
string		 
GetGenericTypeName		 /
(		/ 0
this		0 4
Type		5 9
type		: >
)		> ?
{

 	
var 
typeName 
= 
string !
.! "
Empty" '
;' (
if 
( 
type 
. 
IsGenericType "
)" #
{ 
var 
genericTypes  
=! "
string# )
.) *
Join* .
(. /
$str/ 2
,2 3
type4 8
.8 9
GetGenericArguments9 L
(L M
)M N
.N O
SelectO U
(U V
tV W
=>X Z
t[ \
.\ ]
Name] a
)a b
.b c
ToArrayc j
(j k
)k l
)l m
;m n
typeName 
= 
$" 
{ 
type "
." #
Name# '
.' (
Remove( .
(. /
type/ 3
.3 4
Name4 8
.8 9
IndexOf9 @
(@ A
$charA D
)D E
)E F
}F G
<G H
{H I
genericTypesI U
}U V
>V W
"W X
;X Y
} 
else 
{ 
typeName 
= 
type 
.  
Name  $
;$ %
} 
return 
typeName 
; 
} 	
public 
static 
string 
GetGenericTypeName /
(/ 0
this0 4
object5 ;
@object< C
)C D
{ 	
return 
@object 
. 
GetType "
(" #
)# $
.$ %
GetGenericTypeName% 7
(7 8
)8 9
;9 :
} 	
} 
} ›
uC:\DEV\MAGVA\TransacoesFinanceiras\src\GlobalBase\EventBus\MAGVA.GlobalBase.EventBus\IEventBusSubscriptionsManager.cs
	namespace 	
MAGVA
 
. 

GlobalBase 
. 
EventBus #
{ 
public

 

	interface

 )
IEventBusSubscriptionsManager

 2
{ 
bool 
IsEmpty 
{ 
get 
; 
} 
event 
EventHandler 
< 
string !
>! "
OnEventRemoved# 1
;1 2
void "
AddDynamicSubscription #
<# $
TH$ &
>& '
(' (
string( .
	eventName/ 8
)8 9
where 
TH 
: +
IDynamicIntegrationEventHandler 5
;5 6
void 
AddSubscription 
< 
T 
, 
TH  "
>" #
(# $
)$ %
where 
T 
: 
IntegrationEvent %
where 
TH 
: $
IIntegrationEventHandler .
<. /
T/ 0
>0 1
;1 2
void 
RemoveSubscription 
<  
T  !
,! "
TH# %
>% &
(& '
)' (
where 
TH 
: $
IIntegrationEventHandler 0
<0 1
T1 2
>2 3
where 
T 
: 
IntegrationEvent '
;' (
void %
RemoveDynamicSubscription &
<& '
TH' )
>) *
(* +
string+ 1
	eventName2 ;
); <
where 
TH 
: +
IDynamicIntegrationEventHandler 6
;6 7
bool $
HasSubscriptionsForEvent %
<% &
T& '
>' (
(( )
)) *
where+ 0
T1 2
:3 4
IntegrationEvent5 E
;E F
bool $
HasSubscriptionsForEvent %
(% &
string& ,
	eventName- 6
)6 7
;7 8
Type 
GetEventTypeByName 
(  
string  &
	eventName' 0
)0 1
;1 2
void 
Clear 
( 
) 
; 
IEnumerable 
< 
SubscriptionInfo $
>$ %
GetHandlersForEvent& 9
<9 :
T: ;
>; <
(< =
)= >
where? D
TE F
:G H
IntegrationEventI Y
;Y Z
IEnumerable   
<   
SubscriptionInfo   $
>  $ %
GetHandlersForEvent  & 9
(  9 :
string  : @
	eventName  A J
)  J K
;  K L
string!! 
GetEventKey!! 
<!! 
T!! 
>!! 
(!! 
)!! 
;!!  
}"" 
}## çÄ
|C:\DEV\MAGVA\TransacoesFinanceiras\src\GlobalBase\EventBus\MAGVA.GlobalBase.EventBus\InMemoryEventBusSubscriptionsManager.cs
	namespace 	
MAGVA
 
. 

GlobalBase 
. 
EventBus #
{ 
public

 

partial

 
class

 0
$InMemoryEventBusSubscriptionsManager

 =
:

> ?)
IEventBusSubscriptionsManager

@ ]
{ 
private 
readonly 

Dictionary #
<# $
string$ *
,* +
List, 0
<0 1
SubscriptionInfo1 A
>A B
>B C
	_handlersD M
;M N
private 
readonly 
List 
< 
Type "
>" #
_eventTypes$ /
;/ 0
public 
event 
EventHandler !
<! "
string" (
>( )
OnEventRemoved* 8
;8 9
public 0
$InMemoryEventBusSubscriptionsManager 3
(3 4
)4 5
{ 	
	_handlers 
= 
new 

Dictionary &
<& '
string' -
,- .
List/ 3
<3 4
SubscriptionInfo4 D
>D E
>E F
(F G
)G H
;H I
_eventTypes 
= 
new 
List "
<" #
Type# '
>' (
(( )
)) *
;* +
} 	
public 
bool 
IsEmpty 
=> 
!  
	_handlers  )
.) *
Keys* .
.. /
Any/ 2
(2 3
)3 4
;4 5
public 
void 
Clear 
( 
) 
=> 
	_handlers (
.( )
Clear) .
(. /
)/ 0
;0 1
public 
void "
AddDynamicSubscription *
<* +
TH+ -
>- .
(. /
string/ 5
	eventName6 ?
)? @
where 
TH 
: +
IDynamicIntegrationEventHandler 6
{ 	
DoAddSubscription 
( 
typeof $
($ %
TH% '
)' (
,( )
	eventName* 3
,3 4
	isDynamic5 >
:> ?
true@ D
)D E
;E F
} 	
public   
void   
AddSubscription   #
<  # $
T  $ %
,  % &
TH  ' )
>  ) *
(  * +
)  + ,
where!! 
T!! 
:!! 
IntegrationEvent!! &
where"" 
TH"" 
:"" $
IIntegrationEventHandler"" /
<""/ 0
T""0 1
>""1 2
{## 	
var$$ 
	eventName$$ 
=$$ 
GetEventKey$$ '
<$$' (
T$$( )
>$$) *
($$* +
)$$+ ,
;$$, -
DoAddSubscription&& 
(&& 
typeof&& $
(&&$ %
TH&&% '
)&&' (
,&&( )
	eventName&&* 3
,&&3 4
	isDynamic&&5 >
:&&> ?
false&&@ E
)&&E F
;&&F G
if(( 
((( 
!(( 
_eventTypes(( 
.(( 
Contains(( %
(((% &
typeof((& ,
(((, -
T((- .
)((. /
)((/ 0
)((0 1
{)) 
_eventTypes** 
.** 
Add** 
(**  
typeof**  &
(**& '
T**' (
)**( )
)**) *
;*** +
}++ 
},, 	
private.. 
void.. 
DoAddSubscription.. &
(..& '
Type..' +
handlerType.., 7
,..7 8
string..9 ?
	eventName..@ I
,..I J
bool..K O
	isDynamic..P Y
)..Y Z
{// 	
if00 
(00 
!00 $
HasSubscriptionsForEvent00 )
(00) *
	eventName00* 3
)003 4
)004 5
{11 
	_handlers22 
.22 
Add22 
(22 
	eventName22 '
,22' (
new22) ,
List22- 1
<221 2
SubscriptionInfo222 B
>22B C
(22C D
)22D E
)22E F
;22F G
}33 
if55 
(55 
	_handlers55 
[55 
	eventName55 #
]55# $
.55$ %
Any55% (
(55( )
s55) *
=>55+ -
s55. /
.55/ 0
HandlerType550 ;
==55< >
handlerType55? J
)55J K
)55K L
{66 
throw77 
new77 
ArgumentException77 +
(77+ ,
$"88 
Handler Type 88 #
{88# $
handlerType88$ /
.88/ 0
Name880 4
}884 5%
 already registered for '885 N
{88N O
	eventName88O X
}88X Y
'88Y Z
"88Z [
,88[ \
nameof88] c
(88c d
handlerType88d o
)88o p
)88p q
;88q r
}99 
if;; 
(;; 
	isDynamic;; 
);; 
{<< 
	_handlers== 
[== 
	eventName== #
]==# $
.==$ %
Add==% (
(==( )
SubscriptionInfo==) 9
.==9 :
Dynamic==: A
(==A B
handlerType==B M
)==M N
)==N O
;==O P
}>> 
else?? 
{@@ 
	_handlersAA 
[AA 
	eventNameAA #
]AA# $
.AA$ %
AddAA% (
(AA( )
SubscriptionInfoAA) 9
.AA9 :
TypedAA: ?
(AA? @
handlerTypeAA@ K
)AAK L
)AAL M
;AAM N
}BB 
}CC 	
publicEE 
voidEE %
RemoveDynamicSubscriptionEE -
<EE- .
THEE. 0
>EE0 1
(EE1 2
stringEE2 8
	eventNameEE9 B
)EEB C
whereFF 
THFF 
:FF +
IDynamicIntegrationEventHandlerFF 6
{GG 	
varHH 
handlerToRemoveHH 
=HH  !+
FindDynamicSubscriptionToRemoveHH" A
<HHA B
THHHB D
>HHD E
(HHE F
	eventNameHHF O
)HHO P
;HHP Q
DoRemoveHandlerII 
(II 
	eventNameII %
,II% &
handlerToRemoveII' 6
)II6 7
;II7 8
}JJ 	
publicLL 
voidLL 
RemoveSubscriptionLL &
<LL& '
TLL' (
,LL( )
THLL* ,
>LL, -
(LL- .
)LL. /
whereMM 
THMM 
:MM $
IIntegrationEventHandlerMM /
<MM/ 0
TMM0 1
>MM1 2
whereNN 
TNN 
:NN 
IntegrationEventNN &
{OO 	
varPP 
handlerToRemovePP 
=PP  !$
FindSubscriptionToRemovePP" :
<PP: ;
TPP; <
,PP< =
THPP> @
>PP@ A
(PPA B
)PPB C
;PPC D
varQQ 
	eventNameQQ 
=QQ 
GetEventKeyQQ '
<QQ' (
TQQ( )
>QQ) *
(QQ* +
)QQ+ ,
;QQ, -
DoRemoveHandlerRR 
(RR 
	eventNameRR %
,RR% &
handlerToRemoveRR' 6
)RR6 7
;RR7 8
}SS 	
privateUU 
voidUU 
DoRemoveHandlerUU $
(UU$ %
stringUU% +
	eventNameUU, 5
,UU5 6
SubscriptionInfoUU7 G
subsToRemoveUUH T
)UUT U
{VV 	
ifWW 
(WW 
subsToRemoveWW 
!=WW 
nullWW  $
)WW$ %
{XX 
	_handlersYY 
[YY 
	eventNameYY #
]YY# $
.YY$ %
RemoveYY% +
(YY+ ,
subsToRemoveYY, 8
)YY8 9
;YY9 :
ifZZ 
(ZZ 
!ZZ 
	_handlersZZ 
[ZZ 
	eventNameZZ (
]ZZ( )
.ZZ) *
AnyZZ* -
(ZZ- .
)ZZ. /
)ZZ/ 0
{[[ 
	_handlers\\ 
.\\ 
Remove\\ $
(\\$ %
	eventName\\% .
)\\. /
;\\/ 0
var]] 
	eventType]] !
=]]" #
_eventTypes]]$ /
.]]/ 0
SingleOrDefault]]0 ?
(]]? @
e]]@ A
=>]]B D
e]]E F
.]]F G
Name]]G K
==]]L N
	eventName]]O X
)]]X Y
;]]Y Z
if^^ 
(^^ 
	eventType^^ !
!=^^" $
null^^% )
)^^) *
{__ 
_eventTypes`` #
.``# $
Remove``$ *
(``* +
	eventType``+ 4
)``4 5
;``5 6
}aa 
RaiseOnEventRemovedbb '
(bb' (
	eventNamebb( 1
)bb1 2
;bb2 3
}cc 
}ee 
}ff 	
publichh 
IEnumerablehh 
<hh 
SubscriptionInfohh +
>hh+ ,
GetHandlersForEventhh- @
<hh@ A
ThhA B
>hhB C
(hhC D
)hhD E
wherehhF K
ThhL M
:hhN O
IntegrationEventhhP `
{ii 	
varjj 
keyjj 
=jj 
GetEventKeyjj !
<jj! "
Tjj" #
>jj# $
(jj$ %
)jj% &
;jj& '
returnkk 
GetHandlersForEventkk &
(kk& '
keykk' *
)kk* +
;kk+ ,
}ll 	
publicmm 
IEnumerablemm 
<mm 
SubscriptionInfomm +
>mm+ ,
GetHandlersForEventmm- @
(mm@ A
stringmmA G
	eventNamemmH Q
)mmQ R
=>mmS U
	_handlersmmV _
[mm_ `
	eventNamemm` i
]mmi j
;mmj k
privateoo 
voidoo 
RaiseOnEventRemovedoo (
(oo( )
stringoo) /
	eventNameoo0 9
)oo9 :
{pp 	
varqq 
handlerqq 
=qq 
OnEventRemovedqq (
;qq( )
handlerrr 
?rr 
.rr 
Invokerr 
(rr 
thisrr  
,rr  !
	eventNamerr" +
)rr+ ,
;rr, -
}ss 	
privateuu 
SubscriptionInfouu  +
FindDynamicSubscriptionToRemoveuu! @
<uu@ A
THuuA C
>uuC D
(uuD E
stringuuE K
	eventNameuuL U
)uuU V
wherevv 
THvv 
:vv +
IDynamicIntegrationEventHandlervv 6
{ww 	
returnxx &
DoFindSubscriptionToRemovexx -
(xx- .
	eventNamexx. 7
,xx7 8
typeofxx9 ?
(xx? @
THxx@ B
)xxB C
)xxC D
;xxD E
}yy 	
private{{ 
SubscriptionInfo{{  $
FindSubscriptionToRemove{{! 9
<{{9 :
T{{: ;
,{{; <
TH{{= ?
>{{? @
({{@ A
){{A B
where|| 
T|| 
:|| 
IntegrationEvent|| '
where}} 
TH}} 
:}} $
IIntegrationEventHandler}} 0
<}}0 1
T}}1 2
>}}2 3
{~~ 	
var 
	eventName 
= 
GetEventKey '
<' (
T( )
>) *
(* +
)+ ,
;, -
return
ÄÄ (
DoFindSubscriptionToRemove
ÄÄ -
(
ÄÄ- .
	eventName
ÄÄ. 7
,
ÄÄ7 8
typeof
ÄÄ9 ?
(
ÄÄ? @
TH
ÄÄ@ B
)
ÄÄB C
)
ÄÄC D
;
ÄÄD E
}
ÅÅ 	
private
ÉÉ 
SubscriptionInfo
ÉÉ  (
DoFindSubscriptionToRemove
ÉÉ! ;
(
ÉÉ; <
string
ÉÉ< B
	eventName
ÉÉC L
,
ÉÉL M
Type
ÉÉN R
handlerType
ÉÉS ^
)
ÉÉ^ _
{
ÑÑ 	
if
ÖÖ 
(
ÖÖ 
!
ÖÖ &
HasSubscriptionsForEvent
ÖÖ )
(
ÖÖ) *
	eventName
ÖÖ* 3
)
ÖÖ3 4
)
ÖÖ4 5
{
ÜÜ 
return
áá 
null
áá 
;
áá 
}
àà 
return
ää 
	_handlers
ää 
[
ää 
	eventName
ää &
]
ää& '
.
ää' (
SingleOrDefault
ää( 7
(
ää7 8
s
ää8 9
=>
ää: <
s
ää= >
.
ää> ?
HandlerType
ää? J
==
ääK M
handlerType
ääN Y
)
ääY Z
;
ääZ [
}
åå 	
public
éé 
bool
éé &
HasSubscriptionsForEvent
éé ,
<
éé, -
T
éé- .
>
éé. /
(
éé/ 0
)
éé0 1
where
éé2 7
T
éé8 9
:
éé: ;
IntegrationEvent
éé< L
{
èè 	
var
êê 
key
êê 
=
êê 
GetEventKey
êê !
<
êê! "
T
êê" #
>
êê# $
(
êê$ %
)
êê% &
;
êê& '
return
ëë &
HasSubscriptionsForEvent
ëë +
(
ëë+ ,
key
ëë, /
)
ëë/ 0
;
ëë0 1
}
íí 	
public
ìì 
bool
ìì &
HasSubscriptionsForEvent
ìì ,
(
ìì, -
string
ìì- 3
	eventName
ìì4 =
)
ìì= >
=>
ìì? A
	_handlers
ììB K
.
ììK L
ContainsKey
ììL W
(
ììW X
	eventName
ììX a
)
ììa b
;
ììb c
public
ïï 
Type
ïï  
GetEventTypeByName
ïï &
(
ïï& '
string
ïï' -
	eventName
ïï. 7
)
ïï7 8
=>
ïï9 ;
_eventTypes
ïï< G
.
ïïG H
SingleOrDefault
ïïH W
(
ïïW X
t
ïïX Y
=>
ïïZ \
t
ïï] ^
.
ïï^ _
Name
ïï_ c
==
ïïd f
	eventName
ïïg p
)
ïïp q
;
ïïq r
public
óó 
string
óó 
GetEventKey
óó !
<
óó! "
T
óó" #
>
óó# $
(
óó$ %
)
óó% &
{
òò 	
return
ôô 
typeof
ôô 
(
ôô 
T
ôô 
)
ôô 
.
ôô 
Name
ôô !
;
ôô! "
}
öö 	
}
õõ 
public
ùù 

partial
ùù 
class
ùù 2
$InMemoryEventBusSubscriptionsManager
ùù =
:
ùù> ?+
IEventBusSubscriptionsManager
ùù@ ]
{
ûû 
public
üü 
class
üü 
SubscriptionInfo
üü %
{
†† 	
public
°° 
bool
°° 
	IsDynamic
°° !
{
°°" #
get
°°$ '
;
°°' (
}
°°) *
public
¢¢ 
Type
¢¢ 
HandlerType
¢¢ #
{
¢¢$ %
get
¢¢& )
;
¢¢) *
}
¢¢+ ,
private
§§ 
SubscriptionInfo
§§ $
(
§§$ %
bool
§§% )
	isDynamic
§§* 3
,
§§3 4
Type
§§5 9
handlerType
§§: E
)
§§E F
{
•• 
	IsDynamic
¶¶ 
=
¶¶ 
	isDynamic
¶¶ %
;
¶¶% &
HandlerType
ßß 
=
ßß 
handlerType
ßß )
;
ßß) *
}
®® 
public
™™ 
static
™™ 
SubscriptionInfo
™™ *
Dynamic
™™+ 2
(
™™2 3
Type
™™3 7
handlerType
™™8 C
)
™™C D
{
´´ 
return
¨¨ 
new
¨¨ 
SubscriptionInfo
¨¨ +
(
¨¨+ ,
true
¨¨, 0
,
¨¨0 1
handlerType
¨¨2 =
)
¨¨= >
;
¨¨> ?
}
≠≠ 
public
ÆÆ 
static
ÆÆ 
SubscriptionInfo
ÆÆ *
Typed
ÆÆ+ 0
(
ÆÆ0 1
Type
ÆÆ1 5
handlerType
ÆÆ6 A
)
ÆÆA B
{
ØØ 
return
∞∞ 
new
∞∞ 
SubscriptionInfo
∞∞ +
(
∞∞+ ,
false
∞∞, 1
,
∞∞1 2
handlerType
∞∞3 >
)
∞∞> ?
;
∞∞? @
}
±± 
}
≤≤ 	
}
≥≥ 
}¥¥ 