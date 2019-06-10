�
�C:\DEV\MAGVA\TransacoesFinanceiras\src\GlobalBase\EventBus\MAGVA.GlobalBase.EventBus.EventBusServiceBus\DefaultServiceBusPersisterConnection.cs
	namespace 	
MAGVA
 
. 

GlobalBase 
. 
EventBus #
.# $
EventBusServiceBus$ 6
{ 
public 

class 0
$DefaultServiceBusPersisterConnection 5
:6 7*
IServiceBusPersisterConnection8 V
{		 
private

 
readonly

 
ILogger

  
<

  !0
$DefaultServiceBusPersisterConnection

! E
>

E F
_logger

G N
;

N O
private 
readonly -
!ServiceBusConnectionStringBuilder :.
"_serviceBusConnectionStringBuilder; ]
;] ^
private 
ITopicClient 
_topicClient )
;) *
bool 
	_disposed 
; 
public 0
$DefaultServiceBusPersisterConnection 3
(3 4-
!ServiceBusConnectionStringBuilder4 U-
!serviceBusConnectionStringBuilderV w
,w x
ILogger 
< 0
$DefaultServiceBusPersisterConnection 8
>8 9
logger: @
)@ A
{ 	
_logger 
= 
logger 
?? 
throw  %
new& )!
ArgumentNullException* ?
(? @
nameof@ F
(F G
loggerG M
)M N
)N O
;O P.
"_serviceBusConnectionStringBuilder .
=/ 0-
!serviceBusConnectionStringBuilder1 R
??S U
throw 
new !
ArgumentNullException /
(/ 0
nameof0 6
(6 7-
!serviceBusConnectionStringBuilder7 X
)X Y
)Y Z
;Z [
_topicClient 
= 
new 
TopicClient *
(* +.
"_serviceBusConnectionStringBuilder+ M
,M N
RetryPolicyO Z
.Z [
Default[ b
)b c
;c d
} 	
public -
!ServiceBusConnectionStringBuilder 0-
!ServiceBusConnectionStringBuilder1 R
=>S U.
"_serviceBusConnectionStringBuilderV x
;x y
public 
ITopicClient 
CreateModel '
(' (
)( )
{ 	
if 
( 
_topicClient 
. 
IsClosedOrClosing .
). /
{ 
_topicClient   
=   
new   "
TopicClient  # .
(  . /.
"_serviceBusConnectionStringBuilder  / Q
,  Q R
RetryPolicy  S ^
.  ^ _
Default  _ f
)  f g
;  g h
}!! 
return## 
_topicClient## 
;##  
}$$ 	
public&& 
void&& 
Dispose&& 
(&& 
)&& 
{'' 	
if(( 
((( 
	_disposed(( 
)(( 
return(( !
;((! "
	_disposed** 
=** 
true** 
;** 
}++ 	
},, 
}-- ��
}C:\DEV\MAGVA\TransacoesFinanceiras\src\GlobalBase\EventBus\MAGVA.GlobalBase.EventBus.EventBusServiceBus\EventBusServiceBus.cs
	namespace 	
MAGVA
 
. 

GlobalBase 
. 
EventBus #
.# $
EventBusServiceBus$ 6
{ 
public 

class 
EventBusServiceBus #
:$ %
	IEventBus& /
{ 
private 
readonly *
IServiceBusPersisterConnection 7*
_serviceBusPersisterConnection8 V
;V W
private 
readonly 
ILogger  
<  !
EventBusServiceBus! 3
>3 4
_logger5 <
;< =
private 
readonly )
IEventBusSubscriptionsManager 6
_subsManager7 C
;C D
private 
readonly 
SubscriptionClient +
_subscriptionClient, ?
;? @
private 
readonly 
ILifetimeScope '
_autofac( 0
;0 1
private 
readonly 
string 
AUTOFAC_SCOPE_NAME  2
=3 4
$str5 F
;F G
private 
const 
string #
INTEGRATION_EVENT_SUFIX 4
=5 6
$str7 I
;I J
public 
EventBusServiceBus !
(! "*
IServiceBusPersisterConnection" @)
serviceBusPersisterConnectionA ^
,^ _
ILogger 
< 
EventBusServiceBus &
>& '
logger( .
,. /)
IEventBusSubscriptionsManager0 M
subsManagerN Y
,Y Z
string[ a"
subscriptionClientNameb x
,x y
ILifetimeScope 
autofac "
)" #
{ 	*
_serviceBusPersisterConnection *
=+ ,)
serviceBusPersisterConnection- J
;J K
_logger 
= 
logger 
?? 
throw  %
new& )!
ArgumentNullException* ?
(? @
nameof@ F
(F G
loggerG M
)M N
)N O
;O P
_subsManager   
=   
subsManager   &
??  ' )
new  * -0
$InMemoryEventBusSubscriptionsManager  . R
(  R S
)  S T
;  T U
_subscriptionClient"" 
=""  !
new""" %
SubscriptionClient""& 8
(""8 9)
serviceBusPersisterConnection""9 V
.""V W-
!ServiceBusConnectionStringBuilder""W x
,""x y"
subscriptionClientName## &
)##& '
;##' (
_autofac$$ 
=$$ 
autofac$$ 
;$$ 
RemoveDefaultRule&& 
(&& 
)&& 
;&&  4
(RegisterSubscriptionClientMessageHandler'' 4
(''4 5
)''5 6
;''6 7
}(( 	
public** 
void** 
Publish** 
(** 
IntegrationEvent** ,
@event**- 3
)**3 4
{++ 	
var,, 
	eventName,, 
=,, 
@event,, "
.,," #
GetType,,# *
(,,* +
),,+ ,
.,,, -
Name,,- 1
.,,1 2
Replace,,2 9
(,,9 :#
INTEGRATION_EVENT_SUFIX,,: Q
,,,Q R
$str,,S U
),,U V
;,,V W
var-- 
jsonMessage-- 
=-- 
JsonConvert-- )
.--) *
SerializeObject--* 9
(--9 :
@event--: @
)--@ A
;--A B
var.. 
body.. 
=.. 
Encoding.. 
...  
UTF8..  $
...$ %
GetBytes..% -
(..- .
jsonMessage... 9
)..9 :
;..: ;
var00 
message00 
=00 
new00 
Message00 %
{11 
	MessageId22 
=22 
Guid22  
.22  !
NewGuid22! (
(22( )
)22) *
.22* +
ToString22+ 3
(223 4
)224 5
,225 6
Body33 
=33 
body33 
,33 
Label44 
=44 
	eventName44 !
,44! "
}55 
;55 
var77 
topicClient77 
=77 *
_serviceBusPersisterConnection77 <
.77< =
CreateModel77= H
(77H I
)77I J
;77J K
topicClient99 
.99 
	SendAsync99 !
(99! "
message99" )
)99) *
.:: 

GetAwaiter:: 
(:: 
):: 
.;; 
	GetResult;; 
(;; 
);; 
;;; 
}<< 	
public>> 
void>> 
SubscribeDynamic>> $
<>>$ %
TH>>% '
>>>' (
(>>( )
string>>) /
	eventName>>0 9
)>>9 :
where?? 
TH?? 
:?? +
IDynamicIntegrationEventHandler?? 6
{@@ 	
_loggerAA 
.AA 
LogInformationAA "
(AA" #
$strAA# a
,AAa b
	eventNameAAc l
,AAl m
nameofAAn t
(AAt u
THAAu w
)AAw x
)AAx y
;AAy z
_subsManagerCC 
.CC "
AddDynamicSubscriptionCC /
<CC/ 0
THCC0 2
>CC2 3
(CC3 4
	eventNameCC4 =
)CC= >
;CC> ?
}DD 	
publicFF 
voidFF 
	SubscribeFF 
<FF 
TFF 
,FF  
THFF! #
>FF# $
(FF$ %
)FF% &
whereGG 
TGG 
:GG 
IntegrationEventGG &
whereHH 
THHH 
:HH $
IIntegrationEventHandlerHH /
<HH/ 0
THH0 1
>HH1 2
{II 	
varJJ 
	eventNameJJ 
=JJ 
typeofJJ "
(JJ" #
TJJ# $
)JJ$ %
.JJ% &
NameJJ& *
.JJ* +
ReplaceJJ+ 2
(JJ2 3#
INTEGRATION_EVENT_SUFIXJJ3 J
,JJJ K
$strJJL N
)JJN O
;JJO P
varLL 
containsKeyLL 
=LL 
_subsManagerLL *
.LL* +$
HasSubscriptionsForEventLL+ C
<LLC D
TLLD E
>LLE F
(LLF G
)LLG H
;LLH I
ifMM 
(MM 
!MM 
containsKeyMM 
)MM 
{NN 
tryOO 
{PP 
_subscriptionClientQQ '
.QQ' (
AddRuleAsyncQQ( 4
(QQ4 5
newQQ5 8
RuleDescriptionQQ9 H
{RR 
FilterSS 
=SS  
newSS! $
CorrelationFilterSS% 6
{SS7 8
LabelSS9 >
=SS? @
	eventNameSSA J
}SSK L
,SSL M
NameTT 
=TT 
	eventNameTT (
}UU 
)UU 
.UU 

GetAwaiterUU !
(UU! "
)UU" #
.UU# $
	GetResultUU$ -
(UU- .
)UU. /
;UU/ 0
}VV 
catchWW 
(WW 
ServiceBusExceptionWW *
)WW* +
{XX 
_loggerYY 
.YY 

LogWarningYY &
(YY& '
$strYY' Y
,YYY Z
	eventNameYY[ d
)YYd e
;YYe f
}ZZ 
}[[ 
_logger]] 
.]] 
LogInformation]] "
(]]" #
$str]]# Y
,]]Y Z
	eventName]][ d
,]]d e
nameof]]f l
(]]l m
TH]]m o
)]]o p
)]]p q
;]]q r
_subsManager__ 
.__ 
AddSubscription__ (
<__( )
T__) *
,__* +
TH__, .
>__. /
(__/ 0
)__0 1
;__1 2
}`` 	
publicbb 
voidbb 
Unsubscribebb 
<bb  
Tbb  !
,bb! "
THbb# %
>bb% &
(bb& '
)bb' (
wherecc 
Tcc 
:cc 
IntegrationEventcc &
wheredd 
THdd 
:dd $
IIntegrationEventHandlerdd /
<dd/ 0
Tdd0 1
>dd1 2
{ee 	
varff 
	eventNameff 
=ff 
typeofff "
(ff" #
Tff# $
)ff$ %
.ff% &
Nameff& *
.ff* +
Replaceff+ 2
(ff2 3#
INTEGRATION_EVENT_SUFIXff3 J
,ffJ K
$strffL N
)ffN O
;ffO P
tryhh 
{ii 
_subscriptionClientjj #
.kk 
RemoveRuleAsynckk !
(kk! "
	eventNamekk" +
)kk+ ,
.ll 

GetAwaiterll 
(ll 
)ll 
.mm 
	GetResultmm 
(mm 
)mm 
;mm 
}nn 
catchoo 
(oo ,
 MessagingEntityNotFoundExceptionoo 3
)oo3 4
{pp 
_loggerqq 
.qq 

LogWarningqq "
(qq" #
$strqq# Y
,qqY Z
	eventNameqq[ d
)qqd e
;qqe f
}rr 
_loggertt 
.tt 
LogInformationtt "
(tt" #
$strtt# I
,ttI J
	eventNamettK T
)ttT U
;ttU V
_subsManagervv 
.vv 
RemoveSubscriptionvv +
<vv+ ,
Tvv, -
,vv- .
THvv/ 1
>vv1 2
(vv2 3
)vv3 4
;vv4 5
}ww 	
publicyy 
voidyy 
UnsubscribeDynamicyy &
<yy& '
THyy' )
>yy) *
(yy* +
stringyy+ 1
	eventNameyy2 ;
)yy; <
wherezz 
THzz 
:zz +
IDynamicIntegrationEventHandlerzz 6
{{{ 	
_logger|| 
.|| 
LogInformation|| "
(||" #
$str||# Q
,||Q R
	eventName||S \
)||\ ]
;||] ^
_subsManager~~ 
.~~ %
RemoveDynamicSubscription~~ 2
<~~2 3
TH~~3 5
>~~5 6
(~~6 7
	eventName~~7 @
)~~@ A
;~~A B
} 	
public
�� 
void
�� 
Dispose
�� 
(
�� 
)
�� 
{
�� 	
_subsManager
�� 
.
�� 
Clear
�� 
(
�� 
)
��  
;
��  !
}
�� 	
private
�� 
void
�� 6
(RegisterSubscriptionClientMessageHandler
�� =
(
��= >
)
��> ?
{
�� 	!
_subscriptionClient
�� 
.
��  $
RegisterMessageHandler
��  6
(
��6 7
async
�� 
(
�� 
message
�� 
,
�� 
token
��  %
)
��% &
=>
��' )
{
�� 
var
�� 
	eventName
�� !
=
��" #
$"
��$ &
{
��& '
message
��' .
.
��. /
Label
��/ 4
}
��4 5
{
��5 6%
INTEGRATION_EVENT_SUFIX
��6 M
}
��M N
"
��N O
;
��O P
var
�� 
messageData
�� #
=
��$ %
Encoding
��& .
.
��. /
UTF8
��/ 3
.
��3 4
	GetString
��4 =
(
��= >
message
��> E
.
��E F
Body
��F J
)
��J K
;
��K L
if
�� 
(
�� 
await
�� 
ProcessEvent
�� *
(
��* +
	eventName
��+ 4
,
��4 5
messageData
��6 A
)
��A B
)
��B C
{
�� 
await
�� !
_subscriptionClient
�� 1
.
��1 2
CompleteAsync
��2 ?
(
��? @
message
��@ G
.
��G H
SystemProperties
��H X
.
��X Y
	LockToken
��Y b
)
��b c
;
��c d
}
�� 
}
�� 
,
�� 
new
�� #
MessageHandlerOptions
�� )
(
��) *&
ExceptionReceivedHandler
��* B
)
��B C
{
��D E 
MaxConcurrentCalls
��F X
=
��Y Z
$num
��[ ]
,
��] ^
AutoComplete
��_ k
=
��l m
false
��n s
}
��t u
)
��u v
;
��v w
}
�� 	
private
�� 
Task
�� &
ExceptionReceivedHandler
�� -
(
��- .(
ExceptionReceivedEventArgs
��. H(
exceptionReceivedEventArgs
��I c
)
��c d
{
�� 	
var
�� 
ex
�� 
=
�� (
exceptionReceivedEventArgs
�� /
.
��/ 0
	Exception
��0 9
;
��9 :
var
�� 
context
�� 
=
�� (
exceptionReceivedEventArgs
�� 4
.
��4 5&
ExceptionReceivedContext
��5 M
;
��M N
_logger
�� 
.
�� 
LogError
�� 
(
�� 
ex
�� 
,
��  
$str
��! l
,
��l m
ex
��n p
.
��p q
Message
��q x
,
��x y
context��z �
)��� �
;��� �
return
�� 
Task
�� 
.
�� 
CompletedTask
�� %
;
��% &
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
��  
ProcessEvent
��! -
(
��- .
string
��. 4
	eventName
��5 >
,
��> ?
string
��@ F
message
��G N
)
��N O
{
�� 	
var
�� 
	processed
�� 
=
�� 
false
�� !
;
��! "
if
�� 
(
�� 
_subsManager
�� 
.
�� &
HasSubscriptionsForEvent
�� 5
(
��5 6
	eventName
��6 ?
)
��? @
)
��@ A
{
�� 
using
�� 
(
�� 
var
�� 
scope
��  
=
��! "
_autofac
��# +
.
��+ , 
BeginLifetimeScope
��, >
(
��> ? 
AUTOFAC_SCOPE_NAME
��? Q
)
��Q R
)
��R S
{
�� 
var
�� 
subscriptions
�� %
=
��& '
_subsManager
��( 4
.
��4 5!
GetHandlersForEvent
��5 H
(
��H I
	eventName
��I R
)
��R S
;
��S T
foreach
�� 
(
�� 
var
��  
subscription
��! -
in
��. 0
subscriptions
��1 >
)
��> ?
{
�� 
if
�� 
(
�� 
subscription
�� (
.
��( )
	IsDynamic
��) 2
)
��2 3
{
�� 
var
�� 
handler
��  '
=
��( )
scope
��* /
.
��/ 0
ResolveOptional
��0 ?
(
��? @
subscription
��@ L
.
��L M
HandlerType
��M X
)
��X Y
as
��Z \-
IDynamicIntegrationEventHandler
��] |
;
��| }
if
�� 
(
��  
handler
��  '
==
��( *
null
��+ /
)
��/ 0
continue
��1 9
;
��9 :
dynamic
�� #
	eventData
��$ -
=
��. /
JObject
��0 7
.
��7 8
Parse
��8 =
(
��= >
message
��> E
)
��E F
;
��F G
await
�� !
handler
��" )
.
��) *
Handle
��* 0
(
��0 1
	eventData
��1 :
)
��: ;
;
��; <
}
�� 
else
�� 
{
�� 
var
�� 
handler
��  '
=
��( )
scope
��* /
.
��/ 0
ResolveOptional
��0 ?
(
��? @
subscription
��@ L
.
��L M
HandlerType
��M X
)
��X Y
;
��Y Z
if
�� 
(
��  
handler
��  '
==
��( *
null
��+ /
)
��/ 0
continue
��1 9
;
��9 :
var
�� 
	eventType
��  )
=
��* +
_subsManager
��, 8
.
��8 9 
GetEventTypeByName
��9 K
(
��K L
	eventName
��L U
)
��U V
;
��V W
var
�� 
integrationEvent
��  0
=
��1 2
JsonConvert
��3 >
.
��> ?
DeserializeObject
��? P
(
��P Q
message
��Q X
,
��X Y
	eventType
��Z c
)
��c d
;
��d e
var
�� 
concreteType
��  ,
=
��- .
typeof
��/ 5
(
��5 6&
IIntegrationEventHandler
��6 N
<
��N O
>
��O P
)
��P Q
.
��Q R
MakeGenericType
��R a
(
��a b
	eventType
��b k
)
��k l
;
��l m
await
�� !
(
��" #
Task
��# '
)
��' (
concreteType
��( 4
.
��4 5
	GetMethod
��5 >
(
��> ?
$str
��? G
)
��G H
.
��H I
Invoke
��I O
(
��O P
handler
��P W
,
��W X
new
��Y \
object
��] c
[
��c d
]
��d e
{
��f g
integrationEvent
��h x
}
��y z
)
��z {
;
��{ |
}
�� 
}
�� 
}
�� 
	processed
�� 
=
�� 
true
��  
;
��  !
}
�� 
return
�� 
	processed
�� 
;
�� 
}
�� 	
private
�� 
void
�� 
RemoveDefaultRule
�� &
(
��& '
)
��' (
{
�� 	
try
�� 
{
�� !
_subscriptionClient
�� #
.
�� 
RemoveRuleAsync
�� !
(
��! "
RuleDescription
��" 1
.
��1 2
DefaultRuleName
��2 A
)
��A B
.
�� 

GetAwaiter
�� 
(
�� 
)
�� 
.
�� 
	GetResult
�� 
(
�� 
)
�� 
;
�� 
}
�� 
catch
�� 
(
�� .
 MessagingEntityNotFoundException
�� 3
)
��3 4
{
�� 
_logger
�� 
.
�� 

LogWarning
�� "
(
��" #
$str
��# _
,
��_ `
RuleDescription
��a p
.
��p q
DefaultRuleName��q �
)��� �
;��� �
}
�� 
}
�� 	
}
�� 
}�� �
�C:\DEV\MAGVA\TransacoesFinanceiras\src\GlobalBase\EventBus\MAGVA.GlobalBase.EventBus.EventBusServiceBus\IServiceBusPersisterConnection.cs
	namespace 	
MAGVA
 
. 

GlobalBase 
. 
EventBus #
.# $
EventBusServiceBus$ 6
{ 
public 

	interface *
IServiceBusPersisterConnection 3
:4 5
IDisposable6 A
{ -
!ServiceBusConnectionStringBuilder		 )-
!ServiceBusConnectionStringBuilder		* K
{		L M
get		N Q
;		Q R
}		S T
ITopicClient 
CreateModel  
(  !
)! "
;" #
} 
} 