�
~C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Base\CustomExtensionMethods.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
AspNetIdentity  .
.. /
Base/ 3
{ 
public

 

static

 
class

 "
CustomExtensionMethods

 .
{ 
public 
static 
IServiceCollection (
AddHealthChecks) 8
(8 9
this9 =
IServiceCollection> P
servicesQ Y
,Y Z
IConfiguration[ i
configurationj w
)w x
{ 	
var 
	hcBuilder 
= 
services $
.$ %
AddHealthChecks% 4
(4 5
)5 6
;6 7
	hcBuilder 
. 
AddCheck 
( 
$str %
,% &
(' (
)( )
=>* ,
HealthCheckResult- >
.> ?
Healthy? F
(F G
)G H
)H I
;I J
	hcBuilder 
. 
AddSqlServer 
( 
configuration !
[! "
$str" 4
]4 5
,5 6
name 
: 
$str +
,+ ,
tags 
: 
new 
string $
[$ %
]% &
{' (
$str) ?
}@ A
)A B
;B C
return 
services 
; 
} 	
public 
static 
IServiceCollection ("
AddCustomConfiguration) ?
(? @
this@ D
IServiceCollectionE W
servicesX `
,` a
IConfigurationb p
configurationq ~
)~ 
{ 	
services 
. 

AddOptions 
(  
)  !
;! "
services 
. 
	Configure 
< 
ProgramSettings .
>. /
(/ 0
configuration0 =
)= >
;> ?
services   
.   
	Configure   
<   
ApiBehaviorOptions   1
>  1 2
(  2 3
options  3 :
=>  ; =
{!! 
options"" 
."" ,
 InvalidModelStateResponseFactory"" 8
=""9 :
context""; B
=>""C E
{## 
var$$ 
problemDetails$$ &
=$$' (
new$$) ,$
ValidationProblemDetails$$- E
($$E F
context$$F M
.$$M N

ModelState$$N X
)$$X Y
{%% 
Instance&&  
=&&! "
context&&# *
.&&* +
HttpContext&&+ 6
.&&6 7
Request&&7 >
.&&> ?
Path&&? C
,&&C D
Status'' 
=''  
StatusCodes''! ,
.'', -
Status400BadRequest''- @
,''@ A
Detail(( 
=((  
$str((! ^
})) 
;)) 
return++ 
new++ "
BadRequestObjectResult++ 5
(++5 6
problemDetails++6 D
)++D E
{,, 
ContentTypes-- $
=--% &
{--' (
$str--) C
,--C D
$str--E ^
}--_ `
}.. 
;.. 
}// 
;// 
}00 
)00 
;00 
return22 
services22 
;22 
}33 	
}55 
}66 �
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Infrastructure\AdminDbContextSeed.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
AspNetIdentity  .
.. /
Infrastructure/ =
{ 
public

 

class

 
AdminDbContextSeed

 #
{ 
public 
async 
Task 
	SeedAsync #
(# $
AdminDbContext$ 2
context3 :
,: ;
IHostingEnvironment< O
envP S
,S T
IOptionsU ]
<] ^
ProgramSettings^ m
>m n
settingso w
,w x
ILogger	y �
<
� � 
AdminDbContextSeed
� �
>
� �
logger
� �
)
� �
{ 	
await 
Task 
. 
Run 
( 
( 
) 
=>  
{! "
}# $
)$ %
;% &
} 	
} 
} �
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Infrastructure\Exceptions\FailingMiddlewareAppBuilderExtensions.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
AspNetIdentity  .
.. /
Infrastructure/ =
.= >
Middlewares> I
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
} �5
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Infrastructure\Middlewares\FailingMiddleware.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
AspNetIdentity  .
.. /
Infrastructure/ =
.= >
Middlewares> I
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
}UU �
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Infrastructure\Middlewares\FailingOptions.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
AspNetIdentity  .
.. /
Infrastructure/ =
.= >
Middlewares> I
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
} �
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Infrastructure\Middlewares\FailingStartupFilter.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
AspNetIdentity  .
.. /
Infrastructure/ =
.= >
Middlewares> I
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
} �

�C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Infrastructure\Middlewares\WebHostBuildertExtensions.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
AspNetIdentity  .
.. /
Infrastructure/ =
.= >
Middlewares> I
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
} �5
jC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Program.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
AspNetIdentity  .
{ 
public 

class 
Program 
{ 
public 
static 
readonly 
string %
	Namespace& /
=0 1
typeof2 8
(8 9
Program9 @
)@ A
.A B
	NamespaceB K
;K L
public 
static 
readonly 
string %
AppName& -
=. /
	Namespace0 9
.9 :
	Substring: C
(C D
	NamespaceD M
.M N
LastIndexOfN Y
(Y Z
$charZ ]
,] ^
	Namespace_ h
.h i
LastIndexOfi t
(t u
$charu x
)x y
-z {
$num| }
)} ~
+	 �
$num
� �
)
� �
;
� �
public 
static 
IWebHost 
host #
;# $
public 
static 
int 
Main 
( 
string %
[% &
]& '
args( ,
), -
{ 	
var 
configuration 
= 
GetConfiguration  0
(0 1
)1 2
;2 3
Serilog 
. 
ILogger 
log 
=  !
CreateSerilogLogger" 5
(5 6
configuration6 C
)C D
;D E
Log 
. 
Logger 
= 
log 
; 
try 
{ 
Log 
. 
Information 
(  
$str  P
,P Q
AppNameR Y
)Y Z
;Z [
host 
= 
BuildWebHost #
(# $
configuration$ 1
,1 2
log3 6
,6 7
args8 <
)< =
;= >
Log!! 
.!! 
Information!! 
(!!  
$str!!  M
,!!M N
AppName!!O V
)!!V W
;!!W X
host"" 
."" 
Run"" 
("" 
)"" 
;"" 
return$$ 
$num$$ 
;$$ 
}%% 
catch&& 
(&& 
	Exception&& 
ex&& 
)&&  
{'' 
Log(( 
.(( 
Fatal(( 
((( 
ex(( 
,(( 
$str(( W
,((W X
AppName((Y `
)((` a
;((a b
return)) 
$num)) 
;)) 
}** 
finally++ 
{,, 
Log-- 
.-- 
CloseAndFlush-- !
(--! "
)--" #
;--# $
}.. 
}// 	
private22 
static22 
IWebHost22 
BuildWebHost22  ,
(22, -
IConfiguration22- ;
configuration22< I
,22I J
Serilog22K R
.22R S
ILogger22S Z
logger22[ a
,22a b
string22c i
[22i j
]22j k
args22l p
)22p q
=>22r t
WebHost33 
.33  
CreateDefaultBuilder33 0
(330 1
args331 5
)335 6
.44  
CaptureStartupErrors44 -
(44- .
false44. 3
)443 4
.55 

UseFailing55 #
(55# $
options55$ +
=>55, .
options55/ 6
.556 7

ConfigPath557 A
=55B C
$str55D N
)55N O
.66 

UseStartup66 #
<66# $
Startup66$ +
>66+ ,
(66, -
)66- .
.77 
UseContentRoot77 '
(77' (
	Directory77( 1
.771 2
GetCurrentDirectory772 E
(77E F
)77F G
)77G H
.88 
UseConfiguration88 )
(88) *
configuration88* 7
)887 8
.99 

UseSerilog99 #
(99# $
logger99$ *
)99* +
.:: 
Build:: 
(:: 
)::  
;::  !
private<< 
static<< 
Serilog<< 
.<< 
ILogger<< &
CreateSerilogLogger<<' :
(<<: ;
IConfiguration<<; I
configuration<<J W
)<<W X
{== 	
var?? 
logstashUrl?? 
=?? 
configuration?? +
[??+ ,
$str??, B
]??B C
;??C D
return@@ 
new@@ 
LoggerConfiguration@@ *
(@@* +
)@@+ ,
.AA 
MinimumLevelAA 
.AA 
DebugAA #
(AA# $
)AA$ %
.BB 
EnrichBB 
.BB 
WithPropertyBB $
(BB$ %
$strBB% 9
,BB9 :
AppNameBB; B
)BBB C
.CC 
EnrichCC 
.CC 
FromLogContextCC &
(CC& '
)CC' (
.DD 
WriteToDD 
.DD 
ConsoleDD  
(DD  !
)DD! "
.FF 
WriteToFF 
.FF 
HttpFF 
(FF 
stringFF $
.FF$ %
IsNullOrWhiteSpaceFF% 7
(FF7 8
logstashUrlFF8 C
)FFC D
?FFE F
$strFFG b
:FFc d
logstashUrlFFe p
)FFp q
.GG 
ReadFromGG 
.GG 
ConfigurationGG '
(GG' (
configurationGG( 5
)GG5 6
.HH 
CreateLoggerHH 
(HH 
)HH 
;HH  
}II 	
privateKK 
staticKK 
IConfigurationKK %
GetConfigurationKK& 6
(KK6 7
)KK7 8
{LL 	
varMM 
builderMM 
=MM 
newMM  
ConfigurationBuilderMM 2
(MM2 3
)MM3 4
.NN 
SetBasePathNN 
(NN 
	DirectoryNN &
.NN& '
GetCurrentDirectoryNN' :
(NN: ;
)NN; <
)NN< =
.OO 
AddJsonFileOO 
(OO 
$strOO /
,OO/ 0
optionalOO1 9
:OO9 :
falseOO; @
,OO@ A
reloadOnChangeOOB P
:OOP Q
trueOOR V
)OOV W
.PP #
AddEnvironmentVariablesPP (
(PP( )
)PP) *
;PP* +
returnRR 
builderRR 
.RR 
BuildRR  
(RR  !
)RR! "
;RR" #
}SS 	
}TT 
}UU �
rC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\ProgramSettings.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
AspNetIdentity  .
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
} ��
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Account\AccountController.cs
	namespace 	
IdentityServer4
 
. 

Quickstart $
.$ %
UI% '
{ 
[ 
SecurityHeaders 
] 
public 

class 
AccountController "
:# $

Controller% /
{ 
private 
readonly 
UserManager $
<$ %
UserIdentity% 1
>1 2
_userManager3 ?
;? @
private 
readonly 
SignInManager &
<& '
UserIdentity' 3
>3 4
_signInManager5 C
;C D
private 
readonly -
!IIdentityServerInteractionService :
_interaction; G
;G H
private 
readonly 
IClientStore %
_clientStore& 2
;2 3
private   
readonly   )
IAuthenticationSchemeProvider   6
_schemeProvider  7 F
;  F G
private!! 
readonly!! 
IEventService!! &
_events!!' .
;!!. /
public## 
AccountController##  
(##  !
UserManager$$ 
<$$ 
UserIdentity$$ $
>$$$ %
userManager$$& 1
,$$1 2
SignInManager%% 
<%% 
UserIdentity%% &
>%%& '
signInManager%%( 5
,%%5 6-
!IIdentityServerInteractionService&& -
interaction&&. 9
,&&9 :
IClientStore'' 
clientStore'' $
,''$ %)
IAuthenticationSchemeProvider(( )
schemeProvider((* 8
,((8 9
IEventService)) 
events))  
)))  !
{** 	
_userManager++ 
=++ 
userManager++ &
;++& '
_signInManager,, 
=,, 
signInManager,, *
;,,* +
_interaction-- 
=-- 
interaction-- &
;--& '
_clientStore.. 
=.. 
clientStore.. &
;..& '
_schemeProvider// 
=// 
schemeProvider// ,
;//, -
_events00 
=00 
events00 
;00 
}11 	
[66 	
HttpGet66	 
]66 
public77 
async77 
Task77 
<77 
IActionResult77 '
>77' (
Login77) .
(77. /
string77/ 5
	returnUrl776 ?
)77? @
{88 	
var:: 
vm:: 
=:: 
await:: $
BuildLoginViewModelAsync:: 3
(::3 4
	returnUrl::4 =
)::= >
;::> ?
if<< 
(<< 
vm<< 
.<< 
IsExternalLoginOnly<< &
)<<& '
{== 
return?? 
await?? 
ExternalLogin?? *
(??* +
vm??+ -
.??- .
ExternalLoginScheme??. A
,??A B
	returnUrl??C L
)??L M
;??M N
}@@ 
returnBB 
ViewBB 
(BB 
vmBB 
)BB 
;BB 
}CC 	
[HH 	
HttpPostHH	 
]HH 
[II 	$
ValidateAntiForgeryTokenII	 !
]II! "
publicJJ 
asyncJJ 
TaskJJ 
<JJ 
IActionResultJJ '
>JJ' (
LoginJJ) .
(JJ. /
LoginInputModelJJ/ >
modelJJ? D
,JJD E
stringJJF L
buttonJJM S
)JJS T
{KK 	
ifLL 
(LL 
buttonLL 
!=LL 
$strLL !
)LL! "
{MM 
varOO 
contextOO 
=OO 
awaitOO #
_interactionOO$ 0
.OO0 1(
GetAuthorizationContextAsyncOO1 M
(OOM N
modelOON S
.OOS T
	ReturnUrlOOT ]
)OO] ^
;OO^ _
ifPP 
(PP 
contextPP 
!=PP 
nullPP #
)PP# $
{QQ 
awaitUU 
_interactionUU &
.UU& '
GrantConsentAsyncUU' 8
(UU8 9
contextUU9 @
,UU@ A
ConsentResponseUUB Q
.UUQ R
DeniedUUR X
)UUX Y
;UUY Z
returnXX 
RedirectXX #
(XX# $
modelXX$ )
.XX) *
	ReturnUrlXX* 3
)XX3 4
;XX4 5
}YY 
elseZZ 
{[[ 
return]] 
Redirect]] #
(]]# $
$str]]$ (
)]]( )
;]]) *
}^^ 
}__ 
ifaa 
(aa 

ModelStateaa 
.aa 
IsValidaa "
)aa" #
{bb 
varcc 
resultcc 
=cc 
awaitcc "
_signInManagercc# 1
.cc1 2
PasswordSignInAsynccc2 E
(ccE F
modelccF K
.ccK L
UsernameccL T
,ccT U
modelccV [
.cc[ \
Passwordcc\ d
,ccd e
modelccf k
.cck l
RememberLoginccl y
,ccy z
lockoutOnFailure	cc{ �
:
cc� �
true
cc� �
)
cc� �
;
cc� �
ifdd 
(dd 
resultdd 
.dd 
	Succeededdd $
)dd$ %
{ee 
varff 
userff 
=ff 
awaitff $
_userManagerff% 1
.ff1 2
FindByNameAsyncff2 A
(ffA B
modelffB G
.ffG H
UsernameffH P
)ffP Q
;ffQ R
awaitgg 
_eventsgg !
.gg! "

RaiseAsyncgg" ,
(gg, -
newgg- 0!
UserLoginSuccessEventgg1 F
(ggF G
userggG K
.ggK L
UserNameggL T
,ggT U
userggV Z
.ggZ [
Idgg[ ]
.gg] ^
ToStringgg^ f
(ggf g
)ggg h
,ggh i
userggj n
.ggn o
UserNameggo w
)ggw x
)ggx y
;ggy z
ifkk 
(kk 
_interactionkk $
.kk$ %
IsValidReturnUrlkk% 5
(kk5 6
modelkk6 ;
.kk; <
	ReturnUrlkk< E
)kkE F
||kkG I
UrlkkJ M
.kkM N

IsLocalUrlkkN X
(kkX Y
modelkkY ^
.kk^ _
	ReturnUrlkk_ h
)kkh i
)kki j
{ll 
returnmm 
Redirectmm '
(mm' (
modelmm( -
.mm- .
	ReturnUrlmm. 7
)mm7 8
;mm8 9
}nn 
returnpp 
Redirectpp #
(pp# $
$strpp$ (
)pp( )
;pp) *
}qq 
awaitss 
_eventsss 
.ss 

RaiseAsyncss (
(ss( )
newss) ,!
UserLoginFailureEventss- B
(ssB C
modelssC H
.ssH I
UsernamessI Q
,ssQ R
$strssS h
)ssh i
)ssi j
;ssj k

ModelStateuu 
.uu 
AddModelErroruu (
(uu( )
$struu) +
,uu+ ,
AccountOptionsuu- ;
.uu; <*
InvalidCredentialsErrorMessageuu< Z
)uuZ [
;uu[ \
}vv 
varyy 
vmyy 
=yy 
awaityy $
BuildLoginViewModelAsyncyy 3
(yy3 4
modelyy4 9
)yy9 :
;yy: ;
returnzz 
Viewzz 
(zz 
vmzz 
)zz 
;zz 
}{{ 	
[
�� 	
HttpGet
��	 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
ExternalLogin
��) 6
(
��6 7
string
��7 =
provider
��> F
,
��F G
string
��H N
	returnUrl
��O X
)
��X Y
{
�� 	
if
�� 
(
�� 
AccountOptions
�� 
.
�� -
WindowsAuthenticationSchemeName
�� >
==
��? A
provider
��B J
)
��J K
{
�� 
return
�� 
await
�� &
ProcessWindowsLoginAsync
�� 5
(
��5 6
	returnUrl
��6 ?
)
��? @
;
��@ A
}
�� 
else
�� 
{
�� 
var
�� 
props
�� 
=
�� 
new
�� &
AuthenticationProperties
��  8
(
��8 9
)
��9 :
{
�� 
RedirectUri
�� 
=
��  !
Url
��" %
.
��% &
Action
��& ,
(
��, -
$str
��- D
)
��D E
,
��E F
Items
�� 
=
�� 
{
�� 
{
�� 
$str
�� %
,
��% &
	returnUrl
��' 0
}
��1 2
,
��2 3
{
�� 
$str
�� "
,
��" #
provider
��$ ,
}
��- .
,
��. /
}
�� 
}
�� 
;
�� 
return
�� 
	Challenge
��  
(
��  !
props
��! &
,
��& '
provider
��( 0
)
��0 1
;
��1 2
}
�� 
}
�� 	
[
�� 	
HttpGet
��	 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (#
ExternalLoginCallback
��) >
(
��> ?
)
��? @
{
�� 	
var
�� 
result
�� 
=
�� 
await
�� 
HttpContext
�� *
.
��* +
AuthenticateAsync
��+ <
(
��< =
IdentityConstants
��= N
.
��N O
ExternalScheme
��O ]
)
��] ^
;
��^ _
if
�� 
(
�� 
result
�� 
?
�� 
.
�� 
	Succeeded
�� !
!=
��" $
true
��% )
)
��) *
{
�� 
throw
�� 
new
�� 
	Exception
�� #
(
��# $
$str
��$ C
)
��C D
;
��D E
}
�� 
var
�� 
(
�� 
user
�� 
,
�� 
provider
�� 
,
��  
providerUserId
��! /
,
��/ 0
claims
��1 7
)
��7 8
=
��9 :
await
��; @/
!FindUserFromExternalProviderAsync
��A b
(
��b c
result
��c i
)
��i j
;
��j k
if
�� 
(
�� 
user
�� 
==
�� 
null
�� 
)
�� 
{
�� 
user
�� 
=
�� 
await
�� $
AutoProvisionUserAsync
�� 3
(
��3 4
provider
��4 <
,
��< =
providerUserId
��> L
,
��L M
claims
��N T
)
��T U
;
��U V
}
�� 
var
�� #
additionalLocalClaims
�� %
=
��& '
new
��( +
List
��, 0
<
��0 1
Claim
��1 6
>
��6 7
(
��7 8
)
��8 9
;
��9 :
var
�� 
localSignInProps
��  
=
��! "
new
��# &&
AuthenticationProperties
��' ?
(
��? @
)
��@ A
;
��A B)
ProcessLoginCallbackForOidc
�� '
(
��' (
result
��( .
,
��. /#
additionalLocalClaims
��0 E
,
��E F
localSignInProps
��G W
)
��W X
;
��X Y*
ProcessLoginCallbackForWsFed
�� (
(
��( )
result
��) /
,
��/ 0#
additionalLocalClaims
��1 F
,
��F G
localSignInProps
��H X
)
��X Y
;
��Y Z+
ProcessLoginCallbackForSaml2p
�� )
(
��) *
result
��* 0
,
��0 1#
additionalLocalClaims
��2 G
,
��G H
localSignInProps
��I Y
)
��Y Z
;
��Z [
var
�� 
	principal
�� 
=
�� 
await
�� !
_signInManager
��" 0
.
��0 1&
CreateUserPrincipalAsync
��1 I
(
��I J
user
��J N
)
��N O
;
��O P#
additionalLocalClaims
�� !
.
��! "
AddRange
��" *
(
��* +
	principal
��+ 4
.
��4 5
Claims
��5 ;
)
��; <
;
��< =
var
�� 
name
�� 
=
�� 
	principal
��  
.
��  !
	FindFirst
��! *
(
��* +
JwtClaimTypes
��+ 8
.
��8 9
Name
��9 =
)
��= >
?
��> ?
.
��? @
Value
��@ E
??
��F H
user
��I M
.
��M N
Id
��N P
.
��P Q
ToString
��Q Y
(
��Y Z
)
��Z [
;
��[ \
await
�� 
_events
�� 
.
�� 

RaiseAsync
�� $
(
��$ %
new
��% (#
UserLoginSuccessEvent
��) >
(
��> ?
provider
��? G
,
��G H
providerUserId
��I W
,
��W X
user
��Y ]
.
��] ^
Id
��^ `
.
��` a
ToString
��a i
(
��i j
)
��j k
,
��k l
name
��m q
)
��q r
)
��r s
;
��s t
await
�� 
HttpContext
�� 
.
�� 
SignInAsync
�� )
(
��) *
user
��* .
.
��. /
Id
��/ 1
.
��1 2
ToString
��2 :
(
��: ;
)
��; <
,
��< =
name
��> B
,
��B C
provider
��D L
,
��L M
localSignInProps
��N ^
,
��^ _#
additionalLocalClaims
��` u
.
��u v
ToArray
��v }
(
��} ~
)
��~ 
)�� �
;��� �
await
�� 
HttpContext
�� 
.
�� 
SignOutAsync
�� *
(
��* +
IdentityConstants
��+ <
.
��< =
ExternalScheme
��= K
)
��K L
;
��L M
var
�� 
	returnUrl
�� 
=
�� 
result
�� "
.
��" #

Properties
��# -
.
��- .
Items
��. 3
[
��3 4
$str
��4 ?
]
��? @
;
��@ A
if
�� 
(
�� 
_interaction
�� 
.
�� 
IsValidReturnUrl
�� -
(
��- .
	returnUrl
��. 7
)
��7 8
||
��9 ;
Url
��< ?
.
��? @

IsLocalUrl
��@ J
(
��J K
	returnUrl
��K T
)
��T U
)
��U V
{
�� 
return
�� 
Redirect
�� 
(
��  
	returnUrl
��  )
)
��) *
;
��* +
}
�� 
return
�� 
Redirect
�� 
(
�� 
$str
��  
)
��  !
;
��! "
}
�� 	
[
�� 	
HttpGet
��	 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
Logout
��) /
(
��/ 0
string
��0 6
logoutId
��7 ?
)
��? @
{
�� 	
var
�� 
vm
�� 
=
�� 
await
�� '
BuildLogoutViewModelAsync
�� 4
(
��4 5
logoutId
��5 =
)
��= >
;
��> ?
if
�� 
(
�� 
vm
�� 
.
�� 
ShowLogoutPrompt
�� #
==
��$ &
false
��' ,
)
��, -
{
�� 
return
�� 
await
�� 
Logout
�� #
(
��# $
vm
��$ &
)
��& '
;
��' (
}
�� 
return
�� 
View
�� 
(
�� 
vm
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
Logout
��) /
(
��/ 0
LogoutInputModel
��0 @
model
��A F
)
��F G
{
�� 	
var
�� 
vm
�� 
=
�� 
await
�� *
BuildLoggedOutViewModelAsync
�� 7
(
��7 8
model
��8 =
.
��= >
LogoutId
��> F
)
��F G
;
��G H
if
�� 
(
�� 
User
�� 
?
�� 
.
�� 
Identity
�� 
.
�� 
IsAuthenticated
�� .
==
��/ 1
true
��2 6
)
��6 7
{
�� 
await
�� 
_signInManager
�� $
.
��$ %
SignOutAsync
��% 1
(
��1 2
)
��2 3
;
��3 4
await
�� 
_events
�� 
.
�� 

RaiseAsync
�� (
(
��( )
new
��) ,$
UserLogoutSuccessEvent
��- C
(
��C D
User
��D H
.
��H I
GetSubjectId
��I U
(
��U V
)
��V W
,
��W X
User
��Y ]
.
��] ^
GetDisplayName
��^ l
(
��l m
)
��m n
)
��n o
)
��o p
;
��p q
}
�� 
if
�� 
(
�� 
vm
�� 
.
�� $
TriggerExternalSignout
�� )
)
��) *
{
�� 
string
�� 
url
�� 
=
�� 
Url
��  
.
��  !
Action
��! '
(
��' (
$str
��( 0
,
��0 1
new
��2 5
{
��6 7
logoutId
��8 @
=
��A B
vm
��C E
.
��E F
LogoutId
��F N
}
��O P
)
��P Q
;
��Q R
return
�� 
SignOut
�� 
(
�� 
new
�� "&
AuthenticationProperties
��# ;
{
��< =
RedirectUri
��> I
=
��J K
url
��L O
}
��P Q
,
��Q R
vm
��S U
.
��U V*
ExternalAuthenticationScheme
��V r
)
��r s
;
��s t
}
�� 
return
�� 
View
�� 
(
�� 
$str
�� #
,
��# $
vm
��% '
)
��' (
;
��( )
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
LoginViewModel
�� )
>
��) *&
BuildLoginViewModelAsync
��+ C
(
��C D
string
��D J
	returnUrl
��K T
)
��T U
{
�� 	
var
�� 
context
�� 
=
�� 
await
�� 
_interaction
��  ,
.
��, -*
GetAuthorizationContextAsync
��- I
(
��I J
	returnUrl
��J S
)
��S T
;
��T U
if
�� 
(
�� 
context
�� 
?
�� 
.
�� 
IdP
�� 
!=
�� 
null
��  $
)
��$ %
{
�� 
return
�� 
new
�� 
LoginViewModel
�� )
{
�� 
EnableLocalLogin
�� $
=
��% &
false
��' ,
,
��, -
	ReturnUrl
�� 
=
�� 
	returnUrl
��  )
,
��) *
Username
�� 
=
�� 
context
�� &
?
��& '
.
��' (
	LoginHint
