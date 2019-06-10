‹A
ÉC:\DEV\MAGVA\TransacoesFinanceiras\src\GlobalBase\EventBus\MAGVA.GlobalBase.EventBusRabbitMQ\DefaultRabbitMQPersistentConnection.cs
	namespace 	
MAGVA
 
. 

GlobalBase 
. 
EventBusRabbitMQ +
{ 
public 

class /
#DefaultRabbitMQPersistentConnection 4
: )
IRabbitMQPersistentConnection *
{ 
private 
readonly 
IConnectionFactory +
_connectionFactory, >
;> ?
private 
readonly 
ILogger  
<  !/
#DefaultRabbitMQPersistentConnection! D
>D E
_loggerF M
;M N
private 
readonly 
int 
_retryCount (
;( )
IConnection 
_connection 
;  
bool 
	_disposed 
; 
object 
	sync_root 
= 
new 
object %
(% &
)& '
;' (
public /
#DefaultRabbitMQPersistentConnection 2
(2 3
IConnectionFactory3 E
connectionFactoryF W
,W X
ILoggerY `
<` a0
#DefaultRabbitMQPersistentConnection	a Ñ
>
Ñ Ö
logger
Ü å
,
å ç
int
é ë

retryCount
í ú
=
ù û
$num
ü †
)
† °
{ 	
_connectionFactory 
=  
connectionFactory! 2
??3 5
throw6 ;
new< ?!
ArgumentNullException@ U
(U V
nameofV \
(\ ]
connectionFactory] n
)n o
)o p
;p q
_logger 
= 
logger 
?? 
throw  %
new& )!
ArgumentNullException* ?
(? @
nameof@ F
(F G
loggerG M
)M N
)N O
;O P
_retryCount 
= 

