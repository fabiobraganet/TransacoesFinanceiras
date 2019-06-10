÷
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
}66 ˇ
ÑC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Infrastructure\AdminDbContextSeed.cs
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
ILogger	y Ä
<
Ä Å 
AdminDbContextSeed
Å ì
>
ì î
logger
ï õ
)
õ ú
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
} Æ
¢C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Infrastructure\Exceptions\FailingMiddlewareAppBuilderExtensions.cs
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
} £5
èC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Infrastructure\Middlewares\FailingMiddleware.cs
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
}UU  
åC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Infrastructure\Middlewares\FailingOptions.cs
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
} Õ
íC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Infrastructure\Middlewares\FailingStartupFilter.cs
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
} È

óC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Infrastructure\Middlewares\WebHostBuildertExtensions.cs
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
} ∂5
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
+	 Ä
$num
Å Ç
)
Ç É
;
É Ñ
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
}UU õ
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
} ÄÅ
áC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Account\AccountController.cs
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
lockoutOnFailure	cc{ ã
:
ccã å
true
ccç ë
)
ccë í
;
ccí ì
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
ÄÄ 	
HttpGet
ÄÄ	 
]
ÄÄ 
public
ÅÅ 
async
ÅÅ 
Task
ÅÅ 
<
ÅÅ 
IActionResult
ÅÅ '
>
ÅÅ' (
ExternalLogin
ÅÅ) 6
(
ÅÅ6 7
string
ÅÅ7 =
provider
ÅÅ> F
,
ÅÅF G
string
ÅÅH N
	returnUrl
ÅÅO X
)
ÅÅX Y
{
ÇÇ 	
if
ÉÉ 
(
ÉÉ 
AccountOptions
ÉÉ 
.
ÉÉ -
WindowsAuthenticationSchemeName
ÉÉ >
==
ÉÉ? A
provider
ÉÉB J
)
ÉÉJ K
{
ÑÑ 
return
ÜÜ 
await
ÜÜ &
ProcessWindowsLoginAsync
ÜÜ 5
(
ÜÜ5 6
	returnUrl
ÜÜ6 ?
)
ÜÜ? @
;
ÜÜ@ A
}
áá 
else
àà 
{
ââ 
var
ãã 
props
ãã 
=
ãã 
new
ãã &
AuthenticationProperties
ãã  8
(
ãã8 9
)
ãã9 :
{
åå 
RedirectUri
çç 
=
çç  !
Url
çç" %
.
çç% &
Action
çç& ,
(
çç, -
$str
çç- D
)
ççD E
,
ççE F
Items
éé 
=
éé 
{
èè 
{
êê 
$str
êê %
,
êê% &
	returnUrl
êê' 0
}
êê1 2
,
êê2 3
{
ëë 
$str
ëë "
,
ëë" #
provider
ëë$ ,
}
ëë- .
,
ëë. /
}
íí 
}
ìì 
;
ìì 
return
îî 
	Challenge
îî  
(
îî  !
props
îî! &
,
îî& '
provider
îî( 0
)
îî0 1
;
îî1 2
}
ïï 
}
ññ 	
[
õõ 	
HttpGet
õõ	 
]
õõ 
public
úú 
async
úú 
Task
úú 
<
úú 
IActionResult
úú '
>
úú' (#
ExternalLoginCallback
úú) >
(
úú> ?
)
úú? @
{
ùù 	
var
üü 
result
üü 
=
üü 
await
üü 
HttpContext
üü *
.
üü* +
AuthenticateAsync
üü+ <
(
üü< =
IdentityConstants
üü= N
.
üüN O
ExternalScheme
üüO ]
)
üü] ^
;
üü^ _
if
†† 
(
†† 
result
†† 
?
†† 
.
†† 
	Succeeded
†† !
!=
††" $
true
††% )
)
††) *
{
°° 
throw
¢¢ 
new
¢¢ 
	Exception
¢¢ #
(
¢¢# $
$str
¢¢$ C
)
¢¢C D
;
¢¢D E
}
££ 
var
¶¶ 
(
¶¶ 
user
¶¶ 
,
¶¶ 
provider
¶¶ 
,
¶¶  
providerUserId
¶¶! /
,
¶¶/ 0
claims
¶¶1 7
)
¶¶7 8
=
¶¶9 :
await
¶¶; @/
!FindUserFromExternalProviderAsync
¶¶A b
(
¶¶b c
result
¶¶c i
)
¶¶i j
;
¶¶j k
if
ßß 
(
ßß 
user
ßß 
==
ßß 
null
ßß 
)
ßß 
{
®® 
user
¨¨ 
=
¨¨ 
await
¨¨ $
AutoProvisionUserAsync
¨¨ 3
(
¨¨3 4
provider
¨¨4 <
,
¨¨< =
providerUserId
¨¨> L
,
¨¨L M
claims
¨¨N T
)
¨¨T U
;
¨¨U V
}
≠≠ 
var
≤≤ #
additionalLocalClaims
≤≤ %
=
≤≤& '
new
≤≤( +
List
≤≤, 0
<
≤≤0 1
Claim
≤≤1 6
>
≤≤6 7
(
≤≤7 8
)
≤≤8 9
;
≤≤9 :
var
≥≥ 
localSignInProps
≥≥  
=
≥≥! "
new
≥≥# &&
AuthenticationProperties
≥≥' ?
(
≥≥? @
)
≥≥@ A
;
≥≥A B)
ProcessLoginCallbackForOidc
¥¥ '
(
¥¥' (
result
¥¥( .
,
¥¥. /#
additionalLocalClaims
¥¥0 E
,
¥¥E F
localSignInProps
¥¥G W
)
¥¥W X
;
¥¥X Y*
ProcessLoginCallbackForWsFed
µµ (
(
µµ( )
result
µµ) /
,
µµ/ 0#
additionalLocalClaims
µµ1 F
,
µµF G
localSignInProps
µµH X
)
µµX Y
;
µµY Z+
ProcessLoginCallbackForSaml2p
∂∂ )
(
∂∂) *
result
∂∂* 0
,
∂∂0 1#
additionalLocalClaims
∂∂2 G
,
∂∂G H
localSignInProps
∂∂I Y
)
∂∂Y Z
;
∂∂Z [
var
ªª 
	principal
ªª 
=
ªª 
await
ªª !
_signInManager
ªª" 0
.
ªª0 1&
CreateUserPrincipalAsync
ªª1 I
(
ªªI J
user
ªªJ N
)
ªªN O
;
ªªO P#
additionalLocalClaims
ºº !
.
ºº! "
AddRange
ºº" *
(
ºº* +
	principal
ºº+ 4
.
ºº4 5
Claims
ºº5 ;
)
ºº; <
;
ºº< =
var
ΩΩ 
name
ΩΩ 
=
ΩΩ 
	principal
ΩΩ  
.
ΩΩ  !
	FindFirst
ΩΩ! *
(
ΩΩ* +
JwtClaimTypes
ΩΩ+ 8
.
ΩΩ8 9
Name
ΩΩ9 =
)
ΩΩ= >
?
ΩΩ> ?
.
ΩΩ? @
Value
ΩΩ@ E
??
ΩΩF H
user
ΩΩI M
.
ΩΩM N
Id
ΩΩN P
.
ΩΩP Q
ToString
ΩΩQ Y
(
ΩΩY Z
)
ΩΩZ [
;
ΩΩ[ \
await
ææ 
_events
ææ 
.
ææ 

RaiseAsync
ææ $
(
ææ$ %
new
ææ% (#
UserLoginSuccessEvent
ææ) >
(
ææ> ?
provider
ææ? G
,
ææG H
providerUserId
ææI W
,
ææW X
user
ææY ]
.
ææ] ^
Id
ææ^ `
.
ææ` a
ToString
ææa i
(
ææi j
)
ææj k
,
ææk l
name
ææm q
)
ææq r
)
æær s
;
ææs t
await
øø 
HttpContext
øø 
.
øø 
SignInAsync
øø )
(
øø) *
user
øø* .
.
øø. /
Id
øø/ 1
.
øø1 2
ToString
øø2 :
(
øø: ;
)
øø; <
,
øø< =
name
øø> B
,
øøB C
provider
øøD L
,
øøL M
localSignInProps
øøN ^
,
øø^ _#
additionalLocalClaims
øø` u
.
øøu v
ToArray
øøv }
(
øø} ~
)
øø~ 
)øø Ä
;øøÄ Å
await
¬¬ 
HttpContext
¬¬ 
.
¬¬ 
SignOutAsync
¬¬ *
(
¬¬* +
IdentityConstants
¬¬+ <
.
¬¬< =
ExternalScheme
¬¬= K
)
¬¬K L
;
¬¬L M
var
≈≈ 
	returnUrl
≈≈ 
=
≈≈ 
result
≈≈ "
.
≈≈" #

Properties
≈≈# -
.
≈≈- .
Items
≈≈. 3
[
≈≈3 4
$str
≈≈4 ?
]
≈≈? @
;
≈≈@ A
if
∆∆ 
(
∆∆ 
_interaction
∆∆ 
.
∆∆ 
IsValidReturnUrl
∆∆ -
(
∆∆- .
	returnUrl
∆∆. 7
)
∆∆7 8
||
∆∆9 ;
Url
∆∆< ?
.
∆∆? @

IsLocalUrl
∆∆@ J
(
∆∆J K
	returnUrl
∆∆K T
)
∆∆T U
)
∆∆U V
{
«« 
return
»» 
Redirect
»» 
(
»»  
	returnUrl
»»  )
)
»») *
;
»»* +
}
…… 
return
ÀÀ 
Redirect
ÀÀ 
(
ÀÀ 
$str
ÀÀ  
)
ÀÀ  !
;
ÀÀ! "
}
ÃÃ 	
[
—— 	
HttpGet
——	 
]
—— 
public
““ 
async
““ 
Task
““ 
<
““ 
IActionResult
““ '
>
““' (
Logout
““) /
(
““/ 0
string
““0 6
logoutId
““7 ?
)
““? @
{
”” 	
var
’’ 
vm
’’ 
=
’’ 
await
’’ '
BuildLogoutViewModelAsync
’’ 4
(
’’4 5
logoutId
’’5 =
)
’’= >
;
’’> ?
if
◊◊ 
(
◊◊ 
vm
◊◊ 
.
◊◊ 
ShowLogoutPrompt
◊◊ #
==
◊◊$ &
false
◊◊' ,
)
◊◊, -
{
ÿÿ 
return
€€ 
await
€€ 
Logout
€€ #
(
€€# $
vm
€€$ &
)
€€& '
;
€€' (
}
‹‹ 
return
ﬁﬁ 
View
ﬁﬁ 
(
ﬁﬁ 
vm
ﬁﬁ 
)
ﬁﬁ 
;
ﬁﬁ 
}
ﬂﬂ 	
[
‰‰ 	
HttpPost
‰‰	 
]
‰‰ 
[
ÂÂ 	&
ValidateAntiForgeryToken
ÂÂ	 !
]
ÂÂ! "
public
ÊÊ 
async
ÊÊ 
Task
ÊÊ 
<
ÊÊ 
IActionResult
ÊÊ '
>
ÊÊ' (
Logout
ÊÊ) /
(
ÊÊ/ 0
LogoutInputModel
ÊÊ0 @
model
ÊÊA F
)
ÊÊF G
{
ÁÁ 	
var
ÈÈ 
vm
ÈÈ 
=
ÈÈ 
await
ÈÈ *
BuildLoggedOutViewModelAsync
ÈÈ 7
(
ÈÈ7 8
model
ÈÈ8 =
.
ÈÈ= >
LogoutId
ÈÈ> F
)
ÈÈF G
;
ÈÈG H
if
ÎÎ 
(
ÎÎ 
User
ÎÎ 
?
ÎÎ 
.
ÎÎ 
Identity
ÎÎ 
.
ÎÎ 
IsAuthenticated
ÎÎ .
==
ÎÎ/ 1
true
ÎÎ2 6
)
ÎÎ6 7
{
ÏÏ 
await
ÓÓ 
_signInManager
ÓÓ $
.
ÓÓ$ %
SignOutAsync
ÓÓ% 1
(
ÓÓ1 2
)
ÓÓ2 3
;
ÓÓ3 4
await
ÒÒ 
_events
ÒÒ 
.
ÒÒ 

RaiseAsync
ÒÒ (
(
ÒÒ( )
new
ÒÒ) ,$
UserLogoutSuccessEvent
ÒÒ- C
(
ÒÒC D
User
ÒÒD H
.
ÒÒH I
GetSubjectId
ÒÒI U
(
ÒÒU V
)
ÒÒV W
,
ÒÒW X
User
ÒÒY ]
.
ÒÒ] ^
GetDisplayName
ÒÒ^ l
(
ÒÒl m
)
ÒÒm n
)
ÒÒn o
)
ÒÒo p
;
ÒÒp q
}
ÚÚ 
if
ıı 
(
ıı 
vm
ıı 
.
ıı $
TriggerExternalSignout
ıı )
)
ıı) *
{
ˆˆ 
string
˙˙ 
url
˙˙ 
=
˙˙ 
Url
˙˙  
.
˙˙  !
Action
˙˙! '
(
˙˙' (
$str
˙˙( 0
,
˙˙0 1
new
˙˙2 5
{
˙˙6 7
logoutId
˙˙8 @
=
˙˙A B
vm
˙˙C E
.
˙˙E F
LogoutId
˙˙F N
}
˙˙O P
)
˙˙P Q
;
˙˙Q R
return
˝˝ 
SignOut
˝˝ 
(
˝˝ 
new
˝˝ "&
AuthenticationProperties
˝˝# ;
{
˝˝< =
RedirectUri
˝˝> I
=
˝˝J K
url
˝˝L O
}
˝˝P Q
,
˝˝Q R
vm
˝˝S U
.
˝˝U V*
ExternalAuthenticationScheme
˝˝V r
)
˝˝r s
;
˝˝s t
}
˛˛ 
return
ÄÄ 
View
ÄÄ 
(
ÄÄ 
$str
ÄÄ #
,
ÄÄ# $
vm
ÄÄ% '
)
ÄÄ' (
;
ÄÄ( )
}
ÅÅ 	
private
ÜÜ 
async
ÜÜ 
Task
ÜÜ 
<
ÜÜ 
LoginViewModel
ÜÜ )
>
ÜÜ) *&
BuildLoginViewModelAsync
ÜÜ+ C
(
ÜÜC D
string
ÜÜD J
	returnUrl
ÜÜK T
)
ÜÜT U
{
áá 	
var
àà 
context
àà 
=
àà 
await
àà 
_interaction
àà  ,
.
àà, -*
GetAuthorizationContextAsync
àà- I
(
ààI J
	returnUrl
ààJ S
)
ààS T
;
ààT U
if
ââ 
(
ââ 
context
ââ 
?
ââ 
.
ââ 
IdP
ââ 
!=
ââ 
null
ââ  $
)
ââ$ %
{
ää 
return
åå 
new
åå 
LoginViewModel
åå )
{
çç 
EnableLocalLogin
éé $
=
éé% &
false
éé' ,
,
éé, -
	ReturnUrl
èè 
=
èè 
	returnUrl
èè  )
,
èè) *
Username
êê 
=
êê 
context
êê &
?
êê& '
.
êê' (
	LoginHint
êê( 1
,
êê1 2
ExternalProviders
ëë %
=
ëë& '
new
ëë( +
ExternalProvider
ëë, <
[
ëë< =
]
ëë= >
{
ëë? @
new
ëëA D
ExternalProvider
ëëE U
{
ëëV W"
AuthenticationScheme
ëëX l
=
ëëm n
context
ëëo v
.
ëëv w
IdP
ëëw z
}
ëë{ |
}
ëë} ~
}
íí 
;
íí 
}
ìì 
var
ïï 
schemes
ïï 
=
ïï 
await
ïï 
_schemeProvider
ïï  /
.
ïï/ 0 
GetAllSchemesAsync
ïï0 B
(
ïïB C
)
ïïC D
;
ïïD E
var
óó 
	providers
óó 
=
óó 
schemes
óó #
.
òò 
Where
òò 
(
òò 
x
òò 
=>
òò 
x
òò 
.
òò 
DisplayName
òò )
!=
òò* ,
null
òò- 1
||
òò2 4
(
ôô 
x
ôô 
.
ôô 
Name
ôô #
.
ôô# $
Equals
ôô$ *
(
ôô* +
AccountOptions
ôô+ 9
.
ôô9 :-
WindowsAuthenticationSchemeName
ôô: Y
,
ôôY Z
StringComparison
ôô[ k
.
ôôk l
OrdinalIgnoreCase
ôôl }
)
ôô} ~
)
ôô~ 
)
öö 
.
õõ 
Select
õõ 
(
õõ 
x
õõ 
=>
õõ 
new
õõ  
ExternalProvider
õõ! 1
{
úú 
DisplayName
ùù 
=
ùù  !
x
ùù" #
.
ùù# $
DisplayName
ùù$ /
,
ùù/ 0"
AuthenticationScheme
ûû (
=
ûû) *
x
ûû+ ,
.
ûû, -
Name
ûû- 1
}
üü 
)
üü 
.
üü 
ToList
üü 
(
üü 
)
üü 
;
üü 
var
°° 

allowLocal
°° 
=
°° 
true
°° !
;
°°! "
if
¢¢ 
(
¢¢ 
context
¢¢ 
?
¢¢ 
.
¢¢ 
ClientId
¢¢ !
!=
¢¢" $
null
¢¢% )
)
¢¢) *
{
££ 
var
§§ 
client
§§ 
=
§§ 
await
§§ "
_clientStore
§§# /
.
§§/ 0(
FindEnabledClientByIdAsync
§§0 J
(
§§J K
context
§§K R
.
§§R S
ClientId
§§S [
)
§§[ \
;
§§\ ]
if
•• 
(
•• 
client
•• 
!=
•• 
null
•• "
)
••" #
{
¶¶ 

allowLocal
ßß 
=
ßß  
client
ßß! '
.
ßß' (
EnableLocalLogin
ßß( 8
;
ßß8 9
if
©© 
(
©© 
client
©© 
.
©© *
IdentityProviderRestrictions
©© ;
!=
©©< >
null
©©? C
&&
©©D F
client
©©G M
.
©©M N*
IdentityProviderRestrictions
©©N j
.
©©j k
Any
©©k n
(
©©n o
)
©©o p
)
©©p q
{
™™ 
	providers
´´ !
=
´´" #
	providers
´´$ -
.
´´- .
Where
´´. 3
(
´´3 4
provider
´´4 <
=>
´´= ?
client
´´@ F
.
´´F G*
IdentityProviderRestrictions
´´G c
.
´´c d
Contains
´´d l
(
´´l m
provider
´´m u
.
´´u v#
AuthenticationScheme´´v ä
)´´ä ã
)´´ã å
.´´å ç
ToList´´ç ì
(´´ì î
)´´î ï
;´´ï ñ
}
¨¨ 
}
≠≠ 
}
ÆÆ 
return
∞∞ 
new
∞∞ 
LoginViewModel
∞∞ %
{
±±  
AllowRememberLogin
≤≤ "
=
≤≤# $
AccountOptions
≤≤% 3
.
≤≤3 4 
AllowRememberLogin
≤≤4 F
,
≤≤F G
EnableLocalLogin
≥≥  
=
≥≥! "

allowLocal
≥≥# -
&&
≥≥. 0
AccountOptions
≥≥1 ?
.
≥≥? @
AllowLocalLogin
≥≥@ O
,
≥≥O P
	ReturnUrl
¥¥ 
=
¥¥ 
	returnUrl
¥¥ %
,
¥¥% &
Username
µµ 
=
µµ 
context
µµ "
?
µµ" #
.
µµ# $
	LoginHint
µµ$ -
,
µµ- .
ExternalProviders
∂∂ !
=
∂∂" #
	providers
∂∂$ -
.
∂∂- .
ToArray
∂∂. 5
(
∂∂5 6
)
∂∂6 7
}
∑∑ 
;
∑∑ 
}
∏∏ 	
private
∫∫ 
async
∫∫ 
Task
∫∫ 
<
∫∫ 
LoginViewModel
∫∫ )
>
∫∫) *&
BuildLoginViewModelAsync
∫∫+ C
(
∫∫C D
LoginInputModel
∫∫D S
model
∫∫T Y
)
∫∫Y Z
{
ªª 	
var
ºº 
vm
ºº 
=
ºº 
await
ºº &
BuildLoginViewModelAsync
ºº 3
(
ºº3 4
model
ºº4 9
.
ºº9 :
	ReturnUrl
ºº: C
)
ººC D
;
ººD E
vm
ΩΩ 
.
ΩΩ 
Username
ΩΩ 
=
ΩΩ 
model
ΩΩ 
.
ΩΩ  
Username
ΩΩ  (
;
ΩΩ( )
vm
ææ 
.
ææ 
RememberLogin
ææ 
=
ææ 
model
ææ $
.
ææ$ %
RememberLogin
ææ% 2
;
ææ2 3
return
øø 
vm
øø 
;
øø 
}
¿¿ 	
private
¬¬ 
async
¬¬ 
Task
¬¬ 
<
¬¬ 
LogoutViewModel
¬¬ *
>
¬¬* +'
BuildLogoutViewModelAsync
¬¬, E
(
¬¬E F
string
¬¬F L
logoutId
¬¬M U
)
¬¬U V
{
√√ 	
var
ƒƒ 
vm
ƒƒ 
=
ƒƒ 
new
ƒƒ 
LogoutViewModel
ƒƒ (
{
ƒƒ) *
LogoutId
ƒƒ+ 3
=
ƒƒ4 5
logoutId
ƒƒ6 >
,
ƒƒ> ?
ShowLogoutPrompt
ƒƒ@ P
=
ƒƒQ R
AccountOptions
ƒƒS a
.
ƒƒa b
ShowLogoutPrompt
ƒƒb r
}
ƒƒs t
;
ƒƒt u
if
∆∆ 
(
∆∆ 
User
∆∆ 
?
∆∆ 
.
∆∆ 
Identity
∆∆ 
.
∆∆ 
IsAuthenticated
∆∆ .
!=
∆∆/ 1
true
∆∆2 6
)
∆∆6 7
{
«« 
vm
…… 
.
…… 
ShowLogoutPrompt
…… #
=
……$ %
false
……& +
;
……+ ,
return
   
vm
   
;
   
}
ÀÀ 
var
ÕÕ 
context
ÕÕ 
=
ÕÕ 
await
ÕÕ 
_interaction
ÕÕ  ,
.
ÕÕ, -#
GetLogoutContextAsync
ÕÕ- B
(
ÕÕB C
logoutId
ÕÕC K
)
ÕÕK L
;
ÕÕL M
if
ŒŒ 
(
ŒŒ 
context
ŒŒ 
?
ŒŒ 
.
ŒŒ 
ShowSignoutPrompt
ŒŒ *
==
ŒŒ+ -
false
ŒŒ. 3
)
ŒŒ3 4
{
œœ 
vm
—— 
.
—— 
ShowLogoutPrompt
—— #
=
——$ %
false
——& +
;
——+ ,
return
““ 
vm
““ 
;
““ 
}
”” 
return
◊◊ 
vm
◊◊ 
;
◊◊ 
}
ÿÿ 	
private
⁄⁄ 
async
⁄⁄ 
Task
⁄⁄ 
<
⁄⁄  
LoggedOutViewModel
⁄⁄ -
>
⁄⁄- .*
BuildLoggedOutViewModelAsync
⁄⁄/ K
(
⁄⁄K L
string
⁄⁄L R
logoutId
⁄⁄S [
)
⁄⁄[ \
{
€€ 	
var
›› 
logout
›› 
=
›› 
await
›› 
_interaction
›› +
.
››+ ,#
GetLogoutContextAsync
››, A
(
››A B
logoutId
››B J
)
››J K
;
››K L
var
ﬂﬂ 
vm
ﬂﬂ 
=
ﬂﬂ 
new
ﬂﬂ  
LoggedOutViewModel
ﬂﬂ +
{
‡‡ +
AutomaticRedirectAfterSignOut
·· -
=
··. /
AccountOptions
··0 >
.
··> ?+
AutomaticRedirectAfterSignOut
··? \
,
··\ ]#
PostLogoutRedirectUri
‚‚ %
=
‚‚& '
logout
‚‚( .
?
‚‚. /
.
‚‚/ 0#
PostLogoutRedirectUri
‚‚0 E
,
‚‚E F

ClientName
„„ 
=
„„ 
string
„„ #
.
„„# $
IsNullOrEmpty
„„$ 1
(
„„1 2
logout
„„2 8
?
„„8 9
.
„„9 :

ClientName
„„: D
)
„„D E
?
„„F G
logout
„„H N
?
„„N O
.
„„O P
ClientId
„„P X
:
„„Y Z
logout
„„[ a
?
„„a b
.
„„b c

ClientName
„„c m
,
„„m n
SignOutIframeUrl
‰‰  
=
‰‰! "
logout
‰‰# )
?
‰‰) *
.
‰‰* +
SignOutIFrameUrl
‰‰+ ;
,
‰‰; <
LogoutId
ÂÂ 
=
ÂÂ 
logoutId
ÂÂ #
}
ÊÊ 
;
ÊÊ 
if
ËË 
(
ËË 
User
ËË 
?
ËË 
.
ËË 
Identity
ËË 
.
ËË 
IsAuthenticated
ËË .
==
ËË/ 1
true
ËË2 6
)
ËË6 7
{
ÈÈ 
var
ÍÍ 
idp
ÍÍ 
=
ÍÍ 
User
ÍÍ 
.
ÍÍ 
	FindFirst
ÍÍ (
(
ÍÍ( )
JwtClaimTypes
ÍÍ) 6
.
ÍÍ6 7
IdentityProvider
ÍÍ7 G
)
ÍÍG H
?
ÍÍH I
.
ÍÍI J
Value
ÍÍJ O
;
ÍÍO P
if
ÎÎ 
(
ÎÎ 
idp
ÎÎ 
!=
ÎÎ 
null
ÎÎ 
&&
ÎÎ  "
idp
ÎÎ# &
!=
ÎÎ' )
IdentityServer4
ÎÎ* 9
.
ÎÎ9 :%
IdentityServerConstants
ÎÎ: Q
.
ÎÎQ R#
LocalIdentityProvider
ÎÎR g
)
ÎÎg h
{
ÏÏ 
var
ÌÌ %
providerSupportsSignout
ÌÌ /
=
ÌÌ0 1
await
ÌÌ2 7
HttpContext
ÌÌ8 C
.
ÌÌC D+
GetSchemeSupportsSignOutAsync
ÌÌD a
(
ÌÌa b
idp
ÌÌb e
)
ÌÌe f
;
ÌÌf g
if
ÓÓ 
(
ÓÓ %
providerSupportsSignout
ÓÓ /
)
ÓÓ/ 0
{
ÔÔ 
if
 
(
 
vm
 
.
 
LogoutId
 '
==
( *
null
+ /
)
/ 0
{
ÒÒ 
vm
ıı 
.
ıı 
LogoutId
ıı '
=
ıı( )
await
ıı* /
_interaction
ıı0 <
.
ıı< =&
CreateLogoutContextAsync
ıı= U
(
ııU V
)
ııV W
;
ııW X
}
ˆˆ 
vm
¯¯ 
.
¯¯ *
ExternalAuthenticationScheme
¯¯ 7
=
¯¯8 9
idp
¯¯: =
;
¯¯= >
}
˘˘ 
}
˙˙ 
}
˚˚ 
return
˝˝ 
vm
˝˝ 
;
˝˝ 
}
˛˛ 	
private
ÄÄ 
async
ÄÄ 
Task
ÄÄ 
<
ÄÄ 
IActionResult
ÄÄ (
>
ÄÄ( )&
ProcessWindowsLoginAsync
ÄÄ* B
(
ÄÄB C
string
ÄÄC I
	returnUrl
ÄÄJ S
)
ÄÄS T
{
ÅÅ 	
var
ÉÉ 
result
ÉÉ 
=
ÉÉ 
await
ÉÉ 
HttpContext
ÉÉ *
.
ÉÉ* +
AuthenticateAsync
ÉÉ+ <
(
ÉÉ< =
AccountOptions
ÉÉ= K
.
ÉÉK L-
WindowsAuthenticationSchemeName
ÉÉL k
)
ÉÉk l
;
ÉÉl m
if
ÑÑ 
(
ÑÑ 
result
ÑÑ 
?
ÑÑ 
.
ÑÑ 
	Principal
ÑÑ !
is
ÑÑ" $
WindowsPrincipal
ÑÑ% 5
wp
ÑÑ6 8
)
ÑÑ8 9
{
ÖÖ 
var
ââ 
props
ââ 
=
ââ 
new
ââ &
AuthenticationProperties
ââ  8
(
ââ8 9
)
ââ9 :
{
ää 
RedirectUri
ãã 
=
ãã  !
Url
ãã" %
.
ãã% &
Action
ãã& ,
(
ãã, -
$str
ãã- D
)
ããD E
,
ããE F
Items
åå 
=
åå 
{
çç 
{
éé 
$str
éé %
,
éé% &
	returnUrl
éé' 0
}
éé1 2
,
éé2 3
{
èè 
$str
èè "
,
èè" #
AccountOptions
èè$ 2
.
èè2 3-
WindowsAuthenticationSchemeName
èè3 R
}
èèS T
,
èèT U
}
êê 
}
ëë 
;
ëë 
var
ìì 
id
ìì 
=
ìì 
new
ìì 
ClaimsIdentity
ìì +
(
ìì+ ,
AccountOptions
ìì, :
.
ìì: ;-
WindowsAuthenticationSchemeName
ìì; Z
)
ììZ [
;
ìì[ \
id
îî 
.
îî 
AddClaim
îî 
(
îî 
new
îî 
Claim
îî  %
(
îî% &
JwtClaimTypes
îî& 3
.
îî3 4
Subject
îî4 ;
,
îî; <
wp
îî= ?
.
îî? @
Identity
îî@ H
.
îîH I
Name
îîI M
)
îîM N
)
îîN O
;
îîO P
id
ïï 
.
ïï 
AddClaim
ïï 
(
ïï 
new
ïï 
Claim
ïï  %
(
ïï% &
JwtClaimTypes
ïï& 3
.
ïï3 4
Name
ïï4 8
,
ïï8 9
wp
ïï: <
.
ïï< =
Identity
ïï= E
.
ïïE F
Name
ïïF J
)
ïïJ K
)
ïïK L
;
ïïL M
if
òò 
(
òò 
AccountOptions
òò "
.
òò" #"
IncludeWindowsGroups
òò# 7
)
òò7 8
{
ôô 
var
öö 
wi
öö 
=
öö 
wp
öö 
.
öö  
Identity
öö  (
as
öö) +
WindowsIdentity
öö, ;
;
öö; <
var
õõ 
groups
õõ 
=
õõ  
wi
õõ! #
.
õõ# $
Groups
õõ$ *
.
õõ* +
	Translate
õõ+ 4
(
õõ4 5
typeof
õõ5 ;
(
õõ; <
	NTAccount
õõ< E
)
õõE F
)
õõF G
;
õõG H
var
úú 
roles
úú 
=
úú 
groups
úú  &
.
úú& '
Select
úú' -
(
úú- .
x
úú. /
=>
úú0 2
new
úú3 6
Claim
úú7 <
(
úú< =
JwtClaimTypes
úú= J
.
úúJ K
Role
úúK O
,
úúO P
x
úúQ R
.
úúR S
Value
úúS X
)
úúX Y
)
úúY Z
;
úúZ [
id
ùù 
.
ùù 
	AddClaims
ùù  
(
ùù  !
roles
ùù! &
)
ùù& '
;
ùù' (
}
ûû 
await
†† 
HttpContext
†† !
.
††! "
SignInAsync
††" -
(
††- .
IdentityConstants
°° %
.
°°% &
ExternalScheme
°°& 4
,
°°4 5
new
¢¢ 
ClaimsPrincipal
¢¢ '
(
¢¢' (
id
¢¢( *
)
¢¢* +
,
¢¢+ ,
props
££ 
)
££ 
;
££ 
return
§§ 
Redirect
§§ 
(
§§  
props
§§  %
.
§§% &
RedirectUri
§§& 1
)
§§1 2
;
§§2 3
}
•• 
else
¶¶ 
{
ßß 
return
´´ 
	Challenge
´´  
(
´´  !
AccountOptions
´´! /
.
´´/ 0-
WindowsAuthenticationSchemeName
´´0 O
)
´´O P
;
´´P Q
}
¨¨ 
}
≠≠ 	
private
ØØ 
async
ØØ 
Task
ØØ 
<
ØØ 
(
ØØ 
UserIdentity
ØØ (
user
ØØ) -
,
ØØ- .
string
ØØ/ 5
provider
ØØ6 >
,
ØØ> ?
string
ØØ@ F
providerUserId
ØØG U
,
ØØU V
IEnumerable
ØØW b
<
ØØb c
Claim
ØØc h
>
ØØh i
claims
ØØj p
)
ØØp q
>
ØØq r/
!FindUserFromExternalProviderAsync
∞∞ -
(
∞∞- . 
AuthenticateResult
∞∞. @
result
∞∞A G
)
∞∞G H
{
±± 	
var
≤≤ 
externalUser
≤≤ 
=
≤≤ 
result
≤≤ %
.
≤≤% &
	Principal
≤≤& /
;
≤≤/ 0
var
∑∑ 
userIdClaim
∑∑ 
=
∑∑ 
externalUser
∑∑ *
.
∑∑* +
	FindFirst
∑∑+ 4
(
∑∑4 5
JwtClaimTypes
∑∑5 B
.
∑∑B C
Subject
∑∑C J
)
∑∑J K
??
∑∑L N
externalUser
∏∏ *
.
∏∏* +
	FindFirst
∏∏+ 4
(
∏∏4 5

ClaimTypes
∏∏5 ?
.
∏∏? @
NameIdentifier
∏∏@ N
)
∏∏N O
??
∏∏P R
throw
ππ #
new
ππ$ '
	Exception
ππ( 1
(
ππ1 2
$str
ππ2 B
)
ππB C
;
ππC D
var
ºº 
claims
ºº 
=
ºº 
externalUser
ºº %
.
ºº% &
Claims
ºº& ,
.
ºº, -
ToList
ºº- 3
(
ºº3 4
)
ºº4 5
;
ºº5 6
claims
ΩΩ 
.
ΩΩ 
Remove
ΩΩ 
(
ΩΩ 
userIdClaim
ΩΩ %
)
ΩΩ% &
;
ΩΩ& '
var
øø 
provider
øø 
=
øø 
result
øø !
.
øø! "

Properties
øø" ,
.
øø, -
Items
øø- 2
[
øø2 3
$str
øø3 ;
]
øø; <
;
øø< =
var
¿¿ 
providerUserId
¿¿ 
=
¿¿  
userIdClaim
¿¿! ,
.
¿¿, -
Value
¿¿- 2
;
¿¿2 3
var
√√ 
user
√√ 
=
√√ 
await
√√ 
_userManager
√√ )
.
√√) *
FindByLoginAsync
√√* :
(
√√: ;
provider
√√; C
,
√√C D
providerUserId
√√E S
)
√√S T
;
√√T U
return
≈≈ 
(
≈≈ 
user
≈≈ 
,
≈≈ 
provider
≈≈ "
,
≈≈" #
providerUserId
≈≈$ 2
,
≈≈2 3
claims
≈≈4 :
)
≈≈: ;
;
≈≈; <
}
∆∆ 	
private
»» 
async
»» 
Task
»» 
<
»» 
UserIdentity
»» '
>
»»' ($
AutoProvisionUserAsync
»») ?
(
»»? @
string
»»@ F
provider
»»G O
,
»»O P
string
»»Q W
providerUserId
»»X f
,
»»f g
IEnumerable
»»h s
<
»»s t
Claim
»»t y
>
»»y z
claims»»{ Å
)»»Å Ç
{
…… 	
var
ÀÀ 
filtered
ÀÀ 
=
ÀÀ 
new
ÀÀ 
List
ÀÀ #
<
ÀÀ# $
Claim
ÀÀ$ )
>
ÀÀ) *
(
ÀÀ* +
)
ÀÀ+ ,
;
ÀÀ, -
var
ŒŒ 
name
ŒŒ 
=
ŒŒ 
claims
ŒŒ 
.
ŒŒ 
FirstOrDefault
ŒŒ ,
(
ŒŒ, -
x
ŒŒ- .
=>
ŒŒ/ 1
x
ŒŒ2 3
.
ŒŒ3 4
Type
ŒŒ4 8
==
ŒŒ9 ;
JwtClaimTypes
ŒŒ< I
.
ŒŒI J
Name
ŒŒJ N
)
ŒŒN O
?
ŒŒO P
.
ŒŒP Q
Value
ŒŒQ V
??
ŒŒW Y
claims
œœ 
.
œœ 
FirstOrDefault
œœ %
(
œœ% &
x
œœ& '
=>
œœ( *
x
œœ+ ,
.
œœ, -
Type
œœ- 1
==
œœ2 4

ClaimTypes
œœ5 ?
.
œœ? @
Name
œœ@ D
)
œœD E
?
œœE F
.
œœF G
Value
œœG L
;
œœL M
if
–– 
(
–– 
name
–– 
!=
–– 
null
–– 
)
–– 
{
—— 
filtered
““ 
.
““ 
Add
““ 
(
““ 
new
““  
Claim
““! &
(
““& '
JwtClaimTypes
““' 4
.
““4 5
Name
““5 9
,
““9 :
name
““; ?
)
““? @
)
““@ A
;
““A B
}
”” 
else
‘‘ 
{
’’ 
var
÷÷ 
first
÷÷ 
=
÷÷ 
claims
÷÷ "
.
÷÷" #
FirstOrDefault
÷÷# 1
(
÷÷1 2
x
÷÷2 3
=>
÷÷4 6
x
÷÷7 8
.
÷÷8 9
Type
÷÷9 =
==
÷÷> @
JwtClaimTypes
÷÷A N
.
÷÷N O
	GivenName
÷÷O X
)
÷÷X Y
?
÷÷Y Z
.
÷÷Z [
Value
÷÷[ `
??
÷÷a c
claims
◊◊ 
.
◊◊ 
FirstOrDefault
◊◊ )
(
◊◊) *
x
◊◊* +
=>
◊◊, .
x
◊◊/ 0
.
◊◊0 1
Type
◊◊1 5
==
◊◊6 8