��( 1
,
��1 2
ExternalProviders
�� %
=
��& '
new
��( +
ExternalProvider
��, <
[
��< =
]
��= >
{
��? @
new
��A D
ExternalProvider
��E U
{
��V W"
AuthenticationScheme
��X l
=
��m n
context
��o v
.
��v w
IdP
��w z
}
��{ |
}
��} ~
}
�� 
;
�� 
}
�� 
var
�� 
schemes
�� 
=
�� 
await
�� 
_schemeProvider
��  /
.
��/ 0 
GetAllSchemesAsync
��0 B
(
��B C
)
��C D
;
��D E
var
�� 
	providers
�� 
=
�� 
schemes
�� #
.
�� 
Where
�� 
(
�� 
x
�� 
=>
�� 
x
�� 
.
�� 
DisplayName
�� )
!=
��* ,
null
��- 1
||
��2 4
(
�� 
x
�� 
.
�� 
Name
�� #
.
��# $
Equals
��$ *
(
��* +
AccountOptions
��+ 9
.
��9 :-
WindowsAuthenticationSchemeName
��: Y
,
��Y Z
StringComparison
��[ k
.
��k l
OrdinalIgnoreCase
��l }
)
��} ~
)
��~ 
)
�� 
.
�� 
Select
�� 
(
�� 
x
�� 
=>
�� 
new
��  
ExternalProvider
��! 1
{
�� 
DisplayName
�� 
=
��  !
x
��" #
.
��# $
DisplayName
��$ /
,
��/ 0"
AuthenticationScheme
�� (
=
��) *
x
��+ ,
.
��, -
Name
��- 1
}
�� 
)
�� 
.
�� 
ToList
�� 
(
�� 
)
�� 
;
�� 
var
�� 