retryCount $
;$ %
} 	
public   
bool   
IsConnected   
{!! 	
get"" 
{## 
return$$ 
_connection$$ "
!=$$# %
null$$& *
&&$$+ -
_connection$$. 9
.$$9 :
IsOpen$$: @
&&$$A C
!$$D E
	_disposed$$E N
;$$N O
}%% 
}&& 	
public(( 
IModel(( 
CreateModel(( !
(((! "
)((" #
{)) 	
if** 
(** 
!** 
IsConnected** 
)** 
{++ 
throw,, 
new,, %
InvalidOperationException,, 3
(,,3 4
$str,,4 r
),,r s
;,,s t
}-- 
return// 
_connection// 
.// 
CreateModel// *
(//* +
)//+ ,
;//, -
}00 	
public22 
void22 
Dispose22 
(22 
)22 
{33 	
if44 
(44 
	_disposed44 
)44 
return44 !
;44! "
	_disposed66 
=66 
true66 
;66 
try88 
{99 
_connection:: 
.:: 
Dispose:: #
(::# $
)::$ %
;::% &
};; 
catch<< 
(<< 
IOException<< 
ex<< !
)<<! "
{== 
_logger>> 
.>> 
LogCritical>> #
(>># $
ex>>$ &
.>>& '
ToString>>' /
(>>/ 0
)>>0 1
)>>1 2
;>>2 3
}?? 
}@@ 	
publicBB 
boolBB 

TryConnectBB 
(BB 
)BB  
{CC 	
_loggerDD 
.DD 
LogInformationDD "
(DD" #
$strDD# I
)DDI J
;DDJ K
lockFF 
(FF 
	sync_rootFF 
)FF 
{GG 
varHH 
policyHH 
=HH 
RetryPolicyHH (
.HH( )
HandleHH) /
<HH/ 0
SocketExceptionHH0 ?
>HH? @
(HH@ A
)HHA B
.II 
OrII 
<II &
BrokerUnreachableExceptionII 2
>II2 3
(II3 4
)II4 5
.JJ 
WaitAndRetryJJ !
(JJ! "
_retryCountJJ" -
,JJ- .
retryAttemptJJ/ ;
=>JJ< >
TimeSpanJJ? G
.JJG H
FromSecondsJJH S
(JJS T
MathJJT X
.JJX Y
PowJJY \
(JJ\ ]
$numJJ] ^
,JJ^ _
retryAttemptJJ` l
)JJl m
)JJm n
,JJn o
(JJp q
exJJq s
,JJs t
timeJJu y
)JJy z
=>JJ{ }
{KK 
_loggerLL 
.LL  

LogWarningLL  *
(LL* +
exLL+ -
,LL- .
$strLL/ x
,LLx y
$"LLz |
{LL| }
time	LL} Å
.
LLÅ Ç
TotalSeconds
LLÇ é
:
LLé è
n1
LLè ë
}
LLë í
"
LLí ì
,
LLì î
ex
LLï ó
.
LLó ò
Message
LLò ü
)
LLü †
;
LL† °
}MM 
)NN 
;NN 
policyPP 
.PP 
ExecutePP 
(PP 
(PP  
)PP  !
=>PP" $
{QQ 
_connectionRR 
=RR  !
_connectionFactoryRR" 4
.SS 
CreateConnectionSS +
(SS+ ,
)SS, -
;SS- .
}TT 
)TT 
;TT 
ifVV 
(VV 
IsConnectedVV 
)VV  
{WW 
_connectionXX 
.XX  
ConnectionShutdownXX  2
+=XX3 5 
OnConnectionShutdownXX6 J
;XXJ K
_connectionYY 
.YY  
CallbackExceptionYY  1
+=YY2 4
OnCallbackExceptionYY5 H
;YYH I
_connectionZZ 
.ZZ  
ConnectionBlockedZZ  1
+=ZZ2 4
OnConnectionBlockedZZ5 H
;ZZH I
_logger\\ 
.\\ 
LogInformation\\ *
(\\* +
$str	\\+ ë
,
\\ë í
_connection
\\ì û
.
\\û ü
Endpoint
\\ü ß
.
\\ß ®
HostName
\\® ∞
)
\\∞ ±
;
\\± ≤
return^^ 
true^^ 
;^^  
}__ 
else`` 
{aa 
_loggerbb 
.bb 
LogCriticalbb '
(bb' (
$strbb( k
)bbk l
;bbl m
returndd 
falsedd  
;dd  !
}ee 
}ff 
}gg 	
privateii 
voidii 
OnConnectionBlockedii (
(ii( )
objectii) /
senderii0 6
,ii6 7&
ConnectionBlockedEventArgsii8 R
eiiS T
)iiT U
{jj 	
ifkk 
(kk 
	_disposedkk 
)kk 
returnkk !
;kk! "
_loggermm 
.mm 

LogWarningmm 
(mm 
$strmm [
)mm[ \
;mm\ ]

TryConnectoo 
(oo 
)oo 
;oo 
}pp 	
voidrr 
OnCallbackExceptionrr  
(rr  !
objectrr! '
senderrr( .
,rr. /&
CallbackExceptionEventArgsrr0 J
errK L
)rrL M
{ss 	
iftt 
(tt 
	_disposedtt 
)tt 
returntt !
;tt! "
_loggervv 
.vv 

LogWarningvv 
(vv 
$strvv _
)vv_ `
;vv` a

TryConnectxx 
(xx 
)xx 
;xx 
}yy 	
void{{  
OnConnectionShutdown{{ !
({{! "
object{{" (
sender{{) /
,{{/ 0
ShutdownEventArgs{{1 B
reason{{C I
){{I J
{|| 	
if}} 
(}} 
	_disposed}} 
)}} 
return}} !
;}}! "
_logger 
. 

LogWarning 
( 
$str ^
)^ _
;_ `

TryConnect
ÅÅ 
(
ÅÅ 
)
ÅÅ 
;
ÅÅ 
}
ÇÇ 	
}
ÉÉ 
}ÑÑ ˛∆
pC:\DEV\MAGVA\TransacoesFinanceiras\src\GlobalBase\EventBus\MAGVA.GlobalBase.EventBusRabbitMQ\EventBusRabbitMQ.cs
	namespace 	
MAGVA
 
. 

GlobalBase 
. 
EventBusRabbitMQ +
{ 
public 

class 
EventBusRabbitMQ !
:" #
	IEventBus$ -
,- .
IDisposable/ :
{ 
const 
string 
BROKER_NAME  
=! "
$str# 4
;4 5
private 
readonly )
IRabbitMQPersistentConnection 6!
_persistentConnection7 L
;L M
private 
readonly 
ILogger  
<  !
EventBusRabbitMQ! 1
>1 2
_logger3 :
;: ;
private 
readonly )
IEventBusSubscriptionsManager 6
_subsManager7 C
;C D
private 
readonly 
ILifetimeScope '
_autofac( 0
;0 1
private 
readonly 
string 
AUTOFAC_SCOPE_NAME  2
=3 4
$str5 I
;I J
private 
readonly 
int 
_retryCount (
;( )
private!! 
IModel!! 
_consumerChannel!! '
;!!' (
private"" 
string"" 

_queueName"" !
;""! "
public$$ 
EventBusRabbitMQ$$ 
($$  )
IRabbitMQPersistentConnection$$  = 
persistentConnection$$> R
,$$R S
ILogger$$T [
<$$[ \
EventBusRabbitMQ$$\ l
>$$l m
logger$$n t
,$$t u
ILifetimeScope%% 
autofac%% "
,%%" #)
IEventBusSubscriptionsManager%%$ A
subsManager%%B M
,%%M N
string%%O U
	queueName%%V _
=%%` a
null%%b f
,%%f g
int%%h k

retryCount%%l v
=%%w x
$num%%y z
)%%z {
{&& 	!
_persistentConnection'' !
=''" # 
persistentConnection''$ 8
??''9 ;
throw''< A
new''B E!
ArgumentNullException''F [
(''[ \
nameof''\ b
(''b c 
persistentConnection''c w
)''w x
)''x y
;''y z
_logger(( 
=(( 
logger(( 
??(( 
throw((  %
new((& )!
ArgumentNullException((* ?
(((? @
nameof((@ F
(((F G
logger((G M
)((M N
)((N O
;((O P
_subsManager)) 
=)) 
subsManager)) &
??))' )
new))* -0
$InMemoryEventBusSubscriptionsManager)). R
())R S
)))S T
;))T U

_queueName** 
=** 
	queueName** "
;**" #
_consumerChannel++ 
=++ !
CreateConsumerChannel++ 4
(++4 5
)++5 6
;++6 7
_autofac,, 
=,, 
autofac,, 
;,, 
_retryCount-- 
=-- 

retryCount-- $
;--$ %
_subsManager.. 
... 
OnEventRemoved.. '
+=..( *&
SubsManager_OnEventRemoved..+ E
;..E F
}// 	
private11 
void11 &
SubsManager_OnEventRemoved11 /
(11/ 0
object110 6
sender117 =
,11= >
string11? E
	eventName11F O
)11O P
{22 	
if33 
(33 
!33 !
_persistentConnection33 &
.33& '
IsConnected33' 2
)332 3
{44 !
_persistentConnection55 %
.55% &

TryConnect55& 0
(550 1
)551 2
;552 3
}66 
using88 
(88 
var88 
channel88 
=88  !
_persistentConnection88! 6
.886 7
CreateModel887 B
(88B C
)88C D
)88D E
{99 
channel:: 
.:: 
QueueUnbind:: #
(::# $
queue::$ )
:::) *

_queueName::+ 5
,::5 6
exchange;; 
:;; 
BROKER_NAME;; )
,;;) *

routingKey<< 
:<< 
	eventName<<  )
)<<) *
;<<* +
if>> 
(>> 
_subsManager>>  
.>>  !
IsEmpty>>! (
)>>( )
{?? 

_queueName@@ 
=@@  
string@@! '
.@@' (
Empty@@( -
;@@- .
_consumerChannelAA $
.AA$ %
CloseAA% *
(AA* +
)AA+ ,
;AA, -
}BB 
}CC 
}DD 	
publicFF 
voidFF 
PublishFF 
(FF 
IntegrationEventFF ,
@eventFF- 3
)FF3 4
{GG 	
ifHH 
(HH 
!HH !
_persistentConnectionHH &
.HH& '
IsConnectedHH' 2
)HH2 3
{II !
_persistentConnectionJJ %
.JJ% &

TryConnectJJ& 0
(JJ0 1
)JJ1 2
;JJ2 3
}KK 
varMM 
policyMM 
=MM 
RetryPolicyMM $
.MM$ %
HandleMM% +
<MM+ ,&
BrokerUnreachableExceptionMM, F
>MMF G
(MMG H
)MMH I
.NN 
OrNN 
<NN 
SocketExceptionNN #
>NN# $
(NN$ %
)NN% &
.OO 
WaitAndRetryOO 
(OO 
_retryCountOO )
,OO) *
retryAttemptOO+ 7
=>OO8 :
TimeSpanOO; C
.OOC D
FromSecondsOOD O
(OOO P
MathOOP T
.OOT U
PowOOU X
(OOX Y
$numOOY Z
,OOZ [
retryAttemptOO\ h
)OOh i
)OOi j
,OOj k
(OOl m
exOOm o
,OOo p
timeOOq u
)OOu v
=>OOw y
{PP 
_loggerQQ 
.QQ 

LogWarningQQ &
(QQ& '
exQQ' )
,QQ) *
$strQQ+ u
,QQu v
@eventQQw }
.QQ} ~
Id	QQ~ Ä
,
QQÄ Å
$"
QQÇ Ñ
{
QQÑ Ö
time
QQÖ â
.
QQâ ä
TotalSeconds
QQä ñ
:
QQñ ó
n1
QQó ô
}
QQô ö
"
QQö õ
,
QQõ ú
ex
QQù ü
.
QQü †
Message
QQ† ß
)
QQß ®
;
QQ® ©
}RR 
)RR 
;RR 
varTT 
	eventNameTT 
=TT 
@eventTT "
.TT" #
GetTypeTT# *
(TT* +
)TT+ ,
.TT, -
NameTT- 1
;TT1 2
_loggerVV 
.VV 
LogTraceVV 
(VV 
$strVV b
,VVb c
@eventVVd j
.VVj k
IdVVk m
,VVm n
	eventNameVVo x
)VVx y
;VVy z
usingXX 
(XX 
varXX 
channelXX 
=XX  !
_persistentConnectionXX! 6
.XX6 7
CreateModelXX7 B
(XXB C
)XXC D
)XXD E
{YY 
_logger[[ 
.[[ 
LogTrace[[  
([[  !
$str[[! Z
,[[Z [
@event[[\ b
.[[b c
Id[[c e
)[[e f
;[[f g
channel]] 
.]] 
ExchangeDeclare]] '
(]]' (
exchange]]( 0
:]]0 1
BROKER_NAME]]2 =
,]]= >
type]]? C
:]]C D
$str]]E M
)]]M N
;]]N O
var__ 
message__ 
=__ 
JsonConvert__ )
.__) *
SerializeObject__* 9
(__9 :
@event__: @
)__@ A
;__A B
var`` 
body`` 
=`` 
Encoding`` #
.``# $
UTF8``$ (
.``( )
GetBytes``) 1
(``1 2
message``2 9
)``9 :
;``: ;
policybb 
.bb 
Executebb 
(bb 
(bb  
)bb  !
=>bb" $
{cc 
vardd 

propertiesdd "
=dd# $
channeldd% ,
.dd, -!
CreateBasicPropertiesdd- B
(ddB C
)ddC D
;ddD E

propertiesee 
.ee 
DeliveryModeee +
=ee, -
$numee. /
;ee/ 0
_loggergg 
.gg 
LogTracegg $
(gg$ %
$strgg% N
,ggN O
@eventggP V
.ggV W
IdggW Y
)ggY Z
;ggZ [
channelii 
.ii 
BasicPublishii (
(ii( )
exchangejj  
:jj  !
BROKER_NAMEjj" -
,jj- .

routingKeykk "
:kk" #
	eventNamekk$ -
,kk- .
	mandatoryll !
:ll! "
truell# '
,ll' (
basicPropertiesmm '
:mm' (

propertiesmm) 3
,mm3 4
bodynn 
:nn 
bodynn "
)nn" #
;nn# $
}oo 
)oo 
;oo 
}pp 
}qq 	
publicss 
voidss 
SubscribeDynamicss $
<ss$ %
THss% '
>ss' (
(ss( )
stringss) /
	eventNamess0 9
)ss9 :
wherett 
THtt 
:tt +
IDynamicIntegrationEventHandlertt 6
{uu 	
_loggervv 
.vv 
LogInformationvv "
(vv" #
$strvv# a
,vva b
	eventNamevvc l
,vvl m
typeofvvn t
(vvt u
THvvu w
)vvw x
.vvx y
GetGenericTypeName	vvy ã
(
vvã å
)
vvå ç
)
vvç é
;
vvé è"
DoInternalSubscriptionxx "
(xx" #
	eventNamexx# ,
)xx, -
;xx- .
_subsManageryy 
.yy "
AddDynamicSubscriptionyy /
<yy/ 0
THyy0 2
>yy2 3
(yy3 4
	eventNameyy4 =
)yy= >
;yy> ?
StartBasicConsumezz 
(zz 
)zz 
;zz  
}{{ 	
public}} 
void}} 
	Subscribe}} 
<}} 
T}} 
,}}  
TH}}! #
>}}# $
(}}$ %
)}}% &
where~~ 
T~~ 
:~~ 
IntegrationEvent~~ &
where 
TH 
: $
IIntegrationEventHandler /
</ 0
T0 1
>1 2
{
ÄÄ 	
var
ÅÅ 
	eventName
ÅÅ 
=
ÅÅ 
_subsManager
ÅÅ (
.
ÅÅ( )
GetEventKey
ÅÅ) 4
<
ÅÅ4 5
T
ÅÅ5 6
>
ÅÅ6 7
(
ÅÅ7 8
)
ÅÅ8 9
;
ÅÅ9 :$
DoInternalSubscription
ÇÇ "
(
ÇÇ" #
	eventName
ÇÇ# ,
)
ÇÇ, -
;
ÇÇ- .
_logger
ÑÑ 
.
ÑÑ 
LogInformation
ÑÑ "
(
ÑÑ" #
$str
ÑÑ# Y
,
ÑÑY Z
	eventName
ÑÑ[ d
,
ÑÑd e
typeof
ÑÑf l
(
ÑÑl m
TH
ÑÑm o
)
ÑÑo p
.
ÑÑp q!
GetGenericTypeNameÑÑq É
(ÑÑÉ Ñ
)ÑÑÑ Ö
)ÑÑÖ Ü
;ÑÑÜ á
_subsManager
ÜÜ 
.
ÜÜ 
AddSubscription
ÜÜ (
<
ÜÜ( )
T
ÜÜ) *
,
ÜÜ* +
TH
ÜÜ, .
>
ÜÜ. /
(
ÜÜ/ 0
)
ÜÜ0 1
;
ÜÜ1 2
StartBasicConsume
áá 
(
áá 
)
áá 
;
áá  
}
àà 	
private
ää 
void
ää $
DoInternalSubscription
ää +
(
ää+ ,
string
ää, 2
	eventName
ää3 <
)
ää< =
{
ãã 	
var
åå 
containsKey
åå 
=
åå 
_subsManager
åå *
.
åå* +&
HasSubscriptionsForEvent
åå+ C
(
ååC D
	eventName
ååD M
)
ååM N
;
ååN O
if
çç 
(
çç 
!
çç 
containsKey
çç 
)
çç 
{
éé 
if
èè 
(
èè 
!
èè #
_persistentConnection
èè *
.
èè* +
IsConnected
èè+ 6
)
èè6 7
{
êê #
_persistentConnection
ëë )
.
ëë) *

TryConnect
ëë* 4
(
ëë4 5
)
ëë5 6
;
ëë6 7
}
íí 
using
îî 
(
îî 
var
îî 
channel
îî "
=
îî# $#
_persistentConnection
îî% :
.
îî: ;
CreateModel
îî; F
(
îîF G
)
îîG H
)
îîH I
{
ïï 
channel
ññ 
.
ññ 
	QueueBind
ññ %
(
ññ% &
queue
ññ& +
:
ññ+ ,

_queueName
ññ- 7
,
ññ7 8
exchange
óó& .
:
óó. /
BROKER_NAME
óó0 ;
,
óó; <

routingKey
òò& 0
:
òò0 1
	eventName
òò2 ;
)
òò; <
;
òò< =
}
ôô 
}
öö 
}
õõ 	
public
ùù 
void
ùù 
Unsubscribe
ùù 
<
ùù  
T
ùù  !
,
ùù! "
TH
ùù# %
>
ùù% &
(
ùù& '
)
ùù' (
where
ûû 
T
ûû 
:
ûû 
IntegrationEvent
ûû &
where
üü 
TH
üü 
:
üü &
IIntegrationEventHandler
üü /
<
üü/ 0
T
üü0 1
>
üü1 2
{
†† 	
var
°° 
	eventName
°° 
=
°° 
_subsManager
°° (
.
°°( )
GetEventKey
°°) 4
<
°°4 5
T
°°5 6
>
°°6 7
(
°°7 8
)
°°8 9
;
°°9 :
_logger
££ 
.
££ 
LogInformation
££ "
(
££" #
$str
££# I
,
££I J
	eventName
££K T
)
££T U
;
££U V
_subsManager
•• 
.
••  
RemoveSubscription
•• +
<
••+ ,
T
••, -
,
••- .
TH
••/ 1
>
••1 2
(
••2 3
)
••3 4
;
••4 5
}
¶¶ 	
public
®® 
void
®®  
UnsubscribeDynamic
®® &
<
®®& '
TH
®®' )
>
®®) *
(
®®* +
string
®®+ 1
	eventName
®®2 ;
)
®®; <
where
©© 
TH
©© 
:
©© -
IDynamicIntegrationEventHandler
©© 6
{
™™ 	
_subsManager
´´ 
.
´´ '
RemoveDynamicSubscription
´´ 2
<
´´2 3
TH
´´3 5
>
´´5 6
(
´´6 7
	eventName
´´7 @
)
´´@ A
;
´´A B
}
¨¨ 	
public
ÆÆ 
void
ÆÆ 
Dispose
ÆÆ 
(
ÆÆ 
)
ÆÆ 
{
ØØ 	
if
∞∞ 
(
∞∞ 
_consumerChannel
∞∞  
!=
∞∞! #
null
∞∞$ (
)
∞∞( )
{
±± 
_consumerChannel
≤≤  
.
≤≤  !
Dispose
≤≤! (
(
≤≤( )
)
≤≤) *
;
≤≤* +
}
≥≥ 
_subsManager
µµ 
.
µµ 
Clear
µµ 
(
µµ 
)
µµ  
;
µµ  !
}
∂∂ 	
private
∏∏ 
void
∏∏ 
StartBasicConsume
∏∏ &
(
∏∏& '
)
∏∏' (
{
ππ 	
_logger
∫∫ 
.
∫∫ 
LogTrace
∫∫ 
(
∫∫ 
$str
∫∫ >
)
∫∫> ?
;
∫∫? @
if
ºº 
(
ºº 
_consumerChannel
ºº  
!=
ºº! #
null
ºº$ (
)
ºº( )
{
ΩΩ 
var
ææ 
consumer
ææ 
=
ææ 
new
ææ "(
AsyncEventingBasicConsumer
ææ# =
(
ææ= >
_consumerChannel
ææ> N
)
ææN O
;
ææO P
consumer
¿¿ 
.
¿¿ 
Received
¿¿ !
+=
¿¿" $
Consumer_Received
¿¿% 6
;
¿¿6 7
_consumerChannel
¬¬  
.
¬¬  !
BasicConsume
¬¬! -
(
¬¬- .
queue
√√ 
:
√√ 

_queueName
√√ %
,
√√% &
autoAck
ƒƒ 
:
ƒƒ 
false
ƒƒ "
,
ƒƒ" #
consumer
≈≈ 
:
≈≈ 
consumer
≈≈ &
)
≈≈& '
;
≈≈' (
}
∆∆ 
else
«« 
{
»» 
_logger
…… 
.
…… 
LogError
……  
(
……  !
$str
……! [
)
……[ \
;
……\ ]
}
   
}
ÀÀ 	
private
ÕÕ 
async
ÕÕ 
Task
ÕÕ 
Consumer_Received
ÕÕ ,
(
ÕÕ, -
object
ÕÕ- 3
sender
ÕÕ4 :
,
ÕÕ: ;#
BasicDeliverEventArgs
ÕÕ< Q
	eventArgs
ÕÕR [
)
ÕÕ[ \
{
ŒŒ 	
var
œœ 
	eventName
œœ 
=
œœ 
	eventArgs
œœ %
.
œœ% &

RoutingKey
œœ& 0
;
œœ0 1
var
–– 
message
–– 
=
–– 
Encoding
–– "
.
––" #
UTF8
––# '
.
––' (
	GetString
––( 1
(
––1 2
	eventArgs
––2 ;
.
––; <
Body
––< @
)
––@ A
;
––A B
try
““ 
{
”” 
if
‘‘ 
(
‘‘ 
message
‘‘ 
.
‘‘ 
ToLowerInvariant
‘‘ ,
(
‘‘, -
)
‘‘- .
.
‘‘. /
Contains
‘‘/ 7
(
‘‘7 8
$str
‘‘8 N
)
‘‘N O
)
‘‘O P
{
’’ 
throw
÷÷ 
new
÷÷ '
InvalidOperationException
÷÷ 7
(
÷÷7 8
$"
÷÷8 :*
Fake exception requested: \"
÷÷: V
{
÷÷V W
message
÷÷W ^
}
÷÷^ _
\"
÷÷_ a
"
÷÷a b
)
÷÷b c
;
÷÷c d
}
◊◊ 
await
ŸŸ 
ProcessEvent
ŸŸ "
(
ŸŸ" #
	eventName
ŸŸ# ,
,
ŸŸ, -
message
ŸŸ. 5
)
ŸŸ5 6
;
ŸŸ6 7
}
⁄⁄ 
catch
€€ 
(
€€ 
	Exception
€€ 
ex
€€ 
)
€€  
{
‹‹ 
_logger
›› 
.
›› 

LogWarning
›› "
(
››" #
ex
››# %
,
››% &
$str
››' U
,
››U V
message
››W ^
)
››^ _
;
››_ `
}
ﬁﬁ 
_consumerChannel
‡‡ 
.
‡‡ 
BasicAck
‡‡ %
(
‡‡% &
	eventArgs
‡‡& /
.
‡‡/ 0
DeliveryTag
‡‡0 ;
,
‡‡; <
multiple
‡‡= E
:
‡‡E F
false
‡‡G L
)
‡‡L M
;
‡‡M N
}
·· 	
private
„„ 
IModel
„„ #
CreateConsumerChannel
„„ ,
(
„„, -
)
„„- .
{
‰‰ 	
if
ÂÂ 
(
ÂÂ 
!
ÂÂ #
_persistentConnection
ÂÂ &
.
ÂÂ& '
IsConnected
ÂÂ' 2
)
ÂÂ2 3
{
ÊÊ #
_persistentConnection
ÁÁ %
.
ÁÁ% &

TryConnect
ÁÁ& 0
(
ÁÁ0 1
)
ÁÁ1 2
;
ÁÁ2 3
}
ËË 
_logger
ÍÍ 
.
ÍÍ 
LogTrace
ÍÍ 
(
ÍÍ 
$str
ÍÍ A
)
ÍÍA B
;
ÍÍB C
var
ÏÏ 
channel
ÏÏ 
=
ÏÏ #
_persistentConnection
ÏÏ /
.
ÏÏ/ 0
CreateModel
ÏÏ0 ;
(
ÏÏ; <
)
ÏÏ< =
;
ÏÏ= >
channel
ÓÓ 
.
ÓÓ 
ExchangeDeclare
ÓÓ #
(
ÓÓ# $
exchange
ÓÓ$ ,
:
ÓÓ, -
BROKER_NAME
ÓÓ. 9
,
ÓÓ9 :
type
ÔÔ$ (
:
ÔÔ( )
$str
ÔÔ* 2
)
ÔÔ2 3
;
ÔÔ3 4
channel
ÒÒ 
.
ÒÒ 
QueueDeclare
ÒÒ  
(
ÒÒ  !
queue
ÒÒ! &
:
ÒÒ& '

_queueName
ÒÒ( 2
,
ÒÒ2 3
durable
ÚÚ! (
:
ÚÚ( )
true
ÚÚ* .
,
ÚÚ. /
	exclusive
ÛÛ! *
:
ÛÛ* +
false
ÛÛ, 1
,
ÛÛ1 2

autoDelete
ÙÙ! +
:
ÙÙ+ ,
false
ÙÙ- 2
,
ÙÙ2 3
	arguments
ıı! *
:
ıı* +
null
ıı, 0
)
ıı0 1
;
ıı1 2
channel
˜˜ 
.
˜˜ 
CallbackException
˜˜ %
+=
˜˜& (
(
˜˜) *
sender
˜˜* 0
,
˜˜0 1
ea
˜˜2 4
)
˜˜4 5
=>
˜˜6 8
{
¯¯ 
_logger
˘˘ 
.
˘˘ 

LogWarning
˘˘ "
(
˘˘" #
ea
˘˘# %
.
˘˘% &
	Exception
˘˘& /
,
˘˘/ 0
$str
˘˘1 W
)
˘˘W X
;
˘˘X Y
_consumerChannel
˚˚  
.
˚˚  !
Dispose
˚˚! (
(
˚˚( )
)
˚˚) *
;
˚˚* +
_consumerChannel
¸¸  
=
¸¸! "#
CreateConsumerChannel
¸¸# 8
(
¸¸8 9
)
¸¸9 :
;
¸¸: ;
StartBasicConsume
˝˝ !
(
˝˝! "
)
˝˝" #
;
˝˝# $
}
˛˛ 
;
˛˛ 
return
ÄÄ 
channel
ÄÄ 
;
ÄÄ 
}
ÅÅ 	
private
ÉÉ 
async
ÉÉ 
Task
ÉÉ 
ProcessEvent
ÉÉ '
(
ÉÉ' (
string
ÉÉ( .
	eventName
ÉÉ/ 8
,
ÉÉ8 9
string
ÉÉ: @
message
ÉÉA H
)
ÉÉH I
{
ÑÑ 	
_logger
ÖÖ 
.
ÖÖ 
LogTrace
ÖÖ 
(
ÖÖ 
$str
ÖÖ E
,
ÖÖE F
	eventName
ÖÖG P
)
ÖÖP Q
;
ÖÖQ R
if
áá 
(
áá 
_subsManager
áá 
.
áá &
HasSubscriptionsForEvent
áá 5
(
áá5 6
	eventName
áá6 ?
)
áá? @
)
áá@ A
{
àà 
using
ââ 
(
ââ 
var
ââ 
scope
ââ  
=
ââ! "
_autofac
ââ# +
.
ââ+ , 
BeginLifetimeScope
ââ, >
(
ââ> ? 
AUTOFAC_SCOPE_NAME
ââ? Q
)
ââQ R
)
ââR S
{
ää 
var
ãã 
subscriptions
ãã %
=
ãã& '
_subsManager
ãã( 4
.
ãã4 5!
GetHandlersForEvent
ãã5 H
(
ããH I
	eventName
ããI R
)
ããR S
;
ããS T
foreach
åå 
(
åå 
var
åå  
subscription
åå! -
in
åå. 0
subscriptions
åå1 >
)
åå> ?
{
çç 
if
éé 
(
éé 
subscription
éé (
.
éé( )
	IsDynamic
éé) 2
)
éé2 3
{
èè 
var
êê 
handler
êê  '
=
êê( )
scope
êê* /
.
êê/ 0
ResolveOptional
êê0 ?
(
êê? @
subscription
êê@ L
.
êêL M
HandlerType
êêM X
)
êêX Y
as
êêZ \-
IDynamicIntegrationEventHandler
êê] |
;
êê| }
if
ëë 
(
ëë  
handler
ëë  '
==
ëë( *
null
ëë+ /
)
ëë/ 0
continue
ëë1 9
;
ëë9 :
dynamic
íí #
	eventData
íí$ -
=
íí. /
JObject
íí0 7
.
íí7 8
Parse
íí8 =
(
íí= >
message
íí> E
)
ííE F
;
ííF G
await
ìì !
handler
ìì" )
.
ìì) *
Handle
ìì* 0
(
ìì0 1
	eventData
ìì1 :
)
ìì: ;
;
ìì; <
}
îî 
else
ïï 
{
ññ 
var
óó 
handler
óó  '
=
óó( )
scope
óó* /
.
óó/ 0
ResolveOptional
óó0 ?
(
óó? @
subscription
óó@ L
.
óóL M
HandlerType
óóM X
)
óóX Y
;
óóY Z
if
òò 
(
òò  
handler
òò  '
==
òò( *
null
òò+ /
)
òò/ 0
continue
òò1 9
;
òò9 :
var
ôô 
	eventType
ôô  )
=
ôô* +
_subsManager
ôô, 8
.
ôô8 9 
GetEventTypeByName
ôô9 K
(
ôôK L
	eventName
ôôL U
)
ôôU V
;
ôôV W
var
öö 
integrationEvent
öö  0
=
öö1 2
JsonConvert
öö3 >
.
öö> ?
DeserializeObject
öö? P
(
ööP Q
message
ööQ X
,
ööX Y
	eventType
ööZ c
)
ööc d
;
ööd e
var
õõ 
concreteType
õõ  ,
=
õõ- .
typeof
õõ/ 5
(
õõ5 6&
IIntegrationEventHandler
õõ6 N
<
õõN O
>
õõO P
)
õõP Q
.
õõQ R
MakeGenericType
õõR a
(
õõa b
	eventType
õõb k
)
õõk l
;
õõl m
await
úú !
(
úú" #
Task
úú# '
)
úú' (
concreteType
úú( 4
.
úú4 5
	GetMethod
úú5 >
(
úú> ?
$str
úú? G
)
úúG H
.
úúH I
Invoke
úúI O
(
úúO P
handler
úúP W
,
úúW X
new
úúY \
object
úú] c
[
úúc d
]
úúd e
{
úúf g
integrationEvent
úúh x
}
úúy z
)
úúz {
;
úú{ |
}
ùù 
}
ûû 
}
üü 
}
†† 
else
°° 
{
¢¢ 
_logger
££ 
.
££ 

LogWarning
££ "
(
££" #
$str
££# T
,
££T U
	eventName
££V _
)
££_ `
;
££` a
}
§§ 
}
•• 	
}
¶¶ 
}ßß À
}C:\DEV\MAGVA\TransacoesFinanceiras\src\GlobalBase\EventBus\MAGVA.GlobalBase.EventBusRabbitMQ\IRabbitMQPersistentConnection.cs
	namespace 	
MAGVA
 
. 

GlobalBase 
. 
EventBusRabbitMQ +
{ 
public 

	interface )
IRabbitMQPersistentConnection 2
: 	
IDisposable
 
{		 
bool

 
IsConnected

 
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
  !
bool 

TryConnect 
( 
) 
; 
IModel 
CreateModel 
( 
) 
; 
} 
} 