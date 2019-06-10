�A
�C:\DEV\MAGVA\TransacoesFinanceiras\src\GlobalBase\EventBus\MAGVA.GlobalBase.EventBusRabbitMQ\DefaultRabbitMQPersistentConnection.cs
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
#DefaultRabbitMQPersistentConnection	a �
>
� �
logger
� �
,
� �
int
� �

retryCount
� �
=
� �
$num
� �
)
� �
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
time	LL} �
.
LL� �
TotalSeconds
LL� �
:
LL� �
n1
LL� �
}
LL� �
"
LL� �
,
LL� �
ex
LL� �
.
LL� �
Message
LL� �
)
LL� �
;
LL� �
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
$str	\\+ �
,
\\� �
_connection
\\� �
.
\\� �
Endpoint
\\� �
.
\\� �
HostName
\\� �
)
\\� �
;
\\� �
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
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
}
�� 
}�� ��
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
Id	QQ~ �
,
QQ� �
$"
QQ� �
{
QQ� �
time
QQ� �
.
QQ� �
TotalSeconds
QQ� �
:
QQ� �
n1
QQ� �
}
QQ� �
"
QQ� �
,
QQ� �
ex
QQ� �
.
QQ� �
Message
QQ� �
)
QQ� �
;
QQ� �
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
GetGenericTypeName	vvy �
(
vv� �
)
vv� �
)
vv� �
;
vv� �"
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
�� 	
var
�� 
	eventName