allowLocal
�� 
=
�� 
true
�� !
;
��! "
if
�� 
(
�� 
context
�� 
?
�� 
.
�� 
ClientId
�� !
!=
��" $
null
��% )
)
��) *
{
�� 
var
�� 
client
�� 
=
�� 
await
�� "
_clientStore
��# /
.
��/ 0(
FindEnabledClientByIdAsync
��0 J
(
��J K
context
��K R
.
��R S
ClientId
��S [
)
��[ \
;
��\ ]
if
�� 
(
�� 
client
�� 
!=
�� 
null
�� "
)
��" #
{
�� 

allowLocal
�� 
=
��  
client
��! '
.
��' (
EnableLocalLogin
��( 8
;
��8 9
if
�� 
(
�� 
client
�� 
.
�� *
IdentityProviderRestrictions
�� ;
!=
��< >
null
��? C
&&
��D F
client
��G M
.
��M N*
IdentityProviderRestrictions
��N j
.
��j k
Any
��k n
(
��n o
)
��o p
)
��p q
{
�� 
	providers
�� !
=
��" #
	providers
��$ -
.
��- .
Where
��. 3
(
��3 4
provider
��4 <
=>
��= ?
client
��@ F
.
��F G*
IdentityProviderRestrictions
��G c
.
��c d
Contains
��d l
(
��l m
provider
��m u
.
��u v#
AuthenticationScheme��v �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
}
�� 
}
�� 
}
�� 
return
�� 
new
�� 
LoginViewModel
�� %
{
��  
AllowRememberLogin
�� "
=
��# $
AccountOptions
��% 3
.
��3 4 
AllowRememberLogin
��4 F
,
��F G
EnableLocalLogin
��  
=
��! "

allowLocal
��# -
&&
��. 0
AccountOptions
��1 ?
.
��? @
AllowLocalLogin
��@ O
,
��O P
	ReturnUrl
�� 
=
�� 
	returnUrl
�� %
,
��% &
Username
�� 
=
�� 
context
�� "
?
��" #
.
��# $
	LoginHint
��$ -
,
��- .
ExternalProviders
�� !
=
��" #
	providers
��$ -
.
��- .
ToArray
��. 5
(
��5 6
)
��6 7
}
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
LoginViewModel
�� )
>
��) *&
BuildLoginViewModelAsync
��+ C
(
��C D
LoginInputModel
��D S
model
��T Y
)
��Y Z
{
�� 	
var
�� 
vm
�� 
=
�� 
await
�� &
BuildLoginViewModelAsync
�� 3
(
��3 4
model
��4 9
.
��9 :
	ReturnUrl
��: C
)
��C D
;
��D E
vm
�� 
.
�� 
Username
�� 
=
�� 
model
�� 
.
��  
Username
��  (
;
��( )
vm
�� 
.
�� 
RememberLogin
�� 
=
�� 
model
�� $
.
��$ %
RememberLogin
��% 2
;
��2 3
return
�� 
vm
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
LogoutViewModel
�� *
>
��* +'
BuildLogoutViewModelAsync
��, E
(
��E F
string
��F L
logoutId
��M U
)
��U V
{
�� 	
var
�� 
vm
�� 
=
�� 
new
�� 
LogoutViewModel
�� (
{
��) *
LogoutId
��+ 3
=
��4 5
logoutId
��6 >
,
��> ?
ShowLogoutPrompt
��@ P
=
��Q R
AccountOptions
��S a
.
��a b
ShowLogoutPrompt
��b r
}
��s t
;
��t u
if
�� 
(
�� 
User
�� 
?
�� 
.
�� 
Identity
�� 
.
�� 
IsAuthenticated
�� .
!=
��/ 1
true
��2 6
)
��6 7
{
�� 
vm
�� 
.
�� 
ShowLogoutPrompt
�� #
=
��$ %
false
��& +
;
��+ ,
return
�� 
vm
�� 
;
�� 
}
�� 
var
�� 
context
�� 
=
�� 
await
�� 
_interaction
��  ,
.
��, -#
GetLogoutContextAsync
��- B
(
��B C
logoutId
��C K
)
��K L
;
��L M
if
�� 
(
�� 
context
�� 
?
�� 
.
�� 
ShowSignoutPrompt
�� *
==
��+ -
false
��. 3
)
��3 4
{
�� 
vm
�� 
.
�� 
ShowLogoutPrompt
�� #
=
��$ %
false
��& +
;
��+ ,
return
�� 
vm
�� 
;
�� 
}
�� 
return
�� 
vm
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
��  
LoggedOutViewModel
�� -
>
��- .*
BuildLoggedOutViewModelAsync
��/ K
(
��K L
string
��L R
logoutId
��S [
)
��[ \
{
�� 	
var
�� 
logout
�� 
=
�� 
await
�� 
_interaction
�� +
.
��+ ,#
GetLogoutContextAsync
��, A
(
��A B
logoutId
��B J
)
��J K
;
��K L
var
�� 
vm
�� 
=
�� 
new
��  
LoggedOutViewModel
�� +
{
�� +
AutomaticRedirectAfterSignOut
�� -
=
��. /
AccountOptions
��0 >
.
��> ?+
AutomaticRedirectAfterSignOut
��? \
,
��\ ]#
PostLogoutRedirectUri
�� %
=
��& '
logout
��( .
?
��. /
.
��/ 0#
PostLogoutRedirectUri
��0 E
,
��E F

ClientName
�� 
=
�� 
string
�� #
.
��# $
IsNullOrEmpty
��$ 1
(
��1 2
logout
��2 8
?
��8 9
.
��9 :

ClientName
��: D
)
��D E
?
��F G
logout
��H N
?
��N O
.
��O P
ClientId
��P X
:
��Y Z
logout
��[ a
?
��a b
.
��b c

ClientName
��c m
,
��m n
SignOutIframeUrl
��  
=
��! "
logout
��# )
?
��) *
.
��* +
SignOutIFrameUrl
��+ ;
,
��; <
LogoutId
�� 
=
�� 
logoutId
�� #
}
�� 
;
�� 
if
�� 
(
�� 
User
�� 
?
�� 
.
�� 
Identity
�� 
.
�� 
IsAuthenticated
�� .
==
��/ 1
true
��2 6
)
��6 7
{
�� 
var
�� 
idp
�� 
=
�� 
User
�� 
.
�� 
	FindFirst
�� (
(
��( )
JwtClaimTypes
��) 6
.
��6 7
IdentityProvider
��7 G
)
��G H
?
��H I
.
��I J
Value
��J O
;
��O P
if
�� 
(
�� 
idp
�� 
!=
�� 
null
�� 
&&
��  "
idp
��# &
!=
��' )
IdentityServer4
��* 9
.
��9 :%
IdentityServerConstants
��: Q
.
��Q R#
LocalIdentityProvider
��R g
)
��g h
{
�� 
var
�� %
providerSupportsSignout
�� /
=
��0 1
await
��2 7
HttpContext
��8 C
.
��C D+
GetSchemeSupportsSignOutAsync
��D a
(
��a b
idp
��b e
)
��e f
;
��f g
if
�� 
(
�� %
providerSupportsSignout
�� /
)
��/ 0
{
�� 
if
�� 
(
�� 
vm
�� 
.
�� 
LogoutId
�� '
==
��( *
null
��+ /
)
��/ 0
{
�� 
vm
�� 
.
�� 
LogoutId
�� '
=
��( )
await
��* /
_interaction
��0 <
.
��< =&
CreateLogoutContextAsync
��= U
(
��U V
)
��V W
;
��W X
}
�� 
vm
�� 
.
�� *
ExternalAuthenticationScheme
�� 7
=
��8 9
idp
��: =
;
��= >
}
�� 
}
�� 
}
�� 
return
�� 
vm
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� (
>
��( )&
ProcessWindowsLoginAsync
��* B
(
��B C
string
��C I
	returnUrl
��J S
)
��S T
{
�� 	
var
�� 
result
�� 
=
�� 
await
�� 
HttpContext
�� *
.
��* +
AuthenticateAsync
��+ <
(
��< =
AccountOptions
��= K
.
��K L-
WindowsAuthenticationSchemeName
��L k
)
��k l
;
��l m
if
�� 
(
�� 
result
�� 
?
�� 
.
�� 
	Principal
�� !
is
��" $
WindowsPrincipal
��% 5
wp
��6 8
)
��8 9
{
�� 
var
�� 
props
�� 
=
�� 
new
�� &
AuthenticationProperties
��  8
(
��8 9
)
��9 :
{
�� 
RedirectUri
�� 
=
��  !
Url
��" %
.
��% &
Action
��& ,
(
��, -
$str
��- D
)
��D E
,
��E F
Items
�� 
=
�� 
{
�� 
{
�� 
$str
�� %
,
��% &
	returnUrl
��' 0
}
��1 2
,
��2 3
{
�� 
$str
�� "
,
��" #
AccountOptions
��$ 2
.
��2 3-
WindowsAuthenticationSchemeName
��3 R
}
��S T
,
��T U
}
�� 
}
�� 
;
�� 
var
�� 
id
�� 
=
�� 
new
�� 
ClaimsIdentity
�� +
(
��+ ,
AccountOptions
��, :
.
��: ;-
WindowsAuthenticationSchemeName
��; Z
)
��Z [
;
��[ \
id
�� 
.
�� 
AddClaim
�� 
(
�� 
new
�� 
Claim
��  %
(
��% &
JwtClaimTypes
��& 3
.
��3 4
Subject
��4 ;
,
��; <
wp
��= ?
.
��? @
Identity
��@ H
.
��H I
Name
��I M
)
��M N
)
��N O
;
��O P
id
�� 
.
�� 
AddClaim
�� 
(
�� 
new
�� 
Claim
��  %
(
��% &
JwtClaimTypes
��& 3
.
��3 4
Name
��4 8
,
��8 9
wp
��: <
.
��< =
Identity
��= E
.
��E F
Name
��F J
)
��J K
)
��K L
;
��L M
if
�� 
(
�� 
AccountOptions
�� "
.
��" #"
IncludeWindowsGroups
��# 7
)
��7 8
{
�� 
var
�� 
wi
�� 
=
�� 
wp
�� 
.
��  
Identity
��  (
as
��) +
WindowsIdentity
��, ;
;
��; <
var
�� 
groups
�� 
=
��  
wi
��! #
.
��# $
Groups
��$ *
.
��* +
	Translate
��+ 4
(
��4 5
typeof
��5 ;
(
��; <
	NTAccount
��< E
)
��E F
)
��F G
;
��G H
var
�� 
roles
�� 
=
�� 
groups
��  &
.
��& '
Select
��' -
(
��- .
x
��. /
=>
��0 2
new
��3 6
Claim
��7 <
(
��< =
JwtClaimTypes
��= J
.
��J K
Role
��K O
,
��O P
x
��Q R
.
��R S
Value
��S X
)
��X Y
)
��Y Z
;
��Z [
id
�� 
.
�� 
	AddClaims
��  
(
��  !
roles
��! &
)
��& '
;
��' (
}
�� 
await
�� 
HttpContext
�� !
.
��! "
SignInAsync
��" -
(
��- .
IdentityConstants
�� %
.
��% &
ExternalScheme
��& 4
,
��4 5
new
�� 
ClaimsPrincipal
�� '
(
��' (
id
��( *
)
��* +
,
��+ ,
props
�� 
)
�� 
;
�� 
return
�� 
Redirect
�� 
(
��  
props
��  %
.
��% &
RedirectUri
��& 1
)
��1 2
;
��2 3
}
�� 
else
�� 
{
�� 
return
�� 
	Challenge
��  
(
��  !
AccountOptions
��! /
.
��/ 0-
WindowsAuthenticationSchemeName
��0 O
)
��O P
;
��P Q
}
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
(
�� 
UserIdentity
�� (
user
��) -
,
��- .
string
��/ 5
provider
��6 >
,
��> ?
string
��@ F
providerUserId
��G U
,
��U V
IEnumerable
��W b
<
��b c
Claim
��c h
>
��h i
claims
��j p
)
��p q
>
��q r/
!FindUserFromExternalProviderAsync
�� -
(
��- . 
AuthenticateResult
��. @
result
��A G
)
��G H
{
�� 	
var
�� 
externalUser
�� 
=
�� 
result
�� %
.
��% &
	Principal
��& /
;
��/ 0
var
�� 
userIdClaim
�� 
=
�� 
externalUser
�� *
.
��* +
	FindFirst
��+ 4
(
��4 5
JwtClaimTypes
��5 B
.
��B C
Subject
��C J
)
��J K
??
��L N
externalUser
�� *
.
��* +
	FindFirst
��+ 4
(
��4 5

ClaimTypes
��5 ?
.
��? @
NameIdentifier
��@ N
)
��N O
??
��P R
throw
�� #
new
��$ '
	Exception
��( 1
(
��1 2
$str
��2 B
)
��B C
;
��C D
var
�� 
claims
�� 
=
�� 
externalUser
�� %
.
��% &
Claims
��& ,
.
��, -
ToList
��- 3
(
��3 4
)
��4 5
;
��5 6
claims
�� 
.
�� 
Remove
�� 
(
�� 
userIdClaim
�� %
)
��% &
;
��& '
var
�� 
provider
�� 
=
�� 
result
�� !
.
��! "

Properties
��" ,
.
��, -
Items
��- 2
[
��2 3
$str
��3 ;
]
��; <
;
��< =
var
�� 
providerUserId
�� 
=
��  
userIdClaim
��! ,
.
��, -
Value
��- 2
;
��2 3
var
�� 
user
�� 
=
�� 
await
�� 
_userManager
�� )
.
��) *
FindByLoginAsync
��* :
(
��: ;
provider
��; C
,
��C D
providerUserId
��E S
)
��S T
;
��T U
return
�� 
(
�� 
user
�� 
,
�� 
provider
�� "
,
��" #
providerUserId
��$ 2
,
��2 3
claims
��4 :
)
��: ;
;
��; <
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
UserIdentity
�� '
>
��' ($
AutoProvisionUserAsync
��) ?
(
��? @
string
��@ F
provider
��G O
,
��O P
string
��Q W
providerUserId
��X f
,
��f g
IEnumerable
��h s
<
��s t
Claim
��t y
>
��y z
claims��{ �
)��� �
{
�� 	
var
�� 
filtered
�� 
=
�� 
new
�� 
List
�� #
<
��# $
Claim
��$ )
>
��) *
(
��* +
)
��+ ,
;
��, -
var
�� 
name
�� 
=
�� 
claims
�� 
.
�� 
FirstOrDefault
�� ,
(
��, -
x
��- .
=>
��/ 1
x
��2 3
.
��3 4
Type
��4 8
==
��9 ;
JwtClaimTypes
��< I
.
��I J
Name
��J N
)
��N O
?
��O P
.
��P Q
Value
��Q V
??
��W Y
claims
�� 
.
�� 
FirstOrDefault
�� %
(
��% &
x
��& '
=>
��( *
x
��+ ,
.
��, -
Type
��- 1
==
��2 4

ClaimTypes
��5 ?
.
��? @
Name
��@ D
)
��D E
?
��E F
.
��F G
Value
��G L
;
��L M
if
�� 
(
�� 
name
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
filtered
�� 
.
�� 
Add
�� 
(
�� 
new
��  
Claim
��! &
(
��& '
JwtClaimTypes
��' 4
.
��4 5
Name
��5 9
,
��9 :
name
��; ?
)
��? @
)
��@ A
;
��A B
}
�� 
else
�� 
{
�� 
var
�� 
first
�� 
=
�� 
claims
�� "
.
��" #
FirstOrDefault
��# 1
(
��1 2
x
��2 3
=>
��4 6
x
��7 8
.
��8 9
Type
��9 =
==
��> @
JwtClaimTypes
��A N
.
��N O
	GivenName
��O X
)
��X Y
?
��Y Z
.
��Z [
Value
��[ `
??
��a c
claims
�� 
.
�� 
FirstOrDefault
�� )
(
��) *
x
��* +
=>
��, .
x
��/ 0
.
��0 1
Type
��1 5
==
��6 8

ClaimTypes
��9 C
.
��C D
	GivenName
��D M
)
��M N
?
��N O
.
��O P
Value
��P U
;
��U V
var
�� 
last
�� 
=
�� 
claims
�� !
.
��! "
FirstOrDefault
��" 0
(
��0 1
x
��1 2
=>
��3 5
x
��6 7
.
��7 8
Type
��8 <
==
��= ?
JwtClaimTypes
��@ M
.
��M N

FamilyName
��N X
)
��X Y
?
��Y Z
.
��Z [
Value
��[ `
??
��a c
claims
�� 
.
�� 
FirstOrDefault
�� )
(
��) *
x
��* +
=>
��, .
x
��/ 0
.
��0 1
Type
��1 5
==
��6 8

ClaimTypes
��9 C
.
��C D
Surname
��D K
)
��K L
?
��L M
.
��M N
Value
��N S
;
��S T
if
�� 
(
�� 
first
�� 
!=
�� 
null
�� !
&&
��" $
last
��% )
!=
��* ,
null
��- 1
)
��1 2
{
�� 
filtered
�� 
.
�� 
Add
��  
(
��  !
new
��! $
Claim
��% *
(
��* +
JwtClaimTypes
��+ 8
.
��8 9
Name
��9 =
,
��= >
first
��? D
+
��E F
$str
��G J
+
��K L
last
��M Q
)
��Q R
)
��R S
;
��S T
}
�� 
else
�� 
if
�� 
(
�� 
first
�� 
!=
�� !
null
��" &
)
��& '
{
�� 
filtered
�� 
.
�� 
Add
��  
(
��  !
new
��! $
Claim
��% *
(
��* +
JwtClaimTypes
��+ 8
.
��8 9
Name
��9 =
,
��= >
first
��? D
)
��D E
)
��E F
;
��F G
}
�� 
else
�� 
if
�� 
(
�� 
last
�� 
!=
��  
null
��! %
)
��% &
{
�� 
filtered
�� 
.
�� 
Add
��  
(
��  !
new
��! $
Claim
��% *
(
��* +
JwtClaimTypes
��+ 8
.
��8 9
Name
��9 =
,
��= >
last
��? C
)
��C D
)
��D E
;
��E F
}
�� 
}
�� 
var
�� 
email
�� 
=
�� 
claims
�� 
.
�� 
FirstOrDefault
�� -
(
��- .
x
��. /
=>
��0 2
x
��3 4
.
��4 5
Type
��5 9
==
��: <
JwtClaimTypes
��= J
.
��J K
Email
��K P
)
��P Q
?
��Q R
.
��R S
Value
��S X
??
��Y [
claims
�� 
.
�� 
FirstOrDefault
�� $
(
��$ %
x
��% &
=>
��' )
x
��* +
.
��+ ,
Type
��, 0
==
��1 3

ClaimTypes
��4 >
.
��> ?
Email
��? D
)
��D E
?
��E F
.
��F G
Value
��G L
;
��L M
if
�� 
(
�� 
email
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
filtered
�� 
.
�� 
Add
�� 
(
�� 
new
��  
Claim
��! &
(
��& '
JwtClaimTypes
��' 4
.
��4 5
Email
��5 :
,
��: ;
email
��< A
)
��A B
)
��B C
;
��C D
}
�� 
var
�� 
user
�� 
=
�� 
new
�� 
UserIdentity
�� '
{
�� 
UserName
�� 
=
�� 
Guid
�� 
.
��  
NewGuid
��  '
(
��' (
)
��( )
.
��) *
ToString
��* 2
(
��2 3
)
��3 4
,
��4 5
}
�� 
;
�� 
var
�� 
identityResult
�� 
=
��  
await
��! &
_userManager
��' 3
.
��3 4
CreateAsync
��4 ?
(
��? @
user
��@ D
)
��D E
;
��E F
if
�� 
(
�� 
!
�� 
identityResult
�� 
.
��  
	Succeeded
��  )
)
��) *
throw
��+ 0
new
��1 4
	Exception
��5 >
(
��> ?
identityResult
��? M
.
��M N
Errors
��N T
.
��T U
First
��U Z
(
��Z [
)
��[ \
.
��\ ]
Description
��] h
)
��h i
;
��i j
if
�� 
(
�� 
filtered
�� 
.
�� 
Any
�� 
(
�� 
)
�� 
)
�� 
{
�� 
identityResult
�� 
=
��  
await
��! &
_userManager
��' 3
.
��3 4
AddClaimsAsync
��4 B
(
��B C
user
��C G
,
��G H
filtered
��I Q
)
��Q R
;
��R S
if
�� 
(
�� 
!
�� 
identityResult
�� #
.
��# $
	Succeeded
��$ -
)
��- .
throw
��/ 4
new
��5 8
	Exception
��9 B
(
��B C
identityResult
��C Q
.
��Q R
Errors
��R X
.
��X Y
First
��Y ^
(
��^ _
)
��_ `
.
��` a
Description
��a l
)
��l m
;
��m n
}
�� 
identityResult
�� 
=
�� 
await
�� "
_userManager
��# /
.
��/ 0
AddLoginAsync
��0 =
(
��= >
user
��> B
,
��B C
new
��D G
UserLoginInfo
��H U
(
��U V
provider
��V ^
,
��^ _
providerUserId
��` n
,
��n o
provider
��p x
)
��x y
)
��y z
;
��z {
if
�� 
(
�� 
!
�� 
identityResult
�� 
.
��  
	Succeeded
��  )
)
��) *
throw
��+ 0
new
��1 4
	Exception
��5 >
(
��> ?
identityResult
��? M
.
��M N
Errors
��N T
.
��T U
First
��U Z
(
��Z [
)
��[ \
.
��\ ]
Description
��] h
)
��h i
;
��i j
return
�� 
user
�� 
;
�� 
}
�� 	
private
�� 
void
�� )
ProcessLoginCallbackForOidc
�� 0
(
��0 1 
AuthenticateResult
��1 C
externalResult
��D R
,
��R S
List
��T X
<
��X Y
Claim
��Y ^
>
��^ _
localClaims
��` k
,
��k l'
AuthenticationProperties��m � 
localSignInProps��� �
)��� �
{
�� 	
var
�� 
sid
�� 
=
�� 
externalResult
�� $
.
��$ %
	Principal
��% .
.
��. /
Claims
��/ 5
.
��5 6
FirstOrDefault
��6 D
(
��D E
x
��E F
=>
��G I
x
��J K
.
��K L
Type
��L P
==
��Q S
JwtClaimTypes
��T a
.
��a b
	SessionId
��b k
)
��k l
;
��l m
if
�� 
(
�� 
sid
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
localClaims
�� 
.
�� 
Add
�� 
(
��  
new
��  #
Claim
��$ )
(
��) *
JwtClaimTypes
��* 7
.
��7 8
	SessionId
��8 A
,
��A B
sid
��C F
.
��F G
Value
��G L
)
��L M
)
��M N
;
��N O
}
�� 
var
�� 
id_token
�� 
=
�� 
externalResult
�� )
.
��) *

Properties
��* 4
.
��4 5
GetTokenValue
��5 B
(
��B C
$str
��C M
)
��M N
;
��N O
if
�� 
(
�� 
id_token
�� 
!=
�� 
null
��  
)
��  !
{
�� 
localSignInProps
��  
.
��  !
StoreTokens
��! ,
(
��, -
new
��- 0
[
��0 1
]
��1 2
{
��3 4
new
��5 8!
AuthenticationToken
��9 L
{
��M N
Name
��O S
=
��T U
$str
��V `
,
��` a
Value
��b g
=
��h i
id_token
��j r
}
��s t
}
��u v
)
��v w
;
��w x
}
�� 
}
�� 	
private
�� 
void
�� *
ProcessLoginCallbackForWsFed
�� 1
(
��1 2 
AuthenticateResult
��2 D
externalResult
��E S
,
��S T
List
��U Y
<
��Y Z
Claim
��Z _
>
��_ `
localClaims
��a l
,
��l m'
AuthenticationProperties��n � 
localSignInProps��� �
)��� �
{
�� 	
}
�� 	
private
�� 
void
�� +
ProcessLoginCallbackForSaml2p
�� 2
(
��2 3 
AuthenticateResult
��3 E
externalResult
��F T
,
��T U
List
��V Z
<
��Z [
Claim
��[ `
>
��` a
localClaims
��b m
,
��m n'
AuthenticationProperties��o � 
localSignInProps��� �
)��� �
{
�� 	
}
�� 	
}
�� 
}�� �
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Account\AccountOptions.cs
	namespace 	
IdentityServer4
 
. 

Quickstart $
.$ %
UI% '
{ 
public		 

class		 
AccountOptions		 
{

 
public 
static 
bool 
AllowLocalLogin *
=+ ,
true- 1
;1 2
public 
static 
bool 
AllowRememberLogin -
=. /
true0 4
;4 5
public 
static 
TimeSpan #
RememberMeLoginDuration 6
=7 8
TimeSpan9 A
.A B
FromDaysB J
(J K
$numK M
)M N
;N O
public 
static 
bool 
ShowLogoutPrompt +
=, -
true. 2
;2 3
public 
static 
bool )
AutomaticRedirectAfterSignOut 8
=9 :
false; @
;@ A
public 
static 
readonly 
string %+
WindowsAuthenticationSchemeName& E
=F G
	MicrosoftH Q
.Q R

AspNetCoreR \
.\ ]
Server] c
.c d
IISIntegrationd r
.r s
IISDefaultss ~
.~ !
AuthenticationScheme	 �
;
� �
public 
static 
bool  
IncludeWindowsGroups /
=0 1
false2 7
;7 8
public 
static 
string *
InvalidCredentialsErrorMessage ;
=< =
$str> \
;\ ]
} 
} �
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Account\ExternalProvider.cs
	namespace 	
IdentityServer4
 
. 

Quickstart $
.$ %
UI% '
{ 
public 

class 
ExternalProvider !
{ 
public		 
string		 
DisplayName		 !
{		" #
get		$ '
;		' (
set		) ,
;		, -
}		. /
public

 
string

  
AuthenticationScheme

 *
{

+ ,
get

- 0
;

0 1
set

2 5
;

5 6
}

7 8
} 
} �
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Account\LoggedOutViewModel.cs
	namespace 	
IdentityServer4
 
. 

Quickstart $
.$ %
UI% '
{ 
public 

class 
LoggedOutViewModel #
{ 
public		 
string		 !
PostLogoutRedirectUri		 +
{		, -
get		. 1
;		1 2
set		3 6
;		6 7
}		8 9
public

 
string

 

ClientName

  
{

! "
get

# &
;

& '
set

( +
;

+ ,
}

- .
public 
string 
SignOutIframeUrl &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
bool )
AutomaticRedirectAfterSignOut 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
public 
string 
LogoutId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
bool "
TriggerExternalSignout *
=>+ -(
ExternalAuthenticationScheme. J
!=K M
nullN R
;R S
public 
string (
ExternalAuthenticationScheme 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
} 
} �
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Account\LoginInputModel.cs
	namespace 	
IdentityServer4
 
. 

Quickstart $
.$ %
UI% '
{ 
public		 

class		 
LoginInputModel		  
{

 
[ 	
Required	 
] 
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Required	 
] 
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
bool 
RememberLogin !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
	ReturnUrl 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} �
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Account\LoginViewModel.cs
	namespace		 	
IdentityServer4		
 
.		 

Quickstart		 $
.		$ %
UI		% '
{

 
public 

class 
LoginViewModel 
:  !
LoginInputModel" 1
{ 
public 
bool 
AllowRememberLogin &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
bool 
EnableLocalLogin $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
IEnumerable 
< 
ExternalProvider +
>+ ,
ExternalProviders- >
{? @
getA D
;D E
setF I
;I J
}K L
public 
IEnumerable 
< 
ExternalProvider +
>+ ,$
VisibleExternalProviders- E
=>F H
ExternalProvidersI Z
.Z [
Where[ `
(` a
xa b
=>c e
!f g
Stringg m
.m n
IsNullOrWhiteSpace	n �
(
� �
x
� �
.
� �
DisplayName
� �
)
� �
)
� �
;
� �
public 
bool 
IsExternalLoginOnly '
=>( *
EnableLocalLogin+ ;
==< >
false? D
&&E G
ExternalProvidersH Y
?Y Z
.Z [
Count[ `
(` a
)a b
==c e
$numf g
;g h
public 
string 
ExternalLoginScheme )
=>* ,
IsExternalLoginOnly- @
?A B
ExternalProvidersC T
?T U
.U V
SingleOrDefaultV e
(e f
)f g
?g h
.h i 
AuthenticationSchemei }
:~ 
null
� �
;
� �
} 
} �
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Account\LogoutInputModel.cs
	namespace 	
IdentityServer4
 
. 

Quickstart $
.$ %
UI% '
{ 
public 

class 
LogoutInputModel !
{ 
public		 
string		 
LogoutId		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
}

 
} �
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Account\LogoutViewModel.cs
	namespace 	
IdentityServer4
 
. 

Quickstart $
.$ %
UI% '
{ 
public 

class 
LogoutViewModel  
:! "
LogoutInputModel# 3
{ 
public		 
bool		 
ShowLogoutPrompt		 $
{		% &
get		' *
;		* +
set		, /
;		/ 0
}		1 2
}

 
} ؜
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Consent\ConsentController.cs
	namespace 	
IdentityServer4
 
. 

Quickstart $
.$ %
UI% '
{ 
[ 
SecurityHeaders 
] 
[ 
	Authorize 
] 
public 

class 
ConsentController "
:# $

Controller% /
{ 
private 
readonly -
!IIdentityServerInteractionService :
_interaction; G
;G H
private 
readonly 
IClientStore %
_clientStore& 2
;2 3
private 
readonly 
IResourceStore '
_resourceStore( 6
;6 7
private 
readonly 
ILogger  
<  !
ConsentController! 2
>2 3
_logger4 ;
;; <
public 
ConsentController  
(  !-
!IIdentityServerInteractionService -
interaction. 9
,9 :
IClientStore 
clientStore $
,$ %
IResourceStore 
resourceStore (
,( )
ILogger   
<   
ConsentController   %
>  % &
logger  ' -
)  - .
{!! 	
_interaction"" 
="" 
interaction"" &
;""& '
_clientStore## 
=## 
clientStore## &
;##& '
_resourceStore$$ 
=$$ 
resourceStore$$ *
;$$* +
_logger%% 
=%% 
logger%% 
;%% 
}&& 	
[-- 	
HttpGet--	 
]-- 
public.. 
async.. 
Task.. 
<.. 
IActionResult.. '
>..' (
Index..) .
(... /
string../ 5
	returnUrl..6 ?
)..? @
{// 	
var00 
vm00 
=00 
await00 
BuildViewModelAsync00 .
(00. /
	returnUrl00/ 8
)008 9
;009 :
if11 
(11 
vm11 
!=11 
null11 
)11 
{22 
return33 
View33 
(33 
$str33 #
,33# $
vm33% '
)33' (
;33( )
}44 
return66 
View66 
(66 
$str66 
)66  
;66  !
}77 	
[<< 	
HttpPost<<	 
]<< 
[== 	$
ValidateAntiForgeryToken==	 !
]==! "
public>> 
async>> 
Task>> 
<>> 
IActionResult>> '
>>>' (
Index>>) .
(>>. /
ConsentInputModel>>/ @
model>>A F
)>>F G
{?? 	
var@@ 
result@@ 
=@@ 
await@@ 
ProcessConsent@@ -
(@@- .
model@@. 3
)@@3 4
;@@4 5
ifBB 
(BB 
resultBB 
.BB 

IsRedirectBB !
)BB! "
{CC 
returnDD 
RedirectDD 
(DD  
resultDD  &
.DD& '
RedirectUriDD' 2
)DD2 3
;DD3 4
}EE 
ifGG 
(GG 
resultGG 
.GG 
HasValidationErrorGG )
)GG) *
{HH 

ModelStateII 
.II 
AddModelErrorII (
(II( )
$strII) +
,II+ ,
resultII- 3
.II3 4
ValidationErrorII4 C
)IIC D
;IID E
}JJ 
ifLL 
(LL 
resultLL 
.LL 
ShowViewLL 
)LL  
{MM 
returnNN 
ViewNN 
(NN 
$strNN #
,NN# $
resultNN% +
.NN+ ,
	ViewModelNN, 5
)NN5 6
;NN6 7
}OO 
returnQQ 
ViewQQ 
(QQ 
$strQQ 
)QQ  
;QQ  !
}RR 	
privateWW 
asyncWW 
TaskWW 
<WW  
ProcessConsentResultWW /
>WW/ 0
ProcessConsentWW1 ?
(WW? @
ConsentInputModelWW@ Q
modelWWR W
)WWW X
{XX 	
varYY 
resultYY 
=YY 
newYY  
ProcessConsentResultYY 1
(YY1 2
)YY2 3
;YY3 4
ConsentResponse[[ 
grantedConsent[[ *
=[[+ ,
null[[- 1
;[[1 2
if^^ 
(^^ 
model^^ 
.^^ 
Button^^ 
==^^ 
$str^^  $
)^^$ %
{__ 
grantedConsent`` 
=``  
ConsentResponse``! 0
.``0 1
Denied``1 7
;``7 8
}aa 
elsecc 
ifcc 
(cc 
modelcc 
.cc 
Buttoncc !
==cc" $
$strcc% *
&&cc+ -
modelcc. 3
!=cc4 6
nullcc7 ;
)cc; <
{dd 
ifff 
(ff 
modelff 
.ff 
ScopesConsentedff )
!=ff* ,
nullff- 1
&&ff2 4
modelff5 :
.ff: ;
ScopesConsentedff; J
.ffJ K
AnyffK N
(ffN O
)ffO P
)ffP Q
{gg 
varhh 
scopeshh 
=hh  
modelhh! &
.hh& '
ScopesConsentedhh' 6
;hh6 7
ifii 
(ii 
ConsentOptionsii &
.ii& '
EnableOfflineAccessii' :
==ii; =
falseii> C
)iiC D
{jj 
scopeskk 
=kk  
scopeskk! '
.kk' (
Wherekk( -
(kk- .
xkk. /
=>kk0 2
xkk3 4
!=kk5 7
IdentityServer4kk8 G
.kkG H#
IdentityServerConstantskkH _
.kk_ `
StandardScopeskk` n
.kkn o
OfflineAccesskko |
)kk| }
;kk} ~
}ll 
grantedConsentnn "
=nn# $
newnn% (
ConsentResponsenn) 8
{oo 
RememberConsentpp '
=pp( )
modelpp* /
.pp/ 0
RememberConsentpp0 ?
,pp? @
ScopesConsentedqq '
=qq( )
scopesqq* 0
.qq0 1
ToArrayqq1 8
(qq8 9
)qq9 :
}rr 
;rr 
}ss 
elsett 
{uu 
resultvv 
.vv 
ValidationErrorvv *
=vv+ ,
ConsentOptionsvv- ;
.vv; <%
MustChooseOneErrorMessagevv< U
;vvU V
}ww 
}xx 
elseyy 
{zz 
result{{ 
.{{ 
ValidationError{{ &
={{' (
ConsentOptions{{) 7
.{{7 8(
InvalidSelectionErrorMessage{{8 T
;{{T U
}|| 
if~~ 
(~~ 
grantedConsent~~ 
!=~~ !
null~~" &
)~~& '
{ 
var
�� 
request
�� 
=
�� 
await
�� #
_interaction
��$ 0
.
��0 1*
GetAuthorizationContextAsync
��1 M
(
��M N
model
��N S
.
��S T
	ReturnUrl
��T ]
)
��] ^
;
��^ _
if
�� 
(
�� 
request
�� 
==
�� 
null
�� #
)
��# $
return
��% +
result
��, 2
;
��2 3
await
�� 
_interaction
�� "
.
��" #
GrantConsentAsync
��# 4
(
��4 5
request
��5 <
,
��< =
grantedConsent
��> L
)
��L M
;
��M N
result
�� 
.
�� 
RedirectUri
�� "
=
��# $
model
��% *
.
��* +
	ReturnUrl
��+ 4
;
��4 5
}
�� 
else
�� 
{
�� 
result
�� 
.
�� 
	ViewModel
��  
=
��! "
await
��# (!
BuildViewModelAsync
��) <
(
��< =
model
��= B
.
��B C
	ReturnUrl
��C L
,
��L M
model
��N S
)
��S T
;
��T U
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
ConsentViewModel
�� +
>
��+ ,!
BuildViewModelAsync
��- @
(
��@ A
string
��A G
	returnUrl
��H Q
,
��Q R
ConsentInputModel
��S d
model
��e j
=
��k l
null
��m q
)
��q r
{
�� 	
var
�� 
request
�� 
=
�� 
await
�� 
_interaction
��  ,
.
��, -*
GetAuthorizationContextAsync
��- I
(
��I J
	returnUrl
��J S
)
��S T
;
��T U
if
�� 
(
�� 
request
�� 
!=
�� 
null
�� 
)
��  
{
�� 
var
�� 
client
�� 
=
�� 
await
�� "
_clientStore
��# /
.
��/ 0(
FindEnabledClientByIdAsync
��0 J
(
��J K
request
��K R
.
��R S
ClientId
��S [
)
��[ \
;
��\ ]
if
�� 
(
�� 
client
�� 
!=
�� 
null
�� "
)
��" #
{
�� 
var
�� 
	resources
�� !
=
��" #
await
��$ )
_resourceStore
��* 8
.
��8 9.
 FindEnabledResourcesByScopeAsync
��9 Y
(
��Y Z
request
��Z a
.
��a b
ScopesRequested
��b q
)
��q r
;
��r s
if
�� 
(
�� 
	resources
�� !
!=
��" $
null
��% )
&&
��* ,
(
��- .
	resources
��. 7
.
��7 8
IdentityResources
��8 I
.
��I J
Any
��J M
(
��M N
)
��N O
||
��P R
	resources
��S \
.
��\ ]
ApiResources
��] i
.
��i j
Any
��j m
(
��m n
)
��n o
)
��o p
)
��p q
{
�� 
return
�� $
CreateConsentViewModel
�� 5
(
��5 6
model
��6 ;
,
��; <
	returnUrl
��= F
,
��F G
request
��H O
,
��O P
client
��Q W
,
��W X
	resources
��Y b
)
��b c
;
��c d
}
�� 
else
�� 
{
�� 
_logger
�� 
.
��  
LogError
��  (
(
��( )
$str
��) B
,
��B C
request
��D K
.
��K L
ScopesRequested
��L [
.
��[ \
	Aggregate
��\ e
(
��e f
(
��f g
x
��g h
,
��h i
y
��j k
)
��k l
=>
��m o
x
��p q
+
��r s
$str
��t x
+
��y z
y
��{ |
)
��| }
)
��} ~
;
��~ 
}
�� 
}
�� 
else
�� 
{
�� 
_logger
�� 
.
�� 
LogError
�� $
(
��$ %
$str
��% =
,
��= >
request
��? F
.
��F G
ClientId
��G O
)
��O P
;
��P Q
}
�� 
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
��! K
,
��K L
	returnUrl
��M V
)
��V W
;
��W X
}
�� 
return
�� 
null
�� 
;
�� 
}
�� 	
private
�� 
ConsentViewModel
��  $
CreateConsentViewModel
��! 7
(
��7 8
ConsentInputModel
�� 
model
�� #
,
��# $
string
��% +
	returnUrl
��, 5
,
��5 6"
AuthorizationRequest
��  
request
��! (
,
��( )
Client
�� 
client
�� 
,
�� 
	Resources
�� $
	resources
��% .
)
��. /
{
�� 	
var
�� 
vm
�� 
=
�� 
new
�� 
ConsentViewModel
�� )
(
��) *
)
��* +
;
��+ ,
vm
�� 
.
�� 
RememberConsent
�� 
=
��  
model
��! &
?
��& '
.
��' (
RememberConsent
��( 7
??
��8 :
true
��; ?
;
��? @
vm
�� 
.
�� 
ScopesConsented
�� 
=
��  
model
��! &
?
��& '
.
��' (
ScopesConsented
��( 7
??
��8 :

Enumerable
��; E
.
��E F
Empty
��F K
<
��K L
string
��L R
>
��R S
(
��S T
)
��T U
;
��U V
vm
�� 
.
�� 
	ReturnUrl
�� 
=
�� 
	returnUrl
�� $
;
��$ %
vm
�� 
.
�� 

ClientName
�� 
=
�� 
client
�� "
.
��" #

ClientName
��# -
??
��. 0
client
��1 7
.
��7 8
ClientId
��8 @
;
��@ A
vm
�� 
.
�� 
	ClientUrl
�� 
=
�� 
client
�� !
.
��! "
	ClientUri
��" +
;
��+ ,
vm
�� 
.
�� 
ClientLogoUrl
�� 
=
�� 
client
�� %
.
��% &
LogoUri
��& -
;
��- .
vm
�� 
.
�� "
AllowRememberConsent
�� #
=
��$ %
client
��& ,
.
��, -"
AllowRememberConsent
��- A
;
��A B
vm
�� 
.
�� 
IdentityScopes
�� 
=
�� 
	resources
��  )
.
��) *
IdentityResources
��* ;
.
��; <
Select
��< B
(
��B C
x
��C D
=>
��E G"
CreateScopeViewModel
��H \
(
��\ ]
x
��] ^
,
��^ _
vm
��` b
.
��b c
ScopesConsented
��c r
.
��r s
Contains
��s {
(
��{ |
x
��| }
.
��} ~
Name��~ �
)��� �
||��� �
model��� �
==��� �
null��� �
)��� �
)��� �
.��� �
ToArray��� �
(��� �
)��� �
;��� �
vm
�� 
.
�� 
ResourceScopes
�� 
=
�� 
	resources
��  )
.
��) *
ApiResources
��* 6
.
��6 7

SelectMany
��7 A
(
��A B
x
��B C
=>
��D F
x
��G H
.
��H I
Scopes
��I O
)
��O P
.
��P Q
Select
��Q W
(
��W X
x
��X Y
=>
��Z \"
CreateScopeViewModel
��] q
(
��q r
x
��r s
,
��s t
vm
��u w
.
��w x
ScopesConsented��x �
.��� �
Contains��� �
(��� �
x��� �
.��� �
Name��� �
)��� �
||��� �
model��� �
==��� �
null��� �
)��� �
)��� �
.��� �
ToArray��� �
(��� �
)��� �
;��� �
if
�� 
(
�� 
ConsentOptions
�� 
.
�� !
EnableOfflineAccess
�� 2
&&
��3 5
	resources
��6 ?
.
��? @
OfflineAccess
��@ M
)
��M N
{
�� 
vm
�� 
.
�� 
ResourceScopes
�� !
=
��" #
vm
��$ &
.
��& '
ResourceScopes
��' 5
.
��5 6
Union
��6 ;
(
��; <
new
��< ?
ScopeViewModel
��@ N
[
��N O
]
��O P
{
��Q R#
GetOfflineAccessScope
�� )
(
��) *
vm
��* ,
.
��, -
ScopesConsented
��- <
.
��< =
Contains
��= E
(
��E F
IdentityServer4
��F U
.
��U V%
IdentityServerConstants
��V m
.
��m n
StandardScopes
��n |
.
��| }
OfflineAccess��} �
)��� �
||��� �
model��� �
==��� �
null��� �
)��� �
}
�� 
)
�� 
;
�� 
}
�� 
return
�� 
vm
�� 
;
�� 
}
�� 	
private
�� 
ScopeViewModel
�� "
CreateScopeViewModel
�� 3
(
��3 4
IdentityResource
��4 D
identity
��E M
,
��M N
bool
��O S
check
��T Y
)
��Y Z
{
�� 	
return
�� 
new
�� 
ScopeViewModel
�� %
{
�� 
Name
�� 
=
�� 
identity
�� 
.
��  
Name
��  $
,
��$ %
DisplayName
�� 
=
�� 
identity
�� &
.
��& '
DisplayName
��' 2
,
��2 3
Description
�� 
=
�� 
identity
�� &
.
��& '
Description
��' 2
,
��2 3
	Emphasize
�� 
=
�� 
identity
�� $
.
��$ %
	Emphasize
��% .
,
��. /
Required
�� 
=
�� 
identity
�� #
.
��# $
Required
��$ ,
,
��, -
Checked
�� 
=
�� 
check
�� 
||
��  "
identity
��# +
.
��+ ,
Required
��, 4
}
�� 
;
�� 
}
�� 	
public
�� 
ScopeViewModel
�� "
CreateScopeViewModel
�� 2
(
��2 3
Scope
��3 8
scope
��9 >
,
��> ?
bool
��@ D
check
��E J
)
��J K
{
�� 	
return
�� 
new
�� 
ScopeViewModel
�� %
{
�� 
Name
�� 
=
�� 
scope
�� 
.
�� 
Name
�� !
,
��! "
DisplayName
�� 
=
�� 
scope
�� #
.
��# $
DisplayName
��$ /
,
��/ 0
Description
�� 
=
�� 
scope
�� #
.
��# $
Description
��$ /
,
��/ 0
	Emphasize
�� 
=
�� 
scope
�� !
.
��! "
	Emphasize
��" +
,
��+ ,
Required
�� 
=
�� 
scope
��  
.
��  !
Required
��! )
,
��) *
Checked
�� 
=
�� 
check
�� 
||
��  "
scope
��# (
.
��( )
Required
��) 1
}
�� 
;
�� 
}
�� 	
private
�� 
ScopeViewModel
�� #
GetOfflineAccessScope
�� 4
(
��4 5
bool
��5 9
check
��: ?
)
��? @
{
�� 	
return
�� 
new
�� 
ScopeViewModel
�� %
{
�� 
Name
�� 
=
�� 
IdentityServer4
�� &
.
��& '%
IdentityServerConstants
��' >
.
��> ?
StandardScopes
��? M
.
��M N
OfflineAccess
��N [
,
��[ \
DisplayName
�� 
=
�� 
ConsentOptions
�� ,
.
��, -&
OfflineAccessDisplayName
��- E
,
��E F
Description
�� 
=
�� 
ConsentOptions
�� ,
.
��, -&
OfflineAccessDescription
��- E
,
��E F
	Emphasize
�� 
=
�� 
true
��  
,
��  !
Checked
�� 
=
�� 
check
�� 
}
�� 
;
�� 
}
�� 	
}
�� 
}�� �
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Consent\ConsentInputModel.cs
	namespace 	