ClaimTypes
◊◊9 C
.
◊◊C D
	GivenName
◊◊D M
)
◊◊M N
?
◊◊N O
.
◊◊O P
Value
◊◊P U
;
◊◊U V
var
ÿÿ 
last
ÿÿ 
=
ÿÿ 
claims
ÿÿ !
.
ÿÿ! "
FirstOrDefault
ÿÿ" 0
(
ÿÿ0 1
x
ÿÿ1 2
=>
ÿÿ3 5
x
ÿÿ6 7
.
ÿÿ7 8
Type
ÿÿ8 <
==
ÿÿ= ?
JwtClaimTypes
ÿÿ@ M
.
ÿÿM N

FamilyName
ÿÿN X
)
ÿÿX Y
?
ÿÿY Z
.
ÿÿZ [
Value
ÿÿ[ `
??
ÿÿa c
claims
ŸŸ 
.
ŸŸ 
FirstOrDefault
ŸŸ )
(
ŸŸ) *
x
ŸŸ* +
=>
ŸŸ, .
x
ŸŸ/ 0
.
ŸŸ0 1
Type
ŸŸ1 5
==
ŸŸ6 8

ClaimTypes
ŸŸ9 C
.
ŸŸC D
Surname
ŸŸD K
)
ŸŸK L
?
ŸŸL M
.
ŸŸM N
Value
ŸŸN S
;
ŸŸS T
if
⁄⁄ 
(
⁄⁄ 
first
⁄⁄ 
!=
⁄⁄ 
null
⁄⁄ !
&&
⁄⁄" $
last
⁄⁄% )
!=
⁄⁄* ,
null
⁄⁄- 1
)
⁄⁄1 2
{
€€ 
filtered
‹‹ 
.
‹‹ 
Add
‹‹  
(
‹‹  !
new
‹‹! $
Claim
‹‹% *
(
‹‹* +
JwtClaimTypes
‹‹+ 8
.
‹‹8 9
Name
‹‹9 =
,
‹‹= >
first
‹‹? D
+
‹‹E F
$str
‹‹G J
+
‹‹K L
last
‹‹M Q
)
‹‹Q R
)
‹‹R S
;
‹‹S T
}
›› 
else
ﬁﬁ 
if
ﬁﬁ 
(
ﬁﬁ 
first
ﬁﬁ 
!=
ﬁﬁ !
null
ﬁﬁ" &
)
ﬁﬁ& '
{
ﬂﬂ 
filtered
‡‡ 
.
‡‡ 
Add
‡‡  
(
‡‡  !
new
‡‡! $
Claim
‡‡% *
(
‡‡* +
JwtClaimTypes
‡‡+ 8
.
‡‡8 9
Name
‡‡9 =
,
‡‡= >
first
‡‡? D
)
‡‡D E
)
‡‡E F
;
‡‡F G
}
·· 
else
‚‚ 
if
‚‚ 
(
‚‚ 
last
‚‚ 
!=
‚‚  
null
‚‚! %
)
‚‚% &
{
„„ 
filtered
‰‰ 
.
‰‰ 
Add
‰‰  
(
‰‰  !
new
‰‰! $
Claim
‰‰% *
(
‰‰* +
JwtClaimTypes
‰‰+ 8
.
‰‰8 9
Name
‰‰9 =
,
‰‰= >
last
‰‰? C
)
‰‰C D
)
‰‰D E
;
‰‰E F
}
ÂÂ 
}
ÊÊ 
var
ÈÈ 
email
ÈÈ 
=
ÈÈ 
claims
ÈÈ 
.
ÈÈ 
FirstOrDefault
ÈÈ -
(
ÈÈ- .
x
ÈÈ. /
=>
ÈÈ0 2
x
ÈÈ3 4
.
ÈÈ4 5
Type
ÈÈ5 9
==
ÈÈ: <
JwtClaimTypes
ÈÈ= J
.
ÈÈJ K
Email
ÈÈK P
)
ÈÈP Q
?
ÈÈQ R
.
ÈÈR S
Value
ÈÈS X
??
ÈÈY [
claims
ÍÍ 
.
ÍÍ 
FirstOrDefault
ÍÍ $
(
ÍÍ$ %
x
ÍÍ% &
=>
ÍÍ' )
x
ÍÍ* +
.
ÍÍ+ ,
Type
ÍÍ, 0
==
ÍÍ1 3

ClaimTypes
ÍÍ4 >
.
ÍÍ> ?
Email
ÍÍ? D
)
ÍÍD E
?
ÍÍE F
.
ÍÍF G
Value
ÍÍG L
;
ÍÍL M
if
ÎÎ 
(
ÎÎ 
email
ÎÎ 
!=
ÎÎ 
null
ÎÎ 
)
ÎÎ 
{
ÏÏ 
filtered
ÌÌ 
.
ÌÌ 
Add
ÌÌ 
(
ÌÌ 
new
ÌÌ  
Claim
ÌÌ! &
(
ÌÌ& '
JwtClaimTypes
ÌÌ' 4
.
ÌÌ4 5
Email
ÌÌ5 :
,
ÌÌ: ;
email
ÌÌ< A
)
ÌÌA B
)
ÌÌB C
;
ÌÌC D
}
ÓÓ 
var
 
user
 
=
 
new
 
UserIdentity
 '
{
ÒÒ 
UserName
ÚÚ 
=
ÚÚ 
Guid
ÚÚ 
.
ÚÚ  
NewGuid
ÚÚ  '
(
ÚÚ' (
)
ÚÚ( )
.
ÚÚ) *
ToString
ÚÚ* 2
(
ÚÚ2 3
)
ÚÚ3 4
,
ÚÚ4 5
}
ÛÛ 
;
ÛÛ 
var
ÙÙ 
identityResult
ÙÙ 
=
ÙÙ  
await
ÙÙ! &
_userManager
ÙÙ' 3
.
ÙÙ3 4
CreateAsync
ÙÙ4 ?
(
ÙÙ? @
user
ÙÙ@ D
)
ÙÙD E
;
ÙÙE F
if
ıı 
(
ıı 
!
ıı 
identityResult
ıı 
.
ıı  
	Succeeded
ıı  )
)
ıı) *
throw
ıı+ 0
new
ıı1 4
	Exception
ıı5 >
(
ıı> ?
identityResult
ıı? M
.
ııM N
Errors
ııN T
.
ııT U
First
ııU Z
(
ııZ [
)
ıı[ \
.
ıı\ ]
Description
ıı] h
)
ııh i
;
ııi j
if
˜˜ 
(
˜˜ 
filtered
˜˜ 
.
˜˜ 
Any
˜˜ 
(
˜˜ 
)
˜˜ 
)
˜˜ 
{
¯¯ 
identityResult
˘˘ 
=
˘˘  
await
˘˘! &
_userManager
˘˘' 3
.
˘˘3 4
AddClaimsAsync
˘˘4 B
(
˘˘B C
user
˘˘C G
,
˘˘G H
filtered
˘˘I Q
)
˘˘Q R
;
˘˘R S
if
˙˙ 
(
˙˙ 
!
˙˙ 
identityResult
˙˙ #
.
˙˙# $
	Succeeded
˙˙$ -
)
˙˙- .
throw
˙˙/ 4
new
˙˙5 8
	Exception
˙˙9 B
(
˙˙B C
identityResult
˙˙C Q
.
˙˙Q R
Errors
˙˙R X
.
˙˙X Y
First
˙˙Y ^
(
˙˙^ _
)
˙˙_ `
.
˙˙` a
Description
˙˙a l
)
˙˙l m
;
˙˙m n
}
˚˚ 
identityResult
˝˝ 
=
˝˝ 
await
˝˝ "
_userManager
˝˝# /
.
˝˝/ 0
AddLoginAsync
˝˝0 =
(
˝˝= >
user
˝˝> B
,
˝˝B C
new
˝˝D G
UserLoginInfo
˝˝H U
(
˝˝U V
provider
˝˝V ^
,
˝˝^ _
providerUserId
˝˝` n
,
˝˝n o
provider
˝˝p x
)
˝˝x y
)
˝˝y z
;
˝˝z {
if
˛˛ 
(
˛˛ 
!
˛˛ 
identityResult
˛˛ 
.
˛˛  
	Succeeded
˛˛  )
)
˛˛) *
throw
˛˛+ 0
new
˛˛1 4
	Exception