�� 
=
�� 
_subsManager
�� (
.
��( )
GetEventKey
��) 4
<
��4 5
T
��5 6
>
��6 7
(
��7 8
)
��8 9
;
��9 :$
DoInternalSubscription
�� "
(
��" #
	eventName
��# ,
)
��, -
;
��- .
_logger
�� 
.
�� 
LogInformation
�� "
(
��" #
$str
��# Y
,
��Y Z
	eventName
��[ d
,
��d e
typeof
��f l
(
��l m
TH
��m o
)
��o p
.
��p q!
GetGenericTypeName��q �
(��� �
)��� �
)��� �
;��� �
_subsManager
�� 
.
�� 
AddSubscription
�� (
<
��( )
T
��) *
,
��* +
TH
��, .
>
��. /
(
��/ 0
)
��0 1
;
��1 2
StartBasicConsume
�� 
(
�� 
)
�� 
;
��  
}
�� 	
private
�� 
void
�� $
DoInternalSubscription
�� +
(
��+ ,
string
��, 2
	eventName
��3 <
)
��< =
{
�� 	
var
�� 
containsKey
�� 
=
�� 
_subsManager
�� *
.
��* +&
HasSubscriptionsForEvent
��+ C
(
��C D
	eventName
��D M
)
��M N
;
��N O
if
�� 
(
�� 
!
�� 
containsKey
�� 
)
�� 
{
�� 
if
�� 
(
�� 
!
�� #
_persistentConnection
�� *
.
��* +
IsConnected
��+ 6
)
��6 7
{
�� #
_persistentConnection
�� )
.
��) *

TryConnect
��* 4
(
��4 5
)
��5 6
;
��6 7
}
�� 
using
�� 
(
�� 
var
�� 
channel
�� "
=
��# $#
_persistentConnection
��% :
.
��: ;
CreateModel
��; F
(
��F G
)
��G H
)
��H I
{
�� 
channel
�� 
.
�� 
	QueueBind
�� %
(
��% &
queue
��& +
:
��+ ,

_queueName
��- 7
,
��7 8
exchange
��& .
:
��. /
BROKER_NAME
��0 ;
,
��; <

routingKey
��& 0
:
��0 1
	eventName
��2 ;
)
��; <
;
��< =
}
�� 
}
�� 
}
�� 	
public
�� 
void
�� 
Unsubscribe
�� 
<
��  
T
��  !
,
��! "
TH
��# %
>
��% &
(
��& '
)
��' (
where
�� 
T
�� 
:
�� 
IntegrationEvent
�� &
where
�� 
TH
�� 
:
�� &
IIntegrationEventHandler
�� /
<
��/ 0
T
��0 1
>
��1 2
{
�� 	
var
�� 
	eventName
�� 
=
�� 
_subsManager
�� (
.
��( )
GetEventKey
��) 4
<
��4 5
T
��5 6
>
��6 7
(
��7 8
)
��8 9
;
��9 :
_logger
�� 
.
�� 
LogInformation
�� "
(
��" #
$str
��# I
,
��I J
	eventName
��K T
)
��T U
;
��U V
_subsManager
�� 
.
��  
RemoveSubscription
�� +
<
��+ ,
T
��, -
,
��- .
TH
��/ 1
>
��1 2
(
��2 3
)
��3 4
;
��4 5
}
�� 	
public
�� 
void
��  
UnsubscribeDynamic
�� &
<
��& '
TH
��' )
>
��) *
(
��* +
string
��+ 1
	eventName
��2 ;
)
��; <
where
�� 
TH
�� 
:
�� -
IDynamicIntegrationEventHandler
�� 6
{
�� 	
_subsManager
�� 
.
�� '
RemoveDynamicSubscription
�� 2
<
��2 3
TH
��3 5
>
��5 6
(
��6 7
	eventName
��7 @
)
��@ A
;
��A B
}
�� 	
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
�� 	
if
�� 
(
�� 
_consumerChannel
��  
!=
��! #
null
��$ (
)
��( )
{
�� 
_consumerChannel
��  
.
��  !
Dispose
��! (
(
��( )
)
��) *
;
��* +
}
�� 
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
�� 
StartBasicConsume
�� &
(
��& '
)
��' (
{
�� 	
_logger
�� 
.
�� 
LogTrace
�� 
(
�� 
$str
�� >
)
��> ?
;
��? @
if
�� 
(
�� 
_consumerChannel
��  
!=
��! #
null
��$ (
)
��( )
{
�� 
var
�� 
consumer
�� 
=
�� 
new
�� "(
AsyncEventingBasicConsumer
��# =
(
��= >
_consumerChannel
��> N
)
��N O
;
��O P
consumer
�� 
.
�� 
Received
�� !
+=
��" $
Consumer_Received
��% 6
;
��6 7
_consumerChannel
��  
.
��  !
BasicConsume
��! -
(
��- .
queue
�� 
:
�� 

_queueName
�� %
,
��% &
autoAck
�� 
:
�� 
false
�� "
,
��" #
consumer
�� 
:
�� 
consumer
�� &
)
��& '
;
��' (
}
�� 
else
�� 
{
�� 
_logger
�� 
.
�� 
LogError
��  
(
��  !
$str
��! [
)
��[ \
;
��\ ]
}
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
Consumer_Received
�� ,
(
��, -
object
��- 3
sender
��4 :
,
��: ;#
BasicDeliverEventArgs
��< Q
	eventArgs
��R [
)
��[ \
{
�� 	
var
�� 
	eventName
�� 
=
�� 
	eventArgs
�� %
.
��% &

RoutingKey
��& 0
;
��0 1
var
�� 
message
�� 
=
�� 
Encoding
�� "
.
��" #
UTF8
��# '
.
��' (
	GetString
��( 1
(
��1 2
	eventArgs
��2 ;
.
��; <
Body
��< @
)
��@ A
;
��A B
try
�� 
{
�� 
if
�� 
(
�� 
message
�� 
.
�� 
ToLowerInvariant
�� ,
(
��, -
)
��- .
.
��. /
Contains
��/ 7
(
��7 8
$str
��8 N
)
��N O
)
��O P
{
�� 
throw
�� 
new
�� '
InvalidOperationException
�� 7
(
��7 8
$"
��8 :*
Fake exception requested: \"
��: V
{
��V W
message
��W ^
}
��^ _
\"
��_ a
"
��a b
)
��b c
;
��c d
}
�� 
await
�� 
ProcessEvent
�� "
(
��" #
	eventName
��# ,
,
��, -
message
��. 5
)
��5 6
;
��6 7
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
_logger
�� 
.
�� 

LogWarning
�� "
(
��" #
ex
��# %
,
��% &
$str
��' U
,
��U V
message
��W ^
)
��^ _
;
��_ `
}
�� 
_consumerChannel
�� 
.
�� 
BasicAck
�� %
(
��% &
	eventArgs
��& /
.
��/ 0
DeliveryTag
��0 ;
,
��; <
multiple
��= E
:
��E F
false
��G L
)
��L M
;
��M N
}
�� 	
private
�� 
IModel
�� #
CreateConsumerChannel
�� ,
(
��, -
)
��- .
{
�� 	
if
�� 
(
�� 
!
�� #
_persistentConnection
�� &
.
��& '
IsConnected
��' 2
)
��2 3
{
�� #
_persistentConnection
�� %
.
��% &

TryConnect
��& 0
(
��0 1
)
��1 2
;
��2 3
}
�� 
_logger
�� 
.
�� 
LogTrace
�� 
(
�� 
$str
�� A
)
��A B
;
��B C
var
�� 
channel
�� 
=
�� #
_persistentConnection
�� /
.
��/ 0
CreateModel
��0 ;
(
��; <
)
��< =
;
��= >
channel
�� 
.
�� 
ExchangeDeclare
�� #
(
��# $
exchange
��$ ,
:
��, -
BROKER_NAME
��. 9
,
��9 :
type
��$ (
:
��( )
$str
��* 2
)
��2 3
;
��3 4
channel
�� 
.
�� 
QueueDeclare
��  
(
��  !
queue
��! &
:
��& '

_queueName
��( 2
,
��2 3
durable
��! (
:
��( )
true
��* .
,
��. /
	exclusive
��! *
:
��* +
false
��, 1
,
��1 2

autoDelete
��! +
:
��+ ,
false
��- 2
,
��2 3
	arguments
��! *
:
��* +
null
��, 0
)
��0 1
;
��1 2
channel
�� 
.
�� 
CallbackException
�� %
+=
��& (
(
��) *
sender
��* 0
,
��0 1
ea
��2 4
)
��4 5
=>
��6 8
{
�� 
_logger
�� 
.
�� 

LogWarning
�� "
(
��" #
ea
��# %
.
��% &
	Exception
��& /
,
��/ 0
$str
��1 W
)
��W X
;
��X Y
_consumerChannel
��  
.
��  !
Dispose
��! (
(
��( )
)
��) *
;
��* +
_consumerChannel
��  
=
��! "#
CreateConsumerChannel
��# 8
(
��8 9
)
��9 :
;
��: ;
StartBasicConsume
�� !
(
��! "
)
��" #
;
��# $
}
�� 
;
�� 
return
�� 
channel
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
ProcessEvent
�� '
(
��' (
string
��( .
	eventName
��/ 8
,
��8 9
string
��: @
message
��A H
)
��H I
{
�� 	
_logger
�� 
.
�� 
LogTrace
�� 
(
�� 
$str
�� E
,
��E F
	eventName
��G P
)
��P Q
;
��Q R
if
�� 
(
�� 
_subsManager
�� 
.
�� &
HasSubscriptionsForEvent
�� 5
(
��5 6
	eventName
��6 ?
)
��? @
)
��@ A
{
�� 
using
�� 
(
�� 
var
�� 
scope
��  
=
��! "
_autofac
��# +
.
��+ , 
BeginLifetimeScope
��, >
(
��> ? 
AUTOFAC_SCOPE_NAME
��? Q
)
��Q R
)
��R S
{
�� 
var
�� 
subscriptions
�� %
=
��& '
_subsManager
��( 4
.
��4 5!
GetHandlersForEvent
��5 H
(
��H I
	eventName
��I R
)
��R S
;
��S T
foreach
�� 
(
�� 
var
��  
subscription
��! -
in
��. 0
subscriptions
��1 >
)
��> ?
{
�� 
if
�� 
(
�� 
subscription
�� (
.
��( )
	IsDynamic
��) 2
)
��2 3
{
�� 
var
�� 
handler
��  '
=
��( )
scope
��* /
.
��/ 0
ResolveOptional
��0 ?
(
��? @
subscription
��@ L
.
��L M
HandlerType
��M X
)
��X Y
as
��Z \-
IDynamicIntegrationEventHandler
��] |
;
��| }
if
�� 
(
��  
handler
��  '
==
��( *
null
��+ /
)
��/ 0
continue
��1 9
;
��9 :
dynamic
�� #
	eventData
��$ -
=
��. /
JObject
��0 7
.
��7 8
Parse
��8 =
(
��= >
message
��> E
)
��E F
;
��F G
await
�� !
handler
��" )
.
��) *
Handle
��* 0
(
��0 1
	eventData
��1 :
)
��: ;
;
��; <
}
�� 
else
�� 
{
�� 
var
�� 
handler
��  '
=
��( )
scope
��* /
.
��/ 0
ResolveOptional
��0 ?
(
��? @
subscription
��@ L
.
��L M
HandlerType
��M X
)
��X Y
;
��Y Z
if
�� 
(
��  
handler
��  '
==
��( *
null
��+ /
)
��/ 0
continue
��1 9
;
��9 :
var
�� 
	eventType
��  )
=
��* +
_subsManager
��, 8
.
��8 9 
GetEventTypeByName
��9 K
(
��K L
	eventName
��L U
)
��U V
;
��V W
var
�� 
integrationEvent
��  0
=
��1 2
JsonConvert
��3 >
.
��> ?
DeserializeObject
��? P
(
��P Q
message
��Q X
,
��X Y
	eventType
��Z c
)
��c d
;
��d e
var
�� 
concreteType
��  ,
=
��- .
typeof
��/ 5
(
��5 6&
IIntegrationEventHandler
��6 N
<
��N O
>
��O P
)
��P Q
.
��Q R
MakeGenericType
��R a
(
��a b
	eventType
��b k
)
��k l
;
��l m
await
�� !
(
��" #
Task
��# '
)
��' (
concreteType
��( 4
.
��4 5
	GetMethod
��5 >
(
��> ?
$str
��? G
)
��G H
.
��H I
Invoke
��I O
(
��O P
handler
��P W
,
��W X
new
��Y \
object
��] c
[
��c d
]
��d e
{
��f g
integrationEvent
��h x
}
��y z
)
��z {
;
��{ |
}
�� 
}
�� 
}
�� 
}
�� 
else
�� 
{
�� 
_logger
�� 
.
�� 

LogWarning
�� "
(
��" #
$str
��# T
,
��T U
	eventName
��V _
)
��_ `
;
��` a
}
�� 
}
�� 	
}
�� 
}�� �
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