IdentityServer4
 
. 

Quickstart $
.$ %
UI% '
{ 
public		 

class		 
ConsentInputModel		 "
{

 
public 
string 
Button 
{ 
get "
;" #
set$ '
;' (
}) *
public 
IEnumerable 
< 
string !
>! "
ScopesConsented# 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
public 
bool 
RememberConsent #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
	ReturnUrl 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} �
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Consent\ConsentOptions.cs
	namespace 	
IdentityServer4
 
. 

Quickstart $
.$ %
UI% '
{ 
public 

class 
ConsentOptions 
{ 
public		 
static		 
bool		 
EnableOfflineAccess		 .
=		/ 0
true		1 5
;		5 6
public

 
static

 
string

 $
OfflineAccessDisplayName

 5
=

6 7
$str

8 H
;

H I
public 
static 
string $
OfflineAccessDescription 5
=6 7
$str8 ~
;~ 
public 
static 
readonly 
string %%
MustChooseOneErrorMessage& ?
=@ A
$strB i
;i j
public 
static 
readonly 
string %(
InvalidSelectionErrorMessage& B
=C D
$strE X
;X Y
} 
} �
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Consent\ConsentViewModel.cs
	namespace 	
IdentityServer4
 
. 

Quickstart $
.$ %
UI% '
{ 
public		 

class		 
ConsentViewModel		 !
:		" #
ConsentInputModel		$ 5
{

 
public 
string 

ClientName  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
	ClientUrl 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
ClientLogoUrl #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
bool  
AllowRememberConsent (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
IEnumerable 
< 
ScopeViewModel )
>) *
IdentityScopes+ 9
{: ;
get< ?
;? @
setA D
;D E
}F G
public 
IEnumerable 
< 
ScopeViewModel )
>) *
ResourceScopes+ 9
{: ;
get< ?
;? @
setA D
;D E
}F G
} 
} �

�C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Consent\ProcessConsentResult.cs
	namespace 	
IdentityServer4
 
. 

Quickstart $
.$ %
UI% '
{ 
public 

class  
ProcessConsentResult %
{ 
public		 
bool		 

IsRedirect		 
=>		 !
RedirectUri		" -
!=		. 0
null		1 5
;		5 6
public

 
string

 
RedirectUri

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
public 
bool 
ShowView 
=> 
	ViewModel  )
!=* ,
null- 1
;1 2
public 
ConsentViewModel 
	ViewModel  )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
bool 
HasValidationError &
=>' )
ValidationError* 9
!=: <
null= A
;A B
public 
string 
ValidationError %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
} 
} �

�C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Consent\ScopeViewModel.cs
	namespace 	
IdentityServer4
 
. 

Quickstart $
.$ %
UI% '
{ 
public 

class 
ScopeViewModel 
{ 
public		 
string		 
Name		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 
string

 
DisplayName

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
bool 
	Emphasize 
{ 
get  #
;# $
set% (
;( )
}* +
public 
bool 
Required 
{ 
get "
;" #
set$ '
;' (
}) *
public 
bool 
Checked 
{ 
get !
;! "
set# &
;& '
}( )
} 
} �
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Diagnostics\DiagnosticsController.cs
	namespace 	