˛˛5 >
(
˛˛> ?
identityResult
˛˛? M
.
˛˛M N
Errors
˛˛N T
.
˛˛T U
First
˛˛U Z
(
˛˛Z [
)
˛˛[ \
.
˛˛\ ]
Description
˛˛] h
)
˛˛h i
;
˛˛i j
return
ÄÄ 
user
ÄÄ 
;
ÄÄ 
}
ÅÅ 	
private
ÉÉ 
void
ÉÉ )
ProcessLoginCallbackForOidc
ÉÉ 0
(
ÉÉ0 1 
AuthenticateResult
ÉÉ1 C
externalResult
ÉÉD R
,
ÉÉR S
List
ÉÉT X
<
ÉÉX Y
Claim
ÉÉY ^
>
ÉÉ^ _
localClaims
ÉÉ` k
,
ÉÉk l'
AuthenticationPropertiesÉÉm Ö 
localSignInPropsÉÉÜ ñ
)ÉÉñ ó
{
ÑÑ 	
var
áá 
sid
áá 
=
áá 
externalResult
áá $
.
áá$ %
	Principal
áá% .
.
áá. /
Claims
áá/ 5
.
áá5 6
FirstOrDefault
áá6 D
(
ááD E
x
ááE F
=>
ááG I
x
ááJ K
.
ááK L
Type
ááL P
==
ááQ S
JwtClaimTypes
ááT a
.
ááa b
	SessionId
ááb k
)
áák l
;
áál m
if
àà 
(
àà 
sid
àà 
!=
àà 
null
àà 
)
àà 
{
ââ 
localClaims
ää 
.
ää 
Add
ää 
(
ää  
new
ää  #
Claim
ää$ )
(
ää) *
JwtClaimTypes
ää* 7
.
ää7 8
	SessionId
ää8 A
,
ääA B
sid
ääC F
.
ääF G
Value
ääG L
)
ääL M
)
ääM N
;
ääN O
}
ãã 
var
éé 
id_token
éé 
=
éé 
externalResult
éé )
.
éé) *

Properties
éé* 4
.
éé4 5
GetTokenValue
éé5 B
(
ééB C
$str
ééC M
)
ééM N
;
ééN O
if
èè 
(
èè 
id_token
èè 
!=
èè 
null
èè  
)
èè  !
{
êê 
localSignInProps
ëë  
.
ëë  !
StoreTokens
ëë! ,
(
ëë, -
new
ëë- 0
[
ëë0 1
]
ëë1 2
{
ëë3 4
new
ëë5 8!
AuthenticationToken
ëë9 L
{
ëëM N
Name
ëëO S
=
ëëT U
$str
ëëV `
,
ëë` a
Value
ëëb g
=
ëëh i
id_token
ëëj r
}
ëës t
}
ëëu v
)
ëëv w
;
ëëw x
}
íí 
}
ìì 	
private
ïï 
void
ïï *
ProcessLoginCallbackForWsFed
ïï 1
(
ïï1 2 
AuthenticateResult
ïï2 D
externalResult
ïïE S
,
ïïS T
List
ïïU Y
<
ïïY Z
Claim
ïïZ _
>
ïï_ `
localClaims
ïïa l
,
ïïl m'
AuthenticationPropertiesïïn Ü 
localSignInPropsïïá ó
)ïïó ò
{
ññ 	
}
óó 	
private
ôô 
void
ôô +
ProcessLoginCallbackForSaml2p
ôô 2
(
ôô2 3 
AuthenticateResult
ôô3 E
externalResult
ôôF T
,
ôôT U
List
ôôV Z
<
ôôZ [
Claim
ôô[ `
>
ôô` a
localClaims
ôôb m
,
ôôm n'
AuthenticationPropertiesôôo á 
localSignInPropsôôà ò
)ôôò ô
{
öö 	
}
õõ 	
}
úú 
}ùù ø
ÑC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Account\AccountOptions.cs
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
AuthenticationScheme	 ì
;
ì î
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
} ≈
ÜC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Account\ExternalProvider.cs
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
} ù
àC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Account\LoggedOutViewModel.cs
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
} ÿ
ÖC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Account\LoginInputModel.cs
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
} 
ÑC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Account\LoginViewModel.cs
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
IsNullOrWhiteSpace	n Ä
(
Ä Å
x
Å Ç
.
Ç É
DisplayName
É é
)
é è
)
è ê
;
ê ë
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
Ä Ñ
;
Ñ Ö
} 
} ö
ÜC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Account\LogoutInputModel.cs
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
} À
ÖC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Account\LogoutViewModel.cs
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
} ÿú
áC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Consent\ConsentController.cs
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
ÅÅ 
request
ÅÅ 
=
ÅÅ 
await
ÅÅ #
_interaction
ÅÅ$ 0
.
ÅÅ0 1*
GetAuthorizationContextAsync
ÅÅ1 M
(
ÅÅM N
model
ÅÅN S
.
ÅÅS T
	ReturnUrl
ÅÅT ]
)
ÅÅ] ^
;
ÅÅ^ _
if
ÇÇ 
(
ÇÇ 
request
ÇÇ 
==
ÇÇ 
null
ÇÇ #
)
ÇÇ# $
return
ÇÇ% +
result
ÇÇ, 2
;
ÇÇ2 3
await
ÖÖ 
_interaction
ÖÖ "
.
ÖÖ" #
GrantConsentAsync
ÖÖ# 4
(
ÖÖ4 5
request
ÖÖ5 <
,
ÖÖ< =
grantedConsent
ÖÖ> L
)
ÖÖL M
;
ÖÖM N
result
àà 
.
àà 
RedirectUri
àà "
=
àà# $
model
àà% *
.
àà* +
	ReturnUrl
