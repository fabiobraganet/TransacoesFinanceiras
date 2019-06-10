�
sC:\DEV\MAGVA\TransacoesFinanceiras\src\Front\TransacoesFinanceiras\MAGVA.Front.TransacoesFinanceiras\AppSettings.cs
	namespace 	
MAGVA
 
. 
Front 
. !
TransacoesFinanceiras +
{ 
public 

class 
AppSettings 
{ 
public 
bool *
ActivateCampaignDetailFunction 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
public 
Logging 
Logging 
{  
get! $
;$ %
set& )
;) *
}+ ,
public		 
bool		  
UseCustomizationData		 (
{		) *
get		+ .
;		. /
set		0 3
;		3 4
}		5 6
public 
string $
TransacoesFinanceirasUrl .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
} 
public 

class 
Connectionstrings "
{ 
public 
string 
DefaultConnection '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
} 
public 

class 
Logging 
{ 
public 
bool 
IncludeScopes !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
Loglevel 
LogLevel  
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
public 

class 
Loglevel 
{ 
public 
string 
Default 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
System 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
	Microsoft 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} ��
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Front\TransacoesFinanceiras\MAGVA.Front.TransacoesFinanceiras\Base\CustomExtensionMethods.cs
	namespace 	
MAGVA
 
. 
Front 
. !
TransacoesFinanceiras +
.+ ,
Base, 0
{ 
public&& 

static&& 
class&& %
WebHostBuildertExtensions&& 1
{'' 
static(( 
IAsyncPolicy(( 
<(( 
HttpResponseMessage(( /
>((/ 0
GetRetryPolicy((1 ?
(((? @
)((@ A
{)) 	
return**  
HttpPolicyExtensions** '
.++ $
HandleTransientHttpError++ '
(++' (
)++( )
.,, 
OrResult,, 
(,, 
msg,, 
=>,, 
msg,, "
.,," #

StatusCode,,# -
==,,. 0
System,,1 7
.,,7 8
Net,,8 ;
.,,; <
HttpStatusCode,,< J
.,,J K
NotFound,,K S
),,S T
.-- 
WaitAndRetryAsync--  
(--  !
$num--! "
,--" #
retryAttempt--$ 0
=>--1 3
TimeSpan--4 <
.--< =
FromSeconds--= H
(--H I
Math--I M
.--M N
Pow--N Q
(--Q R
$num--R S
,--S T
retryAttempt--U a
)--a b
)--b c
)--c d
;--d e
}// 	
static00 
IAsyncPolicy00 
<00 
HttpResponseMessage00 /
>00/ 0#
GetCircuitBreakerPolicy001 H
(00H I
)00I J
{11 	
return22  
HttpPolicyExtensions22 '
.33 $
HandleTransientHttpError33 )
(33) *
)33* +
.44 
CircuitBreakerAsync44 $
(44$ %
$num44% &
,44& '
TimeSpan44( 0
.440 1
FromSeconds441 <
(44< =
$num44= ?
)44? @
)44@ A
;44A B
}55 	
public77 
static77 
IServiceCollection77 (
AddCustomMvc77) 5
(775 6
this776 :
IServiceCollection77; M
services77N V
,77V W
IConfiguration77X f
configuration77g t
)77t u
{88 	
services99 
.99 

AddOptions99 
(99  
)99  !
;99! "
services:: 
.:: 
	Configure:: 
<:: 
AppSettings:: *
>::* +
(::+ ,
configuration::, 9
)::9 :
;::: ;
services<< 
.<< 
AddMvc<< 
(<< 
)<< 
.== #
SetCompatibilityVersion== (
(==( ) 
CompatibilityVersion==) =
.=== >
Version_2_2==> I
)==I J
;==J K
services?? 
.?? 

AddSession?? 
(??  
)??  !
;??! "
ifAA 
(AA 
configurationAA 
.AA 
GetValueAA &
<AA& '
stringAA' -
>AA- .
(AA. /
$strAA/ =
)AA= >
==AA? A
boolAAB F
.AAF G

TrueStringAAG Q
)AAQ R
{BB 
servicesCC 
.CC 
AddDataProtectionCC *
(CC* +
optsCC+ /
=>CC0 2
{DD 
optsEE 
.EE $
ApplicationDiscriminatorEE 1
=EE2 3
$strEE4 R
;EER S
}FF 
)FF 
.GG 
PersistKeysToRedisGG #
(GG# $!
ConnectionMultiplexerGG$ 9
.GG9 :
ConnectGG: A
(GGA B
configurationGGB O
[GGO P
$strGGP d
]GGd e
)GGe f
,GGf g
$strGGh }
)GG} ~
;GG~ 
}HH 
returnII 
servicesII 
;II 
}JJ 	
publicLL 
staticLL 
IWebHostBuilderLL %

UseFailingLL& 0
(LL0 1
thisLL1 5
IWebHostBuilderLL6 E
builderLLF M
,LLM N
ActionLLO U
<LLU V
FailingOptionsLLV d
>LLd e
optionsLLf m
)LLm n
{MM 	
builderNN 
.NN 
ConfigureServicesNN %
(NN% &
servicesNN& .
=>NN/ 1
{OO 
servicesPP 
.PP 
AddSingletonPP %
<PP% &
IStartupFilterPP& 4
>PP4 5
(PP5 6
newPP6 9 
FailingStartupFilterPP: N
(PPN O
optionsPPO V
)PPV W
)PPW X
;PPX Y
}QQ 
)QQ 
;QQ 
returnRR 
builderRR 
;RR 
}SS 	
publicUU 
staticUU 
IServiceCollectionUU (
AddHealthChecksUU) 8
(UU8 9
thisUU9 =
IServiceCollectionUU> P
servicesUUQ Y
,UUY Z
IConfigurationUU[ i
configurationUUj w
)UUw x
{VV 	
varWW 
	hcBuilderWW 
=WW 
servicesWW $
.XX 
AddHealthChecksXX  
(XX  !
)XX! "
.YY 
AddCheckYY 
(YY 
$strYY  
,YY  !
(YY" #
)YY# $
=>YY% '
HealthCheckResultYY( 9
.YY9 :
HealthyYY: A
(YYA B
)YYB C
)YYC D
.ZZ 
AddUrlGroupZZ 
(ZZ 
newZZ  
UriZZ! $
(ZZ$ %
configurationZZ% 2
[ZZ2 3
$strZZ3 B
]ZZB C
)ZZC D
,ZZD E
nameZZF J
:ZZJ K
$strZZL b
,ZZb c
tagsZZd h
:ZZh i
newZZj m
stringZZn t
[ZZt u
]ZZu v
{ZZw x
$str	ZZy �
}
ZZ� �
)
ZZ� �
.[[ 
AddUrlGroup[[ 
([[ 
new[[  
Uri[[! $
([[$ %
configuration[[% 2
[[[2 3
$str[[3 O
][[O P
)[[P Q
,[[Q R
name[[S W
:[[W X
$str[[Y y
,[[y z
tags[[{ 
:	[[ �
new
[[� �
string
[[� �
[
[[� �
]
[[� �
{
[[� �
$str
[[� �
}
[[� �
)
[[� �
;
[[� �
return]] 
services]] 
;]] 
}^^ 	
public`` 
static`` 
IServiceCollection`` ("
AddCustomConfiguration``) ?
(``? @
this``@ D
IServiceCollection``E W
services``X `
,``` a
IConfiguration``b p
configuration``q ~
)``~ 
{aa 	
servicesbb 
.bb 

AddOptionsbb 
(bb  
)bb  !
;bb! "
servicescc 
.cc 
	Configurecc 
<cc 
ProgramSettingscc .
>cc. /
(cc/ 0
configurationcc0 =
)cc= >
;cc> ?
servicesdd 
.dd 
	Configuredd 
<dd 
ApiBehaviorOptionsdd 1
>dd1 2
(dd2 3
optionsdd3 :
=>dd; =
{ee 
optionsff 
.ff ,
 InvalidModelStateResponseFactoryff 8
=ff9 :
contextff; B
=>ffC E
{gg 
varhh 
problemDetailshh &
=hh' (
newhh) ,$
ValidationProblemDetailshh- E
(hhE F
contexthhF M
.hhM N

ModelStatehhN X
)hhX Y
{ii 
Instancejj  
=jj! "
contextjj# *
.jj* +
HttpContextjj+ 6
.jj6 7
Requestjj7 >
.jj> ?
Pathjj? C
,jjC D
Statuskk 
=kk  
StatusCodeskk! ,
.kk, -
Status400BadRequestkk- @
,kk@ A
Detailll 
=ll  
$strll! ^
}mm 
;mm 
returnoo 
newoo "
BadRequestObjectResultoo 5
(oo5 6
problemDetailsoo6 D
)ooD E
{pp 
ContentTypesqq $
=qq% &
{qq' (
$strqq) C
,qqC D
$strqqE ^
}qq_ `
}rr 
;rr 
}ss 
;ss 
}tt 
)tt 
;tt 
returnvv 
servicesvv 
;vv 
}ww 	
publicyy 
staticyy 
IServiceCollectionyy (!
AddHttpClientServicesyy) >
(yy> ?
thisyy? C
IServiceCollectionyyD V
servicesyyW _
,yy_ `
IConfigurationyya o
configurationyyp }
)yy} ~
{zz 	
services{{ 
.{{ 
AddSingleton{{ !
<{{! " 
IHttpContextAccessor{{" 6
,{{6 7
HttpContextAccessor{{8 K
>{{K L
({{L M
){{M N
;{{N O
services|| 
.|| 
AddTransient|| !
<||! "4
(HttpClientAuthorizationDelegatingHandler||" J
>||J K
(||K L
)||L M
;||M N
services}} 
.}} 
AddTransient}} !
<}}! "0
$HttpClientRequestIdDelegatingHandler}}" F
>}}F G
(}}G H
)}}H I
;}}I J
services~~ 
.~~ 
AddHttpClient~~ "
(~~" #
$str~~# <
)~~< =
.~~= >
SetHandlerLifetime~~> P
(~~P Q
TimeSpan~~Q Y
.~~Y Z
FromMinutes~~Z e
(~~e f
$num~~f g
)~~g h
)~~h i
.~~i j
AddDevspacesSupport~~j }
(~~} ~
)~~~ 
;	~~ �
services
�� 
.
�� 
AddHttpClient
�� "
<
��" # 
IConsumidorService
��# 5
,
��5 6
ConsumidorService
��7 H
>
��H I
(
��I J
)
��J K
.
��  
SetHandlerLifetime
�� &
(
��& '
TimeSpan
��' /
.
��/ 0
FromMinutes
��0 ;
(
��; <
$num
��< =
)
��= >
)
��> ?
.
�� #
AddHttpMessageHandler
�� )
<
��) *6
(HttpClientAuthorizationDelegatingHandler
��* R
>
��R S
(
��S T
)
��T U
.
�� 
AddPolicyHandler
�� $
(
��$ %
GetRetryPolicy
��% 3
(
��3 4
)
��4 5
)
��5 6
.
�� 
AddPolicyHandler
�� $
(
��$ %%
GetCircuitBreakerPolicy
��% <
(
��< =
)
��= >
)
��> ?
.
�� !
AddDevspacesSupport
�� '
(
��' (
)
��( )
;
��) *
services
�� 
.
�� 
AddTransient
�� !
<
��! "
IIdentityParser
��" 1
<
��1 2
ApplicationUser
��2 A
>
��A B
,
��B C
IdentityParser
��D R
>
��R S
(
��S T
)
��T U
;
��U V
return
�� 
services
�� 
;
�� 
}
�� 	
public
�� 
static
��  
IServiceCollection
�� ("
AddHttpClientLogging
��) =
(
��= >
this
��> B 
IServiceCollection
��C U
services
��V ^
,
��^ _
IConfiguration
��` n
configuration
��o |
)
��| }
{
�� 	
services
�� 
.
�� 

AddLogging
�� 
(
��  
b
��  !
=>
��" $
{
�� 
b
�� 
.
�� 
	AddFilter
�� 
(
�� 
(
�� 
category
�� %
,
��% &
level
��' ,
)
��, -
=>
��. 0
true
��1 5
)
��5 6
;
��6 7
b
�� 
.
�� 

AddConsole
�� 
(
�� 
c
�� 
=>
�� !
c
��" #
.
��# $
IncludeScopes
��$ 1
=
��2 3
true
��4 8
)
��8 9
;
��9 :
b
�� 
.
�� 
AddDebug
�� 
(
�� 
)
�� 
;
�� 
}
�� 
)
�� 
;
�� 
return
�� 
services
�� 
;
�� 
}
�� 	
public
�� 
static
��  
IServiceCollection
�� (%
AddCustomAuthentication
��) @
(
��@ A
this
��A E 
IServiceCollection
��F X
services
��Y a
,
��a b
IConfiguration
��c q
configuration
��r 
)�� �
{
�� 	
var
�� 
useLoadTest
�� 
=
�� 
configuration
�� +
.
��+ ,
GetValue
��, 4
<
��4 5
bool
��5 9
>
��9 :
(
��: ;
$str
��; H
)
��H I
;
��I J
var
�� 
identityUrl
�� 
=
�� 
configuration
�� +
.
��+ ,
GetValue
��, 4
<
��4 5
string
��5 ;
>
��; <
(
��< =
$str
��= J
)
��J K
;
��K L
var
�� 
callBackUrl
�� 
=
�� 
configuration
�� +
.
��+ ,
GetValue
��, 4
<
��4 5
string
��5 ;
>
��; <
(
��< =
$str
��= J
)
��J K
;
��K L
var
�� #
sessionCookieLifetime
�� %
=
��& '
configuration
��( 5
.
��5 6
GetValue
��6 >
(
��> ?
$str
��? ]
,
��] ^
$num
��_ b
)
��b c
;
��c d
services
�� 
.
�� 
AddAuthentication
�� &
(
��& '
options
��' .
=>
��/ 1
{
�� 
options
�� 
.
�� 
DefaultScheme
�� %
=
��& '*
CookieAuthenticationDefaults
��( D
.
��D E"
AuthenticationScheme
��E Y
;
��Y Z
options
�� 
.
�� $
DefaultChallengeScheme
�� .
=
��/ 0#
OpenIdConnectDefaults
��1 F
.
��F G"
AuthenticationScheme
��G [
;
��[ \
options
�� 
.
�� '
DefaultAuthenticateScheme
�� 1
=
��2 3*
CookieAuthenticationDefaults
��4 P
.
��P Q"
AuthenticationScheme
��Q e
;
��e f
options
�� 
.
�� !
DefaultForbidScheme
�� +
=
��, -*
CookieAuthenticationDefaults
��. J
.
��J K"
AuthenticationScheme
��K _
;
��_ `
options
�� 
.
�� !
DefaultSignInScheme
�� +
=
��, -*
CookieAuthenticationDefaults
��. J
.
��J K"
AuthenticationScheme
��K _
;
��_ `
options
�� 
.
�� "
DefaultSignOutScheme
�� ,
=
��- .*
CookieAuthenticationDefaults
��/ K
.
��K L"
AuthenticationScheme
��L `
;
��` a
}
�� 
)
�� 
.
�� 
	AddCookie
�� 
(
�� *
CookieAuthenticationDefaults
�� 3
.
��3 4"
AuthenticationScheme
��4 H
,
��H I
setup
��J O
=>
��P R
{
�� 
setup
�� 
.
�� 
ExpireTimeSpan
�� $
=
��% &
TimeSpan
��' /
.
��/ 0
FromMinutes
��0 ;
(
��; <#
sessionCookieLifetime
��< Q
)
��Q R
;
��R S
setup
�� 
.
�� 
Cookie
�� 
.
�� 
Name
�� !
=
��" #!
AuthorizationConsts
��$ 7
.
��7 8 
IdentityCookieName
��8 J
;
��J K
}
�� 
)
�� 
.
�� 
AddOpenIdConnect
�� 
(
�� 
options
�� %
=>
��& (
{
�� 
options
�� 
.
�� 
SignInScheme
�� $
=
��% &*
CookieAuthenticationDefaults
��' C
.
��C D"
AuthenticationScheme
��D X
;
��X Y
options
�� 
.
�� 
	Authority
�� !
=
��" #
identityUrl
��$ /
.
��/ 0
ToString
��0 8
(
��8 9
)
��9 :
;
��: ;
options
�� 
.
�� "
SignedOutRedirectUri
�� ,
=
��- .
callBackUrl
��/ :
.
��: ;
ToString
��; C
(
��C D
)
��D E
;
��E F
options
�� 
.
�� 
ClientId
��  
=
��! "
useLoadTest
��# .
?
��/ 0
$str
��1 :
:
��; <
$str
��= T
;
��T U
options
�� 
.
�� 
ClientSecret
�� $
=
��% &
$str
��' /
;
��/ 0
options
�� 
.
�� 
ResponseType
�� $
=
��% &
useLoadTest
��' 2
?
��3 4
$str
��5 J
:
��K L
$str
��M \
;
��\ ]
options
�� 
.
�� 

SaveTokens
�� "
=
��# $
true
��% )
;
��) *
options
�� 
.
�� +
GetClaimsFromUserInfoEndpoint
�� 5
=
��6 7
true
��8 <
;
��< =
options
�� 
.
�� "
RequireHttpsMetadata
�� ,
=
��- .
false
��/ 4
;
��4 5
options
�� 
.
�� 
Scope
�� 
.
�� 
Clear
�� #
(
��# $
)
��$ %
;
��% &
options
�� 
.
�� 
Scope
�� 
.
�� 
Add
�� !
(
��! "!
AuthorizationConsts
��" 5
.
��5 6
ScopeOpenId
��6 A
)
��A B
;
��B C
options
�� 
.
�� 
Scope
�� 
.
�� 
Add
�� !
(
��! "!
AuthorizationConsts
��" 5
.
��5 6
ScopeProfile
��6 B
)
��B C
;
��C D
options
�� 
.
�� 
Scope
�� 
.
�� 
Add
�� !
(
��! "!
AuthorizationConsts
��" 5
.
��5 6

ScopeEmail
��6 @
)
��@ A
;
��A B
options
�� 
.
�� 
Scope
�� 
.
�� 
Add
�� !
(
��! "
$str
��" 9
)
��9 :
;
��: ;
options
�� 
.
�� 
Scope
�� 
.
�� 
Add
�� !
(
��! "
$str
��" 0
)
��0 1
;
��1 2
options
�� 
.
�� '
TokenValidationParameters
�� 1
=
��2 3
new
��4 7'
TokenValidationParameters
��8 Q
{
�� 
NameClaimType
�� !
=
��" #
JwtClaimTypes
��$ 1
.
��1 2
Name
��2 6
,
��6 7
RoleClaimType
�� !
=
��" #
JwtClaimTypes
��$ 1
.
��1 2
Role
��2 6
,
��6 7
}
�� 
;
�� 
options
�� 
.
�� 
Events
�� 
=
��  
new
��! $!
OpenIdConnectEvents
��% 8
{
�� 
OnMessageReceived
�� %
=
��& '
OnMessageReceived
��( 9
,
��9 :*
OnRedirectToIdentityProvider
�� 0
=
��1 2*
OnRedirectToIdentityProvider
��3 O
}
�� 
;
�� 
}
�� 
)
�� 
;
�� 
return
�� 
services
�� 
;
�� 
}
�� 	
public
�� 
static
�� 
void
�� &
AddAuthorizationPolicies
�� 3
(
��3 4
this
��4 8 
IServiceCollection
��9 K
services
��L T
)
��T U
{
�� 	
services
�� 
.
�� 
AddAuthorization
�� %
(
��% &
options
��& -
=>
��. 0
{
�� 
options
�� 
.
�� 
	AddPolicy
�� !
(
��! "
$str
��" =
,
��= >
policy
�� 
=>
�� 
policy
�� $
.
��$ %
RequireRole
��% 0
(
��0 1
$str
��1 A
)
��A B
)
��B C
;
��C D
}
�� 
)
�� 
;
�� 
}
�� 	
public
�� 
static
�� 
void
��  
AddMvcLocalization
�� -
(
��- .
this
��. 2 
IServiceCollection
��3 E
services
��F N
)
��N O
{
�� 	
services
�� 
.
�� 
AddSingleton
�� !
<
��! "
ITempDataProvider
��" 3
,
��3 4$
CookieTempDataProvider
��5 K
>
��K L
(
��L M
)
��M N
;
��N O
services
�� 
.
�� 
AddLocalization
�� $
(
��$ %
opts
��% )
=>
��* ,
{
��- .
opts
��/ 3
.
��3 4
ResourcesPath
��4 A
=
��B C!
ConfigurationConsts
��D W
.
��W X
ResourcesPath
��X e
;
��e f
}
��g h
)
��h i
;
��i j
services
�� 
.
�� 
AddMvc
�� 
(
�� 
)
�� 
.
�� %
SetCompatibilityVersion
�� (
(
��( )"
CompatibilityVersion
��) =
.
��= >
Version_2_1
��> I
)
��I J
.
�� !
AddViewLocalization
�� $
(
��$ %0
"LanguageViewLocationExpanderFormat
�� 6
.
��6 7
Suffix
��7 =
,
��= >
opts
�� 
=>
�� 
{
�� 
opts
�� "
.
��" #
ResourcesPath
��# 0
=
��1 2!
ConfigurationConsts
��3 F
.
��F G
ResourcesPath
��G T
;
��T U
}
��V W
)
��W X
.
�� ,
AddDataAnnotationsLocalization
�� /
(
��/ 0
)
��0 1
;
��1 2
services
�� 
.
�� 
	Configure
�� 
<
�� (
RequestLocalizationOptions
�� 9
>
��9 :
(
��: ;
opts
�� 
=>
�� 
{
�� 
var
�� 
supportedCultures
�� )
=
��* +
new
��, /
[
��/ 0
]
��0 1
{
�� 
new
�� 
CultureInfo
�� '
(
��' (
$str
��( /
)
��/ 0
,
��0 1
new
�� 
CultureInfo
�� '
(
��' (
$str
��( ,
)
��, -
}
�� 
;
�� 
opts
�� 
.
�� #
DefaultRequestCulture
�� .
=
��/ 0
new
��1 4
RequestCulture
��5 C
(
��C D
$str
��D H
)
��H I
;
��I J
opts
�� 
.
�� 
SupportedCultures
�� *
=
��+ ,
supportedCultures
��- >
;
��> ?
opts
�� 
.
�� !
SupportedUICultures
�� ,
=
��- .
supportedCultures
��/ @
;
��@ A
}
�� 
)
�� 
;
�� 
}
�� 	
public
�� 
static
�� 
void
��  
UseSecurityHeaders
�� -
(
��- .
this
��. 2!
IApplicationBuilder
��3 F
app
��G J
)
��J K
{
�� 	
app
�� 
.
�� !
UseForwardedHeaders
�� #
(
��# $
new
��$ '%
ForwardedHeadersOptions
��( ?
(
��? @
)
��@ A
{
�� 
ForwardedHeaders
��  
=
��! "
ForwardedHeaders
��# 3
.
��3 4
XForwardedFor
��4 A
|
��B C
ForwardedHeaders
��D T
.
��T U
XForwardedProto
��U d
}
�� 
)
�� 
;
�� 
app
�� 
.
�� 
UseHsts
�� 
(
�� 
options
�� 
=>
��  "
options
��# *
.
��* +
MaxAge
��+ 1
(
��1 2
days
��2 6
:
��6 7
$num
��8 ;
)
��; <
)
��< =
;
��= >
app
�� 
.
�� 
UseXXssProtection
�� !
(
��! "
options
��" )
=>
��* ,
options
��- 4
.
��4 5"
EnabledWithBlockMode
��5 I
(
��I J
)
��J K
)
��K L
;
��L M
app
�� 
.
�� $
UseXContentTypeOptions
�� &
(
��& '
)
��' (
;
��( )
app
�� 
.
�� 
UseXfo
�� 
(
�� 
options
�� 
=>
�� !
options
��" )
.
��) *

SameOrigin
��* 4
(
��4 5
)
��5 6
)
��6 7
;
��7 8
app
�� 
.
�� 
UseReferrerPolicy
�� !
(
��! "
options
��" )
=>
��* ,
options
��- 4
.
��4 5

NoReferrer
��5 ?
(
��? @
)
��@ A
)
��A B
;
��B C
var
�� 
allowCspUrls
�� 
=
�� 
new
�� "
List
��# '
<
��' (
string
��( .
>
��. /
{
�� 
$str
�� /
,
��/ 0
$str
�� ,
}
�� 
;
�� 
app
�� 
.
�� 
UseCsp
�� 
(
�� 
options
�� 
=>
�� !
{
�� 
options
�� 
.
�� 
FontSources
�� #
(
��# $
configuration
��$ 1
=>
��2 4
{
�� 
configuration
�� !
.
��! "
SelfSrc
��" )
=
��* +
true
��, 0
;
��0 1
configuration
�� !
.
��! "
CustomSources
��" /
=
��0 1
allowCspUrls
��2 >
;
��> ?
}
�� 
)
�� 
;
�� 
options
�� 
.
�� 
ScriptSources
�� %
(
��% &
configuration
��& 3
=>
��4 6
{
�� 
configuration
�� !
.
��! "
SelfSrc
��" )
=
��* +
true
��, 0
;
��0 1
configuration
�� !
.
��! "
UnsafeInlineSrc
��" 1
=
��2 3
true
��4 8
;
��8 9
configuration
�� !
.
��! "
UnsafeEvalSrc
��" /
=
��0 1
true
��2 6
;
��6 7
}
�� 
)
�� 
;
�� 
options
�� 
.
�� 
StyleSources
�� $
(
��$ %
configuration
��% 2
=>
��3 5
{
�� 
configuration
�� !
.
��! "
SelfSrc
��" )
=
��* +
true
��, 0
;
��0 1
configuration
�� !
.
��! "
CustomSources
��" /
=
��0 1
allowCspUrls
��2 >
;
��> ?
configuration
�� !
.
��! "
UnsafeInlineSrc
��" 1
=
��2 3
true
��4 8
;
��8 9
}
�� 
)
�� 
;
�� 
}
�� 
)
�� 
;
�� 
}
�� 	
public
�� 
static
�� 
void
�� '
ConfigureAuthentification
�� 4
(
��4 5
this
��5 9!
IApplicationBuilder
��: M
app
��N Q
,
��Q R!
IHostingEnvironment
��S f
env
��g j
)
��j k
{
�� 	
app
�� 
.
�� 
UseAuthentication
�� !
(
��! "
)
��" #
;
��# $
if
�� 
(
�� 
env
�� 
.
�� 
	IsStaging
�� 
(
�� 
)
�� 
)
��  
{
�� 
app
�� 
.
�� 
UseMiddleware
�� !
<
��! "0
"AuthenticatedTestRequestMiddleware
��" D
>
��D E
(
��E F
)
��F G
;
��G H
}
�� 
}
�� 	
public
�� 
static
�� 
void
�� #
ConfigureLocalization
�� 0
(
��0 1
this
��1 5!
IApplicationBuilder
��6 I
app
��J M
)
��M N
{
�� 	
var
�� 
options
�� 
=
�� 
app
�� 
.
�� !
ApplicationServices
�� 1
.
��1 2

GetService
��2 <
<
��< =
IOptions
��= E
<
��E F(
RequestLocalizationOptions
��F `
>
��` a
>
��a b
(
��b c
)
��c d
;
��d e
app
�� 
.
�� $
UseRequestLocalization
�� &
(
��& '
options
��' .
.
��. /
Value
��/ 4
)
��4 5
;
��5 6
}
�� 	
private
�� 
static
�� 
Task
�� 
OnMessageReceived
�� -
(
��- .$
MessageReceivedContext
��. D
context
��E L
)
��L M
{
�� 	
context
�� 
.
�� 

Properties
�� 
.
�� 
IsPersistent
�� +
=
��, -
true
��. 2
;
��2 3
context
�� 
.
�� 

Properties
�� 
.
�� 

ExpiresUtc
�� )
=
��* +
new
��, /
DateTimeOffset
��0 >
(
��> ?
DateTime
��? G
.
��G H
Now
��H K
.
��K L
AddHours
��L T
(
��T U
$num
��U W
)
��W X
)
��X Y
;
��Y Z
return
�� 
Task
�� 
.
�� 

FromResult
�� "
(
��" #
$num
��# $
)
��$ %
;
��% &
}
�� 	
private
�� 
static
�� 
Task
�� *
OnRedirectToIdentityProvider
�� 8
(
��8 9
RedirectContext
��9 H
n
��I J
)
��J K
{
�� 	
n
�� 
.
�� 
ProtocolMessage
�� 
.
�� 
RedirectUri
�� )
=
��* +!
AuthorizationConsts
��, ?
.
��? @!
IdentityRedirectUri
��@ S
;
��S T
return
�� 
Task
�� 
.
�� 

FromResult
�� "
(
��" #
$num
��# $
)
��$ %
;
��% &
}
�� 	
}
�� 
public
�� 

static
�� 
class
�� 2
$ServiceCollectionDevspacesExtensions
�� <
{
�� 
public
�� 
static
��  
IServiceCollection
�� (
AddDevspaces
��) 5
(
��5 6
this
��6 : 
IServiceCollection
��; M
services
��N V
)
��V W
{
�� 	
services
�� 
.
�� 
AddTransient
�� !
<
��! "%
DevspacesMessageHandler
��" 9
>
��9 :
(
��: ;
)
��; <
;
��< =
return
�� 
services
�� 
;
�� 
}
�� 	
}
�� 
public
�� 

static
�� 
class
�� 2
$HttpClientBuilderDevspacesExtensions
�� <
{
�� 
public
�� 
static
��  
IHttpClientBuilder
�� (!
AddDevspacesSupport
��) <
(
��< =
this
��= A 
IHttpClientBuilder
��B T
builder
��U \
)
��\ ]
{
�� 	
builder
�� 
.
�� #
AddHttpMessageHandler
�� )
<
��) *%
DevspacesMessageHandler
��* A
>
��A B
(
��B C
)
��C D
;
��D E
return
�� 
builder
�� 
;
�� 
}
�� 	
}
�� 
public
�� 

class
�� %
DevspacesMessageHandler
�� (
:
��) *
DelegatingHandler
��+ <
{
�� 
private
�� 
const
�� 
string
�� !
DevspacesHeaderName
�� 0
=
��1 2
$str
��3 B
;
��B C
private
�� 
readonly
�� "
IHttpContextAccessor
�� -"
_httpContextAccessor
��. B
;
��B C
public
�� %
DevspacesMessageHandler
�� &
(
��& '"
IHttpContextAccessor
��' ;!
httpContextAccessor
��< O
)
��O P
{
�� 	"
_httpContextAccessor
��  
=
��! "!
httpContextAccessor
��# 6
;
��6 7
}
�� 	
	protected
�� 
override
�� 
Task
�� 
<
��  !
HttpResponseMessage
��  3
>
��3 4
	SendAsync
��5 >
(
��> ? 
HttpRequestMessage
��? Q
request
��R Y
,
��Y Z
CancellationToken
��[ l
cancellationToken
��m ~
)
��~ 
{
�� 	
var
�� 
req
�� 
=
�� "
_httpContextAccessor
�� *
.
��* +
HttpContext
��+ 6
.
��6 7
Request
��7 >
;
��> ?
if
�� 
(
�� 
req
�� 
.
�� 
Headers
�� 
.
�� 
ContainsKey
�� '
(
��' (!
DevspacesHeaderName
��( ;
)
��; <
)
��< =
{
�� 
request
�� 
.
�� 
Headers
�� 
.
��  
Add
��  #
(
��# $!
DevspacesHeaderName
��$ 7
,
��7 8
req
��9 <
.
��< =
Headers
��= D
[
��D E!
DevspacesHeaderName
��E X
]
��X Y
as
��Z \
IEnumerable
��] h
<
��h i
string
��i o
>
��o p
)
��p q
;
��q r
}
�� 
return
�� 
base
�� 
.
�� 
	SendAsync
�� !
(
��! "
request
��" )
,
��) *
cancellationToken
��+ <
)
��< =
;
��= >
}
�� 	
}
�� 
}�� �
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Front\TransacoesFinanceiras\MAGVA.Front.TransacoesFinanceiras\Constants\AuthorizationConsts.cs
	namespace 	
MAGVA
 
. 
Front 
. !
TransacoesFinanceiras +
.+ ,
	Constants, 5
{ 
public 

class 
AuthorizationConsts $
{ 
public 
const 
string '
TransacoesFinanceirasPolicy 7
=8 9
$str: U
;U V
public		 
const		 
string		 %
TransacoesFinanceirasRole		 5
=		6 7
$str		8 S
;		S T
public

 
const

 
string

 )
TransacoesFinanceirasResource

 9
=

: ;
$str

< \
;

\ ]
public 
const 
string *
ApiTansacoesFinanceirashttpuri :
=; <
$str= j
;j k
public 
const 
string +
ApiTansacoesFinanceirasResource ;
=< =
$str> ^
;^ _
public 
const 
string 
IdentityCookieName .
=/ 0
$str1 F
;F G
public 
const 
string 
IdentityRedirectUri /
=0 1
$str2 l
;l m
public 
const 
string !
IdentityServerBaseUrl 1
=2 3
$str4 d
;d e
public 
const 
string 
BaseUrl #
=$ %
$str& T
;T U
public 
const 
string 
UserNameClaimType -
=. /
$str0 6
;6 7
public 
const 
string 
SignInScheme (
=) *
$str+ 4
;4 5
public 
const 
string 
OidcClientId (
=) *
$str+ B
;B C
public 
const 
string $
OidcAuthenticationScheme 4
=5 6
$str7 =
;= >
public 
const 
string 
OidcResponseType ,
=- .
$str/ 9
;9 :
public 
static 
List 
< 
string !
>! "
Scopes# )
=* +
new, /
List0 4
<4 5
string5 ;
>; <
{= >
$str? G
,G H
$strI R
,R S
$strT [
,[ \
$str] d
}e f
;f g
public 
const 
string 
ScopeOpenId '
=( )
$str* 2
;2 3
public 
const 
string 
ScopeProfile (
=) *
$str+ 4
;4 5
public 
const 
string 

ScopeEmail &
=' (
$str) 0
;0 1
public 
const 
string 

ScopeRoles &
=' (
$str) 0
;0 1
public 
const 
string &
ScopeTransacoesFinanceiras 6
=7 8
$str9 P
;P Q
public!! 
const!! 
string!! 
AccountLoginPage!! ,
=!!- .
$str!!/ >
;!!> ?
public"" 
const"" 
string"" #
AccountAccessDeniedPage"" 3
=""4 5
$str""6 N
;""N O
}## 
}$$ �
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Front\TransacoesFinanceiras\MAGVA.Front.TransacoesFinanceiras\Constants\ConfigurationConsts.cs
	namespace 	
MAGVA
 
. 
Front 
. !
TransacoesFinanceiras +
.+ ,
	Constants, 5
{ 
public 

class 
ConfigurationConsts $
{ 
public 
const 
string 
LoggingSectionKey -
=. /
$str0 9
;9 :
public		 
const		 
string		 
ResourcesPath		 )
=		* +
$str		, 7
;		7 8
}

 
} �
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Front\TransacoesFinanceiras\MAGVA.Front.TransacoesFinanceiras\Controllers\AccountController.cs
	namespace 	
MAGVA
 
. 
Front 
. !
TransacoesFinanceiras +
.+ ,
Controllers, 7
{ 
[ 
	Authorize 
] 
public 

class 
AccountController "
:# $
BaseController% 3
{ 
public 
AccountController  
(  !
ILogger! (
<( )
AccountController) :
>: ;
logger< B
)B C
:D E
baseF J
(J K
loggerK Q
)Q R
{ 	
} 	
public 
IActionResult 
AccessDenied )
() *
)* +
{ 	
return 
View 
( 
) 
; 
} 	
public 
IActionResult 
Logout #
(# $
)$ %
{ 	
return 
new 
SignOutResult $
($ %
new% (
List) -
<- .
string. 4
>4 5
{6 7!
OpenIdConnectDefaults8 M
.M N 
AuthenticationSchemeN b
,b c)
CookieAuthenticationDefaults	d �
.
� �"
AuthenticationScheme
� �
}
� �
,
� �
new $
AuthenticationProperties ,
{- .
RedirectUri/ :
=; <
$str= @
}A B
)B C
;C D
} 	
} 
} �
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Front\TransacoesFinanceiras\MAGVA.Front.TransacoesFinanceiras\Controllers\BaseController.cs
	namespace 	
MAGVA
 
. 
Front 
. !
TransacoesFinanceiras +
.+ ,
Controllers, 7
{ 
public 

class 
BaseController 
:  !

Controller" ,
{ 
private		 
readonly		 
ILogger		  
<		  !
BaseController		! /
>		/ 0
_logger		1 8
;		8 9
public 
BaseController 
( 
ILogger %
<% &
BaseController& 4
>4 5
logger6 <
)< =
{ 	
_logger 
= 
logger 
; 
} 	
} 
} �'
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Front\TransacoesFinanceiras\MAGVA.Front.TransacoesFinanceiras\Controllers\ConsumidorController.cs
	namespace 	
MAGVA
 
. 
Front 
. !
TransacoesFinanceiras +
.+ ,
Controllers, 7
{ 
[ 
	Authorize 
] 
public 

class  
ConsumidorController %
:& '

Controller( 2
{ 
private 
readonly 
IIdentityParser (
<( )
ApplicationUser) 8
>8 9
_appUserParser: H
;H I
public 
readonly 
IConsumidorService *
_consumidorService+ =
;= >
public  
ConsumidorController #
(# $
IIdentityParser$ 3
<3 4
ApplicationUser4 C
>C D
appUserParserE R
,R S
IConsumidorServiceT f
consumidorServiceg x
)x y
{ 	
_appUserParser 
= 
appUserParser *
;* +
_consumidorService 
=  
consumidorService! 2
;2 3
} 	
public 
async 
Task 
< 
IActionResult '
>' (
Index) .
(. /
)/ 0
{ 	
try 
{ 
var 
user 
= 
_appUserParser )
.) *
Parse* /
(/ 0
HttpContext0 ;
.; <
User< @
)@ A
;A B
var 
vm 
= 
await 
_consumidorService 1
.1 2
GetConsumidor2 ?
(? @
user@ D
)D E
;E F
if 
( 
string 
. 
IsNullOrEmpty (
(( )
vm) +
.+ ,
Nome, 0
)0 1
)1 2
vm 
= 
null 
; 
return!! 
View!! 
(!! 
vm!! 
)!! 
;!!  
}"" 
catch## 
(## "
BrokenCircuitException## )
)##) *
{$$ (
HandleBrokenCircuitException%% ,
(%%, -
)%%- .
;%%. /
}&& 
return(( 
View(( 
((( 
)(( 
;(( 
})) 	
[++ 	
HttpPost++	 
]++ 
[,, 	$
ValidateAntiForgeryToken,,	 !
],,! "
public-- 
async-- 
Task-- 
<-- 
IActionResult-- '
>--' (
Create--) /
(--/ 0
[--0 1
Bind--1 5
(--5 6
$str--6 B
)--B C
]--C D

Consumidor--E O

consumidor--P Z
)--Z [
{.. 	
try// 
{00 
string11 
result11 
=11 
null11  $
;11$ %
if33 
(33 

ModelState33 
.33 
IsValid33 &
)33& '
{44 
var55 
user55 
=55 
_appUserParser55 -
.55- .
Parse55. 3
(553 4
HttpContext554 ?
.55? @
User55@ D
)55D E
;55E F

consumidor77 
.77 
LoginId77 &
=77' (
user77) -
.77- .
Id77. 0
;770 1

consumidor88 
.88 
Ativo88 $
=88% &
true88' +
;88+ ,
result:: 
=:: 
await:: "
_consumidorService::# 5
.::5 6
PostConsumidor::6 D
(::D E

consumidor::E O
)::O P
;::P Q

consumidor<< 
=<<  
null<<! %
;<<% &
if== 
(== 
result== 
.== 
Contains== '
(==' (
$str==( ,
)==, -
)==- .
{>> 

consumidor?? "
=??# $
await??% *
_consumidorService??+ =
.??= >
GetConsumidor??> K
(??K L
user??L P
)??P Q
;??Q R
}@@ 
}AA 
returnCC 
ViewCC 
(CC 

consumidorCC &
)CC& '
;CC' (
}DD 
catchEE 
(EE "
BrokenCircuitExceptionEE )
)EE) *
{FF (
HandleBrokenCircuitExceptionGG ,
(GG, -
)GG- .
;GG. /
}HH 
returnJJ 
ViewJJ 
(JJ 
)JJ 
;JJ 
}KK 	
privateMM 
voidMM (
HandleBrokenCircuitExceptionMM 1
(MM1 2
)MM2 3
{NN 	
ViewBagOO 
.OO  
BasketInoperativeMsgOO (
=OO) *
$strOO+ Y
;OOY Z
}PP 	
}QQ 
}RR �

�C:\DEV\MAGVA\TransacoesFinanceiras\src\Front\TransacoesFinanceiras\MAGVA.Front.TransacoesFinanceiras\Controllers\ErrorController.cs
	namespace 	
MAGVA
 
. 
Front 
. !
TransacoesFinanceiras +
.+ ,
Controllers, 7
{ 
public 

class 
ErrorController  
:! "

Controller# -
{		 
[

 	
ResponseCache

	 
(

 
Duration

 
=

  !
$num

" #
,

# $
Location

% -
=

. /!
ResponseCacheLocation

0 E
.

E F
None

F J
,

J K
NoStore

L S
=

T U
true

V Z
)

Z [
]

[ \
public 
IActionResult 
Error "
(" #
)# $
{ 	
return 
View 
( 
new 
ErrorViewModel *
{+ ,
	RequestId- 6
=7 8
Activity9 A
.A B
CurrentB I
?I J
.J K
IdK M
??N P
HttpContextQ \
.\ ]
TraceIdentifier] l
}m n
)n o
;o p
} 	
} 
} � 
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Front\TransacoesFinanceiras\MAGVA.Front.TransacoesFinanceiras\Controllers\HomeController.cs
	namespace 	
MAGVA
 
. 
Front 
. !
TransacoesFinanceiras +
.+ ,
Controllers, 7
{ 
[ 
	Authorize 
( 
) 
] 
public 

class 
HomeController 
:  !

Controller" ,
{ 
private 
readonly 
IIdentityParser (
<( )
ApplicationUser) 8
>8 9
_appUserParser: H
;H I
public 
readonly 
IConsumidorService *
_consumidorService+ =
;= >
public 
HomeController 
( 
IIdentityParser -
<- .
ApplicationUser. =
>= >
appUserParser? L
,L M
IConsumidorServiceN `
consumidorServicea r
)r s
{ 	
_appUserParser 
= 
appUserParser *
;* +
_consumidorService 
=  
consumidorService! 2
;2 3
} 	
public 
async 
Task 
< 
IActionResult '
>' (
Index) .
(. /
)/ 0
{ 	
try 
{ 
var 
user 
= 
_appUserParser )
.) *
Parse* /
(/ 0
HttpContext0 ;
.; <
User< @
)@ A
;A B
var 
vm 
= 
await 
_consumidorService 1
.1 2
GetConsumidor2 ?
(? @
user@ D
)D E
;E F
if   
(   
string   
.   
IsNullOrEmpty   (
(  ( )
vm  ) +
.  + ,
Nome  , 0
)  0 1
)  1 2
vm!! 
=!! 
null!! 
;!! 
return## 
View## 
(## 
vm## 
)## 
;##  
}$$ 
catch%% 
(%% "
BrokenCircuitException%% )
)%%) *
{&& (
HandleBrokenCircuitException'' ,
('', -
)''- .
;''. /
}(( 
return** 
View** 
(** 
)** 
;** 
}++ 	
private-- 
void-- (
HandleBrokenCircuitException-- 1
(--1 2
)--2 3
{.. 	
ViewBag// 
.//  
BasketInoperativeMsg// (
=//) *
$str//+ Y
;//Y Z
}00 	
[22 	
AllowAnonymous22	 
(22 
)22 
]22 
public33 
IActionResult33 
Privacy33 $
(33$ %
)33% &
{44 	
return55 
View55 
(55 
)55 
;55 
}66 	
[88 	
AllowAnonymous88	 
(88 
)88 
]88 
[99 	
ResponseCache99	 
(99 
Duration99 
=99  !
$num99" #
,99# $
Location99% -
=99. /!
ResponseCacheLocation990 E
.99E F
None99F J
,99J K
NoStore99L S
=99T U
true99V Z
)99Z [
]99[ \
public:: 
IActionResult:: 
Error:: "
(::" #
)::# $
{;; 	
return<< 
View<< 
(<< 
new<< 
ErrorViewModel<< *
{<<+ ,
	RequestId<<- 6
=<<7 8
Activity<<9 A
.<<A B
Current<<B I
?<<I J
.<<J K
Id<<K M
??<<N P
HttpContext<<Q \
.<<\ ]
TraceIdentifier<<] l
}<<m n
)<<n o
;<<o p
}== 	
}>> 
}?? �

C:\DEV\MAGVA\TransacoesFinanceiras\src\Front\TransacoesFinanceiras\MAGVA.Front.TransacoesFinanceiras\Helpers\DateTimeHelpers.cs
	namespace 	
MAGVA
 
. 
Front 
. !
TransacoesFinanceiras +
.+ ,
Helpers, 3
{ 
public 

static 
class 
DateTimeHelpers '
{ 
private 
static 
readonly 
DateTime  (
Epoch) .
=/ 0
new1 4
DateTime5 =
(= >
$num> B
,B C
$numD E
,E F
$numG H
,H I
$numJ K
,K L
$numM N
,N O
$numP Q
,Q R
DateTimeKindS _
._ `
Utc` c
)c d
;d e
public		 
static		 
double		 
GetEpochTicks		 *
(		* +
this		+ /
DateTimeOffset		0 >
dateTime		? G
)		G H
{

 	
return 
dateTime 
. 
Subtract $
($ %
Epoch% *
)* +
.+ ,
TotalMilliseconds, =
;= >
} 	
} 
} �
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Front\TransacoesFinanceiras\MAGVA.Front.TransacoesFinanceiras\Helpers\Identity\IdentityErrorMessages.cs
	namespace 	
MAGVA
 
. 
Front 
. !
TransacoesFinanceiras +
.+ ,
Helpers, 3
.3 4
Identity4 <
{ 
public 

class !
IdentityErrorMessages &
:' ("
IdentityErrorDescriber) ?
{ 
} 
} �

�C:\DEV\MAGVA\TransacoesFinanceiras\src\Front\TransacoesFinanceiras\MAGVA.Front.TransacoesFinanceiras\Helpers\NotificationHelpers.cs
	namespace 	
MAGVA
 
. 
Front 
. !
TransacoesFinanceiras +
.+ ,
Helpers, 3
{ 
public 

class 
NotificationHelpers $
{ 
public 
const 
string 
NotificationKey +
=, -
$str. P
;P Q
public 
class 
Alert 
{		 	
public

 
	AlertType

 
Type

 !
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
public 
string 
Message !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
Title 
{  !
get" %
;% &
set' *
;* +
}, -
} 	
public 
enum 
	AlertType 
{ 	
Info 
, 
Success 
, 
Warning 
, 
Error 
} 	
} 
} �
~C:\DEV\MAGVA\TransacoesFinanceiras\src\Front\TransacoesFinanceiras\MAGVA.Front.TransacoesFinanceiras\Helpers\StartupHelpers.cs
	namespace 	
MAGVA
 
. 
Front 
. !
TransacoesFinanceiras +
.+ ,
Helpers, 3
{ 
public 

static 
class 
StartupHelpers &
{ 
}		 
}

 �V
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Front\TransacoesFinanceiras\MAGVA.Front.TransacoesFinanceiras\Helpers\TagHelpers\PickerTagHelper.cs
	namespace 	
MAGVA
 
. 
Front 
. !
TransacoesFinanceiras +
.+ ,
Helpers, 3
.3 4

TagHelpers4 >
{		 
[

 
HtmlTargetElement

 
(

 
$str

 
)

  
]

  !
public 

class 
PickerTagHelper  
:! "
	TagHelper# ,
{ 
public 
string 
Url 
{ 
get 
;  
set! $
;$ %
}& '
[ 	
Required	 
] 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
public 
string 
SelectedItemsTitle (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
string "
SearchInputPlaceholder ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
string 
SearchResultTitle '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
string 
SuggestedItemsTitle )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
string 
NoItemSelectedTitle )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
List 
< 
string 
> 
SelectedItems )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
string 
SelectedItem "
{# $
get% (
;( )
set* -
;- .
}/ 0
public   
string   
ShowAllItemsTitle   '
{  ( )
get  * -
;  - .
set  / 2
;  2 3
}  4 5
public"" 
int"" 
MinSearchText""  
{""! "
get""# &
;""& '
set""( +
;""+ ,
}""- .
public$$ 
bool$$ 
MultipleSelect$$ "
{$$# $
get$$% (
;$$( )
set$$* -
;$$- .
}$$/ 0
public&& 
bool&& 
AllowSuggestedItems&& '
{&&( )
get&&* -
;&&- .
set&&/ 2
;&&2 3
}&&4 5
=&&6 7
true&&8 <
;&&< =
public(( 
int(( 
TopSuggestedItems(( $
{((% &
get((' *
;((* +
set((, /
;((/ 0
}((1 2
=((3 4
$num((5 6
;((6 7
public** 
bool** 
Required** 
{** 
get** "
;**" #
set**$ '
;**' (
}**) *
public,, 
string,, 
RequiredMessage,, %
{,,& '
get,,( +
;,,+ ,
set,,- 0
;,,0 1
},,2 3
public.. 
override.. 
void.. 
Process.. $
(..$ %
TagHelperContext..% 5
context..6 =
,..= >
TagHelperOutput..? N
output..O U
)..U V
{// 	

AddWrapper00 
(00 
output00 
)00 
;00 
AddComponent11 
(11 
output11 
)11  
;11  !
AddHiddenField22 
(22 
output22 !
)22! "
;22" #
}33 	
private55 
void55 

AddWrapper55 
(55  
TagHelperOutput55  /
output550 6
)556 7
{66 	
output77 
.77 
TagMode77 
=77 
TagMode77 $
.77$ %
StartTagAndEndTag77% 6
;776 7
output88 
.88 
TagName88 
=88 
$str88 "
;88" #
output99 
.99 

Attributes99 
.99 
Add99 !
(99! "
$str99" )
,99) *
$str99+ :
)99: ;
;99; <
output:: 
.:: 

Attributes:: 
.:: 
Add:: !
(::! "
new::" %
TagHelperAttribute::& 8
(::8 9
$str::9 D
,::D E
new::F I

HtmlString::J T
(::T U
$str::U m
)::m n
)::n o
)::o p
;::p q
};; 	
private== 
void== 
AddComponent== !
(==! "
TagHelperOutput==" 1
output==2 8
)==8 9
{>> 	
var?? 
selectedItems?? 
=?? (
GetSelectedItemsToJsonString??  <
(??< =
)??= >
;??> ?
varAA 
rawPickerHtmlAA 
=AA 
newAA  #

HtmlStringAA$ .
(AA. /
$"AA/ 1c
V<div data-bind=\'component: {{ name: \"picker\", params: {{ search: \"\", hiddenId: \"	AA1 �
{
AA� �
Id
AA� �
}
AA� �
\", url: \"
AA� �
{
AA� �
Url
AA� �
}
AA� �(
\", selectedItemsTitle: \"
AA� �
{
AA� � 
SelectedItemsTitle
AA� �
}
AA� �'
\", allowSuggestedItems: 
AA� �
{
AA� �!
AllowSuggestedItems
AA� �
.
AA� �
ToString
AA� �
(
AA� �
)
AA� �
.
AA� �
ToLower
AA� �
(
AA� �
)
AA� �
}
AA� �%
, searchResultTitle: \"
AA� �
{
AA� �
SearchResultTitle
AA� �
}
AA� �)
\", suggestedItemsTitle: \"
AA� �
{
AA� �!
SuggestedItemsTitle
AA� �
}
AA� �)
\", noItemSelectedTitle: \"
AA� �
{
AA� �!
NoItemSelectedTitle
AA� �
}
AA� �,
\", searchInputPlaceholder: \"
AA� �
{
AA� �$
SearchInputPlaceholder
AA� �
}
AA� �'
\", showAllItemsTitle: \"
AA� �
{
AA� �
ShowAllItemsTitle
AA� �
}
AA� �!
\", selectedItems: 
AA� �
{
AA� �
selectedItems
AA� �
}
AA� �
, minSearchText: 
AA� �
{
AA� �
MinSearchText
AA� �
}
AA� �#
, topSuggestedItems: 
AA� �
{
AA� �
TopSuggestedItems
AA� �
}
AA� � 
 ,multipleSelect: 
AA� �
{
AA� �
MultipleSelect
AA� �
.
AA� �
ToString
AA� �
(
AA� �
)
AA� �
.
AA� �
ToLower
AA� �
(
AA� �
)
AA� �
}
AA� �
 }}}}\'></div>
AA� �
"
AA� �
)
AA� �
;
AA� �
outputCC 
.CC 
ContentCC 
.CC 

AppendHtmlCC %
(CC% &
rawPickerHtmlCC& 3
)CC3 4
;CC4 5
}DD 	
privateJJ 
stringJJ (
GetSelectedItemsToJsonStringJJ 3
(JJ3 4
)JJ4 5
{KK 	
forLL 
(LL 
varLL 
iLL 
=LL 
$numLL 
;LL 
iLL 
<LL 
SelectedItemsLL  -
?LL- .
.LL. /
CountLL/ 4
;LL4 5
iLL6 7
++LL7 9
)LL9 :
{MM 
SelectedItemsNN 
[NN 
iNN 
]NN  
=NN! "
SelectedItemsNN# 0
[NN0 1
iNN1 2
]NN2 3
.NN3 4
ReplaceNN4 ;
(NN; <
$strNN< ?
,NN? @
$strNNA C
)NNC D
.NND E
ReplaceNNE L
(NNL M
$strNNM Q
,NNQ R
$strNNS U
)NNU V
;NNV W
}OO 
varQQ 
selectedItemsQQ 
=QQ 
MultipleSelectQQ  .
?QQ/ 0
JsonConvertQQ1 <
.QQ< =
SerializeObjectQQ= L
(QQL M
SelectedItemsQQM Z
??QQ[ ]
newQQ^ a
ListQQb f
<QQf g
stringQQg m
>QQm n
(QQn o
)QQo p
)QQp q
:QQr s
JsonConvertQQt 
.	QQ �
SerializeObject
QQ� �
(
QQ� �
SelectedItem
QQ� �
)
QQ� �
;
QQ� �
returnSS 
selectedItemsSS  
;SS  !
}TT 	
privateVV 
voidVV 
AddHiddenFieldVV #
(VV# $
TagHelperOutputVV$ 3
outputVV4 :
)VV: ;
{WW 	
varXX 
hiddenFieldXX 
=XX 
newXX !

TagBuilderXX" ,
(XX, -
$strXX- 4
)XX4 5
;XX5 6
hiddenFieldYY 
.YY 

AttributesYY "
.YY" #
AddYY# &
(YY& '
$strYY' -
,YY- .
$strYY/ 7
)YY7 8
;YY8 9
hiddenFieldZZ 
.ZZ 

AttributesZZ "
.ZZ" #
AddZZ# &
(ZZ& '
$strZZ' +
,ZZ+ ,
IdZZ- /
)ZZ/ 0
;ZZ0 1
hiddenField[[ 
.[[ 

Attributes[[ "
.[[" #
Add[[# &
([[& '
$str[[' -
,[[- .
Id[[/ 1
)[[1 2
;[[2 3
hiddenField\\ 
.\\ 

Attributes\\ "
.\\" #
Add\\# &
(\\& '
$str\\' .
,\\. /
string\\0 6
.\\6 7
Empty\\7 <
)\\< =
;\\= >
if^^ 
(^^ 
Required^^ 
)^^ 
{__ 
hiddenField`` 
.`` 

Attributes`` &
.``& '
Add``' *
(``* +
$str``+ 5
,``5 6
string``7 =
.``= >
Empty``> C
)``C D
;``D E
hiddenFieldaa 
.aa 

Attributesaa &
.aa& '
Addaa' *
(aa* +
$straa+ 5
,aa5 6
$straa7 =
)aa= >
;aa> ?
hiddenFieldbb 
.bb 

Attributesbb &
.bb& '
Addbb' *
(bb* +
$strbb+ >
,bb> ?
RequiredMessagebb@ O
??bbP R
$"bbS U
The bbU Y
{bbY Z
IdbbZ \
}bb\ ]
 field is required.bb] p
"bbp q
)bbq r
;bbr s
hiddenFieldcc 
.cc 

Attributescc &
.cc& '
Addcc' *
(cc* +
$strcc+ :
,cc: ;
$strcc< B
)ccB C
;ccC D
}dd 
outputff 
.ff 
Contentff 
.ff 

AppendHtmlff %
(ff% &
hiddenFieldff& 1
)ff1 2
;ff2 3
}gg 	
}hh 
}ii �
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Front\TransacoesFinanceiras\MAGVA.Front.TransacoesFinanceiras\Helpers\TagHelpers\SwitchTagHelper.cs
	namespace 	
MAGVA
 
. 
Front 
. !
TransacoesFinanceiras +
.+ ,
Helpers, 3
.3 4

TagHelpers4 >
{ 
[ 
HtmlTargetElement 
( 
$str &
)& '
]' (
public 

class 
SwitchTagHelper  
:! "
	TagHelper# ,
{		 
public

 
override

 
async

 
Task

 "
ProcessAsync

# /
(

/ 0
TagHelperContext

0 @
context

A H
,

H I
TagHelperOutput

J Y
output

Z `
)

` a
{ 	
var 
childContent 
= 
await $
output% +
.+ , 
GetChildContentAsync, @
(@ A
)A B
;B C
var 
	divSlider 
= 
new 

TagBuilder  *
(* +
$str+ 0
)0 1
;1 2
	divSlider 
. 
AddCssClass !
(! "
$str" 0
)0 1
;1 2
output 
. 
TagName 
= 
$str $
;$ %
output 
. 

Attributes 
. 
Add !
(! "
$str" )
,) *
$str+ 3
)3 4
;4 5
output 
. 
Content 
. 

AppendHtml %
(% &
childContent& 2
)2 3
;3 4
output 
. 
Content 
. 

AppendHtml %
(% &
	divSlider& /
)/ 0
;0 1
output 
. 
TagMode 
= 
TagMode $
.$ %
StartTagAndEndTag% 6
;6 7
} 	
} 
} �
zC:\DEV\MAGVA\TransacoesFinanceiras\src\Front\TransacoesFinanceiras\MAGVA.Front.TransacoesFinanceiras\Helpers\UrlHelpers.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
Helpers& -
{ 
public 

static 
class 

UrlHelpers "
{ 
public 
static 
string 
QueryStringSafeHash 0
(0 1
string1 7
hash8 <
)< =
{ 	
hash 
= 
hash 
. 
Replace 
(  
$char  #
,# $
$char% (
)( )
;) *
return 
hash 
. 
Replace 
(  
$char  #
,# $
$char% (
)( )
;) *
}		 	
public 
static 
string !
QueryStringUnSafeHash 2
(2 3
string3 9
hash: >
)> ?
{ 	
hash 
= 
hash 
. 
Replace 
(  
$char  #
,# $
$char% (
)( )
;) *
return 
hash 
. 
Replace 
(  
$char  #
,# $
$char% (
)( )
;) *
} 	
} 
} �
zC:\DEV\MAGVA\TransacoesFinanceiras\src\Front\TransacoesFinanceiras\MAGVA.Front.TransacoesFinanceiras\Infrastructure\API.cs
	namespace 	
MAGVA
 
. 
Front 
. !
TransacoesFinanceiras +
.+ ,
Infrastructure, :
{ 
public 

static 
class 
API 
{ 
public 
static 
class 

Consumidor &
{ 	
public 
static 
string  
GetConsumidor! .
(. /
string/ 5
baseUri6 =
,= >
string? E
LoginIdF M
)M N
=>O Q
$"R T
{T U
baseUriU \
}\ ]
/] ^
{^ _
LoginId_ f
}f g
"g h
;h i
public		 
static		 
string		  
PostConsumidor		! /
(		/ 0
string		0 6
baseUri		7 >
)		> ?
=>		@ B
$"		C E
{		E F
baseUri		F M
}		M N
"		N O
;		O P
public

 
static

 
string

  
PutConsumidor

! .
(

. /
string

/ 5
baseUri

6 =
)

= >
=>

? A
$"

B D
{

D E
baseUri

E L
}

L M
"

M N
;

N O
public 
static 
string  
DeleteConsumidor! 1
(1 2
string2 8
baseUri9 @
,@ A
stringB H
idI K
)K L
=>M O
$"P R
{R S
baseUriS Z
}Z [
/[ \
{\ ]
id] _
}_ `
"` a
;a b
} 	
} 
} �
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Front\TransacoesFinanceiras\MAGVA.Front.TransacoesFinanceiras\Infrastructure\Exceptions\FailingMiddlewareAppBuilderExtensions.cs
	namespace 	
MAGVA
 
. 
Front 
. !
TransacoesFinanceiras +
.+ ,
Infrastructure, :
.: ;
Middlewares; F
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
} �
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Front\TransacoesFinanceiras\MAGVA.Front.TransacoesFinanceiras\Infrastructure\HttpClientAuthorizationDelegatingHandler.cs
	namespace 	
MAGVA
 
. 
Front 
. !
TransacoesFinanceiras +
.+ ,
Infrastructure, :
{ 
public 

class 4
(HttpClientAuthorizationDelegatingHandler 9
: 	
DelegatingHandler
 
{ 
private 
readonly  
IHttpContextAccessor -
_httpContextAccesor. A
;A B
public 4
(HttpClientAuthorizationDelegatingHandler 7
(7 8 
IHttpContextAccessor8 L
httpContextAccesorM _
)_ `
{ 	
_httpContextAccesor 
=  !
httpContextAccesor" 4
;4 5
} 	
	protected 
override 
async  
Task! %
<% &
HttpResponseMessage& 9
>9 :
	SendAsync; D
(D E
HttpRequestMessageE W
requestX _
,_ `
CancellationTokena r
cancellationToken	s �
)
� �
{ 	
var 
authorizationHeader #
=$ %
_httpContextAccesor& 9
.9 :
HttpContext: E
. 
Request 
. 
Headers  
[  !
$str! 0
]0 1
;1 2
if 
( 
! 
string 
. 
IsNullOrEmpty %
(% &
authorizationHeader& 9
)9 :
): ;
{ 
request 
. 
Headers 
.  
Add  #
(# $
$str$ 3
,3 4
new5 8
List9 =
<= >
string> D
>D E
(E F
)F G
{H I
authorizationHeaderJ ]
}^ _
)_ `
;` a
} 
var   
token   
=   
await   
GetToken   &
(  & '
)  ' (
;  ( )
if"" 
("" 
token"" 
!="" 
null"" 
)"" 
{## 
request$$ 
.$$ 
Headers$$ 
.$$  
Authorization$$  -
=$$. /
new$$0 3%
AuthenticationHeaderValue$$4 M
($$M N
$str$$N V
,$$V W
token$$X ]
)$$] ^
;$$^ _
}%% 
return'' 
await'' 
base'' 
.'' 
	SendAsync'' '
(''' (
request''( /
,''/ 0
cancellationToken''1 B
)''B C
;''C D
}(( 	
async** 
Task** 
<** 
string** 
>** 
GetToken** #
(**# $
)**$ %
{++ 	
const,, 
string,, 
ACCESS_TOKEN,, %
=,,& '
$str,,( 6
;,,6 7
return.. 
await.. 
_httpContextAccesor.. ,
..., -
HttpContext..- 8
.// 
GetTokenAsync// 
(// 
ACCESS_TOKEN// +
)//+ ,
;//, -
}00 	
}11 
}22 �
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Front\TransacoesFinanceiras\MAGVA.Front.TransacoesFinanceiras\Infrastructure\HttpClientRequestIdDelegatingHandler.cs
	namespace 	
MAGVA
 
. 
Front 
. !
TransacoesFinanceiras +
.+ ,
Infrastructure, :
{ 
public		 

class		 0
$HttpClientRequestIdDelegatingHandler		 5
:

 
DelegatingHandler

	 
{ 
public 0
$HttpClientRequestIdDelegatingHandler 3
(3 4
)4 5
{ 	
} 	
	protected 
override 
async  
Task! %
<% &
HttpResponseMessage& 9
>9 :
	SendAsync; D
(D E
HttpRequestMessageE W
requestX _
,_ `
CancellationTokena r
cancellationToken	s �
)
� �
{ 	
if 
( 
request 
. 
Method 
== !

HttpMethod" ,
., -
Post- 1
||2 4
request5 <
.< =
Method= C
==D F

HttpMethodG Q
.Q R
PutR U
)U V
{ 
if 
( 
! 
request 
. 
Headers $
.$ %
Contains% -
(- .
$str. ;
); <
)< =
{ 
request 
. 
Headers #
.# $
Add$ '
(' (
$str( 5
,5 6
Guid7 ;
.; <
NewGuid< C
(C D
)D E
.E F
ToStringF N
(N O
)O P
)P Q
;Q R
} 
} 
return 
await 
base 
. 
	SendAsync '
(' (
request( /
,/ 0
cancellationToken1 B
)B C
;C D
} 	
} 
} �5
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Front\TransacoesFinanceiras\MAGVA.Front.TransacoesFinanceiras\Infrastructure\Middlewares\ByPassAuthMiddleware.cs
	namespace 	
MAGVA
 
. 
Front 
. !
TransacoesFinanceiras +
.+ ,
Infrastructure, :
.: ;
Middlewares; F
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
public  
ByPassAuthMiddleware #
(# $
RequestDelegate$ 3
next4 8
)8 9
{ 	
_next 
= 
next 
; 
_currentUserId 
= 
null !
;! "
} 	
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
path 
== 
$str !
)! "
{ 
var 
userid 
= 
context $
.$ %
Request% ,
., -
Query- 2
[2 3
$str3 ;
]; <
;< =
if 
( 
! 
string 
. 
IsNullOrEmpty )
() *
userid* 0
)0 1
)1 2
{ 
_currentUserId "
=# $
userid% +
;+ ,
} 
context   
.   
Response    
.    !

StatusCode  ! +
=  , -
$num  . 1
;  1 2
context!! 
.!! 
Response!!  
.!!  !
ContentType!!! ,
=!!- .
$str!!/ <
;!!< =
await"" 
context"" 
."" 
Response"" &
.""& '

WriteAsync""' 1
(""1 2
$"""2 4
User set to ""4 @
{""@ A
_currentUserId""A O
}""O P
"""P Q
)""Q R
;""R S
}## 
else%% 
if%% 
(%% 
path%% 
==%% 
$str%% ,
)%%, -
{&& 
_currentUserId'' 
=''  
null''! %
;''% &
context(( 
.(( 
Response((  
.((  !

StatusCode((! +
=((, -
$num((. 1
;((1 2
context)) 
.)) 
Response))  
.))  !
ContentType))! ,
=))- .
$str))/ <
;))< =
await** 
context** 
.** 
Response** &
.**& '

WriteAsync**' 1
(**1 2
$"**2 4E
9User set to none. Token required for protected endpoints.**4 m
"**m n
)**n o
;**o p
}++ 
else,, 
{-- 
var.. 
currentUserId.. !
=.." #
_currentUserId..$ 2
;..2 3
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
if11 
(11 

authHeader11 
!=11 !
StringValues11" .
.11. /
Empty11/ 4
)114 5
{22 
var33 
header33 
=33  

authHeader33! +
.33+ ,
FirstOrDefault33, :
(33: ;
)33; <
;33< =
if44 
(44 
!44 
string44 
.44  
IsNullOrEmpty44  -
(44- .
header44. 4
)444 5
&&446 8
header449 ?
.44? @

StartsWith44@ J
(44J K
$str44K S
)44S T
&&44U W
header44X ^
.44^ _
Length44_ e
>44f g
$str44h p
.44p q
Length44q w
)44w x
{55 
currentUserId66 %
=66& '
header66( .
.66. /
	Substring66/ 8
(668 9
$str669 A
.66A B
Length66B H
)66H I
;66I J
}77 
}88 
if:: 
(:: 
!:: 
string:: 
.:: 
IsNullOrEmpty:: )
(::) *
currentUserId::* 7
)::7 8
)::8 9
{;; 
var<< 
user<< 
=<< 
new<< "
ClaimsIdentity<<# 1
(<<1 2
new<<2 5
[<<5 6
]<<6 7
{<<8 9
new== 
Claim== 
(== 
$str== &
,==& '
currentUserId==( 5
)==5 6
,==6 7
new>> 
Claim>> 
(>> 
$str>> $
,>>$ %
$str>>& 1
)>>1 2
,>>2 3
new?? 
Claim?? 
(?? 
$str?? %
,??% &
Guid??' +
.??+ ,
NewGuid??, 3
(??3 4
)??4 5
.??5 6
ToString??6 >
(??> ?
)??? @
)??@ A
,??A B
new@@ 
Claim@@ 
(@@ 
$str@@ \
,@@\ ]
$str@@^ t
)@@t u
,@@u v
newAA 
ClaimAA 
(AA 
$strAA %
,AA% &
GuidAA' +
.AA+ ,
NewGuidAA, 3
(AA3 4
)AA4 5
.AA5 6
ToStringAA6 >
(AA> ?
)AA? @
)AA@ A
,AAA B
newBB 
ClaimBB 
(BB 
$strBB ]
,BB] ^
$strBB^ d
)BBd e
,BBe f
newCC 
ClaimCC 
(CC 
$strCC #
,CC# $
$strCC% +
)CC+ ,
,CC, -
newDD 
ClaimDD 
(DD 
$strDD /
,DD/ 0
$strDD1 8
)DD8 9
,DD9 :
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
}OO �5
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Front\TransacoesFinanceiras\MAGVA.Front.TransacoesFinanceiras\Infrastructure\Middlewares\FailingMiddleware.cs
	namespace 	
MAGVA
 
. 
Front 
. !
TransacoesFinanceiras +
.+ ,
Infrastructure, :
.: ;
Middlewares; F
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
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Front\TransacoesFinanceiras\MAGVA.Front.TransacoesFinanceiras\Infrastructure\Middlewares\FailingOptions.cs
	namespace 	
MAGVA
 
. 
Front 
. !
TransacoesFinanceiras +
.+ ,
Infrastructure, :
.: ;
Middlewares; F
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
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Front\TransacoesFinanceiras\MAGVA.Front.TransacoesFinanceiras\Infrastructure\Middlewares\FailingStartupFilter.cs
	namespace 	
MAGVA
 
. 
Front 
. !
TransacoesFinanceiras +
.+ ,
Infrastructure, :
.: ;
Middlewares; F
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

�C:\DEV\MAGVA\TransacoesFinanceiras\src\Front\TransacoesFinanceiras\MAGVA.Front.TransacoesFinanceiras\Infrastructure\Middlewares\WebHostBuildertExtensions.cs
	namespace 	
MAGVA
 
. 
Front 
. !
TransacoesFinanceiras +
.+ ,
Infrastructure, :
.: ;
Middlewares; F
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
} �3
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Front\TransacoesFinanceiras\MAGVA.Front.TransacoesFinanceiras\Middlewares\AuthenticatedTestRequestMiddleware.cs
	namespace 	
MAGVA
 
. 
Front 
. !
TransacoesFinanceiras +
.+ ,
Middlewares, 7
{ 
public

 

class

 .
"AuthenticatedTestRequestMiddleware

 3
{ 
private 
readonly 
RequestDelegate (
_next) .
;. /
public 
const 
string  
TestUserPrefixHeader 0
=1 2
$str3 =
;= >
public 
const 
string 

TestUserId &
=' (
$str) 1
;1 2
public 
const 
string 
TestUserName (
=) *
$str+ 5
;5 6
public 
const 
string 
TestUserRoles )
=* +
$str, 7
;7 8
public .
"AuthenticatedTestRequestMiddleware 1
(1 2
RequestDelegate2 A
nextB F
)F G
{ 	
_next 
= 
next 
; 
} 	
public 
async 
Task 
Invoke  
(  !
HttpContext! ,
context- 4
)4 5
{ 	
if 
( 
context 
. 
Request 
.  
Headers  '
.' (
Keys( ,
., -
Contains- 5
(5 6
$"6 8
{8 9 
TestUserPrefixHeader9 M
}M N
-N O
{O P
TestUserNameP \
}\ ]
"] ^
)^ _
)_ `
{ 
var 
name 
= 
context 
. 
Request #
.# $
Headers$ +
[+ ,
$", .
{. / 
TestUserPrefixHeader/ C
}C D
-D E
{E F
TestUserNameF R
}R S
"S T
]T U
.U V
FirstV [
([ \
)\ ]
;] ^
var 
id 
= 
context   
.   
Request   #
.  # $
Headers  $ +
.  + ,
Keys  , 0
.  0 1
Contains  1 9
(  9 :
$"  : <
{  < = 
TestUserPrefixHeader  = Q
}  Q R
-  R S
{  S T

TestUserId  T ^
}  ^ _
"  _ `
)  ` a
?!! 
context!! !
.!!! "
Request!!" )
.!!) *
Headers!!* 1
[!!1 2
$"!!2 4
{!!4 5 
TestUserPrefixHeader!!5 I
}!!I J
-!!J K
{!!K L

TestUserId!!L V
}!!V W
"!!W X
]!!X Y
.!!Y Z
First!!Z _
(!!_ `
)!!` a
:!!b c
string!!d j
.!!j k
Empty!!k p
;!!p q
var## 
claims## 
=## 
new##  
List##! %
<##% &
Claim##& +
>##+ ,
{$$ 
new%% 
Claim%% 
(%% 

ClaimTypes%% (
.%%( )
Name%%) -
,%%- .
name%%/ 3
)%%3 4
,%%4 5
new&& 
Claim&& 
(&& 

ClaimTypes&& (
.&&( )
NameIdentifier&&) 7
,&&7 8
id&&9 ;
)&&; <
,&&< =
}'' 
;'' 
AddRoles)) 
()) 
context))  
,))  !
claims))" (
)))( )
;))) *
var++ 
claimsIdentity++ "
=++# $
new++% (
ClaimsIdentity++) 7
(++7 8
claims++8 >
,++> ?
$str++@ I
)++I J
;++J K
var-- 
claimsPrincipal-- #
=--$ %
new--& )
ClaimsPrincipal--* 9
(--9 :
claimsIdentity--: H
)--H I
;--I J
context.. 
... 
User.. 
=.. 
claimsPrincipal.. .
;... /
}// 
await11 
_next11 
(11 
context11 
)11  
;11  !
}22 	
private44 
void44 
AddRoles44 
(44 
HttpContext44 )
context44* 1
,441 2
List443 7
<447 8
Claim448 =
>44= >
claims44? E
)44E F
{55 	
var66 
roles66 
=66 
context66 
.66  
Request66  '
.66' (
Headers66( /
.66/ 0
Keys660 4
.664 5
Contains665 =
(66= >
$"66> @
{66@ A 
TestUserPrefixHeader66A U
}66U V
-66V W
{66W X
TestUserRoles66X e
}66e f
"66f g
)66g h
?77 
context77 
.77 
Request77 !
.77! "
Headers77" )
[77) *
$"77* ,
{77, - 
TestUserPrefixHeader77- A
}77A B
-77B C
{77C D
TestUserRoles77D Q
}77Q R
"77R S
]77S T
.77T U
First77U Z
(77Z [
)77[ \
:88 
string88 
.88 
Empty88 
;88 
var:: 
	rolesList:: 
=:: 
new:: 
List::  $
<::$ %
string::% +
>::+ ,
(::, -
)::- .
;::. /
if<< 
(<< 
!<< 
string<< 
.<< 
IsNullOrEmpty<< %
(<<% &
roles<<& +
)<<+ ,
)<<, -
{== 
	rolesList>> 
.>> 
AddRange>> "
(>>" #
roles>># (
.>>( )
Split>>) .
(>>. /
$char>>/ 2
)>>2 3
)>>3 4
;>>4 5
}?? 
claimsAA 
.AA 
AddRangeAA 
(AA 
	rolesListAA %
.AA% &
SelectAA& ,
(AA, -
roleAA- 1
=>AA2 4
newAA5 8
ClaimAA9 >
(AA> ?

ClaimTypesAA? I
.AAI J
RoleAAJ N
,AAN O
roleAAP T
)AAT U
)AAU V
)AAV W
;AAW X
}BB 	
}CC 
}DD �
}C:\DEV\MAGVA\TransacoesFinanceiras\src\Front\TransacoesFinanceiras\MAGVA.Front.TransacoesFinanceiras\Models\ErrorViewModel.cs
	namespace 	
MAGVA
 
. 
Front 
. !
TransacoesFinanceiras +
.+ ,
Models, 2
{ 
public 

class 
ErrorViewModel 
{ 
public 
string 
	RequestId 
{  !
get" %
;% &
set' *
;* +
}, -
public 
bool 
ShowRequestId !
=>" $
!% &
string& ,
., -
IsNullOrEmpty- :
(: ;
	RequestId; D
)D E
;E F
} 
}		 �5
oC:\DEV\MAGVA\TransacoesFinanceiras\src\Front\TransacoesFinanceiras\MAGVA.Front.TransacoesFinanceiras\Program.cs
	namespace 	
MAGVA
 
. 
Front 
. !
TransacoesFinanceiras +
{ 
public 

class 
Program 
{ 
public 
static 
readonly 
string %
	Namespace& /
=0 1
typeof2 8
(8 9
Program9 @
)@ A
.A B
	NamespaceB K
;K L
public 
static 
readonly 
string %
AppName& -
=. /
	Namespace0 9
.9 :
	Substring: C
(C D
	NamespaceD M
.M N
LastIndexOfN Y
(Y Z
$charZ ]
,] ^
	Namespace_ h
.h i
LastIndexOfi t
(t u
$charu x
)x y
-z {
$num| }
)} ~
+	 �
$num
� �
)
� �
;
� �
public 
static 
IWebHost 
host #
;# $
public 
static 
int 
Main 
( 
string %
[% &
]& '
args( ,
), -
{ 	
var 
configuration 
= 
GetConfiguration  0
(0 1
)1 2
;2 3
Serilog 
. 
ILogger 
log 
=  !
CreateSerilogLogger" 5
(5 6
configuration6 C
)C D
;D E
Log 
. 
Logger 
= 
log 
; 
try 
{ 
Log 
. 
Information 
(  
$str  P
,P Q
AppNameR Y
)Y Z
;Z [
host 
= 
BuildWebHost #
(# $
configuration$ 1
,1 2
log3 6
,6 7
args8 <
)< =
;= >
Log 
. 
Information 
(  
$str  M
,M N
AppNameO V
)V W
;W X
host 
. 
Run 
( 
) 
; 
return!! 
$num!! 
;!! 
}"" 
catch## 
(## 
	Exception## 
ex## 
)##  
{$$ 
Log%% 
.%% 
Fatal%% 
(%% 
ex%% 
,%% 
$str%% W
,%%W X
AppName%%Y `
)%%` a
;%%a b
return&& 
$num&& 
;&& 
}'' 
finally(( 
{)) 
Log** 
.** 
CloseAndFlush** !
(**! "
)**" #
;**# $
}++ 
},, 	
private.. 
static.. 
IWebHost.. 
BuildWebHost..  ,
(.., -
IConfiguration..- ;
configuration..< I
,..I J
Serilog..K R
...R S
ILogger..S Z
logger..[ a
,..a b
string..c i
[..i j
]..j k
args..l p
)..p q
=>..r t
WebHost// 
.//  
CreateDefaultBuilder// 0
(//0 1
args//1 5
)//5 6
.00  
CaptureStartupErrors00 -
(00- .
false00. 3
)003 4
.11 

UseFailing11 #
(11# $
options11$ +
=>11, .
options11/ 6
.116 7

ConfigPath117 A
=11B C
$str11D N
)11N O
.22 

UseStartup22 #
<22# $
Startup22$ +
>22+ ,
(22, -
)22- .
.33 
UseContentRoot33 '
(33' (
	Directory33( 1
.331 2
GetCurrentDirectory332 E
(33E F
)33F G
)33G H
.44 
UseConfiguration44 )
(44) *
configuration44* 7
)447 8
.55 

UseSerilog55 #
(55# $
logger55$ *
)55* +
.66 
Build66 
(66 
)66  
;66  !
private88 
static88 
Serilog88 
.88 
ILogger88 &
CreateSerilogLogger88' :
(88: ;
IConfiguration88; I
configuration88J W
)88W X
{99 	
var;; 
logstashUrl;; 
=;; 
configuration;; +
[;;+ ,
$str;;, B
];;B C
;;;C D
return<< 
new<< 
LoggerConfiguration<< *
(<<* +
)<<+ ,
.== 
MinimumLevel== 
.== 
Debug== #
(==# $
)==$ %
.>> 
Enrich>> 
.>> 
WithProperty>> $
(>>$ %
$str>>% 9
,>>9 :
AppName>>; B
)>>B C
.?? 
Enrich?? 
.?? 
FromLogContext?? &
(??& '
)??' (
.@@ 
WriteTo@@ 
.@@ 
Console@@  
(@@  !
)@@! "
.BB 
WriteToBB 
.BB 
HttpBB 
(BB 
stringBB $
.BB$ %
IsNullOrWhiteSpaceBB% 7
(BB7 8
logstashUrlBB8 C
)BBC D
?BBE F
$strBBG b
:BBc d
logstashUrlBBe p
)BBp q
.CC 
ReadFromCC 
.CC 
ConfigurationCC '
(CC' (
configurationCC( 5
)CC5 6
.DD 
CreateLoggerDD 
(DD 
)DD 
;DD  
}EE 	
privateGG 
staticGG 
IConfigurationGG %
GetConfigurationGG& 6
(GG6 7
)GG7 8
{HH 	
varII 
builderII 
=II 
newII  
ConfigurationBuilderII 2
(II2 3
)II3 4
.JJ 
SetBasePathJJ 
(JJ 
	DirectoryJJ &
.JJ& '
GetCurrentDirectoryJJ' :
(JJ: ;
)JJ; <
)JJ< =
.KK 
AddJsonFileKK 
(KK 
$strKK /
,KK/ 0
optionalKK1 9
:KK9 :
falseKK; @
,KK@ A
reloadOnChangeKKB P
:KKP Q
trueKKR V
)KKV W
.LL #
AddEnvironmentVariablesLL (
(LL( )
)LL) *
;LL* +
returnNN 
builderNN 
.NN 
BuildNN  
(NN  !
)NN! "
;NN" #
}OO 	
}PP 
}QQ �
wC:\DEV\MAGVA\TransacoesFinanceiras\src\Front\TransacoesFinanceiras\MAGVA.Front.TransacoesFinanceiras\ProgramSettings.cs
	namespace 	
MAGVA
 
. 
Front 
. !
TransacoesFinanceiras +
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
} �P
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Front\TransacoesFinanceiras\MAGVA.Front.TransacoesFinanceiras\Services\ConsumidorService.cs
	namespace 	
MAGVA
 
. 
Front 
. !
TransacoesFinanceiras +
.+ ,
Services, 4
{ 
public 

class 
ConsumidorService "
:# $
IConsumidorService% 7
{ 
private 
readonly 
IOptions !
<! "
AppSettings" -
>- .
	_settings/ 8
;8 9
private 
readonly 

HttpClient #

_apiClient$ .
;. /
private 
readonly 
string %
_transacoesFinanceirasUrl  9
;9 :
public 
ConsumidorService  
(  !

HttpClient! +

httpClient, 6
,6 7
IOptions8 @
<@ A
AppSettingsA L
>L M
settingsN V
)V W
{ 	

_apiClient 
= 

httpClient #
;# $
	_settings 
= 
settings  
;  !%
_transacoesFinanceirasUrl %
=& '
$"( *
{* +
	_settings+ 4
.4 5
Value5 :
.: ;$
TransacoesFinanceirasUrl; S
}S T
/api/v1/ConsumidorT f
"f g
;g h
} 	
public 
async 
Task 
< 

Consumidor $
>$ %
GetConsumidor& 3
(3 4
ApplicationUser4 C
userD H
)H I
{   	
var!! 
uri!! 
=!! 
API!! 
.!! 

Consumidor!! $
.!!$ %
GetConsumidor!!% 2
(!!2 3%
_transacoesFinanceirasUrl!!3 L
,!!L M
user!!N R
.!!R S
Id!!S U
)!!U V
;!!V W
try## 
{$$ 
var%% 
responseString%% "
=%%# $
await%%% *

_apiClient%%+ 5
.%%5 6
GetStringAsync%%6 D
(%%D E
uri%%E H
)%%H I
;%%I J
return'' 
string'' 
.'' 
IsNullOrEmpty'' +
(''+ ,
responseString'', :
)'': ;
?''< =
new(( 

Consumidor(( "
(((" #
)((# $
{((% &
LoginId((' .
=((/ 0
user((1 5
.((5 6
Id((6 8
}((9 :
:((; <
JsonConvert)) 
.))  
DeserializeObject))  1
<))1 2

Consumidor))2 <
>))< =
())= >
responseString))> L
)))L M
;))M N
}** 
catch++ 
(++  
HttpRequestException++ '
ex++( *
)++* +
{,, 
if-- 
(-- 
ex-- 
.-- 
Message-- 
.-- 
Contains-- '
(--' (
$str--( -
)--- .
)--. /
{.. 
new// 
SignOutResult// %
(//% &
new//& )
List//* .
<//. /
string/// 5
>//5 6
{00 !
OpenIdConnectDefaults11 1
.111 2 
AuthenticationScheme112 F
,11F G(
CookieAuthenticationDefaults11H d
.11d e 
AuthenticationScheme11e y
}22 
,22 
new33 $
AuthenticationProperties33 4
{335 6
RedirectUri337 B
=33C D
$str33E H
}33I J
)33J K
;33K L
}44 
}55 
return77 
null77 
;77 
}88 	
public:: 
async:: 
Task:: 
<:: 
string::  
>::  !
PostConsumidor::" 0
(::0 1

Consumidor::1 ;

consumidor::< F
)::F G
{;; 	
var<< 
uri<< 
=<< 
API<< 
.<< 

Consumidor<< $
.<<$ %
PostConsumidor<<% 3
(<<3 4%
_transacoesFinanceirasUrl<<4 M
)<<M N
;<<N O
HttpContent>> 
content>> 
=>>  !
new>>" %
StringContent>>& 3
(>>3 4
JsonConvert>>4 ?
.>>? @
SerializeObject>>@ O
(>>O P

consumidor>>P Z
)>>Z [
,>>[ \
Encoding>>] e
.>>e f
UTF8>>f j
,>>j k
$str>>l ~
)>>~ 
;	>> �
HttpRequestMessage@@ 
request@@ &
=@@' (
new@@) ,
HttpRequestMessage@@- ?
{AA 
MethodBB 
=BB 

HttpMethodBB #
.BB# $
PostBB$ (
,BB( )

RequestUriCC 
=CC 
newCC  
SystemCC! '
.CC' (
UriCC( +
(CC+ ,
uriCC, /
)CC/ 0
,CC0 1
ContentDD 
=DD 
contentDD !
}EE 
;EE 
HttpResponseMessageGG 
resultGG  &
=GG' (
awaitGG) .

_apiClientGG/ 9
.GG9 :
	PostAsyncGG: C
(GGC D
uriGGD G
,GGG H
contentGGI P
)GGP Q
;GGQ R
varII 
responseII 
=II 
stringII !
.II! "
EmptyII" '
;II' (
ifJJ 
(JJ 
resultJJ 
.JJ 
IsSuccessStatusCodeJJ *
)JJ* +
{KK 
responseLL 
=LL 
resultLL !
.LL! "

StatusCodeLL" ,
.LL, -
ToStringLL- 5
(LL5 6
)LL6 7
;LL7 8
}MM 
returnOO 
responseOO 
;OO 
}PP 	
publicRR 
asyncRR 
TaskRR 
<RR 
stringRR  
>RR  !
PutConsumidorRR" /
(RR/ 0

ConsumidorRR0 :

consumidorRR; E
)RRE F
{SS 	
varTT 
uriTT 
=TT 
APITT 
.TT 

ConsumidorTT $
.TT$ %
PutConsumidorTT% 2
(TT2 3%
_transacoesFinanceirasUrlTT3 L
)TTL M
;TTM N
HttpContentVV 
contentVV 
=VV  !
newVV" %
StringContentVV& 3
(VV3 4
JsonConvertVV4 ?
.VV? @
SerializeObjectVV@ O
(VVO P

consumidorVVP Z
)VVZ [
,VV[ \
EncodingVV] e
.VVe f
UTF8VVf j
,VVj k
$strVVl ~
)VV~ 
;	VV �
HttpRequestMessageXX 
requestXX &
=XX' (
newXX) ,
HttpRequestMessageXX- ?
{YY 
MethodZZ 
=ZZ 

HttpMethodZZ #
.ZZ# $
PutZZ$ '
,ZZ' (

RequestUri[[ 
=[[ 
new[[  
System[[! '
.[[' (
Uri[[( +
([[+ ,
uri[[, /
)[[/ 0
,[[0 1
Content\\ 
=\\ 
content\\ !
}]] 
;]] 
HttpResponseMessage__ 
result__  &
=__' (
await__) .

_apiClient__/ 9
.__9 :
PutAsync__: B
(__B C
uri__C F
,__F G
content__H O
)__O P
;__P Q
varaa 
responseaa 
=aa 
stringaa !
.aa! "
Emptyaa" '
;aa' (
ifbb 
(bb 
resultbb 
.bb 
IsSuccessStatusCodebb *
)bb* +
{cc 
responsedd 
=dd 
resultdd !
.dd! "

StatusCodedd" ,
.dd, -
ToStringdd- 5
(dd5 6
)dd6 7
;dd7 8
}ee 
returngg 
responsegg 
;gg 
}hh 	
publicjj 
asyncjj 
Taskjj 
<jj 
stringjj  
>jj  !
DeleteConsumidorjj" 2
(jj2 3

Consumidorjj3 =

consumidorjj> H
)jjH I
{kk 	
varll 
urill 
=ll 
APIll 
.ll 

Consumidorll $
.ll$ %
DeleteConsumidorll% 5
(ll5 6%
_transacoesFinanceirasUrlll6 O
,llO P

consumidorllQ [
.ll[ \
Idll\ ^
.ll^ _
ToStringll_ g
(llg h
)llh i
)lli j
;llj k
HttpContentnn 
contentnn 
=nn  !
newnn" %
StringContentnn& 3
(nn3 4
JsonConvertnn4 ?
.nn? @
SerializeObjectnn@ O
(nnO P

consumidornnP Z
)nnZ [
,nn[ \
Encodingnn] e
.nne f
UTF8nnf j
,nnj k
$strnnl ~
)nn~ 
;	nn �
HttpRequestMessagepp 
requestpp &
=pp' (
newpp) ,
HttpRequestMessagepp- ?
{qq 
Methodrr 
=rr 

HttpMethodrr #
.rr# $
Deleterr$ *
,rr* +

RequestUriss 
=ss 
newss  
Systemss! '
.ss' (
Uriss( +
(ss+ ,
uriss, /
)ss/ 0
,ss0 1
Contenttt 
=tt 
contenttt !
}uu 
;uu 
HttpResponseMessageww 
resultww  &
=ww' (
awaitww) .

_apiClientww/ 9
.ww9 :
DeleteAsyncww: E
(wwE F
uriwwF I
)wwI J
;wwJ K
varyy 
responseyy 
=yy 
stringyy !
.yy! "
Emptyyy" '
;yy' (
ifzz 
(zz 
resultzz 
.zz 
IsSuccessStatusCodezz *
)zz* +
{{{ 
response|| 
=|| 
result|| !
.||! "

StatusCode||" ,
.||, -
ToString||- 5
(||5 6
)||6 7
;||7 8
}}} 
return 
response 
; 
}
�� 	
}
�� 
}�� �
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Front\TransacoesFinanceiras\MAGVA.Front.TransacoesFinanceiras\Services\IConsumidorService.cs
	namespace 	
MAGVA
 
. 
Front 
. !
TransacoesFinanceiras +
.+ ,
Services, 4
{ 
public 

	interface 
IConsumidorService '
{ 
Task		 
<		 

Consumidor		 
>		 
GetConsumidor		 &
(		& '
ApplicationUser		' 6
user		7 ;
)		; <
;		< =
Task

 
<

 
string

 
>

 
PostConsumidor

 #
(

# $

Consumidor

$ .

consumidor

/ 9
)

9 :
;

: ;
} 
} �6
C:\DEV\MAGVA\TransacoesFinanceiras\src\Front\TransacoesFinanceiras\MAGVA.Front.TransacoesFinanceiras\Services\IdentityParser.cs
	namespace 	
MAGVA
 
. 
Front 
. !
TransacoesFinanceiras +
.+ ,
Services, 4
{ 
public

 

class

 
IdentityParser

 
:

  !
IIdentityParser

" 1
<

1 2
ApplicationUser

2 A
>

A B
{ 
public 
ApplicationUser 
Parse $
($ %

IPrincipal% /
	principal0 9
)9 :
{ 	
if 
( 
	principal 
is 
ClaimsPrincipal ,
claims- 3
)3 4
{ 
return 
new 
ApplicationUser *
{ 
CardHolderName "
=# $
claims% +
.+ ,
Claims, 2
.2 3
FirstOrDefault3 A
(A B
xB C
=>D F
xG H
.H I
TypeI M
==N P
$strQ ^
)^ _
?_ `
.` a
Valuea f
??g i
$strj l
,l m

CardNumber 
=  
claims! '
.' (
Claims( .
.. /
FirstOrDefault/ =
(= >
x> ?
=>@ B
xC D
.D E
TypeE I
==J L
$strM Z
)Z [
?[ \
.\ ]
Value] b
??c e
$strf h
,h i

Expiration 
=  
claims! '
.' (
Claims( .
.. /
FirstOrDefault/ =
(= >
x> ?
=>@ B
xC D
.D E
TypeE I
==J L
$strM ^
)^ _
?_ `
.` a
Valuea f
??g i
$strj l
,l m
CardType 
= 
int "
." #
Parse# (
(( )
claims) /
./ 0
Claims0 6
.6 7
FirstOrDefault7 E
(E F
xF G
=>H J
xK L
.L M
TypeM Q
==R T
$strU ^
)^ _
?_ `
.` a
Valuea f
??g i
$strj m
)m n
,n o
City 
= 
claims !
.! "
Claims" (
.( )
FirstOrDefault) 7
(7 8
x8 9
=>: <
x= >
.> ?
Type? C
==D F
$strG U
)U V
?V W
.W X
ValueX ]
??^ `
$stra c
,c d
Country 
= 
claims $
.$ %
Claims% +
.+ ,
FirstOrDefault, :
(: ;
x; <
=>= ?
x@ A
.A B
TypeB F
==G I
$strJ [
)[ \
?\ ]
.] ^
Value^ c
??d f
$strg i
,i j
Email 
= 
claims "
." #
Claims# )
.) *
FirstOrDefault* 8
(8 9
x9 :
=>; =
x> ?
.? @
Type@ D
==E G
$strH O
)O P
?P Q
.Q R
ValueR W
??X Z
$str[ ]
,] ^
Id 
= 
claims 
.  
Claims  &
.& '
FirstOrDefault' 5
(5 6
x6 7
=>8 :
x; <
.< =
Type= A
==B D
$strE J
)J K
?K L
.L M
ValueM R
??S U
$strV X
,X Y
LastName 
= 
claims %
.% &
Claims& ,
., -
FirstOrDefault- ;
(; <
x< =
=>> @
xA B
.B C
TypeC G
==H J
$strK V
)V W
?W X
.X Y
ValueY ^
??_ a
$strb d
,d e
Name 
= 
claims !
.! "
Claims" (
.( )
FirstOrDefault) 7
(7 8
x8 9
=>: <
x= >
.> ?
Type? C
==D F
$strG M
)M N
?N O
.O P
ValueP U
??V X
$strY [
,[ \
PhoneNumber 
=  !
claims" (
.( )
Claims) /
./ 0
FirstOrDefault0 >
(> ?
x? @
=>A C
xD E
.E F
TypeF J
==K M
$strN \
)\ ]
?] ^
.^ _
Value_ d
??e g
$strh j
,j k
SecurityNumber "
=# $
claims% +
.+ ,
Claims, 2
.2 3
FirstOrDefault3 A
(A B
xB C
=>D F
xG H
.H I
TypeI M
==N P
$strQ g
)g h
?h i
.i j
Valuej o
??p r
$strs u
,u v
State 
= 
claims "
." #
Claims# )
.) *
FirstOrDefault* 8
(8 9
x9 :
=>; =
x> ?
.? @
Type@ D
==E G
$strH W
)W X
?X Y
.Y Z
ValueZ _
??` b
$strc e
,e f
Street   
=   
claims   #
.  # $
Claims  $ *
.  * +
FirstOrDefault  + 9
(  9 :
x  : ;
=>  < >
x  ? @
.  @ A
Type  A E
==  F H
$str  I Y
)  Y Z
?  Z [
.  [ \
Value  \ a
??  b d
$str  e g
,  g h
ZipCode!! 
=!! 
claims!! $
.!!$ %
Claims!!% +
.!!+ ,
FirstOrDefault!!, :
(!!: ;
x!!; <
=>!!= ?
x!!@ A
.!!A B
Type!!B F
==!!G I
$str!!J \
)!!\ ]
?!!] ^
.!!^ _
Value!!_ d
??!!e g
$str!!h j
}"" 
;"" 
}## 
throw$$ 
new$$ 
ArgumentException$$ '
($$' (
message$$( /
:$$/ 0
$str$$1 Z
,$$Z [
	paramName$$\ e
:$$e f
nameof$$g m
($$m n
	principal$$n w
)$$w x
)$$x y
;$$y z
}%% 	
}&& 
}'' �
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Front\TransacoesFinanceiras\MAGVA.Front.TransacoesFinanceiras\Services\IIdentityParser.cs
	namespace 	
MAGVA
 
. 
Front 
. !
TransacoesFinanceiras +
.+ ,
Services, 4
{ 
public 

	interface 
IIdentityParser $
<$ %
T% &
>& '
{ 
T 	
Parse
 
( 

IPrincipal 
	principal $
)$ %
;% &
}		 
}

 �
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Front\TransacoesFinanceiras\MAGVA.Front.TransacoesFinanceiras\Services\ModelDTO\ConsumidorDTO.cs
	namespace 	
MAGVA
 
. 
Front 
. !
TransacoesFinanceiras +
.+ ,
Services, 4
.4 5
ModelDTO5 =
{ 
public 

class 
ConsumidorDTO 
{ 
[ 	
Required	 
] 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
[		 	
Required			 
]		 
public

 
string

 
Nome

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
[ 	
Required	 
] 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Required	 
] 
public 
int 
LoginId 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Required	 
] 
public 
bool 
Ativo 
{ 
get 
;  
set! $
;$ %
}& '
} 
} �:
oC:\DEV\MAGVA\TransacoesFinanceiras\src\Front\TransacoesFinanceiras\MAGVA.Front.TransacoesFinanceiras\Startup.cs
	namespace 	
MAGVA
 
. 
Front 
. !
TransacoesFinanceiras +
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IHostingEnvironment *
env+ .
). /
{ 	#
JwtSecurityTokenHandler #
.# $&
DefaultInboundClaimTypeMap$ >
.> ?
Clear? D
(D E
)E F
;F G
var 
builder 
= 
new  
ConfigurationBuilder 2
(2 3
)3 4
. 
SetBasePath  
(  !
env! $
.$ %
ContentRootPath% 4
)4 5
. 
AddJsonFile  
(  !
$str! 3
,3 4
optional5 =
:= >
true? C
,C D
reloadOnChangeE S
:S T
trueU Y
)Y Z
. 
AddJsonFile  
(  !
$"! #
appsettings.# /
{/ 0
env0 3
.3 4
EnvironmentName4 C
}C D
.jsonD I
"I J
,J K
optionalL T
:T U
trueV Z
,Z [
reloadOnChange\ j
:j k
truel p
)p q
. #
AddEnvironmentVariables ,
(, -
)- .
;. /
Configuration 
= 
builder #
.# $
Build$ )
() *
)* +
;+ ,
HostingEnvironment 
=  
env! $
;$ %
} 	
public   
IConfiguration   
Configuration   +
{  , -
get  . 1
;  1 2
}  3 4
public"" 
IHostingEnvironment"" "
HostingEnvironment""# 5
{""6 7
get""8 ;
;""; <
}""= >
public$$ 
void$$ 
ConfigureServices$$ %
($$% &
IServiceCollection$$& 8
services$$9 A
)$$A B
{%% 	
services&& 
.'' 
AddHealthChecks'' $
(''$ %
Configuration''% 2
)''2 3
.(( 
AddCustomMvc(( !
(((! "
Configuration((" /
)((/ 0
.)) 
AddDevspaces)) !
())! "
)))" #
.** !
AddHttpClientServices** *
(*** +
Configuration**+ 8
)**8 9
.++  
AddHttpClientLogging++ )
(++) *
Configuration++* 7
)++7 8
.,, #
AddCustomAuthentication,, ,
(,,, -
Configuration,,- :
),,: ;
.-- $
AddAuthorizationPolicies-- -
(--- .
)--. /
;--/ 0
}.. 	
public00 
void00 
	Configure00 
(00 
IApplicationBuilder00 1
app002 5
,005 6
IHostingEnvironment007 J
env00K N
,00N O
ILoggerFactory00P ^
loggerFactory00_ l
)00l m
{11 	#
JwtSecurityTokenHandler22 #
.22# $&
DefaultInboundClaimTypeMap22$ >
.22> ?
Clear22? D
(22D E
)22E F
;22F G
if44 
(44 
env44 
.44 
IsDevelopment44 !
(44! "
)44" #
)44# $
{55 
app66 
.66 %
UseDeveloperExceptionPage66 -
(66- .
)66. /
;66/ 0
}77 
else88 
{99 
app:: 
.:: 
UseExceptionHandler:: '
(::' (
$str::( 0
)::0 1
;::1 2
app;; 
.;; 
UseHsts;; 
(;; 
);; 
;;; 
}<< 
var>> 
pathBase>> 
=>> 
Configuration>> (
[>>( )
$str>>) 4
]>>4 5
;>>5 6
if?? 
(?? 
!?? 
string?? 
.?? 
IsNullOrEmpty?? %
(??% &
pathBase??& .
)??. /
)??/ 0
{@@ 
loggerFactoryAA 
.AA 
CreateLoggerAA *
<AA* +
StartupAA+ 2
>AA2 3
(AA3 4
)AA4 5
.AA5 6
LogDebugAA6 >
(AA> ?
$strAA? ]
,AA] ^
pathBaseAA_ g
)AAg h
;AAh i
appBB 
.BB 
UsePathBaseBB 
(BB  
pathBaseBB  (
)BB( )
;BB) *
}CC 
appEE 
.EE 
UseCorsEE 
(EE 
$strEE $
)EE$ %
;EE% &
appGG 
.GG 
UseHealthChecksGG 
(GG  
$strGG  +
,GG+ ,
newGG- 0
HealthCheckOptionsGG1 C
{HH 
	PredicateII 
=II 
rII 
=>II  
rII! "
.II" #
NameII# '
.II' (
ContainsII( 0
(II0 1
$strII1 7
)II7 8
}JJ 
)JJ 
;JJ 
appLL 
.LL 
UseHealthChecksLL 
(LL  
$strLL  %
,LL% &
newLL' *
HealthCheckOptionsLL+ =
(LL= >
)LL> ?
{MM 
	PredicateNN 
=NN 
_NN 
=>NN  
trueNN! %
,NN% &
ResponseWriterOO 
=OO  
UIResponseWriterOO! 1
.OO1 2&
WriteHealthCheckUIResponseOO2 L
}PP 
)PP 
;PP 
appRR 
.RR 

UseSessionRR 
(RR 
)RR 
;RR 
appSS 
.SS 
UseStaticFilesSS 
(SS 
)SS  
;SS  !
ifUU 
(UU 
ConfigurationUU 
.UU 
GetValueUU &
<UU& '
boolUU' +
>UU+ ,
(UU, -
$strUU- :
)UU: ;
)UU; <
{VV 
appWW 
.WW 
UseMiddlewareWW !
<WW! " 
ByPassAuthMiddlewareWW" 6
>WW6 7
(WW7 8
)WW8 9
;WW9 :
}XX 
appZZ 
.ZZ 
UseSecurityHeadersZZ "
(ZZ" #
)ZZ# $
;ZZ$ %
app[[ 
.[[ %
ConfigureAuthentification[[ )
([[) *
env[[* -
)[[- .
;[[. /
app\\ 
.\\ !
ConfigureLocalization\\ %
(\\% &
)\\& '
;\\' (
app^^ 
.^^ 
UseAuthentication^^ !
(^^! "
)^^" #
;^^# $
app`` 
.`` 
UseMvc`` 
(`` 
routes`` 
=>``  
{aa 
routesbb 
.bb 
MapRoutebb 
(bb  
$strbb  )
,bb) *
$strbb+ S
)bbS T
;bbT U
routescc 
.cc 
MapRoutecc 
(cc  
namecc  $
:cc$ %
$strcc& 4
,cc4 5
templatecc6 >
:cc> ?
$strcc@ c
)ccc d
;ccd e
}dd 
)dd 
;dd 
}ee 	
}ff 
}gg �
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Front\TransacoesFinanceiras\MAGVA.Front.TransacoesFinanceiras\ViewModels\ApplicationUser.cs
	namespace 	
MAGVA
 
. 
Front 
. !
TransacoesFinanceiras +
.+ ,

ViewModels, 6
{ 
public 

class 
ApplicationUser  
:! "
IdentityUser# /
{ 
public		 
string		 

CardNumber		  
{		! "
get		# &
;		& '
set		( +
;		+ ,
}		- .
public

 
string

 
SecurityNumber

 $
{

% &
get

' *
;

* +
set

, /
;

/ 0
}

1 2
public 
string 

Expiration  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
CardHolderName $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
int 
CardType 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Street 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
City 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
State 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
	StateCode 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Country 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
CountryCode !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
ZipCode 
{ 
get  #
;# $
set% (
;( )
}* +
public 
double 
Latitude 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
double 
	Longitude 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
Required	 
] 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Required	 
] 
public 
string 
LastName 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} �
}C:\DEV\MAGVA\TransacoesFinanceiras\src\Front\TransacoesFinanceiras\MAGVA.Front.TransacoesFinanceiras\ViewModels\Consumidor.cs
	namespace 	
MAGVA
 
. 
Front 
. !
TransacoesFinanceiras +
.+ ,

ViewModels, 6
{ 
public 

class 

Consumidor 
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
=$ %
$num& '
;' (
[

 	
Required

	 
]

 
[ 	
StringLength	 
( 
$num 
, 
MinimumLength (
=) *
$num+ ,
), -
]- .
public 
string 
Nome 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
EmailAddress	 
] 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
LoginId 
{ 
get  #
;# $
set% (
;( )
}* +
=, -
$str. 1
;1 2
public 
bool 
Ativo 
{ 
get 
;  
set! $
;$ %
}& '
=( )
true* .
;. /
} 
} 