IdentityServer4
 
. 

Quickstart $
.$ %
UI% '
{ 
[ 
SecurityHeaders 
] 
[ 
	Authorize 
] 
public 

class !
DiagnosticsController &
:' (

Controller) 3
{ 
public 
async 
Task 
< 
IActionResult '
>' (
Index) .
(. /
)/ 0
{ 	
var 
localAddresses 
=  
new! $
string% +
[+ ,
], -
{. /
$str0 ;
,; <
$str= B
,B C
HttpContextD O
.O P

ConnectionP Z
.Z [
LocalIpAddress[ i
.i j
ToStringj r
(r s
)s t
}u v
;v w
if 
( 
! 
localAddresses 
.  
Contains  (
(( )
HttpContext) 4
.4 5

Connection5 ?
.? @
RemoteIpAddress@ O
.O P
ToStringP X
(X Y
)Y Z
)Z [
)[ \
{ 
return 
NotFound 
(  
)  !
;! "
} 
var 
model 
= 
new  
DiagnosticsViewModel 0
(0 1
await1 6
HttpContext7 B
.B C
AuthenticateAsyncC T
(T U
)U V
)V W
;W X
return 
View 
( 
model 
) 
; 
} 	
} 
} �
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Diagnostics\DiagnosticsViewModel.cs
	namespace 	
IdentityServer4
 
. 

Quickstart $
.$ %
UI% '
{ 
public 

class  
DiagnosticsViewModel %
{ 
public  
DiagnosticsViewModel #
(# $
AuthenticateResult$ 6
result7 =
)= >
{ 	
AuthenticateResult 
=  
result! '
;' (
if 
( 
result 
. 

Properties !
.! "
Items" '
.' (
ContainsKey( 3
(3 4
$str4 A
)A B
)B C
{ 
var 
encoded 
= 
result $
.$ %

Properties% /
./ 0
Items0 5
[5 6
$str6 C
]C D
;D E
var 
bytes 
= 
	Base64Url %
.% &
Decode& ,
(, -
encoded- 4
)4 5
;5 6
var 
value 
= 
Encoding $
.$ %
UTF8% )
.) *
	GetString* 3
(3 4
bytes4 9
)9 :
;: ;
Clients 
= 
JsonConvert %
.% &
DeserializeObject& 7
<7 8
string8 >
[> ?
]? @
>@ A
(A B
valueB G
)G H
;H I
} 
} 	
public 
AuthenticateResult !
AuthenticateResult" 4
{5 6
get7 :
;: ;
}< =
public 
IEnumerable 
< 
string !
>! "
Clients# *
{+ ,
get- 0
;0 1
}2 3
=4 5
new6 9
List: >
<> ?
string? E
>E F
(F G
)G H
;H I
} 
}   �-
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Grants\GrantsController.cs
	namespace 	
IdentityServer4
 
. 

Quickstart $
.$ %
UI% '
{ 
[ 
SecurityHeaders 
] 
[ 
	Authorize 
] 
public 

class 
GrantsController !
:" #

Controller$ .
{ 
private 
readonly -
!IIdentityServerInteractionService :
_interaction; G
;G H
private 
readonly 
IClientStore %
_clients& .
;. /
private 
readonly 
IResourceStore '

_resources( 2
;2 3
public 
GrantsController 
(  -
!IIdentityServerInteractionService  A
interactionB M
,M N
IClientStore 
clients  
,  !
IResourceStore 
	resources $
)$ %
{ 	
_interaction 
= 
interaction &
;& '
_clients 
= 
clients 
; 

_resources   
=   
	resources   "
;  " #
}!! 	
[&& 	
HttpGet&&	 
]&& 
public'' 
async'' 
Task'' 
<'' 
IActionResult'' '
>''' (
Index'') .
(''. /
)''/ 0
{(( 	
return)) 
View)) 
()) 
$str)) 
,))  
await))! &
BuildViewModelAsync))' :
()): ;
))); <
)))< =
;))= >
}** 	
[// 	
HttpPost//	 
]// 
[00 	$
ValidateAntiForgeryToken00	 !
]00! "
public11 
async11 
Task11 
<11 
IActionResult11 '
>11' (
Revoke11) /
(11/ 0
string110 6
clientId117 ?
)11? @
{22 	
await33 
_interaction33 
.33 "
RevokeUserConsentAsync33 5
(335 6
clientId336 >
)33> ?
;33? @
return44 
RedirectToAction44 #
(44# $
$str44$ +
)44+ ,
;44, -
}55 	
private77 
async77 
Task77 
<77 
GrantsViewModel77 *
>77* +
BuildViewModelAsync77, ?
(77? @
)77@ A
{88 	
var99 
grants99 
=99 
await99 
_interaction99 +
.99+ ,#
GetAllUserConsentsAsync99, C
(99C D
)99D E
;99E F
var;; 
list;; 
=;; 
new;; 
List;; 
<;;  
GrantViewModel;;  .
>;;. /
(;;/ 0
);;0 1
;;;1 2
foreach<< 
(<< 
var<< 
grant<< 
in<< !
grants<<" (
)<<( )
{== 
var>> 
client>> 
=>> 
await>> "
_clients>># +
.>>+ ,
FindClientByIdAsync>>, ?
(>>? @
grant>>@ E
.>>E F
ClientId>>F N
)>>N O
;>>O P
if?? 
(?? 
client?? 
!=?? 
null?? "
)??" #
{@@ 
varAA 
	resourcesAA !
=AA" #
awaitAA$ )

_resourcesAA* 4
.AA4 5%
FindResourcesByScopeAsyncAA5 N
(AAN O
grantAAO T
.AAT U
ScopesAAU [
)AA[ \
;AA\ ]
varCC 
itemCC 
=CC 
newCC "
GrantViewModelCC# 1
(CC1 2
)CC2 3
{DD 
ClientIdEE  
=EE! "
clientEE# )
.EE) *
ClientIdEE* 2
,EE2 3

ClientNameFF "
=FF# $
clientFF% +
.FF+ ,

ClientNameFF, 6
??FF7 9
clientFF: @
.FF@ A
ClientIdFFA I
,FFI J
ClientLogoUrlGG %
=GG& '
clientGG( .
.GG. /
LogoUriGG/ 6
,GG6 7
	ClientUrlHH !
=HH" #
clientHH$ *
.HH* +
	ClientUriHH+ 4
,HH4 5
CreatedII 
=II  !
grantII" '
.II' (
CreationTimeII( 4
,II4 5
ExpiresJJ 
=JJ  !
grantJJ" '
.JJ' (

ExpirationJJ( 2
,JJ2 3
IdentityGrantNamesKK *
=KK+ ,
	resourcesKK- 6
.KK6 7
IdentityResourcesKK7 H
.KKH I
SelectKKI O
(KKO P
xKKP Q
=>KKR T
xKKU V
.KKV W
DisplayNameKKW b
??KKc e
xKKf g
.KKg h
NameKKh l
)KKl m
.KKm n
ToArrayKKn u
(KKu v
)KKv w
,KKw x
ApiGrantNamesLL %
=LL& '
	resourcesLL( 1
.LL1 2
ApiResourcesLL2 >
.LL> ?
SelectLL? E
(LLE F
xLLF G
=>LLH J
xLLK L
.LLL M
DisplayNameLLM X
??LLY [
xLL\ ]
.LL] ^
NameLL^ b
)LLb c
.LLc d
ToArrayLLd k
(LLk l
)LLl m
}MM 
;MM 
listOO 
.OO 
AddOO 
(OO 
itemOO !
)OO! "
;OO" #
}PP 
}QQ 
returnSS 
newSS 
GrantsViewModelSS &
{TT 
GrantsUU 
=UU 
listUU 
}VV 
;VV 
}WW 	
}XX 
}YY �
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Grants\GrantsViewModel.cs
	namespace 	
IdentityServer4
 
. 

Quickstart $
.$ %
UI% '
{		 
public

 

class

 
GrantsViewModel

  
{ 
public 
IEnumerable 
< 
GrantViewModel )
>) *
Grants+ 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
} 
public 

class 
GrantViewModel 
{ 
public 
string 
ClientId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 

ClientName  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
	ClientUrl 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
ClientLogoUrl #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
DateTime 
Created 
{  !
get" %
;% &
set' *
;* +
}, -
public 
DateTime 
? 
Expires  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
IEnumerable 
< 
string !
>! "
IdentityGrantNames# 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
public 
IEnumerable 
< 
string !
>! "
ApiGrantNames# 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
} 
} �
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Home\ErrorViewModel.cs
	namespace 	
IdentityServer4
 
. 

Quickstart $
.$ %
UI% '
{ 
public		 

class		 
ErrorViewModel		 
{

 
public 
ErrorMessage 
Error !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} �
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Home\HomeController.cs
	namespace		 	
IdentityServer4		
 
.		 

Quickstart		 $
.		$ %
UI		% '
{

 
[ 
SecurityHeaders 
] 
public 

class 
HomeController 
:  !

Controller" ,
{ 
private 
readonly -
!IIdentityServerInteractionService :
_interaction; G
;G H
public 
HomeController 
( -
!IIdentityServerInteractionService ?
interaction@ K
)K L
{ 	
_interaction 
= 
interaction &
;& '
} 	
public 
IActionResult 
Index "
(" #
)# $
{ 	
return 
View 
( 
) 
; 
} 	
public 
async 
Task 
< 
IActionResult '
>' (
Error) .
(. /
string/ 5
errorId6 =
)= >
{ 	
var 
vm 
= 
new 
ErrorViewModel '
(' (
)( )
;) *
var"" 
message"" 
="" 
await"" 
_interaction""  ,
."", - 
GetErrorContextAsync""- A
(""A B
errorId""B I
)""I J
;""J K
if## 
(## 
message## 
!=## 
null## 
)##  
{$$ 
vm%% 
.%% 
Error%% 
=%% 
message%% "
;%%" #
}&& 
return(( 
View(( 
((( 
$str(( 
,((  
vm((! #
)((# $
;(($ %
})) 	
}** 
}++ �
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\SecurityHeadersAttribute.cs
	namespace 	
IdentityServer4
 
. 

Quickstart $
.$ %
UI% '
{		 
public

 

class

 $
SecurityHeadersAttribute

 )
:

* +!
ActionFilterAttribute

, A
{ 
public 
override 
void 
OnResultExecuting .
(. /"
ResultExecutingContext/ E
contextF M
)M N
{ 	
var 
result 
= 
context  
.  !
Result! '
;' (
if 
( 
result 
is 

ViewResult $
)$ %
{ 
if 
( 
! 
context 
. 
HttpContext (
.( )
Response) 1
.1 2
Headers2 9
.9 :
ContainsKey: E
(E F
$strF ^
)^ _
)_ `
{ 
context 
. 
HttpContext '
.' (
Response( 0
.0 1
Headers1 8
.8 9
Add9 <
(< =
$str= U
,U V
$strW `
)` a
;a b
} 
if 
( 
! 
context 
. 
HttpContext (
.( )
Response) 1
.1 2
Headers2 9
.9 :
ContainsKey: E
(E F
$strF W
)W X
)X Y
{ 
context 
. 
HttpContext '
.' (
Response( 0
.0 1
Headers1 8
.8 9
Add9 <
(< =
$str= N
,N O
$strP \
)\ ]
;] ^
} 
var 
csp 
= 
$str	 �
;
� �
if%% 
(%% 
!%% 
context%% 
.%% 
HttpContext%% (
.%%( )
Response%%) 1
.%%1 2
Headers%%2 9
.%%9 :
ContainsKey%%: E
(%%E F
$str%%F _
)%%_ `
)%%` a
{&& 
context'' 
.'' 
HttpContext'' '
.''' (
Response''( 0
.''0 1
Headers''1 8
.''8 9
Add''9 <
(''< =
$str''= V
,''V W
csp''X [
)''[ \
;''\ ]
}(( 
if** 
(** 
!** 
context** 
.** 
HttpContext** (
.**( )
Response**) 1
.**1 2
Headers**2 9
.**9 :
ContainsKey**: E
(**E F
$str**F a
)**a b
)**b c
{++ 
context,, 
.,, 
HttpContext,, '
.,,' (
Response,,( 0
.,,0 1
Headers,,1 8
.,,8 9
Add,,9 <
(,,< =
$str,,= X
,,,X Y
csp,,Z ]
),,] ^
;,,^ _
}-- 
var00 
referrer_policy00 #
=00$ %
$str00& 3
;003 4
if11 
(11 
!11 
context11 
.11 
HttpContext11 (
.11( )
Response11) 1
.111 2
Headers112 9
.119 :
ContainsKey11: E
(11E F
$str11F W
)11W X
)11X Y
{22 
context33 
.33 
HttpContext33 '
.33' (
Response33( 0
.330 1
Headers331 8
.338 9
Add339 <
(33< =
$str33= N
,33N O
referrer_policy33P _
)33_ `
;33` a
}44 
}55 
}66 	
}77 
}88 �P
jC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Startup.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
AspNetIdentity  .
{ 
public 

class 
Startup 
{ 
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 
IHostingEnvironment "
Environment# .
{/ 0
get1 4
;4 5
}6 7
public 
Startup 
( 
IHostingEnvironment *
environment+ 6
)6 7
{ 	
var 
builder 
= 
new  
ConfigurationBuilder 2
(2 3
)3 4
. 
SetBasePath 
( 
environment (
.( )
ContentRootPath) 8
)8 9
. 
AddJsonFile 
( 
$str /
,/ 0
optional1 9
:9 :
true; ?
,? @
reloadOnChangeA O
:O P
trueQ U
)U V
. 
AddJsonFile 
( 
$" 
appsettings. +
{+ ,
environment, 7
.7 8
EnvironmentName8 G
}G H
.jsonH M
"M N
,N O
optionalP X
:X Y
trueZ ^
,^ _
reloadOnChange` n
:n o
truep t
)t u
.   #
AddEnvironmentVariables   (
(  ( )
)  ) *
;  * +
if"" 
("" 
environment"" 
."" 
IsDevelopment"" )
("") *
)""* +
)""+ ,
{## 
}%% 
Configuration'' 
='' 
builder'' #
.''# $
Build''$ )
('') *
)''* +
;''+ ,
Environment(( 
=(( 
environment(( %
;((% &
})) 	
public++ 
void++ 
ConfigureServices++ %
(++% &
IServiceCollection++& 8
services++9 A
)++A B
{,, 	
string-- 
connectionString-- #
=--$ %
Configuration--& 3
.--3 4
GetConnectionString--4 G
(--G H
$str--H Y
)--Y Z
;--Z [
var.. 
migrationsAssembly.. "
=..# $
typeof..% +
(..+ ,
Startup.., 3
)..3 4
...4 5
GetTypeInfo..5 @
(..@ A
)..A B
...B C
Assembly..C K
...K L
GetName..L S
(..S T
)..T U
...U V
Name..V Z
;..Z [
services00 
.00 
AddHealthChecks00 $
(00$ %
Configuration00% 2
)002 3
.11 "
AddCustomConfiguration11 '
(11' (
Configuration11( 5
)115 6
;116 7
services33 
.33 
AddDbContext33 !
<33! "
AdminDbContext33" 0
>330 1
(331 2
options332 9
=>33: <
options44 
.44 
UseSqlServer44 $
(44$ %
connectionString44% 5
)445 6
)446 7
;447 8
services66 
.66 
AddIdentity66  
<66  !
UserIdentity66! -
,66- .
UserIdentityRole66/ ?
>66? @
(66@ A
)66A B
.77 $
AddEntityFrameworkStores77 )
<77) *
AdminDbContext77* 8
>778 9
(779 :
)77: ;
.88 $
AddDefaultTokenProviders88 )
(88) *
)88* +
;88+ ,
services:: 
.:: 
AddMvc:: 
(:: 
):: 
;:: 
services<< 
.<< 
	Configure<< 
<<< 

IISOptions<< )
><<) *
(<<* +
iis<<+ .
=><</ 1
{== 
iis>> 
.>> %
AuthenticationDisplayName>> -
=>>. /
$str>>0 9
;>>9 :
iis?? 
.?? #
AutomaticAuthentication?? +
=??, -
false??. 3
;??3 4
}@@ 
)@@ 
;@@ 
varBB 
builderBB 
=BB 
servicesBB "
.BB" #
AddIdentityServerBB# 4
(BB4 5
optionsBB5 <
=>BB= ?
{CC 
optionsDD 
.DD 
EventsDD 
.DD 
RaiseErrorEventsDD /
=DD0 1
trueDD2 6
;DD6 7
optionsEE 
.EE 
EventsEE 
.EE "
RaiseInformationEventsEE 5
=EE6 7
trueEE8 <
;EE< =
optionsFF 
.FF 
EventsFF 
.FF 
RaiseFailureEventsFF 1
=FF2 3
trueFF4 8
;FF8 9
optionsGG 
.GG 
EventsGG 
.GG 
RaiseSuccessEventsGG 1
=GG2 3
trueGG4 8
;GG8 9
}HH 
)HH 
.II 
AddAspNetIdentityII "
<II" #
UserIdentityII# /
>II/ 0
(II0 1
)II1 2
.KK !
AddConfigurationStoreKK &
(KK& '
optionsKK' .
=>KK/ 1
{LL 
optionsMM 
.MM 
ConfigureDbContextMM .
=MM/ 0
bMM1 2
=>MM3 5
bNN 
.NN 
UseSqlServerNN &
(NN& '
connectionStringNN' 7
,NN7 8
sqlOO 
=>OO  "
sqlOO# &
.OO& '
MigrationsAssemblyOO' 9
(OO9 :
migrationsAssemblyOO: L
)OOL M
)OOM N
;OON O
}PP 
)PP 
.RR 
AddOperationalStoreRR $
(RR$ %
optionsRR% ,
=>RR- /
{SS 
optionsTT 
.TT 
ConfigureDbContextTT .
=TT/ 0
bTT1 2
=>TT3 5
bUU 
.UU 
UseSqlServerUU &
(UU& '
connectionStringUU' 7
,UU7 8
sqlVV 
=>VV  "
sqlVV# &
.VV& '
MigrationsAssemblyVV' 9
(VV9 :
migrationsAssemblyVV: L
)VVL M
)VVM N
;VVN O
optionsYY 
.YY 
EnableTokenCleanupYY .
=YY/ 0
trueYY1 5
;YY5 6
}[[ 
)[[ 
;[[ 
services]] 
.]] 
	Configure]] 
<]] #
ForwardedHeadersOptions]] 6
>]]6 7
(]]7 8
options]]8 ?
=>]]@ B
{^^ 
options__ 
.__ 
ForwardedHeaders__ (
=__) *
ForwardedHeaders__+ ;
.__; <
XForwardedFor__< I
|__J K
ForwardedHeaders__L \
.__\ ]
XForwardedProto__] l
;__l m
}`` 
)`` 
;`` 
ifbb 
(bb 
Environmentbb 
.bb 
IsDevelopmentbb )
(bb) *
)bb* +
)bb+ ,
{cc 
builderdd 
.dd )
AddDeveloperSigningCredentialdd 5
(dd5 6
)dd6 7
;dd7 8
}ee 
elseff 
{gg 
throwhh 
newhh 
	Exceptionhh #
(hh# $
$strhh$ D
)hhD E
;hhE F
}ii 
}jj 	
publicll 
voidll 
	Configurell 
(ll 
IApplicationBuilderll 1
appll2 5
,ll5 6
IHostingEnvironmentll7 J
envllK N
,llN O
ILoggerFactoryllP ^
loggerFactoryll_ l
)lll m
{mm 	
varnn 
pathBasenn 
=nn 
Configurationnn (
[nn( )
$strnn) 4
]nn4 5
;nn5 6
ifoo 
(oo 
!oo 
stringoo 
.oo 
IsNullOrEmptyoo %
(oo% &
pathBaseoo& .
)oo. /
)oo/ 0
{pp 
loggerFactoryqq 
.qq 
CreateLoggerqq *
<qq* +
Startupqq+ 2
>qq2 3
(qq3 4
)qq4 5
.qq5 6
LogDebugqq6 >
(qq> ?
$strqq? ]
,qq] ^
pathBaseqq_ g
)qqg h
;qqh i
apprr 
.rr 
UsePathBaserr 
(rr  
pathBaserr  (
)rr( )
;rr) *
}ss 
ifuu 
(uu 
envuu 
.uu 
IsDevelopmentuu !
(uu! "
)uu" #
)uu# $
{vv 
appww 
.ww %
UseDeveloperExceptionPageww -
(ww- .
)ww. /
;ww/ 0
}xx 
appzz 
.zz 
UseHealthCheckszz 
(zz  
$strzz  +
,zz+ ,
newzz- 0
HealthCheckOptionszz1 C
{{{ 
	Predicate|| 
=|| 
r|| 
=>||  
r||! "
.||" #
Name||# '
.||' (
Contains||( 0
(||0 1
$str||1 7
)||7 8
}}} 
)}} 
;}} 
app 
. 
UseHealthChecks 
(  
$str  %
,% &
new' *
HealthCheckOptions+ =
(= >
)> ?
{
�� 
	Predicate
�� 
=
�� 
_
�� 
=>
��  
true
��! %
,
��% &
ResponseWriter
�� 
=
��  
UIResponseWriter
��! 1
.
��1 2(
WriteHealthCheckUIResponse
��2 L
}
�� 
)
�� 
;
�� 
app
�� 
.
�� 
UseStaticFiles
�� 
(
�� 
)
��  
;
��  !
app
�� 
.
�� 
UseIdentityServer
�� !
(
��! "
)
��" #
;
��# $
app
�� 
.
�� $
UseMvcWithDefaultRoute
�� &
(
��& '
)
��' (
;
��( )
}
�� 	
}
�� 
}�� 