àà+ 4
;
àà4 5
}
ââ 
else
ää 
{
ãã 
result
çç 
.
çç 
	ViewModel
çç  
=
çç! "
await
çç# (!
BuildViewModelAsync
çç) <
(
çç< =
model
çç= B
.
ççB C
	ReturnUrl
ççC L
,
ççL M
model
ççN S
)
ççS T
;
ççT U
}
éé 
return
êê 
result
êê 
;
êê 
}
ëë 	
private
ìì 
async
ìì 
Task
ìì 
<
ìì 
ConsentViewModel
ìì +
>
ìì+ ,!
BuildViewModelAsync
ìì- @
(
ìì@ A
string
ììA G
	returnUrl
ììH Q
,
ììQ R
ConsentInputModel
ììS d
model
ììe j
=
ììk l
null
ììm q
)
ììq r
{
îî 	
var
ïï 
request
ïï 
=
ïï 
await
ïï 
_interaction
ïï  ,
.
ïï, -*
GetAuthorizationContextAsync
ïï- I
(
ïïI J
	returnUrl
ïïJ S
)
ïïS T
;
ïïT U
if
ññ 
(
ññ 
request
ññ 
!=
ññ 
null
ññ 
)
ññ  
{
óó 
var
òò 
client
òò 
=
òò 
await
òò "
_clientStore
òò# /
.
òò/ 0(
FindEnabledClientByIdAsync
òò0 J
(
òòJ K
request
òòK R
.
òòR S
ClientId
òòS [
)
òò[ \
;
òò\ ]
if
ôô 
(
ôô 
client
ôô 
!=
ôô 
null
ôô "
)
ôô" #
{
öö 
var
õõ 
	resources
õõ !
=
õõ" #
await
õõ$ )
_resourceStore
õõ* 8
.
õõ8 9.
 FindEnabledResourcesByScopeAsync
õõ9 Y
(
õõY Z
request
õõZ a
.
õõa b
ScopesRequested
õõb q
)
õõq r
;
õõr s
if
úú 
(
úú 
	resources
úú !
!=
úú" $
null
úú% )
&&
úú* ,
(
úú- .
	resources
úú. 7
.
úú7 8
IdentityResources
úú8 I
.
úúI J
Any
úúJ M
(
úúM N
)
úúN O
||
úúP R
	resources
úúS \
.
úú\ ]
ApiResources
úú] i
.
úúi j
Any
úúj m
(
úúm n
)
úún o
)
úúo p
)
úúp q
{
ùù 
return
ûû $
CreateConsentViewModel
ûû 5
(
ûû5 6
model
ûû6 ;
,
ûû; <
	returnUrl
ûû= F
,
ûûF G
request
ûûH O
,
ûûO P
client
ûûQ W
,
ûûW X
	resources
ûûY b
)
ûûb c
;
ûûc d
}
üü 
else
†† 
{
°° 
_logger
¢¢ 
.
¢¢  
LogError
¢¢  (
(
¢¢( )
$str
¢¢) B
,
¢¢B C
request
¢¢D K
.
¢¢K L
ScopesRequested
¢¢L [
.
¢¢[ \
	Aggregate
¢¢\ e
(
¢¢e f
(
¢¢f g
x
¢¢g h
,
¢¢h i
y
¢¢j k
)
¢¢k l
=>
¢¢m o
x
¢¢p q
+
¢¢r s
$str
¢¢t x
+
¢¢y z
y
¢¢{ |
)
¢¢| }
)
¢¢} ~
;
¢¢~ 
}
££ 
}
§§ 
else
•• 
{
¶¶ 
_logger
ßß 
.
ßß 
LogError
ßß $
(
ßß$ %
$str
ßß% =
,
ßß= >
request
ßß? F
.
ßßF G
ClientId
ßßG O
)
ßßO P
;
ßßP Q
}
®® 
}
©© 
else
™™ 
{
´´ 
_logger
¨¨ 
.
¨¨ 
LogError
¨¨  
(
¨¨  !
$str
¨¨! K
,
¨¨K L
	returnUrl
¨¨M V
)
¨¨V W
;
¨¨W X
}
≠≠ 
return
ØØ 
null
ØØ 
;
ØØ 
}
∞∞ 	
private
≤≤ 
ConsentViewModel
≤≤  $
CreateConsentViewModel
≤≤! 7
(
≤≤7 8
ConsentInputModel
≥≥ 
model
≥≥ #
,
≥≥# $
string
≥≥% +
	returnUrl
≥≥, 5
,
≥≥5 6"
AuthorizationRequest
¥¥  
request
¥¥! (
,
¥¥( )
Client
µµ 
client
µµ 
,
µµ 
	Resources
µµ $
	resources
µµ% .
)
µµ. /
{
∂∂ 	
var
∑∑ 
vm
∑∑ 
=
∑∑ 
new
∑∑ 
ConsentViewModel
∑∑ )
(
∑∑) *
)
∑∑* +
;
∑∑+ ,
vm
∏∏ 
.
∏∏ 
RememberConsent
∏∏ 
=
∏∏  
model
∏∏! &
?
∏∏& '
.
∏∏' (
RememberConsent
∏∏( 7
??
∏∏8 :
true
∏∏; ?
;
∏∏? @
vm
ππ 
.
ππ 
ScopesConsented
ππ 
=
ππ  
model
ππ! &
?
ππ& '
.
ππ' (
ScopesConsented
ππ( 7
??
ππ8 :

Enumerable
ππ; E
.
ππE F
Empty
ππF K
<
ππK L
string
ππL R
>
ππR S
(
ππS T
)
ππT U
;
ππU V
vm
ªª 
.
ªª 
	ReturnUrl
ªª 
=
ªª 
	returnUrl
ªª $
;
ªª$ %
vm
ΩΩ 
.
ΩΩ 

ClientName
ΩΩ 
=
ΩΩ 
client
ΩΩ "
.
ΩΩ" #

ClientName
ΩΩ# -
??
ΩΩ. 0
client
ΩΩ1 7
.
ΩΩ7 8
ClientId
ΩΩ8 @
;
ΩΩ@ A
vm
ææ 
.
ææ 
	ClientUrl
ææ 
=
ææ 
client
ææ !
.
ææ! "
	ClientUri
ææ" +
;
ææ+ ,
vm
øø 
.
øø 
ClientLogoUrl
øø 
=
øø 
client
øø %
.
øø% &
LogoUri
øø& -
;
øø- .
vm
¿¿ 
.
¿¿ "
AllowRememberConsent
¿¿ #
=
¿¿$ %
client
¿¿& ,
.
¿¿, -"
AllowRememberConsent
¿¿- A
;
¿¿A B
vm
¬¬ 
.
¬¬ 
IdentityScopes
¬¬ 
=
¬¬ 
	resources
¬¬  )
.
¬¬) *
IdentityResources
¬¬* ;
.
¬¬; <
Select
¬¬< B
(
¬¬B C
x
¬¬C D
=>
¬¬E G"
CreateScopeViewModel
¬¬H \
(
¬¬\ ]
x
¬¬] ^
,
¬¬^ _
vm
¬¬` b
.
¬¬b c
ScopesConsented
¬¬c r
.
¬¬r s
Contains
¬¬s {
(
¬¬{ |
x
¬¬| }
.
¬¬} ~
Name¬¬~ Ç
)¬¬Ç É
||¬¬Ñ Ü
model¬¬á å
==¬¬ç è
null¬¬ê î
)¬¬î ï
)¬¬ï ñ
.¬¬ñ ó
ToArray¬¬ó û
(¬¬û ü
)¬¬ü †
;¬¬† °
vm
√√ 
.
√√ 
ResourceScopes
√√ 
=
√√ 
	resources
√√  )
.
√√) *
ApiResources
√√* 6
.
√√6 7

SelectMany
√√7 A
(
√√A B
x
√√B C
=>
√√D F
x
√√G H
.
√√H I
Scopes
√√I O
)
√√O P
.
√√P Q
Select
√√Q W
(
√√W X
x
√√X Y
=>
√√Z \"
CreateScopeViewModel
√√] q
(
√√q r
x
√√r s
,
√√s t
vm
√√u w
.
√√w x
ScopesConsented√√x á
.√√á à
Contains√√à ê
(√√ê ë
x√√ë í
.√√í ì
Name√√ì ó
)√√ó ò
||√√ô õ
model√√ú °
==√√¢ §
null√√• ©
)√√© ™
)√√™ ´
.√√´ ¨
ToArray√√¨ ≥
(√√≥ ¥
)√√¥ µ
;√√µ ∂
if
ƒƒ 
(
ƒƒ 
ConsentOptions
ƒƒ 
.
ƒƒ !
EnableOfflineAccess
ƒƒ 2
&&
ƒƒ3 5
	resources
ƒƒ6 ?
.
ƒƒ? @
OfflineAccess
ƒƒ@ M
)
ƒƒM N
{
≈≈ 
vm
∆∆ 
.
∆∆ 
ResourceScopes
∆∆ !
=
∆∆" #
vm
∆∆$ &
.
∆∆& '
ResourceScopes
∆∆' 5
.
∆∆5 6
Union
∆∆6 ;
(
∆∆; <
new
∆∆< ?
ScopeViewModel
∆∆@ N
[
∆∆N O
]
∆∆O P
{
∆∆Q R#
GetOfflineAccessScope
«« )
(
««) *
vm
««* ,
.
««, -
ScopesConsented
««- <
.
««< =
Contains
««= E
(
««E F
IdentityServer4
««F U
.
««U V%
IdentityServerConstants
««V m
.
««m n
StandardScopes
««n |
.
««| }
OfflineAccess««} ä
)««ä ã
||««å é
model««è î
==««ï ó
null««ò ú
)««ú ù
}
»» 
)
»» 
;
»» 
}
…… 
return
ÀÀ 
vm
ÀÀ 
;
ÀÀ 
}
ÃÃ 	
private
ŒŒ 
ScopeViewModel
ŒŒ "
CreateScopeViewModel
ŒŒ 3
(
ŒŒ3 4
IdentityResource
ŒŒ4 D
identity
ŒŒE M
,
ŒŒM N
bool
ŒŒO S
check
ŒŒT Y
)
ŒŒY Z
{
œœ 	
return
–– 
new
–– 
ScopeViewModel
–– %
{
—— 
Name
““ 
=
““ 
identity
““ 
.
““  
Name
““  $
,
““$ %
DisplayName
”” 
=
”” 
identity
”” &
.
””& '
DisplayName
””' 2
,
””2 3
Description
‘‘ 
=
‘‘ 
identity
‘‘ &
.
‘‘& '
Description
‘‘' 2
,
‘‘2 3
	Emphasize
’’ 
=
’’ 
identity
’’ $
.
’’$ %
	Emphasize
’’% .
,
’’. /
Required
÷÷ 
=
÷÷ 
identity
÷÷ #
.
÷÷# $
Required
÷÷$ ,
,
÷÷, -
Checked
◊◊ 
=
◊◊ 
check
◊◊ 
||
◊◊  "
identity
◊◊# +
.
◊◊+ ,
Required
◊◊, 4
}
ÿÿ 
;
ÿÿ 
}
ŸŸ 	
public
€€ 
ScopeViewModel
€€ "
CreateScopeViewModel
€€ 2
(
€€2 3
Scope
€€3 8
scope
€€9 >
,
€€> ?
bool
€€@ D
check
€€E J
)
€€J K
{
‹‹ 	
return
›› 
new
›› 
ScopeViewModel
›› %
{
ﬁﬁ 
Name
ﬂﬂ 
=
ﬂﬂ 
scope
ﬂﬂ 
.
ﬂﬂ 
Name
ﬂﬂ !
,
ﬂﬂ! "
DisplayName
‡‡ 
=
‡‡ 
scope
‡‡ #
.
‡‡# $
DisplayName
‡‡$ /
,
‡‡/ 0
Description
·· 
=
·· 
scope
·· #
.
··# $
Description
··$ /
,
··/ 0
	Emphasize
‚‚ 
=
‚‚ 
scope
‚‚ !
.
‚‚! "
	Emphasize
‚‚" +
,
‚‚+ ,
Required
„„ 
=
„„ 
scope
„„  
.
„„  !
Required
„„! )
,
„„) *
Checked
‰‰ 
=
‰‰ 
check
‰‰ 
||
‰‰  "
scope
‰‰# (
.
‰‰( )
Required
‰‰) 1
}
ÂÂ 
;
ÂÂ 
}
ÊÊ 	
private
ËË 
ScopeViewModel
ËË #
GetOfflineAccessScope
ËË 4
(
ËË4 5
bool
ËË5 9
check
ËË: ?
)
ËË? @
{
ÈÈ 	
return
ÍÍ 
new
ÍÍ 
ScopeViewModel
ÍÍ %
{
ÎÎ 
Name
ÏÏ 
=
ÏÏ 
IdentityServer4
ÏÏ &
.
ÏÏ& '%
IdentityServerConstants
ÏÏ' >
.
ÏÏ> ?
StandardScopes
ÏÏ? M
.
ÏÏM N
OfflineAccess
ÏÏN [
,
ÏÏ[ \
DisplayName
ÌÌ 
=
ÌÌ 
ConsentOptions
ÌÌ ,
.
ÌÌ, -&
OfflineAccessDisplayName
ÌÌ- E
,
ÌÌE F
Description
ÓÓ 
=
ÓÓ 
ConsentOptions
ÓÓ ,
.
ÓÓ, -&
OfflineAccessDescription
ÓÓ- E
,
ÓÓE F
	Emphasize
ÔÔ 
=
ÔÔ 
true
ÔÔ  
,
ÔÔ  !
Checked
 
=
 
check
 
}
ÒÒ 
;
ÒÒ 
}
ÚÚ 	
}
ÛÛ 
}ÙÙ ≤
áC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Consent\ConsentInputModel.cs
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
} ˛
ÑC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Consent\ConsentOptions.cs
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
} 
ÜC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Consent\ConsentViewModel.cs
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
} ø

äC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Consent\ProcessConsentResult.cs
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
} û

ÑC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Consent\ScopeViewModel.cs
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
} ±
èC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Diagnostics\DiagnosticsController.cs
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
} £
éC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Diagnostics\DiagnosticsViewModel.cs
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
}   ◊-
ÖC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Grants\GrantsController.cs
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
}YY ´
ÑC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Grants\GrantsViewModel.cs
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
} ñ
ÅC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Home\ErrorViewModel.cs
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
} Á
ÅC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\Home\HomeController.cs
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
}++ Ç
ÜC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.AspNetIdentity\Quickstart\SecurityHeadersAttribute.cs
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
$str	 †
;
† °
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
}88 ›P
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
ÄÄ 
	Predicate
ÅÅ 
=
ÅÅ 
_
ÅÅ 
=>
ÅÅ  
true
ÅÅ! %
,
ÅÅ% &
ResponseWriter
ÇÇ 
=
ÇÇ  
UIResponseWriter
ÇÇ! 1
.
ÇÇ1 2(
WriteHealthCheckUIResponse
ÇÇ2 L
}
ÉÉ 
)
ÉÉ 
;
ÉÉ 
app
ÖÖ 
.
ÖÖ 
UseStaticFiles
ÖÖ 
(
ÖÖ 
)
ÖÖ  
;
ÖÖ  !
app
ÜÜ 
.
ÜÜ 
UseIdentityServer
ÜÜ !
(
ÜÜ! "
)
ÜÜ" #
;
ÜÜ# $
app
áá 
.
áá $
UseMvcWithDefaultRoute
áá &
(
áá& '
)
áá' (
;
áá( )
}
àà 	
}
ââ 
}ää 