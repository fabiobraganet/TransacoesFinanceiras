�)
uC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\Base\CustomExtensionMethods.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
Base& *
{ 
public 

static 
class "
CustomExtensionMethods .
{ 
public 
static 
IServiceCollection (
AddHealthChecks) 8
(8 9
this9 =
IServiceCollection> P
servicesQ Y
,Y Z
IConfiguration[ i
configurationj w
)w x
{ 	
var 
	hcBuilder 
= 
services $
.$ %
AddHealthChecks% 4
(4 5
)5 6
;6 7
	hcBuilder 
. 
AddCheck 
( 
$str %
,% &
(' (
)( )
=>* ,
HealthCheckResult- >
.> ?
Healthy? F
(F G
)G H
)H I
;I J
	hcBuilder 
. 
AddSqlServer 
( 
configuration !
[! "
$str" 4
]4 5
,5 6
name 
: 
$str +
,+ ,
tags 
: 
new 
string $
[$ %
]% &
{' (
$str) ?
}@ A
)A B
;B C
return 
services 
; 
} 	
public 
static 
IServiceCollection (
AddCustomDbContext) ;
(; <
this< @
IServiceCollectionA S
servicesT \
,\ ]
IConfiguration^ l
configurationm z
)z {
{   	
services!! 
.!! '
AddEntityFrameworkSqlServer!! 0
(!!0 1
)!!1 2
."" 
AddDbContext""  
<""  !
AdminDbContext""! /
>""/ 0
(""0 1
options""1 8
=>""9 ;
{## 
options$$ 
.$$ 
UseSqlServer$$ +
($$+ ,
configuration$$, 9
[$$9 :
$str$$: L
]$$L M
,$$M N"
sqlServerOptionsAction%% 1
:%%1 2

sqlOptions%%3 =
=>%%> @
{&& 

sqlOptions'' )
.'') *
MigrationsAssembly''* <
(''< =
$str''= Z
)''Z [
;''[ \

sqlOptions(( )
.(() * 
EnableRetryOnFailure((* >
(((> ?
maxRetryCount((? L
:((L M
$num((N P
,((P Q
maxRetryDelay((R _
:((_ `
TimeSpan((a i
.((i j
FromSeconds((j u
(((u v
$num((v x
)((x y
,((y z
errorNumbersToAdd	(({ �
:
((� �
null
((� �
)
((� �
;
((� �
})) 
))) 
;)) 
}** 
,** 
ServiceLifetime++ "
.++" #
Scoped++# )
)++) *
;++* +
return-- 
services-- 
;-- 
}.. 	
public00 
static00 
IServiceCollection00 ("
AddCustomConfiguration00) ?
(00? @
this00@ D
IServiceCollection00E W
services00X `
,00` a
IConfiguration00b p
configuration00q ~
)00~ 
{11 	
services22 
.22 

AddOptions22 
(22  
)22  !
;22! "
services33 
.33 
	Configure33 
<33 
ProgramSettings33 .
>33. /
(33/ 0
configuration330 =
)33= >
;33> ?
services44 
.44 
	Configure44 
<44 
ApiBehaviorOptions44 1
>441 2
(442 3
options443 :
=>44; =
{55 
options66 
.66 ,
 InvalidModelStateResponseFactory66 8
=669 :
context66; B
=>66C E
{77 
var88 
problemDetails88 &
=88' (
new88) ,$
ValidationProblemDetails88- E
(88E F
context88F M
.88M N

ModelState88N X
)88X Y
{99 
Instance::  
=::! "
context::# *
.::* +
HttpContext::+ 6
.::6 7
Request::7 >
.::> ?
Path::? C
,::C D
Status;; 
=;;  
StatusCodes;;! ,
.;;, -
Status400BadRequest;;- @
,;;@ A
Detail<< 
=<<  
$str<<! ^
}== 
;== 
return?? 
new?? "
BadRequestObjectResult?? 5
(??5 6
problemDetails??6 D
)??D E
{@@ 
ContentTypesAA $
=AA% &
{AA' (
$strAA) C
,AAC D
$strAAE ^
}AA_ `
}BB 
;BB 
}CC 
;CC 
}DD 
)DD 
;DD 
returnFF 
servicesFF 
;FF 
}GG 	
}II 
}JJ ��
oC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\Configuration\Clients.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
Configuration& 3
{ 
public		 

class		 
Clients		 
{

 
public 
static 
IEnumerable !
<! "
Client" (
>( )
GetAdminClient* 8
(8 9
)9 :
{ 	
return 
new 
List 
< 
Client "
>" #
{ 
new 
Client 
{ 
ClientId 
= 
AuthorizationConsts 2
.2 3
OidcClientId3 ?
,? @

ClientName 
=  
AuthorizationConsts! 4
.4 5
OidcClientId5 A
,A B
	ClientUri 
= 
AuthorizationConsts  3
.3 4 
IdentityAdminBaseUrl4 H
,H I
AllowedGrantTypes %
=& '

GrantTypes( 2
.2 3
Implicit3 ;
,; <'
AllowAccessTokensViaBrowser /
=0 1
true2 6
,6 7
RedirectUris  
=! "
{# $
$"% '
{' (
AuthorizationConsts( ;
.; < 
IdentityAdminBaseUrl< P
}P Q
/signin-oidcQ ]
"] ^
}^ _
,_ `!
FrontChannelLogoutUri   )
=  * +
$"  , .
{  . /
AuthorizationConsts  / B
.  B C 
IdentityAdminBaseUrl  C W
}  W X
/signout-oidc  X e
"  e f
,  f g"
PostLogoutRedirectUris!! *
=!!+ ,
{!!- .
$"!!/ 1
{!!1 2
AuthorizationConsts!!2 E
.!!E F 
IdentityAdminBaseUrl!!F Z
}!!Z ["
/signout-callback-oidc!![ q
"!!q r
}!!r s
,!!s t
AllowedCorsOrigins"" &
=""' (
{"") *
AuthorizationConsts""+ >
.""> ? 
IdentityAdminBaseUrl""? S
}""T U
,""U V
AllowedScopes$$ !
=$$" #
{%% #
IdentityServerConstants&& /
.&&/ 0
StandardScopes&&0 >
.&&> ?
OpenId&&? E
,&&E F#
IdentityServerConstants'' /
.''/ 0
StandardScopes''0 >
.''> ?
Profile''? F
,''F G#
IdentityServerConstants(( /
.((/ 0
StandardScopes((0 >
.((> ?
Email((? D
,((D E
$str)) 
}** 
}++ 
,++ 
new11 
Client11 
{22 
ClientId33 
=33 
$str33 ?
,33? @

ClientName44 
=44  
$str44! J
,44J K
AllowedGrantTypes55 %
=55& '

GrantTypes55( 2
.552 3
Implicit553 ;
,55; <'
AllowAccessTokensViaBrowser66 /
=660 1
true662 6
,666 7
RedirectUris88  
=88! "
{88# $
$"88% '
{88' (
AuthorizationConsts88( ;
.88; <*
ApiTansacoesFinanceirashttpuri88< Z
}88Z [)
/swagger/oauth2-redirect.html88[ x
"88x y
,88y z
$"88{ }
{88} ~ 
AuthorizationConsts	88~ �
.
88� �-
ApiTansacoesFinanceirashttpsuri
88� �
}
88� �+
/swagger/oauth2-redirect.html
88� �
"
88� �
}
88� �
,
88� �"
PostLogoutRedirectUris99 *
=99+ ,
{99- .
$"99/ 1
{991 2
AuthorizationConsts992 E
.99E F*
ApiTansacoesFinanceirashttpuri99F d
}99d e
/swagger/index.html99e x
"99x y
,99y z
$"99{ }
{99} ~ 
AuthorizationConsts	99~ �
.
99� �-
ApiTansacoesFinanceirashttpsuri
99� �
}
99� �!
/swagger/index.html
99� �
"
99� �
}
99� �
,
99� �
AllowedScopes;; !
=;;" #
{<< 
$str== /
,==/ 0
$str==1 ?
}>> 
}?? 
,?? 
newDD 
ClientDD 
{EE 
ClientIdFF 
=FF 
$strFF 6
,FF6 7

ClientNameGG 
=GG  
$strGG! 9
,GG9 :
ClientSecretsHH !
=HH" #
newHH$ '
ListHH( ,
<HH, -
SecretHH- 3
>HH3 4
{II 
newJJ 
SecretJJ "
(JJ" #
$strJJ# +
.JJ+ ,
Sha256JJ, 2
(JJ2 3
)JJ3 4
)JJ4 5
}KK 
,KK 
	ClientUriLL 
=LL 
$"LL  "9
-http://magvafronttransacoesfinanceiras:15000/LL" O
"LLO P
,LLP Q
AllowedGrantTypesMM %
=MM& '

GrantTypesMM( 2
.MM2 3
HybridMM3 9
,MM9 :'
AllowAccessTokensViaBrowserNN /
=NN0 1
falseNN2 7
,NN7 8
RequireConsentOO "
=OO# $
falseOO% *
,OO* +
AllowOfflineAccessPP &
=PP' (
truePP) -
,PP- .,
 AlwaysIncludeUserClaimsInIdTokenQQ 4
=QQ5 6
trueQQ7 ;
,QQ; <
RedirectUrisRR  
=RR! "
newRR# &
ListRR' +
<RR+ ,
stringRR, 2
>RR2 3
{SS 
$"TT D
8http://magvafronttransacoesfinanceiras:15000/signin-oidcTT R
"TTR S
}UU 
,UU "
PostLogoutRedirectUrisVV *
=VV+ ,
newVV- 0
ListVV1 5
<VV5 6
stringVV6 <
>VV< =
{WW 
$"XX O
Chttp://magvafronttransacoesfinanceiras:15000//signout-callback-oidcXX ]
"XX] ^
}YY 
,YY 
AllowedScopesZZ !
=ZZ" #
newZZ$ '
ListZZ( ,
<ZZ, -
stringZZ- 3
>ZZ3 4
{[[ #
IdentityServerConstants\\ /
.\\/ 0
StandardScopes\\0 >
.\\> ?
OpenId\\? E
,\\E F#
IdentityServerConstants]] /
.]]/ 0
StandardScopes]]0 >
.]]> ?
Profile]]? F
,]]F G#
IdentityServerConstants^^ /
.^^/ 0
StandardScopes^^0 >
.^^> ?
Email^^? D
,^^D E#
IdentityServerConstants__ /
.__/ 0
StandardScopes__0 >
.__> ?
OfflineAccess__? L
,__L M
$str`` /
,``/ 0
$straa &
}cc 
,cc 
AccessTokenLifetimeee '
=ee( )
$numee* ,
*ee, -
$numee- /
*ee/ 0
$numee0 1
,ee1 2!
IdentityTokenLifetimeff )
=ff) *
$numff+ -
*ff- .
$numff. 0
*ff0 1
$numff1 2
}gg 
,gg 
}ii 
;ii 
}kk 	
publicnn 
staticnn 
IEnumerablenn !
<nn! "
Clientnn" (
>nn( )
Getnn* -
(nn- .
)nn. /
{oo 	
returnpp 
newpp 
Listpp 
<pp 
Clientpp "
>pp" #
{qq 
newuu 
Clientuu 
{vv  !
ClientIdww( 0
=ww1 2
$strww3 ;
,ww; <
ClientSecretsxx( 5
=xx6 7
{yy( )
newzz0 3
Secretzz4 :
(zz: ;
$strzz; C
.zzC D
Sha256zzD J
(zzJ K
)zzK L
)zzL M
}{{( )
,{{) *
AllowedGrantTypes}}( 9
=}}: ;

GrantTypes}}< F
.}}F G
ClientCredentials}}G X
,}}X Y
AllowedScopes~~( 5
=~~6 7
{~~8 9
$str~~: @
,~~@ A
$str~~B R
}~~S T
}  !
,! "
new
�� 
Client
�� 
{
��  !
ClientId
��( 0
=
��1 2
$str
��3 ?
,
��? @
ClientSecrets
��( 5
=
��6 7
{
��( )
new
��0 3
Secret
��4 :
{
��0 1
Type
��8 <
=
��= >%
IdentityServerConstants
��? V
.
��V W
SecretTypes
��W b
.
��b c#
X509CertificateBase64
��c x
,
��x y
Value
��8 =
=
��> ?
$str��@ �
}
��0 1
}
��( )
,
��) *
AllowedGrantTypes
��( 9
=
��: ;

GrantTypes
��< F
.
��F G
ClientCredentials
��G X
,
��X Y
AllowedScopes
��( 5
=
��6 7
{
��8 9
$str
��: @
,
��@ A
$str
��B R
}
��S T
}
��  !
,
��! "
new
�� 
Client
�� 
{
��  !
ClientId
��( 0
=
��1 2
$str
��3 B
,
��B C
ClientSecrets
��( 5
=
��6 7
{
��( )
new
��0 3
Secret
��4 :
(
��: ;
$str
��; C
.
��C D
Sha256
��D J
(
��J K
)
��K L
)
��L M
}
��( )
,
��) *
AllowedScopes
��( 5
=
��6 7
{
��8 9
$str
��: @
,
��@ A
$str
��B R
}
��S T
}
��  !
,
��! "
new
�� 
Client
�� 
{
��  !
ClientId
��( 0
=
��1 2
$str
��3 =
,
��= >
ClientSecrets
��( 5
=
��6 7
{
��( )
new
��0 3
Secret
��4 :
(
��: ;
$str
��; C
.
��C D
Sha256
��D J
(
��J K
)
��K L
)
��L M
}
��( )
,
��) *
AllowedGrantTypes
��( 9
=
��: ;

GrantTypes
��< F
.
��F G#
ResourceOwnerPassword
��G \
,
��\ ] 
AllowOfflineAccess
��( :
=
��; <
true
��= A
,
��A B
AllowedScopes
��( 5
=
��6 7
{
��( )%
IdentityServerConstants
��0 G
.
��G H
StandardScopes
��H V
.
��V W
OpenId
��W ]
,
��] ^
$str
��0 @
,
��@ A
$str
��0 6
,
��6 7
$str
��8 H
}
��( )
}
��  !
,
��! "
new
�� 
Client
�� 
{
��  !
ClientId
��( 0
=
��1 2
$str
��3 D
,
��D E!
RequireClientSecret
��( ;
=
��< =
false
��> C
,
��C D
AllowedGrantTypes
��( 9
=
��: ;

GrantTypes
��< F
.
��F G#
ResourceOwnerPassword
��G \
,
��\ ] 
AllowOfflineAccess
��( :
=
��; <
true
��= A
,
��A B
AllowedScopes
��( 5
=
��6 7
{
��( )%
IdentityServerConstants
��0 G
.
��G H
StandardScopes
��H V
.
��V W
OpenId
��W ]
,
��] ^%
IdentityServerConstants
��0 G
.
��G H
StandardScopes
��H V
.
��V W
Email
��W \
,
��\ ]
$str
��0 6
,
��6 7
$str
��8 H
}
��( )
}
��  !
,
��! "
new
�� 
Client
�� 
{
��  !
ClientId
��( 0
=
��1 2
$str
��3 H
,
��H I

ClientName
��( 2
=
��3 4
$str
��5 V
,
��V W!
RequireClientSecret
��( ;
=
��< =
false
��> C
,
��C D
AllowedGrantTypes
��( 9
=
��: ;

GrantTypes
��< F
.
��F G
Hybrid
��G M
,
��M N
RequirePkce
��( 3
=
��4 5
true
��6 :
,
��: ;
RedirectUris
��( 4
=
��5 6
{
��7 8
$str
��9 Q
}
��R S
,
��S T 
AllowOfflineAccess
��( :
=
��; <
true
��= A
,
��A B
AllowedScopes
��( 5
=
��6 7
{
��( )%
IdentityServerConstants
��0 G
.
��G H
StandardScopes
��H V
.
��V W
OpenId
��W ]
,
��] ^%
IdentityServerConstants
��0 G
.
��G H
StandardScopes
��H V
.
��V W
Profile
��W ^
,
��^ _%
IdentityServerConstants
��0 G
.
��G H
StandardScopes
��H V
.
��V W
Email
��W \
,
��\ ]
$str
��0 6
,
��6 7
$str
��8 H
,
��H I
}
��( )
,
��) *
}
��  !
,
��! "
new
�� 
Client
�� 
{
��  !
ClientId
��( 0
=
��1 2
$str
��3 G
,
��G H
ClientSecrets
��( 5
=
��6 7
{
��( )
new
��0 3
Secret
��4 :
(
��: ;
$str
��; C
.
��C D
Sha256
��D J
(
��J K
)
��K L
)
��L M
}
��( )
,
��) *
AllowedGrantTypes
��( 9
=
��: ;

GrantTypes
��< F
.
��F G#
ResourceOwnerPassword
��G \
,
��\ ]
AllowedScopes
��( 5
=
��6 7
{
��8 9
$str
��: @
,
��@ A
$str
��B R
}
��S T
,
��T U
AccessTokenType
��( 7
=
��8 9
AccessTokenType
��: I
.
��I J
	Reference
��J S
}
��  !
,
��! "
new
�� 
Client
�� 
{
��  !
ClientId
��( 0
=
��1 2
$str
��3 A
,
��A B

ClientName
��( 2
=
��3 4
$str
��5 C
,
��C D
	ClientUri
��( 1
=
��2 3
$str
��4 N
,
��N O
AllowedGrantTypes
��( 9
=
��: ;

GrantTypes
��< F
.
��F G
Implicit
��G O
,
��O P)
AllowAccessTokensViaBrowser
��( C
=
��D E
true
��F J
,
��J K
RedirectUris
��( 4
=
��5 6
{
��8 9
$str
��: ^
}
��_ `
,
��` a#
FrontChannelLogoutUri
��( =
=
��> ?
$str
��@ e
,
��e f$
PostLogoutRedirectUris
��( >
=
��? @
{
��A B
$str
��C q
}
��r s
,
��s t
AllowedScopes
��( 5
=
��6 7
{
��( )%
IdentityServerConstants
��0 G
.
��G H
StandardScopes
��H V
.
��V W
OpenId
��W ]
,
��] ^%
IdentityServerConstants
��0 G
.
��G H
StandardScopes
��H V
.
��V W
Profile
��W ^
,
��^ _%
IdentityServerConstants
��0 G
.
��G H
StandardScopes
��H V
.
��V W
Email
��W \
,
��\ ]
$str
��0 6
,
��6 7
$str
��8 H
}
��( )
,
��) *
}
��  !
,
��! "
new
�� 
Client
�� 
{
��  !
ClientId
��( 0
=
��1 2
$str
��3 ?
,
��? @

ClientName
��( 2
=
��3 4
$str
��5 A
,
��A B
	ClientUri
��( 1
=
��2 3
$str
��4 N
,
��N O
AllowedGrantTypes
��( 9
=
��: ;

GrantTypes
��< F
.
��F G
Implicit
��G O
,
��O P
RedirectUris
��( 4
=
��5 6
{
��7 8
$str
��9 _
}
��` a
,
��a b#
FrontChannelLogoutUri
��( =
=
��> ?
$str
��@ e
,
��e f$
PostLogoutRedirectUris
��( >
=
��? @
{
��A B
$str
��C \
}
��] ^
,
��^ _
AllowedScopes
��( 5
=
��6 7
{
��8 9%
IdentityServerConstants
��: Q
.
��Q R
StandardScopes
��R `
.
��` a
OpenId
��a g
}
��h i
,
��i j
}
��  !
,
��! "
new
�� 
Client
�� 
{
��  !
ClientId
��( 0
=
��1 2
$str
��3 ?
,
��? @

ClientName
��( 2
=
��3 4
$str
��5 A
,
��A B
	ClientUri
��( 1
=
��2 3
$str
��4 N
,
��N O
ClientSecrets
��( 5
=
��6 7
{
��( )
new
��0 3
Secret
��4 :
(
��: ;
$str
��; C
.
��C D
Sha256
��D J
(
��J K
)
��K L
)
��L M
}
��( )
,
��) *
AllowedGrantTypes
��( 9
=
��: ;

GrantTypes
��< F
.
��F G
Hybrid
��G M
,
��M N)
AllowAccessTokensViaBrowser
��( C
=
��D E
false
��F K
,
��K L
RedirectUris
��( 4
=
��5 6
{
��7 8
$str
��9 ]
}
��^ _
,
��_ `#
FrontChannelLogoutUri
��( =
=
��> ?
$str
��@ e
,
��e f$
PostLogoutRedirectUris
��( >
=
��? @
{
��A B
$str
��C q
}
��r s
,
��s t 
AllowOfflineAccess
��( :
=
��; <
true
��= A
,
��A B
AllowedScopes
��( 5
=
��6 7
{
��( )%
IdentityServerConstants
��0 G
.
��G H
StandardScopes
��H V
.
��V W
OpenId
��W ]
,
��] ^%
IdentityServerConstants
��0 G
.
��G H
StandardScopes
��H V
.
��V W
Profile
��W ^
,
��^ _%
IdentityServerConstants
��0 G
.
��G H
StandardScopes
��H V
.
��V W
Email
��W \
,
��\ ]
$str
��0 6
,
��6 7
$str
��8 H
,
��H I
}
��( )
,
��) *
}
��  !
,
��! "
new
�� 
Client
�� 
{
��  !
ClientId
��( 0
=
��1 2
$str
��3 =
,
��= >

ClientName
��( 2
=
��3 4
$str
��5 R
,
��R S
	ClientUri
��( 1
=
��2 3
$str
��4 N
,
��N O
AllowedGrantTypes
��( 9
=
��: ;

GrantTypes
��< F
.
��F G
Implicit
��G O
,
��O P)
AllowAccessTokensViaBrowser
��( C
=
��D E
true
��F J
,
��J K
RedirectUris
��( 4
=
��5 6
{
��7 8
$str
��9 \
}
��] ^
,
��^ _
AllowedScopes
��( 5
=
��6 7
{
��8 9
$str
��: @
,
��@ A
$str
��B R
}
��S T
,
��T U
}
��  !
,
��! "
new
�� 
Client
�� 
{
��  !
ClientId
��( 0
=
��1 2
$str
��3 <
,
��< =

ClientName
��( 2
=
��3 4
$str
��5 M
,
��M N
	ClientUri
��( 1
=
��2 3
$str
��4 N
,
��N O
AllowedGrantTypes
��( 9
=
��: ;

GrantTypes
��< F
.
��F G
Implicit
��G O
,
��O P)
AllowAccessTokensViaBrowser
��( C
=
��D E
true
��F J
,
��J K!
RequireClientSecret
��( ;
=
��< =
false
��> C
,
��C D
AccessTokenType
��( 7
=
��8 9
AccessTokenType
��: I
.
��I J
	Reference
��J S
,
��S T
RedirectUris
��( 4
=
��5 6
{
��( )
$str
��0 R
,
��R S
$str
��0 U
,
��U V
$str
��0 S
,
��S T
$str
��0 R
,
��R S
}
��( )
,
��) *$
PostLogoutRedirectUris
��( >
=
��? @
{
��A B
$str
��C e
}
��f g
,
��g h 
AllowedCorsOrigins
��( :
=
��; <
{
��= >
$str
��? V
}
��W X
,
��X Y
AllowedScopes
��( 5
=
��6 7
{
��( )%
IdentityServerConstants
��0 G
.
��G H
StandardScopes
��H V
.
��V W
OpenId
��W ]
,
��] ^%
IdentityServerConstants
��0 G
.
��G H
StandardScopes
��H V
.
��V W
Profile
��W ^
,
��^ _%
IdentityServerConstants
��0 G
.
��G H
StandardScopes
��H V
.
��V W
Email
��W \
,
��\ ]
$str
��0 6
,
��6 7
$str
��8 H
}
��( )
,
��) *
}
��  !
,
��! "
}
�� 
;
�� 
}
�� 	
}
�� 
}�� �
qC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\Configuration\Resources.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
Configuration& 3
{ 
public 

class 
ClientResources  
{		 
public

 
static

 
IEnumerable

 !
<

! "
IdentityResource

" 2
>

2 3 
GetIdentityResources

4 H
(

H I
)

I J
{ 	
return 
new 
[ 
] 
{ 
new 
IdentityResources %
.% &
OpenId& ,
(, -
)- .
,. /
new 
IdentityResources %
.% &
Profile& -
(- .
). /
,/ 0
new 
IdentityResources %
.% &
Email& +
(+ ,
), -
,- .
new 
IdentityResource $
($ %
$str% 5
,5 6
new7 :
[: ;
]; <
{= >
JwtClaimTypes? L
.L M
NameM Q
,Q R
JwtClaimTypesS `
.` a
Emaila f
,f g
$strh r
}s t
)t u
,u v
new 
IdentityResource $
($ %
$str% ,
,, -
$str. 5
,5 6
new7 :
[: ;
]; <
{= >
$str? E
}F G
)G H
} 
; 
} 	
public 
static 
IEnumerable !
<! "
ApiResource" -
>- .
GetApiResources/ >
(> ?
)? @
{ 	
return 
new 
[ 
] 
{ 
new 
ApiResource 
(  
$str  @
,@ A
$strB s
)s t
{ 

ApiSecrets 
=  
{ 
new 
Secret "
(" #
$str# +
.+ ,
Sha256, 2
(2 3
)3 4
)4 5
} 
, 
Enabled   
=   
true   "
,  " #
Scopes!! 
=!! 
new!!  
List!!! %
<!!% &
Scope!!& +
>!!+ ,
(!!, -
)!!- .
{"" 
new## 
Scope## !
(##! "
)##" #
{##$ %
Name##& *
=##+ ,
$str##- D
,##D E
DisplayName##F Q
=##R S
$str##T l
,##l m
Required##n v
=##w x
true##y }
,##} ~$
ShowInDiscoveryDocument	## �
=
##� �
true
##� �
,
##� �
Description
##� �
=
##� �
$str
##� �
}
##� �
,
##� �
new$$ 
Scope$$ !
($$! "
)$$" #
{$$$ %
Name$$& *
=$$+ ,
$str$$- ;
,$$; <
DisplayName$$= H
=$$I J
$str$$K Y
,$$Y Z
Required$$[ c
=$$d e
false$$f k
,$$k l$
ShowInDiscoveryDocument	$$m �
=
$$� �
true
$$� �
,
$$� �
Description
$$� �
=
$$� �
$str
$$� �
}
$$� �
,
$$� �
}%% 
,%% 

UserClaims&& 
=&&  
{&&! "
$str&&# )
,&&) *
$str&&+ 2
}&&3 4
}'' 
}(( 
;(( 
})) 	
}** 
}++ �
mC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\Configuration\Users.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
Configuration& 3
{ 
public 

class 
Users 
{ 
public 
const 
string 
AdminUserName )
=* +
$str, 3
;3 4
public 
const 
string 
AdminPassword )
=* +
$str, 9
;9 :
public 
const 
string 

AdminEmail &
=' (
$str) <
;< =
} 
}		 �
wC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\Constants\AuthorizationConsts.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
	Constants& /
{ 
public 

class 
AuthorizationConsts $
{ 
public 
const 
string  
AdministrationPolicy 0
=1 2
$str3 M
;M N
public 
const 
string 
AdministrationRole .
=/ 0
$str1 :
;: ;
public

 
const

 
string

 *
ApiTansacoesFinanceirashttpuri

 :
=

; <
$str

= j
;

j k
public 
const 
string +
ApiTansacoesFinanceirashttpsuri ;
=< =
$str> l
;l m
public 
const 
string #
IdentityAdminCookieName 3
=4 5
$str6 K
;K L
public 
const 
string $
IdentityAdminRedirectUri 4
=5 6
$str7 j
;j k
public 
const 
string !
IdentityServerBaseUrl 1
=2 3
$str4 d
;d e
public 
const 
string  
IdentityAdminBaseUrl 0
=1 2
$str3 Z
;Z [
public 
const 
string 
UserNameClaimType -
=. /
$str0 6
;6 7
public 
const 
string 
SignInScheme (
=) *
$str+ 4
;4 5
public 
const 
string 
OidcClientId (
=) *
$str+ :
;: ;
public 
const 
string $
OidcAuthenticationScheme 4
=5 6
$str7 =
;= >
public 
const 
string 
OidcResponseType ,
=- .
$str/ 9
;9 :
public 
static 
List 
< 
string !
>! "
Scopes# )
=* +
new, /
List0 4
<4 5
string5 ;
>; <
{= >
$str? G
,G H
$strI R
,R S
$strT [
,[ \
$str] d
}e f
;f g
public 
const 
string 
ScopeOpenId '
=( )
$str* 2
;2 3
public 
const 
string 
ScopeProfile (
=) *
$str+ 4
;4 5
public 
const 
string 

ScopeEmail &
=' (
$str) 0
;0 1
public 
const 
string 

ScopeRoles &
=' (
$str) 0
;0 1
public 
const 
string 
AccountLoginPage ,
=- .
$str/ >
;> ?
public 
const 
string #
AccountAccessDeniedPage 3
=4 5
$str6 N
;N O
}   
}!! �
wC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\Constants\ConfigurationConsts.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
	Constants& /
{ 
public 

class 
ConfigurationConsts $
{ 
public 
const 
string $
AdminConnectionStringKey 4
=5 6
$str7 H
;H I
public 
const 
string %
NLogConfigurationVariable 5
=6 7
$str8 J
;J K
public		 
const		 
string		 
LoggingSectionKey		 -
=		. /
$str		0 9
;		9 :
public 
const 
string 
ResourcesPath )
=* +
$str, 7
;7 8
} 
} �
wC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\Controllers\AccountController.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
Controllers& 1
{		 
[

 
	Authorize

 
]

 
public 

class 
AccountController "
:# $
BaseController% 3
{ 
public 
AccountController  
(  !
ILogger! (
<( )#
ConfigurationController) @
>@ A
loggerB H
)H I
:J K
baseL P
(P Q
loggerQ W
)W X
{ 	
} 	
public 
IActionResult 
AccessDenied )
() *
)* +
{ 	
return 
View 
( 
) 
; 
} 	
public 
IActionResult 
Logout #
(# $
)$ %
{ 	
return 
new 
SignOutResult $
($ %
new% (
List) -
<- .
string. 4
>4 5
{6 7
AuthorizationConsts8 K
.K L
SignInSchemeL X
,X Y
AuthorizationConstsZ m
.m n%
OidcAuthenticationScheme	n �
}
� �
,
� �
new $
AuthenticationProperties ,
{- .
RedirectUri/ :
=; <
$str= @
}A B
)B C
;C D
} 	
} 
} �,
tC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\Controllers\BaseController.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
Controllers& 1
{		 
public

 

class

 
BaseController

 
:

  !

Controller

" ,
{ 
private 
readonly 
ILogger  
<  !
BaseController! /
>/ 0
_logger1 8
;8 9
public 
BaseController 
( 
ILogger %
<% &
BaseController& 4
>4 5
logger6 <
)< =
{ 	
_logger 
= 
logger 
; 
} 	
	protected 
void 
SuccessNotification *
(* +
string+ 1
message2 9
,9 :
string; A
titleB G
=H I
$strJ L
)L M
{ 	
CreateNotification 
( 
NotificationHelpers 2
.2 3
	AlertType3 <
.< =
Success= D
,D E
messageF M
,M N
titleO T
)T U
;U V
} 	
	protected 
void 
CreateNotification )
() *
NotificationHelpers* =
.= >
	AlertType> G
typeH L
,L M
stringN T
messageU \
,\ ]
string^ d
titlee j
=k l
$strm o
)o p
{ 	
var 
toast 
= 
new 
NotificationHelpers /
./ 0
Alert0 5
{ 
Type 
= 
type 
, 
Message 
= 
message !
,! "
Title 
= 
title 
} 
; 
var!! 
alerts!! 
=!! 
new!! 
List!! !
<!!! "
NotificationHelpers!!" 5
.!!5 6
Alert!!6 ;
>!!; <
(!!< =
)!!= >
;!!> ?
if## 
(## 
TempData## 
.## 
ContainsKey## $
(##$ %
NotificationHelpers##% 8
.##8 9
NotificationKey##9 H
)##H I
)##I J
{$$ 
alerts%% 
=%% 
JsonConvert%% $
.%%$ %
DeserializeObject%%% 6
<%%6 7
List%%7 ;
<%%; <
NotificationHelpers%%< O
.%%O P
Alert%%P U
>%%U V
>%%V W
(%%W X
TempData%%X `
[%%` a
NotificationHelpers%%a t
.%%t u
NotificationKey	%%u �
]
%%� �
.
%%� �
ToString
%%� �
(
%%� �
)
%%� �
)
%%� �
;
%%� �
TempData&& 
.&& 
Remove&& 
(&&  
NotificationHelpers&&  3
.&&3 4
NotificationKey&&4 C
)&&C D
;&&D E
}'' 
alerts)) 
.)) 
Add)) 
()) 
toast)) 
))) 
;)) 
var++ 
settings++ 
=++ 
new++ "
JsonSerializerSettings++ 5
{,, 
TypeNameHandling--  
=--! "
TypeNameHandling--# 3
.--3 4
All--4 7
}.. 
;.. 
var00 
	alertJson00 
=00 
JsonConvert00 '
.00' (
SerializeObject00( 7
(007 8
alerts008 >
,00> ?
settings00@ H
)00H I
;00I J
TempData22 
.22 
Add22 
(22 
NotificationHelpers22 ,
.22, -
NotificationKey22- <
,22< =
	alertJson22> G
)22G H
;22H I
}33 	
	protected55 
void55 !
GenerateNotifications55 ,
(55, -
)55- .
{66 	
if77 
(77 
!77 
TempData77 
.77 
ContainsKey77 %
(77% &
NotificationHelpers77& 9
.779 :
NotificationKey77: I
)77I J
)77J K
return77L R
;77R S
ViewBag88 
.88 
Notifications88 !
=88" #
TempData88$ ,
[88, -
NotificationHelpers88- @
.88@ A
NotificationKey88A P
]88P Q
;88Q R
TempData99 
.99 
Remove99 
(99 
NotificationHelpers99 /
.99/ 0
NotificationKey990 ?
)99? @
;99@ A
}:: 	
public<< 
override<< 
void<< 
OnActionExecuting<< .
(<<. /"
ActionExecutingContext<</ E
context<<F M
)<<M N
{== 	!
GenerateNotifications>> !
(>>! "
)>>" #
;>># $
base@@ 
.@@ 
OnActionExecuting@@ "
(@@" #
context@@# *
)@@* +
;@@+ ,
}AA 	
publicCC 
overrideCC 

ViewResultCC "
ViewCC# '
(CC' (
objectCC( .
modelCC/ 4
)CC4 5
{DD 	!
GenerateNotificationsEE !
(EE! "
)EE" #
;EE# $
returnGG 
baseGG 
.GG 
ViewGG 
(GG 
modelGG "
)GG" #
;GG# $
}HH 	
}II 
}JJ ��
}C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\Controllers\ConfigurationController.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
Controllers& 1
{ 
[ 
	Authorize 
( 
Policy 
= 
AuthorizationConsts +
.+ , 
AdministrationPolicy, @
)@ A
]A B
[ 

TypeFilter 
( 
typeof 
( .
"ControllerExceptionFilterAttribute 9
)9 :
): ;
]; <
public 

class #
ConfigurationController (
:) *
BaseController+ 9
{ 
private 
readonly $
IIdentityResourceService 1$
_identityResourceService2 J
;J K
private 
readonly 
IApiResourceService ,
_apiResourceService- @
;@ A
private 
readonly 
IClientService '
_clientService( 6
;6 7
private 
readonly 
IStringLocalizer )
<) *#
ConfigurationController* A
>A B

_localizerC M
;M N
public #
ConfigurationController &
(& '$
IIdentityResourceService' ?#
identityResourceService@ W
,W X
IApiResourceService 
apiResourceService  2
,2 3
IClientService 
clientService (
,( )
IStringLocalizer 
< #
ConfigurationController 4
>4 5
	localizer6 ?
,? @
ILogger 
< #
ConfigurationController +
>+ ,
logger- 3
)3 4
: 
base 
( 
logger 
) 
{ 	$
_identityResourceService $
=% &#
identityResourceService' >
;> ?
_apiResourceService 
=  !
apiResourceService" 4
;4 5
_clientService   
=   
clientService   *
;  * +

_localizer!! 
=!! 
	localizer!! "
;!!" #
}"" 	
[$$ 	
HttpGet$$	 
]$$ 
[%% 	
Route%%	 
(%% 
$str%% &
)%%& '
]%%' (
[&& 	
Route&&	 
(&& 
$str&& /
)&&/ 0
]&&0 1
public'' 
async'' 
Task'' 
<'' 
IActionResult'' '
>''' (
Client'') /
(''/ 0
int''0 3
id''4 6
)''6 7
{(( 	
if)) 
()) 
id)) 
==)) 
$num)) 
))) 
{** 
var++ 
	clientDto++ 
=++ 
_clientService++  .
.++. / 
BuildClientViewModel++/ C
(++C D
)++D E
;++E F
return,, 
View,, 
(,, 
	clientDto,, %
),,% &
;,,& '
}-- 
var// 
client// 
=// 
await// 
_clientService// -
.//- .
GetClientAsync//. <
(//< =
(//= >
int//> A
)//A B
id//B D
)//D E
;//E F
client00 
=00 
_clientService00 #
.00# $ 
BuildClientViewModel00$ 8
(008 9
client009 ?
)00? @
;00@ A
return22 
View22 
(22 
client22 
)22 
;22  
}33 	
[55 	
HttpPost55	 
]55 
[66 	$
ValidateAntiForgeryToken66	 !
]66! "
public77 
async77 
Task77 
<77 
IActionResult77 '
>77' (
Client77) /
(77/ 0
	ClientDto770 9
client77: @
)77@ A
{88 	
client99 
=99 
_clientService99 #
.99# $ 
BuildClientViewModel99$ 8
(998 9
client999 ?
)99? @
;99@ A
if;; 
(;; 
!;; 

ModelState;; 
.;; 
IsValid;; #
);;# $
{<< 
return== 
View== 
(== 
client== "
)==" #
;==# $
}>> 
ifAA 
(AA 
clientAA 
.AA 
IdAA 
==AA 
$numAA 
)AA 
{BB 
varCC 
clientIdCC 
=CC 
awaitCC $
_clientServiceCC% 3
.CC3 4
AddClientAsyncCC4 B
(CCB C
clientCCC I
)CCI J
;CCJ K
SuccessNotificationDD #
(DD# $
stringDD$ *
.DD* +
FormatDD+ 1
(DD1 2

_localizerDD2 <
[DD< =
$strDD= O
]DDO P
,DDP Q
clientDDR X
.DDX Y
ClientIdDDY a
)DDa b
,DDb c

_localizerDDd n
[DDn o
$strDDo }
]DD} ~
)DD~ 
;	DD �
returnFF 
RedirectToActionFF '
(FF' (
nameofFF( .
(FF. /
ClientFF/ 5
)FF5 6
,FF6 7
newFF8 ;
{FF< =
IdFF> @
=FFA B
clientIdFFC K
}FFL M
)FFM N
;FFN O
}GG 
awaitJJ 
_clientServiceJJ  
.JJ  !
UpdateClientAsyncJJ! 2
(JJ2 3
clientJJ3 9
)JJ9 :
;JJ: ;
SuccessNotificationKK 
(KK  
stringKK  &
.KK& '
FormatKK' -
(KK- .

_localizerKK. 8
[KK8 9
$strKK9 N
]KKN O
,KKO P
clientKKQ W
.KKW X
ClientIdKKX `
)KK` a
,KKa b

_localizerKKc m
[KKm n
$strKKn |
]KK| }
)KK} ~
;KK~ 
returnMM 
RedirectToActionMM #
(MM# $
nameofMM$ *
(MM* +
ClientsMM+ 2
)MM2 3
)MM3 4
;MM4 5
}NN 	
[PP 	
HttpGetPP	 
]PP 
publicQQ 
asyncQQ 
TaskQQ 
<QQ 
IActionResultQQ '
>QQ' (
ClientCloneQQ) 4
(QQ4 5
intQQ5 8
idQQ9 ;
)QQ; <
{RR 	
ifSS 
(SS 
idSS 
==SS 
$numSS 
)SS 
returnSS 
NotFoundSS  (
(SS( )
)SS) *
;SS* +
varUU 
	clientDtoUU 
=UU 
awaitUU !
_clientServiceUU" 0
.UU0 1
GetClientAsyncUU1 ?
(UU? @
idUU@ B
)UUB C
;UUC D
varVV 
clientVV 
=VV 
_clientServiceVV '
.VV' (%
BuildClientCloneViewModelVV( A
(VVA B
idVVB D
,VVD E
	clientDtoVVF O
)VVO P
;VVP Q
returnXX 
ViewXX 
(XX 
clientXX 
)XX 
;XX  
}YY 	
[[[ 	
HttpPost[[	 
][[ 
[\\ 	$
ValidateAntiForgeryToken\\	 !
]\\! "
public]] 
async]] 
Task]] 
<]] 
IActionResult]] '
>]]' (
ClientClone]]) 4
(]]4 5
ClientCloneDto]]5 C
client]]D J
)]]J K
{^^ 	
if__ 
(__ 
!__ 

ModelState__ 
.__ 
IsValid__ #
)__# $
{`` 
returnaa 
Viewaa 
(aa 
clientaa "
)aa" #
;aa# $
}bb 
vardd 
newClientIddd 
=dd 
awaitdd #
_clientServicedd$ 2
.dd2 3
CloneClientAsyncdd3 C
(ddC D
clientddD J
)ddJ K
;ddK L
SuccessNotificationee 
(ee  
stringee  &
.ee& '
Formatee' -
(ee- .

_localizeree. 8
[ee8 9
$stree9 M
]eeM N
,eeN O
clienteeP V
.eeV W
ClientIdeeW _
)ee_ `
,ee` a

_localizereeb l
[eel m
$streem {
]ee{ |
)ee| }
;ee} ~
returngg 
RedirectToActiongg #
(gg# $
nameofgg$ *
(gg* +
Clientgg+ 1
)gg1 2
,gg2 3
newgg4 7
{gg8 9
Idgg: <
=gg= >
newClientIdgg? J
}ggK L
)ggL M
;ggM N
}hh 	
[jj 	
HttpGetjj	 
]jj 
publickk 
asynckk 
Taskkk 
<kk 
IActionResultkk '
>kk' (
ClientDeletekk) 5
(kk5 6
intkk6 9
idkk: <
)kk< =
{ll 	
ifmm 
(mm 
idmm 
==mm 
$nummm 
)mm 
returnmm 
NotFoundmm  (
(mm( )
)mm) *
;mm* +
varoo 
clientoo 
=oo 
awaitoo 
_clientServiceoo -
.oo- .
GetClientAsyncoo. <
(oo< =
idoo= ?
)oo? @
;oo@ A
returnqq 
Viewqq 
(qq 
clientqq 
)qq 
;qq  
}rr 	
[tt 	
HttpPosttt	 
]tt 
[uu 	$
ValidateAntiForgeryTokenuu	 !
]uu! "
publicvv 
asyncvv 
Taskvv 
<vv 
IActionResultvv '
>vv' (
ClientDeletevv) 5
(vv5 6
	ClientDtovv6 ?
clientvv@ F
)vvF G
{ww 	
awaitxx 
_clientServicexx  
.xx  !
RemoveClientAsyncxx! 2
(xx2 3
clientxx3 9
)xx9 :
;xx: ;
SuccessNotificationzz 
(zz  

_localizerzz  *
[zz* +
$strzz+ @
]zz@ A
,zzA B

_localizerzzC M
[zzM N
$strzzN \
]zz\ ]
)zz] ^
;zz^ _
return|| 
RedirectToAction|| #
(||# $
nameof||$ *
(||* +
Clients||+ 2
)||2 3
)||3 4
;||4 5
}}} 	
[ 	
HttpGet	 
] 
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
��' (
ClientClaims
��) 5
(
��5 6
int
��6 9
id
��: <
,
��< =
int
��> A
?
��A B
page
��C G
)
��G H
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
$num
�� 
)
�� 
return
�� 
NotFound
��  (
(
��( )
)
��) *
;
��* +
var
�� 
claims
�� 
=
�� 
await
�� 
_clientService
�� -
.
��- ."
GetClientClaimsAsync
��. B
(
��B C
id
��C E
,
��E F
page
��G K
??
��L N
$num
��O P
)
��P Q
;
��Q R
return
�� 
View
�� 
(
�� 
claims
�� 
)
�� 
;
��  
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
��' (
ClientProperties
��) 9
(
��9 :
int
��: =
id
��> @
,
��@ A
int
��B E
?
��E F
page
��G K
)
��K L
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
$num
�� 
)
�� 
return
�� 
NotFound
��  (
(
��( )
)
��) *
;
��* +
var
�� 

properties
�� 
=
�� 
await
�� "
_clientService
��# 1
.
��1 2&
GetClientPropertiesAsync
��2 J
(
��J K
id
��K M
,
��M N
page
��O S
??
��T V
$num
��W X
)
��X Y
;
��Y Z
return
�� 
View
�� 
(
�� 

properties
�� "
)
��" #
;
��# $
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
��' (
ClientProperties
��) 9
(
��9 :!
ClientPropertiesDto
��: M
clientProperty
��N \
)
��\ ]
{
�� 	
if
�� 
(
�� 
!
�� 

ModelState
�� 
.
�� 
IsValid
�� #
)
��# $
{
�� 
return
�� 
View
�� 
(
�� 
clientProperty
�� *
)
��* +
;
��+ ,
}
�� 
await
�� 
_clientService
��  
.
��  !$
AddClientPropertyAsync
��! 7
(
��7 8
clientProperty
��8 F
)
��F G
;
��G H!
SuccessNotification
�� 
(
��  
string
��  &
.
��& '
Format
��' -
(
��- .

_localizer
��. 8
[
��8 9
$str
��9 S
]
��S T
,
��T U
clientProperty
��V d
.
��d e
ClientId
��e m
,
��m n
clientProperty
��o }
.
��} ~

ClientName��~ �
)��� �
,��� �

_localizer��� �
[��� �
$str��� �
]��� �
)��� �
;��� �
return
�� 
RedirectToAction
�� #
(
��# $
nameof
��$ *
(
��* +
ClientProperties
��+ ;
)
��; <
,
��< =
new
��> A
{
��B C
Id
��D F
=
��G H
clientProperty
��I W
.
��W X
ClientId
��X `
}
��a b
)
��b c
;
��c d
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
��' (
ClientClaims
��) 5
(
��5 6
ClientClaimsDto
��6 E
clientClaim
��F Q
)
��Q R
{
�� 	
if
�� 
(
�� 
!
�� 

ModelState
�� 
.
�� 
IsValid
�� #
)
��# $
{
�� 
return
�� 
View
�� 
(
�� 
clientClaim
�� '
)
��' (
;
��( )
}
�� 
await
�� 
_clientService
��  
.
��  !!
AddClientClaimAsync
��! 4
(
��4 5
clientClaim
��5 @
)
��@ A
;
��A B!
SuccessNotification
�� 
(
��  
string
��  &
.
��& '
Format
��' -
(
��- .

_localizer
��. 8
[
��8 9
$str
��9 P
]
��P Q
,
��Q R
clientClaim
��S ^
.
��^ _
Value
��_ d
,
��d e
clientClaim
��f q
.
��q r

ClientName
��r |
)
��| }
,
��} ~

_localizer�� �
[��� �
$str��� �
]��� �
)��� �
;��� �
return
�� 
RedirectToAction
�� #
(
��# $
nameof
��$ *
(
��* +
ClientClaims
��+ 7
)
��7 8
,
��8 9
new
��: =
{
��> ?
Id
��@ B
=
��C D
clientClaim
��E P
.
��P Q
ClientId
��Q Y
}
��Z [
)
��[ \
;
��\ ]
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
��' (
ClientClaimDelete
��) :
(
��: ;
int
��; >
id
��? A
)
��A B
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
$num
�� 
)
�� 
return
�� 
NotFound
��  (
(
��( )
)
��) *
;
��* +
var
�� 
clientClaim
�� 
=
�� 
await
�� #
_clientService
��$ 2
.
��2 3!
GetClientClaimAsync
��3 F
(
��F G
id
��G I
)
��I J
;
��J K
return
�� 
View
�� 
(
�� 
nameof
�� 
(
�� 
ClientClaimDelete
�� 0
)
��0 1
,
��1 2
clientClaim
��3 >
)
��> ?
;
��? @
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
��' ("
ClientPropertyDelete
��) =
(
��= >
int
��> A
id
��B D
)
��D E
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
$num
�� 
)
�� 
return
�� 
NotFound
��  (
(
��( )
)
��) *
;
��* +
var
�� 
clientProperty
�� 
=
��  
await
��! &
_clientService
��' 5
.
��5 6$
GetClientPropertyAsync
��6 L
(
��L M
id
��M O
)
��O P
;
��P Q
return
�� 
View
�� 
(
�� 
nameof
�� 
(
�� "
ClientPropertyDelete
�� 3
)
��3 4
,
��4 5
clientProperty
��6 D
)
��D E
;
��E F
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
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
��' (
ClientClaimDelete
��) :
(
��: ;
ClientClaimsDto
��; J
clientClaim
��K V
)
��V W
{
�� 	
await
�� 
_clientService
��  
.
��  !$
DeleteClientClaimAsync
��! 7
(
��7 8
clientClaim
��8 C
)
��C D
;
��D E!
SuccessNotification
�� 
(
��  

_localizer
��  *
[
��* +
$str
��+ E
]
��E F
,
��F G

_localizer
��H R
[
��R S
$str
��S a
]
��a b
)
��b c
;
��c d
return
�� 
RedirectToAction
�� #
(
��# $
nameof
��$ *
(
��* +
ClientClaims
��+ 7
)
��7 8
,
��8 9
new
��: =
{
��> ?
Id
��@ B
=
��C D
clientClaim
��E P
.
��P Q
ClientId
��Q Y
}
��Z [
)
��[ \
;
��\ ]
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
��' ("
ClientPropertyDelete
��) =
(
��= >!
ClientPropertiesDto
��> Q
clientProperty
��R `
)
��` a
{
�� 	
await
�� 
_clientService
��  
.
��  !'
DeleteClientPropertyAsync
��! :
(
��: ;
clientProperty
��; I
)
��I J
;
��J K!
SuccessNotification
�� 
(
��  

_localizer
��  *
[
��* +
$str
��+ H
]
��H I
,
��I J

_localizer
��K U
[
��U V
$str
��V d
]
��d e
)
��e f
;
��f g
return
�� 
RedirectToAction
�� #
(
��# $
nameof
��$ *
(
��* +
ClientProperties
��+ ;
)
��; <
,
��< =
new
��> A
{
��B C
Id
��D F
=
��G H
clientProperty
��I W
.
��W X
ClientId
��X `
}
��a b
)
��b c
;
��c d
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
��' (
ClientSecrets
��) 6
(
��6 7
int
��7 :
id
��; =
,
��= >
int
��? B
?
��B C
page
��D H
)
��H I
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
$num
�� 
)
�� 
return
�� 
NotFound
��  (
(
��( )
)
��) *
;
��* +
var
�� 
clientSecrets
�� 
=
�� 
await
��  %
_clientService
��& 4
.
��4 5#
GetClientSecretsAsync
��5 J
(
��J K
id
��K M
,
��M N
page
��O S
??
��T V
$num
��W X
)
��X Y
;
��Y Z
_clientService
�� 
.
�� )
BuildClientSecretsViewModel
�� 6
(
��6 7
clientSecrets
��7 D
)
��D E
;
��E F
return
�� 
View
�� 
(
�� 
clientSecrets
�� %
)
��% &
;
��& '
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
��' (
ClientSecrets
��) 6
(
��6 7
ClientSecretsDto
��7 G
clientSecret
��H T
)
��T U
{
�� 	
await
�� 
_clientService
��  
.
��  !"
AddClientSecretAsync
��! 5
(
��5 6
clientSecret
��6 B
)
��B C
;
��C D!
SuccessNotification
�� 
(
��  
string
��  &
.
��& '
Format
��' -
(
��- .

_localizer
��. 8
[
��8 9
$str
��9 Q
]
��Q R
,
��R S
clientSecret
��T `
.
��` a

ClientName
��a k
)
��k l
,
��l m

_localizer
��n x
[
��x y
$str��y �
]��� �
)��� �
;��� �
return
�� 
RedirectToAction
�� #
(
��# $
nameof
��$ *
(
��* +
ClientSecrets
��+ 8
)
��8 9
,
��9 :
new
��; >
{
��? @
Id
��A C
=
��D E
clientSecret
��F R
.
��R S
ClientId
��S [
}
��\ ]
)
��] ^
;
��^ _
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
��' ( 
ClientSecretDelete
��) ;
(
��; <
int
��< ?
id
��@ B
)
��B C
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
$num
�� 
)
�� 
return
�� 
NotFound
��  (
(
��( )
)
��) *
;
��* +
var
�� 
clientSecret
�� 
=
�� 
await
�� $
_clientService
��% 3
.
��3 4"
GetClientSecretAsync
��4 H
(
��H I
id
��I K
)
��K L
;
��L M
return
�� 
View
�� 
(
�� 
nameof
�� 
(
��  
ClientSecretDelete
�� 1
)
��1 2
,
��2 3
clientSecret
��4 @
)
��@ A
;
��A B
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
��' ( 
ClientSecretDelete
��) ;
(
��; <
ClientSecretsDto
��< L
clientSecret
��M Y
)
��Y Z
{
�� 	
await
�� 
_clientService
��  
.
��  !%
DeleteClientSecretAsync
��! 8
(
��8 9
clientSecret
��9 E
)
��E F
;
��F G!
SuccessNotification
�� 
(
��  

_localizer
��  *
[
��* +
$str
��+ F
]
��F G
,
��G H

_localizer
��I S
[
��S T
$str
��T b
]
��b c
)
��c d
;
��d e
return
�� 
RedirectToAction
�� #
(
��# $
nameof
��$ *
(
��* +
ClientSecrets
��+ 8
)
��8 9
,
��9 :
new
��; >
{
��? @
Id
��A C
=
��D E
clientSecret
��F R
.
��R S
ClientId
��S [
}
��\ ]
)
��] ^
;
��^ _
}
�� 	
[
�� 	
HttpGet
��	 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
SearchScopes
��) 5
(
��5 6
string
��6 <
scope
��= B
,
��B C
int
��D G
limit
��H M
=
��N O
$num
��P Q
)
��Q R
{
�� 	
var
�� 
scopes
�� 
=
�� 
await
�� 
_clientService
�� -
.
��- .
GetScopesAsync
��. <
(
��< =
scope
��= B
,
��B C
limit
��D I
)
��I J
;
��J K
return
�� 
Ok
�� 
(
�� 
scopes
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
HttpGet
��	 
]
�� 
public
�� 
IActionResult
�� 
SearchClaims
�� )
(
��) *
string
��* 0
claim
��1 6
,
��6 7
int
��8 ;
limit
��< A
=
��B C
$num
��D E
)
��E F
{
�� 	
var
�� 
claims
�� 
=
�� 
_clientService
�� '
.
��' (
GetStandardClaims
��( 9
(
��9 :
claim
��: ?
,
��? @
limit
��A F
)
��F G
;
��G H
return
�� 
Ok
�� 
(
�� 
claims
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
HttpGet
��	 
]
�� 
public
�� 
IActionResult
�� 
SearchGrantTypes
�� -
(
��- .
string
��. 4
grant
��5 :
,
��: ;
int
��< ?
limit
��@ E
=
��F G
$num
��H I
)
��I J
{
�� 	
var
�� 
grants
�� 
=
�� 
_clientService
�� '
.
��' (
GetGrantTypes
��( 5
(
��5 6
grant
��6 ;
,
��; <
limit
��= B
)
��B C
;
��C D
return
�� 
Ok
�� 
(
�� 
grants
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
HttpGet
��	 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
Clients
��) 0
(
��0 1
int
��1 4
?
��4 5
page
��6 :
,
��: ;
string
��< B
search
��C I
)
��I J
{
�� 	
ViewBag
�� 
.
�� 
Search
�� 
=
�� 
search
�� #
;
��# $
return
�� 
View
�� 
(
�� 
await
�� 
_clientService
�� ,
.
��, -
GetClientsAsync
��- <
(
��< =
search
��= C
,
��C D
page
��E I
??
��J L
$num
��M N
)
��N O
)
��O P
;
��P Q
}
�� 	
[
�� 	
HttpGet
��	 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' ($
IdentityResourceDelete
��) ?
(
��? @
int
��@ C
id
��D F
)
��F G
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
$num
�� 
)
�� 
return
�� 
NotFound
��  (
(
��( )
)
��) *
;
��* +
var
�� 
identityResource
��  
=
��! "
await
��# (&
_identityResourceService
��) A
.
��A B&
GetIdentityResourceAsync
��B Z
(
��Z [
id
��[ ]
)
��] ^
;
��^ _
return
�� 
View
�� 
(
�� 
identityResource
�� (
)
��( )
;
��) *
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' ($
IdentityResourceDelete
��) ?
(
��? @!
IdentityResourceDto
��@ S
identityResource
��T d
)
��d e
{
�� 	
await
�� &
_identityResourceService
�� *
.
��* +)
DeleteIdentityResourceAsync
��+ F
(
��F G
identityResource
��G W
)
��W X
;
��X Y!
SuccessNotification
�� 
(
��  

_localizer
��  *
[
��* +
$str
��+ J
]
��J K
,
��K L

_localizer
��M W
[
��W X
$str
��X f
]
��f g
)
��g h
;
��h i
return
�� 
RedirectToAction
�� #
(
��# $
nameof
��$ *
(
��* +
IdentityResources
��+ <
)
��< =
)
��= >
;
��> ?
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
IdentityResource
��) 9
(
��9 :!
IdentityResourceDto
��: M
identityResource
��N ^
)
��^ _
{
�� 	
if
�� 
(
�� 
!
�� 

ModelState
�� 
.
�� 
IsValid
�� #
)
��# $
{
�� 
return
�� 
View
�� 
(
�� 
identityResource
�� ,
)
��, -
;
��- .
}
�� 
identityResource
�� 
=
�� &
_identityResourceService
�� 7
.
��7 8,
BuildIdentityResourceViewModel
��8 V
(
��V W
identityResource
��W g
)
��g h
;
��h i
if
�� 
(
�� 
identityResource
��  
.
��  !
Id
��! #
==
��$ &
$num
��' (
)
��( )
await
��* /&
_identityResourceService
��0 H
.
��H I&
AddIdentityResourceAsync
��I a
(
��a b
identityResource
��b r
)
��r s
;
��s t
else
�� 
await
�� &
_identityResourceService
�� /
.
��/ 0)
UpdateIdentityResourceAsync
��0 K
(
��K L
identityResource
��L \
)
��\ ]
;
��] ^!
SuccessNotification
�� 
(
��  
string
��  &
.
��& '
Format
��' -
(
��- .

_localizer
��. 8
[
��8 9
$str
��9 U
]
��U V
,
��V W
identityResource
��X h
.
��h i
Name
��i m
)
��m n
,
��n o

_localizer
��p z
[
��z {
$str��{ �
]��� �
)��� �
;��� �
return
�� 
RedirectToAction
�� #
(
��# $
nameof
��$ *
(
��* +
IdentityResources
��+ <
)
��< =
)
��= >
;
��> ?
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
ApiResource
��) 4
(
��4 5
ApiResourceDto
��5 C
apiResource
��D O
)
��O P
{
�� 	
if
�� 
(
�� 
!
�� 

ModelState
�� 
.
�� 
IsValid
�� #
)
��# $
{
�� 
return
�� 
View
�� 
(
�� 
apiResource
�� '
)
��' (
;
��( )
}
�� 
ComboBoxHelpers
�� 
.
�� "
PopulateValuesToList
�� 0
(
��0 1
apiResource
��1 <
.
��< =
UserClaimsItems
��= L
,
��L M
apiResource
��N Y
.
��Y Z

UserClaims
��Z d
)
��d e
;
��e f
if
�� 
(
�� 
apiResource
�� 
.
�� 
Id
�� 
==
�� !
$num
��" #
)
��# $
await
��% *!
_apiResourceService
��+ >
.
��> ?!
AddApiResourceAsync
��? R
(
��R S
apiResource
��S ^
)
��^ _
;
��_ `
else
�� 
await
�� !
_apiResourceService
�� *
.
��* +$
UpdateApiResourceAsync
��+ A
(
��A B
apiResource
��B M
)
��M N
;
��N O!
SuccessNotification
�� 
(
��  
string
��  &
.
��& '
Format
��' -
(
��- .

_localizer
��. 8
[
��8 9
$str
��9 P
]
��P Q
,
��Q R
apiResource
��S ^
.
��^ _
Name
��_ c
)
��c d
,
��d e

_localizer
��f p
[
��p q
$str
��q 
]�� �
)��� �
;��� �
return
�� 
RedirectToAction
�� #
(
��# $
nameof
��$ *
(
��* +
ApiResources
��+ 7
)
��7 8
)
��8 9
;
��9 :
}
�� 	
[
�� 	
HttpGet
��	 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
ApiResourceDelete
��) :
(
��: ;
int
��; >
id
��? A
)
��A B
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
$num
�� 
)
�� 
return
�� 
NotFound
��  (
(
��( )
)
��) *
;
��* +
var
�� 
apiResource
�� 
=
�� 
await
�� #!
_apiResourceService
��$ 7
.
��7 8!
GetApiResourceAsync
��8 K
(
��K L
id
��L N
)
��N O
;
��O P
return
�� 
View
�� 
(
�� 
apiResource
�� #
)
��# $
;
��$ %
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
ApiResourceDelete
��) :
(
��: ;
ApiResourceDto
��; I
apiResource
��J U
)
��U V
{
�� 	
await
�� !
_apiResourceService
�� %
.
��% &$
DeleteApiResourceAsync
��& <
(
��< =
apiResource
��= H
)
��H I
;
��I J!
SuccessNotification
�� 
(
��  

_localizer
��  *
[
��* +
$str
��+ E
]
��E F
,
��F G

_localizer
��H R
[
��R S
$str
��S a
]
��a b
)
��b c
;
��c d
return
�� 
RedirectToAction
�� #
(
��# $
nameof
��$ *
(
��* +
ApiResources
��+ 7
)
��7 8
)
��8 9
;
��9 :
}
�� 	
[
�� 	
HttpGet
��	 
]
�� 
[
�� 	
Route
��	 
(
�� 
$str
�� &
)
��& '
]
��' (
[
�� 	
Route
��	 
(
�� 
$str
�� /
)
��/ 0
]
��0 1
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
ApiResource
��) 4
(
��4 5
int
��5 8
id
��9 ;
)
��; <
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
$num
�� 
)
�� 
{
�� 
var
�� 
apiResourceDto
�� "
=
��# $
new
��% (
ApiResourceDto
��) 7
(
��7 8
)
��8 9
;
��9 :
return
�� 
View
�� 
(
�� 
apiResourceDto
�� *
)
��* +
;
��+ ,
}
�� 
var
�� 
apiResource
�� 
=
�� 
await
�� #!
_apiResourceService
��$ 7
.
��7 8!
GetApiResourceAsync
��8 K
(
��K L
id
��L N
)
��N O
;
��O P
return
�� 
View
�� 
(
�� 
apiResource
�� #
)
��# $
;
��$ %
}
�� 	
[
�� 	
HttpGet
��	 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (

ApiSecrets
��) 3
(
��3 4
int
��4 7
id
��8 :
,
��: ;
int
��< ?
?
��? @
page
��A E
)
��E F
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
$num
�� 
)
�� 
return
�� 
NotFound
��  (
(
��( )
)
��) *
;
��* +
var
�� 

apiSecrets
�� 
=
�� 
await
�� "!
_apiResourceService
��# 6
.
��6 7 
GetApiSecretsAsync
��7 I
(
��I J
id
��J L
,
��L M
page
��N R
??
��S U
$num
��V W
)
��W X
;
��X Y!
_apiResourceService
�� 
.
��  &
BuildApiSecretsViewModel
��  8
(
��8 9

apiSecrets
��9 C
)
��C D
;
��D E
return
�� 
View
�� 
(
�� 

apiSecrets
�� "
)
��" #
;
��# $
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (

ApiSecrets
��) 3
(
��3 4
ApiSecretsDto
��4 A
	apiSecret
��B K
)
��K L
{
�� 	
if
�� 
(
�� 
!
�� 

ModelState
�� 
.
�� 
IsValid
�� #
)
��# $
{
�� 
return
�� 
View
�� 
(
�� 
	apiSecret
�� %
)
��% &
;
��& '
}
�� 
await
�� !
_apiResourceService
�� %
.
��% &
AddApiSecretAsync
��& 7
(
��7 8
	apiSecret
��8 A
)
��A B
;
��B C!
SuccessNotification
�� 
(
��  

_localizer
��  *
[
��* +
$str
��+ @
]
��@ A
,
��A B

_localizer
��C M
[
��M N
$str
��N \
]
��\ ]
)
��] ^
;
��^ _
return
�� 
RedirectToAction
�� #
(
��# $
nameof
��$ *
(
��* +

ApiSecrets
��+ 5
)
��5 6
,
��6 7
new
��8 ;
{
��< =
Id
��> @
=
��A B
	apiSecret
��C L
.
��L M
ApiResourceId
��M Z
}
��[ \
)
��\ ]
;
��] ^
}
�� 	
[
�� 	
HttpGet
��	 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
	ApiScopes
��) 2
(
��2 3
int
��3 6
id
��7 9
,
��9 :
int
��; >
?
��> ?
page
��@ D
,
��D E
int
��F I
?
��I J
scope
��K P
)
��P Q
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
$num
�� 
||
�� 
!
�� 

ModelState
�� &
.
��& '
IsValid
��' .
)
��. /
return
��0 6
NotFound
��7 ?
(
��? @
)
��@ A
;
��A B
if
�� 
(
�� 
scope
�� 
==
�� 
null
�� 
)
�� 
{
�� 
var
�� 
apiScopesDto
��  
=
��! "
await
��# (!
_apiResourceService
��) <
.
��< =
GetApiScopesAsync
��= N
(
��N O
id
��O Q
,
��Q R
page
��S W
??
��X Z
$num
��[ \
)
��\ ]
;
��] ^
return
�� 
View
�� 
(
�� 
apiScopesDto
�� (
)
��( )
;
��) *
}
�� 
else
�� 
{
�� 
var
�� 
apiScopesDto
��  
=
��! "
await
��# (!
_apiResourceService
��) <
.
��< =
GetApiScopeAsync
��= M
(
��M N
id
��N P
,
��P Q
scope
��R W
.
��W X
Value
��X ]
)
��] ^
;
��^ _
return
�� 
View
�� 
(
�� 
apiScopesDto
�� (
)
��( )
;
��) *
}
�� 
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
	ApiScopes
��) 2
(
��2 3
ApiScopesDto
��3 ?
apiScope
��@ H
)
��H I
{
�� 	
if
�� 
(
�� 
!
�� 

ModelState
�� 
.
�� 
IsValid
�� #
)
��# $
{
�� 
return
�� 
View
�� 
(
�� 
apiScope
�� $
)
��$ %
;
��% &
}
�� !
_apiResourceService
�� 
.
��  $
BuildApiScopeViewModel
��  6
(
��6 7
apiScope
��7 ?
)
��? @
;
��@ A
if
�� 
(
�� 
apiScope
�� 
.
�� 

ApiScopeId
�� #
==
��$ &
$num
��' (
)
��( )
await
��* /!
_apiResourceService
��0 C
.
��C D
AddApiScopeAsync
��D T
(
��T U
apiScope
��U ]
)
��] ^
;
��^ _
else
�� 
await
�� !
_apiResourceService
�� *
.
��* +!
UpdateApiScopeAsync
��+ >
(
��> ?
apiScope
��? G
)
��G H
;
��H I!
SuccessNotification
�� 
(
��  
string
��  &
.
��& '
Format
��' -
(
��- .

_localizer
��. 8
[
��8 9
$str
��9 M
]
��M N
,
��N O
apiScope
��P X
.
��X Y
Name
��Y ]
)
��] ^
,
��^ _

_localizer
��` j
[
��j k
$str
��k y
]
��y z
)
��z {
;
��{ |
return
�� 
RedirectToAction
�� #
(
��# $
nameof
��$ *
(
��* +
	ApiScopes
��+ 4
)
��4 5
)
��5 6
;
��6 7
}
�� 	
[
�� 	
HttpGet
��	 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
ApiScopeDelete
��) 7
(
��7 8
int
��8 ;
id
��< >
,
��> ?
int
��@ C
scope
��D I
)
��I J
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
$num
�� 
||
�� 
scope
��  
==
��! #
$num
��$ %
)
��% &
return
��' -
NotFound
��. 6
(
��6 7
)
��7 8
;
��8 9
var
�� 
apiScope
�� 
=
�� 
await
��  !
_apiResourceService
��! 4
.
��4 5
GetApiScopeAsync
��5 E
(
��E F
id
��F H
,
��H I
scope
��J O
)
��O P
;
��P Q
return
�� 
View
�� 
(
�� 
nameof
�� 
(
�� 
ApiScopeDelete
�� -
)
��- .
,
��. /
apiScope
��0 8
)
��8 9
;
��9 :
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
ApiScopeDelete
��) 7
(
��7 8
ApiScopesDto
��8 D
apiScope
��E M
)
��M N
{
�� 	
await
�� !
_apiResourceService
�� %
.
��% &!
DeleteApiScopeAsync
��& 9
(
��9 :
apiScope
��: B
)
��B C
;
��C D!
SuccessNotification
�� 
(
��  

_localizer
��  *
[
��* +
$str
��+ B
]
��B C
,
��C D

_localizer
��E O
[
��O P
$str
��P ^
]
��^ _
)
��_ `
;
��` a
return
�� 
RedirectToAction
�� #
(
��# $
nameof
��$ *
(
��* +
	ApiScopes
��+ 4
)
��4 5
,
��5 6
new
��7 :
{
��; <
Id
��= ?
=
��@ A
apiScope
��B J
.
��J K
ApiResourceId
��K X
}
��Y Z
)
��Z [
;
��[ \
}
�� 	
[
�� 	
HttpGet
��	 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
ApiResources
��) 5
(
��5 6
int
��6 9
?
��9 :
page
��; ?
,
��? @
string
��A G
search
��H N
)
��N O
{
�� 	
ViewBag
�� 
.
�� 
Search
�� 
=
�� 
search
�� #
;
��# $
var
�� 
apiResources
�� 
=
�� 
await
�� $!
_apiResourceService
��% 8
.
��8 9"
GetApiResourcesAsync
��9 M
(
��M N
search
��N T
,
��T U
page
��V Z
??
��[ ]
$num
��^ _
)
��_ `
;
��` a
return
�� 
View
�� 
(
�� 
apiResources
�� $
)
��$ %
;
��% &
}
�� 	
[
�� 	
HttpGet
��	 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
IdentityResources
��) :
(
��: ;
int
��; >
?
��> ?
page
��@ D
,
��D E
string
��F L
search
��M S
)
��S T
{
�� 	
ViewBag
�� 
.
�� 
Search
�� 
=
�� 
search
�� #
;
��# $
var
�� "
identityResourcesDto
�� $
=
��% &
await
��' ,&
_identityResourceService
��- E
.
��E F'
GetIdentityResourcesAsync
��F _
(
��_ `
search
��` f
,
��f g
page
��h l
??
��m o
$num
��p q
)
��q r
;
��r s
return
�� 
View
�� 
(
�� "
identityResourcesDto
�� ,
)
��, -
;
��- .
}
�� 	
[
�� 	
HttpGet
��	 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
ApiSecretDelete
��) 8
(
��8 9
int
��9 <
id
��= ?
)
��? @
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
$num
�� 
)
�� 
return
�� 
NotFound
��  (
(
��( )
)
��) *
;
��* +
var
�� 
clientSecret
�� 
=
�� 
await
�� $!
_apiResourceService
��% 8
.
��8 9
GetApiSecretAsync
��9 J
(
��J K
id
��K M
)
��M N
;
��N O
return
�� 
View
�� 
(
�� 
nameof
�� 
(
�� 
ApiSecretDelete
�� .
)
��. /
,
��/ 0
clientSecret
��1 =
)
��= >
;
��> ?
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
ApiSecretDelete
��) 8
(
��8 9
ApiSecretsDto
��9 F
	apiSecret
��G P
)
��P Q
{
�� 	
await
�� !
_apiResourceService
�� %
.
��% &"
DeleteApiSecretAsync
��& :
(
��: ;
	apiSecret
��; D
)
��D E
;
��E F!
SuccessNotification
�� 
(
��  

_localizer
��  *
[
��* +
$str
��+ C
]
��C D
,
��D E

_localizer
��F P
[
��P Q
$str
��Q _
]
��_ `
)
��` a
;
��a b
return
�� 
RedirectToAction
�� #
(
��# $
nameof
��$ *
(
��* +

ApiSecrets
��+ 5
)
��5 6
,
��6 7
new
��8 ;
{
��< =
Id
��> @
=
��A B
	apiSecret
��C L
.
��L M
ApiResourceId
��M Z
}
��[ \
)
��\ ]
;
��] ^
}
�� 	
[
�� 	
HttpGet
��	 
]
�� 
[
�� 	
Route
��	 
(
�� 
$str
�� &
)
��& '
]
��' (
[
�� 	
Route
��	 
(
�� 
$str
�� /
)
��/ 0
]
��0 1
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
IdentityResource
��) 9
(
��9 :
int
��: =
id
��> @
)
��@ A
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
$num
�� 
)
�� 
{
�� 
var
�� !
identityResourceDto
�� '
=
��( )
new
��* -!
IdentityResourceDto
��. A
(
��A B
)
��B C
;
��C D
return
�� 
View
�� 
(
�� !
identityResourceDto
�� /
)
��/ 0
;
��0 1
}
�� 
var
�� 
identityResource
��  
=
��! "
await
��# (&
_identityResourceService
��) A
.
��A B&
GetIdentityResourceAsync
��B Z
(
��Z [
id
��[ ]
)
��] ^
;
��^ _
return
�� 
View
�� 
(
�� 
identityResource
�� (
)
��( )
;
��) *
}
�� 	
}
�� 
}�� �5
uC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\Controllers\GrantController.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
Controllers& 1
{ 
[ 
	Authorize 
( 
Policy 
= 
AuthorizationConsts +
.+ , 
AdministrationPolicy, @
)@ A
]A B
[ 

TypeFilter 
( 
typeof 
( .
"ControllerExceptionFilterAttribute 9
)9 :
): ;
]; <
public 

class 
GrantController  
:! "
BaseController# 1
{ 
private 
readonly "
IPersistedGrantService /"
_persistedGrantService0 F
;F G
private 
readonly 
IStringLocalizer )
<) *
GrantController* 9
>9 :

_localizer; E
;E F
public 
GrantController 
( "
IPersistedGrantService 5!
persistedGrantService6 K
,K L
ILogger 
< #
ConfigurationController +
>+ ,
logger- 3
,3 4
IStringLocalizer 
< 
GrantController ,
>, -
	localizer. 7
)7 8
:9 :
base; ?
(? @
logger@ F
)F G
{ 	"
_persistedGrantService "
=# $!
persistedGrantService% :
;: ;

_localizer 
= 
	localizer "
;" #
} 	
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
IActionResult '
>' (
PersistedGrants) 8
(8 9
int9 <
?< =
page> B
,B C
stringD J
searchK Q
)Q R
{   	
ViewBag!! 
.!! 
Search!! 
=!! 
search!! #
;!!# $
var"" 
persistedGrants"" 
=""  !
await""" '"
_persistedGrantService""( >
.""> ?$
GetPersitedGrantsByUsers""? W
(""W X
search""X ^
,""^ _
page""` d
??""e g
$num""h i
)""i j
;""j k
return$$ 
View$$ 
($$ 
persistedGrants$$ '
)$$' (
;$$( )
}%% 	
['' 	
HttpGet''	 
]'' 
public(( 
async(( 
Task(( 
<(( 
IActionResult(( '
>((' ( 
PersistedGrantDelete(() =
(((= >
string((> D
id((E G
)((G H
{)) 	
if** 
(** 
string** 
.** 
IsNullOrEmpty** $
(**$ %
id**% '
)**' (
)**( )
return*** 0
NotFound**1 9
(**9 :
)**: ;
;**; <
var,, 
grant,, 
=,, 
await,, "
_persistedGrantService,, 4
.,,4 5!
GetPersitedGrantAsync,,5 J
(,,J K

UrlHelpers,,K U
.,,U V!
QueryStringUnSafeHash,,V k
(,,k l
id,,l n
),,n o
),,o p
;,,p q
if-- 
(-- 
grant-- 
==-- 
null-- 
)-- 
return-- %
NotFound--& .
(--. /
)--/ 0
;--0 1
return// 
View// 
(// 
grant// 
)// 
;// 
}00 	
[33 	
HttpPost33	 
]33 
[44 	$
ValidateAntiForgeryToken44	 !
]44! "
public55 
async55 
Task55 
<55 
IActionResult55 '
>55' ( 
PersistedGrantDelete55) =
(55= >
PersistedGrantDto55> O
grant55P U
)55U V
{66 	
await77 "
_persistedGrantService77 (
.77( )%
DeletePersistedGrantAsync77) B
(77B C
grant77C H
.77H I
Key77I L
)77L M
;77M N
SuccessNotification99 
(99  

_localizer99  *
[99* +
$str99+ H
]99H I
,99I J

_localizer99K U
[99U V
$str99V d
]99d e
)99e f
;99f g
return;; 
RedirectToAction;; #
(;;# $
nameof;;$ *
(;;* +
PersistedGrants;;+ :
);;: ;
);;; <
;;;< =
}<< 	
[>> 	
HttpPost>>	 
]>> 
[?? 	$
ValidateAntiForgeryToken??	 !
]??! "
public@@ 
async@@ 
Task@@ 
<@@ 
IActionResult@@ '
>@@' (!
PersistedGrantsDelete@@) >
(@@> ?
PersistedGrantsDto@@? Q
grants@@R X
)@@X Y
{AA 	
awaitBB "
_persistedGrantServiceBB (
.BB( )&
DeletePersistedGrantsAsyncBB) C
(BBC D
grantsBBD J
.BBJ K
	SubjectIdBBK T
)BBT U
;BBU V
SuccessNotificationDD 
(DD  

_localizerDD  *
[DD* +
$strDD+ I
]DDI J
,DDJ K

_localizerDDL V
[DDV W
$strDDW e
]DDe f
)DDf g
;DDg h
returnFF 
RedirectToActionFF #
(FF# $
nameofFF$ *
(FF* +
PersistedGrantsFF+ :
)FF: ;
)FF; <
;FF< =
}GG 	
[JJ 	
HttpGetJJ	 
]JJ 
publicKK 
asyncKK 
TaskKK 
<KK 
IActionResultKK '
>KK' (
PersistedGrantKK) 7
(KK7 8
stringKK8 >
idKK? A
,KKA B
intKKC F
?KKF G
pageKKH L
)KKL M
{LL 	
varMM 
persistedGrantsMM 
=MM  !
awaitMM" '"
_persistedGrantServiceMM( >
.MM> ?#
GetPersitedGrantsByUserMM? V
(MMV W
idMMW Y
,MMY Z
pageMM[ _
??MM` b
$numMMc d
)MMd e
;MMe f
persistedGrantsNN 
.NN 
	SubjectIdNN %
=NN& '
ConvertNN( /
.NN/ 0
ToInt16NN0 7
(NN7 8
idNN8 :
)NN: ;
;NN; <
returnPP 
ViewPP 
(PP 
persistedGrantsPP '
)PP' (
;PP( )
}QQ 	
}RR 
}SS �
tC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\Controllers\HomeController.cs
	namespace		 	
MAGVA		
 
.		 
Middle		 
.		 
Security		 
.		  
Admin		  %
.		% &
Controllers		& 1
{

 
[ 
	Authorize 
( 
Policy 
= 
AuthorizationConsts +
.+ , 
AdministrationPolicy, @
)@ A
]A B
[ 

TypeFilter 
( 
typeof 
( .
"ControllerExceptionFilterAttribute 9
)9 :
): ;
]; <
public 

class 
HomeController 
:  !
BaseController" 0
{ 
private 
readonly 
ILogger  
<  !#
ConfigurationController! 8
>8 9
_logger: A
;A B
public 
HomeController 
( 
ILogger %
<% &#
ConfigurationController& =
>= >
logger? E
)E F
:G H
baseI M
(M N
loggerN T
)T U
{ 	
_logger 
= 
logger 
; 
} 	
public 
IActionResult 
Index "
(" #
)# $
{ 	
return 
View 
( 
) 
; 
} 	
public 
IActionResult 
Error "
(" #
)# $
{ 	
var 
exceptionFeature  
=! "
HttpContext# .
.. /
Features/ 7
.7 8
Get8 ;
<; <(
IExceptionHandlerPathFeature< X
>X Y
(Y Z
)Z [
;[ \
if   
(   
exceptionFeature    
==  ! #
null  $ (
)  ( )
return  * 0
View  1 5
(  5 6
)  6 7
;  7 8
string## '
routeWhereExceptionOccurred## .
=##/ 0
exceptionFeature##1 A
.##A B
Path##B F
;##F G
	Exception&& !
exceptionThatOccurred&& +
=&&, -
exceptionFeature&&. >
.&&> ?
Error&&? D
;&&D E
_logger)) 
.)) 
LogError)) 
()) !
exceptionThatOccurred)) 2
,))2 3
$"))4 6
Exception at route ))6 I
{))I J'
routeWhereExceptionOccurred))J e
}))e f
"))f g
)))g h
;))h i
return++ 
View++ 
(++ 
)++ 
;++ 
},, 	
}-- 
}.. ��
xC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\Controllers\IdentityController.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
Controllers& 1
{ 
[ 
	Authorize 
( 
Policy 
= 
AuthorizationConsts +
.+ , 
AdministrationPolicy, @
)@ A
]A B
[ 

TypeFilter 
( 
typeof 
( .
"ControllerExceptionFilterAttribute 9
)9 :
): ;
]; <
public 

class 
IdentityController #
:$ %
BaseController& 4
{ 
private 
readonly 
IIdentityService )
_identityService* :
;: ;
private 
readonly 
IStringLocalizer )
<) *
IdentityController* <
>< =

_localizer> H
;H I
public 
IdentityController !
(! "
IIdentityService" 2
identityService3 B
,B C
ILogger 
< #
ConfigurationController +
>+ ,
logger- 3
,3 4
IStringLocalizer 
< 
IdentityController /
>/ 0
	localizer1 :
): ;
:< =
base> B
(B C
loggerC I
)I J
{ 	
_identityService 
= 
identityService .
;. /

_localizer 
= 
	localizer "
;" #
} 	
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
IActionResult '
>' (
Roles) .
(. /
int/ 2
?2 3
page4 8
,8 9
string: @
searchA G
)G H
{   	
ViewBag!! 
.!! 
Search!! 
=!! 
search!! #
;!!# $
var"" 
roles"" 
="" 
await"" 
_identityService"" .
."". /
GetRolesAsync""/ <
(""< =
search""= C
,""C D
page""E I
??""J L
$num""M N
)""N O
;""O P
return$$ 
View$$ 
($$ 
roles$$ 
)$$ 
;$$ 
}%% 	
['' 	
HttpGet''	 
]'' 
[(( 	
Route((	 
((( 
$str(( &
)((& '
]((' (
[)) 	
Route))	 
()) 
$str)) /
)))/ 0
]))0 1
public** 
async** 
Task** 
<** 
IActionResult** '
>**' (
Role**) -
(**- .
int**. 1
id**2 4
)**4 5
{++ 	
if,, 
(,, 
id,, 
==,, 
$num,, 
),, 
return,, 
View,,  $
(,,$ %
new,,% (
RoleDto,,) 0
(,,0 1
),,1 2
),,2 3
;,,3 4
var.. 
role.. 
=.. 
await.. 
_identityService.. -
...- .
GetRoleAsync... :
(..: ;
new..; >
RoleDto..? F
{..G H
Id..I K
=..L M
id..N P
}..Q R
)..R S
;..S T
return00 
View00 
(00 
role00 
)00 
;00 
}11 	
[33 	
HttpPost33	 
]33 
[44 	$
ValidateAntiForgeryToken44	 !
]44! "
public55 
async55 
Task55 
<55 
IActionResult55 '
>55' (
Role55) -
(55- .
RoleDto55. 5
role556 :
)55: ;
{66 	
if77 
(77 
!77 

ModelState77 
.77 
IsValid77 #
)77# $
{88 
return99 
View99 
(99 
role99  
)99  !
;99! "
}:: 
if<< 
(<< 
role<< 
.<< 
Id<< 
==<< 
$num<< 
)<< 
{== 
await>> 
_identityService>> &
.>>& '
CreateRoleAsync>>' 6
(>>6 7
role>>7 ;
)>>; <
;>>< =
}?? 
else@@ 
{AA 
awaitBB 
_identityServiceBB &
.BB& '
UpdateRoleAsyncBB' 6
(BB6 7
roleBB7 ;
)BB; <
;BB< =
}CC 
SuccessNotificationEE 
(EE  
stringEE  &
.EE& '
FormatEE' -
(EE- .

_localizerEE. 8
[EE8 9
$strEE9 L
]EEL M
,EEM N
roleEEO S
.EES T
NameEET X
)EEX Y
,EEY Z

_localizerEE[ e
[EEe f
$strEEf t
]EEt u
)EEu v
;EEv w
returnGG 
RedirectToActionGG #
(GG# $
nameofGG$ *
(GG* +
RolesGG+ 0
)GG0 1
)GG1 2
;GG2 3
}HH 	
[JJ 	
HttpGetJJ	 
]JJ 
publicKK 
asyncKK 
TaskKK 
<KK 
IActionResultKK '
>KK' (
UsersKK) .
(KK. /
intKK/ 2
?KK2 3
pageKK4 8
,KK8 9
stringKK: @
searchKKA G
)KKG H
{LL 	
ViewBagMM 
.MM 
SearchMM 
=MM 
searchMM #
;MM# $
varNN 
usersDtoNN 
=NN 
awaitNN  
_identityServiceNN! 1
.NN1 2
GetUsersAsyncNN2 ?
(NN? @
searchNN@ F
,NNF G
pageNNH L
??NNM O
$numNNP Q
)NNQ R
;NNR S
returnPP 
ViewPP 
(PP 
usersDtoPP  
)PP  !
;PP! "
}QQ 	
[SS 	
HttpPostSS	 
]SS 
[TT 	$
ValidateAntiForgeryTokenTT	 !
]TT! "
publicUU 
asyncUU 
TaskUU 
<UU 
IActionResultUU '
>UU' (
UserProfileUU) 4
(UU4 5
UserDtoUU5 <
userUU= A
)UUA B
{VV 	
ifWW 
(WW 
!WW 

ModelStateWW 
.WW 
IsValidWW #
)WW# $
{XX 
returnYY 
ViewYY 
(YY 
userYY  
)YY  !
;YY! "
}ZZ 
if\\ 
(\\ 
user\\ 
.\\ 
Id\\ 
==\\ 
$num\\ 
)\\ 
{]] 
await^^ 
_identityService^^ &
.^^& '
CreateUserAsync^^' 6
(^^6 7
user^^7 ;
)^^; <
;^^< =
}__ 
else`` 
{aa 
awaitbb 
_identityServicebb &
.bb& '
UpdateUserAsyncbb' 6
(bb6 7
userbb7 ;
)bb; <
;bb< =
}cc 
SuccessNotificationee 
(ee  
stringee  &
.ee& '
Formatee' -
(ee- .

_localizeree. 8
[ee8 9
$stree9 L
]eeL M
,eeM N
usereeO S
.eeS T
UserNameeeT \
)ee\ ]
,ee] ^

_localizeree_ i
[eei j
$streej x
]eex y
)eey z
;eez {
returngg 
RedirectToActiongg #
(gg# $
nameofgg$ *
(gg* +
Usersgg+ 0
)gg0 1
)gg1 2
;gg2 3
}hh 	
[jj 	
HttpGetjj	 
]jj 
publickk 
IActionResultkk 
UserProfilekk (
(kk( )
)kk) *
{ll 	
varmm 
newUsermm 
=mm 
newmm 
UserDtomm %
(mm% &
)mm& '
;mm' (
returnoo 
Viewoo 
(oo 
$stroo %
,oo% &
newUseroo' .
)oo. /
;oo/ 0
}pp 	
[rr 	
HttpGetrr	 
]rr 
[ss 	
Routess	 
(ss 
$strss 2
)ss2 3
]ss3 4
publictt 
asynctt 
Tasktt 
<tt 
IActionResulttt '
>tt' (
UserProfilett) 4
(tt4 5
inttt5 8
idtt9 ;
)tt; <
{uu 	
varvv 
uservv 
=vv 
awaitvv 
_identityServicevv -
.vv- .
GetUserAsyncvv. :
(vv: ;
newvv; >
UserDtovv? F
{vvG H
IdvvI K
=vvL M
idvvN P
}vvQ R
)vvR S
;vvS T
ifww 
(ww 
userww 
==ww 
nullww 
)ww 
returnww $
NotFoundww% -
(ww- .
)ww. /
;ww/ 0
returnyy 
Viewyy 
(yy 
$stryy %
,yy% &
useryy' +
)yy+ ,
;yy, -
}zz 	
[|| 	
HttpGet||	 
]|| 
public}} 
async}} 
Task}} 
<}} 
IActionResult}} '
>}}' (
	UserRoles}}) 2
(}}2 3
int}}3 6
id}}7 9
,}}9 :
int}}; >
?}}> ?
page}}@ D
)}}D E
{~~ 	
if 
( 
id 
== 
$num 
) 
return 
NotFound  (
(( )
)) *
;* +
var
�� 
	userRoles
�� 
=
�� 
await
�� !
_identityService
��" 2
.
��2 3%
BuildUserRolesViewModel
��3 J
(
��J K
id
��K M
,
��M N
page
��O S
)
��S T
;
��T U
return
�� 
View
�� 
(
�� 
	userRoles
�� !
)
��! "
;
��" #
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
��' (
	UserRoles
��) 2
(
��2 3
UserRolesDto
��3 ?
role
��@ D
)
��D E
{
�� 	
await
�� 
_identityService
�� "
.
��" #!
CreateUserRoleAsync
��# 6
(
��6 7
role
��7 ;
)
��; <
;
��< =!
SuccessNotification
�� 
(
��  

_localizer
��  *
[
��* +
$str
��+ B
]
��B C
,
��C D

_localizer
��E O
[
��O P
$str
��P ^
]
��^ _
)
��_ `
;
��` a
return
�� 
RedirectToAction
�� #
(
��# $
nameof
��$ *
(
��* +
	UserRoles
��+ 4
)
��4 5
,
��5 6
new
��7 :
{
��; <
Id
��= ?
=
��@ A
role
��B F
.
��F G
UserId
��G M
}
��N O
)
��O P
;
��P Q
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
��' (
UserRolesDelete
��) 8
(
��8 9
int
��9 <
id
��= ?
,
��? @
int
��A D
roleId
��E K
)
��K L
{
�� 	
await
�� 
_identityService
�� "
.
��" #
ExistsUserAsync
��# 2
(
��2 3
id
��3 5
)
��5 6
;
��6 7
await
�� 
_identityService
�� "
.
��" #
ExistsRoleAsync
��# 2
(
��2 3
roleId
��3 9
)
��9 :
;
��: ;
var
�� 
roles
�� 
=
�� 
await
�� 
_identityService
�� .
.
��. /
GetRolesAsync
��/ <
(
��< =
)
��= >
;
��> ?
var
�� 
rolesDto
�� 
=
�� 
new
�� 
UserRolesDto
�� +
{
�� 
UserId
�� 
=
�� 
id
�� 
,
�� 
	RolesList
�� 
=
�� 
roles
�� !
.
��! "
Select
��" (
(
��( )
x
��) *
=>
��+ -
new
��. 1

SelectItem
��2 <
(
��< =
x
��= >
.
��> ?
Id
��? A
.
��A B
ToString
��B J
(
��J K
)
��K L
,
��L M
x
��N O
.
��O P
Name
��P T
)
��T U
)
��U V
.
��V W
ToList
��W ]
(
��] ^
)
��^ _
,
��_ `
RoleId
�� 
=
�� 
roleId
�� 
}
�� 
;
�� 
return
�� 
View
�� 
(
�� 
rolesDto
��  
)
��  !
;
��! "
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
��' (
UserRolesDelete
��) 8
(
��8 9
UserRolesDto
��9 E
role
��F J
)
��J K
{
�� 	
await
�� 
_identityService
�� "
.
��" #!
DeleteUserRoleAsync
��# 6
(
��6 7
role
��7 ;
)
��; <
;
��< =!
SuccessNotification
�� 
(
��  

_localizer
��  *
[
��* +
$str
��+ B
]
��B C
,
��C D

_localizer
��E O
[
��O P
$str
��P ^
]
��^ _
)
��_ `
;
��` a
return
�� 
RedirectToAction
�� #
(
��# $
nameof
��$ *
(
��* +
	UserRoles
��+ 4
)
��4 5
,
��5 6
new
��7 :
{
��; <
Id
��= ?
=
��@ A
role
��B F
.
��F G
UserId
��G M
}
��N O
)
��O P
;
��P Q
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
��' (

UserClaims
��) 3
(
��3 4
UserClaimsDto
��4 A
claim
��B G
)
��G H
{
�� 	
if
�� 
(
�� 
!
�� 

ModelState
�� 
.
�� 
IsValid
�� #
)
��# $
{
�� 
return
�� 
View
�� 
(
�� 
claim
�� !
)
��! "
;
��" #
}
�� 
await
�� 
_identityService
�� "
.
��" ##
CreateUserClaimsAsync
��# 8
(
��8 9
claim
��9 >
)
��> ?
;
��? @!
SuccessNotification
�� 
(
��  
string
��  &
.
��& '
Format
��' -
(
��- .

_localizer
��. 8
[
��8 9
$str
��9 R
]
��R S
,
��S T
claim
��U Z
.
��Z [
	ClaimType
��[ d
,
��d e
claim
��f k
.
��k l

ClaimValue
��l v
)
��v w
,
��w x

_localizer��y �
[��� �
$str��� �
]��� �
)��� �
;��� �
return
�� 
RedirectToAction
�� #
(
��# $
nameof
��$ *
(
��* +

UserClaims
��+ 5
)
��5 6
,
��6 7
new
��8 ;
{
��< =
Id
��> @
=
��A B
claim
��C H
.
��H I
UserId
��I O
}
��P Q
)
��Q R
;
��R S
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
��' (

UserClaims
��) 3
(
��3 4
int
��4 7
id
��8 :
,
��: ;
int
��< ?
?
��? @
page
��A E
)
��E F
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
$num
�� 
)
�� 
return
�� 
NotFound
��  (
(
��( )
)
��) *
;
��* +
var
�� 
claims
�� 
=
�� 
await
�� 
_identityService
�� /
.
��/ 0 
GetUserClaimsAsync
��0 B
(
��B C
id
��C E
,
��E F
page
��G K
??
��L N
$num
��O P
)
��P Q
;
��Q R
claims
�� 
.
�� 
UserId
�� 
=
�� 
id
�� 
;
�� 
return
�� 
View
�� 
(
�� 
claims
�� 
)
�� 
;
��  
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
��' (
UserClaimsDelete
��) 9
(
��9 :
int
��: =
id
��> @
,
��@ A
int
��B E
claimId
��F M
)
��M N
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
$num
�� 
||
�� 
claimId
�� "
==
��# %
$num
��& '
)
��' (
return
��) /
NotFound
��0 8
(
��8 9
)
��9 :
;
��: ;
var
�� 
claim
�� 
=
�� 
await
�� 
_identityService
�� .
.
��. /
GetUserClaimAsync
��/ @
(
��@ A
id
��A C
,
��C D
claimId
��E L
)
��L M
;
��M N
if
�� 
(
�� 
claim
�� 
==
�� 
null
�� 
)
�� 
return
�� %
NotFound
��& .
(
��. /
)
��/ 0
;
��0 1
return
�� 
View
�� 
(
�� 
claim
�� 
)
�� 
;
�� 
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
��' (
UserClaimsDelete
��) 9
(
��9 :
UserClaimsDto
��: G
claim
��H M
)
��M N
{
�� 	
await
�� 
_identityService
�� "
.
��" ##
DeleteUserClaimsAsync
��# 8
(
��8 9
claim
��9 >
)
��> ?
;
��? @!
SuccessNotification
�� 
(
��  

_localizer
��  *
[
��* +
$str
��+ D
]
��D E
,
��E F

_localizer
��G Q
[
��Q R
$str
��R `
]
��` a
)
��a b
;
��b c
return
�� 
RedirectToAction
�� #
(
��# $
nameof
��$ *
(
��* +

UserClaims
��+ 5
)
��5 6
,
��6 7
new
��8 ;
{
��< =
Id
��> @
=
��A B
claim
��C H
.
��H I
UserId
��I O
}
��P Q
)
��Q R
;
��R S
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
��' (
UserProviders
��) 6
(
��6 7
int
��7 :
id
��; =
)
��= >
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
$num
�� 
)
�� 
return
�� 
NotFound
��  (
(
��( )
)
��) *
;
��* +
var
�� 
	providers
�� 
=
�� 
await
�� !
_identityService
��" 2
.
��2 3#
GetUserProvidersAsync
��3 H
(
��H I
id
��I K
)
��K L
;
��L M
return
�� 
View
�� 
(
�� 
	providers
�� !
)
��! "
;
��" #
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
��' (!
UserProvidersDelete
��) <
(
��< =
int
��= @
id
��A C
,
��C D
string
��E K
providerKey
��L W
)
��W X
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
$num
�� 
||
�� 
string
�� !
.
��! "
IsNullOrEmpty
��" /
(
��/ 0
providerKey
��0 ;
)
��; <
)
��< =
return
��> D
NotFound
��E M
(
��M N
)
��N O
;
��O P
var
�� 
provider
�� 
=
�� 
await
��  
_identityService
��! 1
.
��1 2"
GetUserProviderAsync
��2 F
(
��F G
id
��G I
,
��I J
providerKey
��K V
)
��V W
;
��W X
if
�� 
(
�� 
provider
�� 
==
�� 
null
��  
)
��  !
return
��" (
NotFound
��) 1
(
��1 2
)
��2 3
;
��3 4
return
�� 
View
�� 
(
�� 
provider
��  
)
��  !
;
��! "
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
��' (!
UserProvidersDelete
��) <
(
��< =
UserProviderDto
��= L
provider
��M U
)
��U V
{
�� 	
await
�� 
_identityService
�� "
.
��" #&
DeleteUserProvidersAsync
��# ;
(
��; <
provider
��< D
)
��D E
;
��E F!
SuccessNotification
�� 
(
��  

_localizer
��  *
[
��* +
$str
��+ G
]
��G H
,
��H I

_localizer
��J T
[
��T U
$str
��U c
]
��c d
)
��d e
;
��e f
return
�� 
RedirectToAction
�� #
(
��# $
nameof
��$ *
(
��* +
UserProviders
��+ 8
)
��8 9
,
��9 :
new
��; >
{
��? @
Id
��A C
=
��D E
provider
��F N
.
��N O
UserId
��O U
}
��V W
)
��W X
;
��X Y
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
��' ( 
UserChangePassword
��) ;
(
��; <
int
��< ?
id
��@ B
)
��B C
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
$num
�� 
)
�� 
return
�� 
NotFound
��  (
(
��( )
)
��) *
;
��* +
var
�� 
user
�� 
=
�� 
await
�� 
_identityService
�� -
.
��- .
GetUserAsync
��. :
(
��: ;
new
��; >
UserDto
��? F
{
��G H
Id
��I K
=
��L M
id
��N P
}
��Q R
)
��R S
;
��S T
var
�� 
userDto
�� 
=
�� 
new
�� #
UserChangePasswordDto
�� 3
{
��4 5
UserId
��6 <
=
��= >
id
��? A
,
��A B
UserName
��C K
=
��L M
user
��N R
.
��R S
UserName
��S [
}
��\ ]
;
��] ^
return
�� 
View
�� 
(
�� 
userDto
�� 
)
��  
;
��  !
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' ( 
UserChangePassword
��) ;
(
��; <#
UserChangePasswordDto
��< Q
userPassword
��R ^
)
��^ _
{
�� 	
if
�� 
(
�� 
!
�� 

ModelState
�� 
.
�� 
IsValid
�� #
)
��# $
{
�� 
return
�� 
View
�� 
(
�� 
userPassword
�� (
)
��( )
;
��) *
}
�� 
var
�� 
identityResult
�� 
=
��  
await
��! &
_identityService
��' 7
.
��7 8%
UserChangePasswordAsync
��8 O
(
��O P
userPassword
��P \
)
��\ ]
;
��] ^
if
�� 
(
�� 
!
�� 
identityResult
�� 
.
��  
Errors
��  &
.
��& '
Any
��' *
(
��* +
)
��+ ,
)
��, -
{
�� !
SuccessNotification
�� #
(
��# $

_localizer
��$ .
[
��. /
$str
��/ J
]
��J K
,
��K L

_localizer
��M W
[
��W X
$str
��X f
]
��f g
)
��g h
;
��h i
return
�� 
RedirectToAction
�� '
(
��' (
$str
��( 5
,
��5 6
new
��7 :
{
��; <
Id
��= ?
=
��@ A
userPassword
��B N
.
��N O
UserId
��O U
}
��V W
)
��W X
;
��X Y
}
�� 
foreach
�� 
(
�� 
var
�� 
error
�� 
in
�� !
identityResult
��" 0
.
��0 1
Errors
��1 7
)
��7 8
{
�� 

ModelState
�� 
.
�� 
AddModelError
�� (
(
��( )
string
��) /
.
��/ 0
Empty
��0 5
,
��5 6
error
��7 <
.
��< =
Description
��= H
)
��H I
;
��I J
}
�� 
return
�� 
View
�� 
(
�� 
userPassword
�� $
)
��$ %
;
��% &
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (

RoleClaims
��) 3
(
��3 4
RoleClaimsDto
��4 A
claim
��B G
)
��G H
{
�� 	
if
�� 
(
�� 
!
�� 

ModelState
�� 
.
�� 
IsValid
�� #
)
��# $
{
�� 
return
�� 
View
�� 
(
�� 
claim
�� !
)
��! "
;
��" #
}
�� 
await
�� 
_identityService
�� "
.
��" ##
CreateRoleClaimsAsync
��# 8
(
��8 9
claim
��9 >
)
��> ?
;
��? @!
SuccessNotification
�� 
(
��  
string
��  &
.
��& '
Format
��' -
(
��- .

_localizer
��. 8
[
��8 9
$str
��9 R
]
��R S
,
��S T
claim
��U Z
.
��Z [
	ClaimType
��[ d
,
��d e
claim
��f k
.
��k l

ClaimValue
��l v
)
��v w
,
��w x

_localizer��y �
[��� �
$str��� �
]��� �
)��� �
;��� �
return
�� 
RedirectToAction
�� #
(
��# $
nameof
��$ *
(
��* +

RoleClaims
��+ 5
)
��5 6
,
��6 7
new
��8 ;
{
��< =
Id
��> @
=
��A B
claim
��C H
.
��H I
RoleId
��I O
}
��P Q
)
��Q R
;
��R S
}
�� 	
[
�� 	
HttpGet
��	 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (

RoleClaims
��) 3
(
��3 4
int
��4 7
id
��8 :
,
��: ;
int
��< ?
?
��? @
page
��A E
)
��E F
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
$num
�� 
)
�� 
return
�� 
NotFound
��  (
(
��( )
)
��) *
;
��* +
var
�� 
claims
�� 
=
�� 
await
�� 
_identityService
�� /
.
��/ 0 
GetRoleClaimsAsync
��0 B
(
��B C
id
��C E
,
��E F
page
��G K
??
��L N
$num
��O P
)
��P Q
;
��Q R
claims
�� 
.
�� 
RoleId
�� 
=
�� 
id
�� 
;
�� 
return
�� 
View
�� 
(
�� 
claims
�� 
)
�� 
;
��  
}
�� 	
[
�� 	
HttpGet
��	 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
RoleClaimsDelete
��) 9
(
��9 :
int
��: =
id
��> @
,
��@ A
int
��B E
claimId
��F M
)
��M N
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
$num
�� 
||
�� 
claimId
�� "
==
��# %
$num
��& '
)
��' (
return
��) /
NotFound
��0 8
(
��8 9
)
��9 :
;
��: ;
var
�� 
claim
�� 
=
�� 
await
�� 
_identityService
�� .
.
��. /
GetRoleClaimAsync
��/ @
(
��@ A
id
��A C
,
��C D
claimId
��E L
)
��L M
;
��M N
return
�� 
View
�� 
(
�� 
claim
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
RoleClaimsDelete
��) 9
(
��9 :
RoleClaimsDto
��: G
claim
��H M
)
��M N
{
�� 	
await
�� 
_identityService
�� "
.
��" ##
DeleteRoleClaimsAsync
��# 8
(
��8 9
claim
��9 >
)
��> ?
;
��? @!
SuccessNotification
�� 
(
��  

_localizer
��  *
[
��* +
$str
��+ D
]
��D E
,
��E F

_localizer
��G Q
[
��Q R
$str
��R `
]
��` a
)
��a b
;
��b c
return
�� 
RedirectToAction
�� #
(
��# $
nameof
��$ *
(
��* +

RoleClaims
��+ 5
)
��5 6
,
��6 7
new
��8 ;
{
��< =
Id
��> @
=
��A B
claim
��C H
.
��H I
RoleId
��I O
}
��P Q
)
��Q R
;
��R S
}
�� 	
[
�� 	
HttpGet
��	 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (

RoleDelete
��) 3
(
��3 4
int
��4 7
id
��8 :
)
��: ;
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
$num
�� 
)
�� 
return
�� 
NotFound
��  (
(
��( )
)
��) *
;
��* +
var
�� 
roleDto
�� 
=
�� 
await
�� 
_identityService
��  0
.
��0 1
GetRoleAsync
��1 =
(
��= >
new
��> A
RoleDto
��B I
{
��J K
Id
��L N
=
��O P
id
��Q S
}
��T U
)
��U V
;
��V W
if
�� 
(
�� 
roleDto
�� 
==
�� 
null
�� 
)
��  
return
��! '
NotFound
��( 0
(
��0 1
)
��1 2
;
��2 3
return
�� 
View
�� 
(
�� 
roleDto
�� 
)
��  
;
��  !
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (

RoleDelete
��) 3
(
��3 4
RoleDto
��4 ;
role
��< @
)
��@ A
{
�� 	
await
�� 
_identityService
�� "
.
��" #
DeleteRoleAsync
��# 2
(
��2 3
role
��3 7
)
��7 8
;
��8 9!
SuccessNotification
�� 
(
��  

_localizer
��  *
[
��* +
$str
��+ >
]
��> ?
,
��? @

_localizer
��A K
[
��K L
$str
��L Z
]
��Z [
)
��[ \
;
��\ ]
return
�� 
RedirectToAction
�� #
(
��# $
nameof
��$ *
(
��* +
Roles
��+ 0
)
��0 1
)
��1 2
;
��2 3
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (

UserDelete
��) 3
(
��3 4
UserDto
��4 ;
user
��< @
)
��@ A
{
�� 	
await
�� 
_identityService
�� "
.
��" #
DeleteUserAsync
��# 2
(
��2 3
user
��3 7
)
��7 8
;
��8 9!
SuccessNotification
�� 
(
��  

_localizer
��  *
[
��* +
$str
��+ >
]
��> ?
,
��? @

_localizer
��A K
[
��K L
$str
��L Z
]
��Z [
)
��[ \
;
��\ ]
return
�� 
RedirectToAction
�� #
(
��# $
nameof
��$ *
(
��* +
Users
��+ 0
)
��0 1
)
��1 2
;
��2 3
}
�� 	
[
�� 	
HttpGet
��	 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (

UserDelete
��) 3
(
��3 4
int
��4 7
id
��8 :
)
��: ;
{
�� 	
if
�� 
(
�� 
id
�� 
==
�� 
$num
�� 
)
�� 
return
�� 
NotFound
��  (
(
��( )
)
��) *
;
��* +
var
�� 
user
�� 
=
�� 
await
�� 
_identityService
�� -
.
��- .
GetUserAsync
��. :
(
��: ;
new
��; >
UserDto
��? F
(
��F G
)
��G H
{
��I J
Id
��K M
=
��N O
id
��P R
}
��S T
)
��T U
;
��U V
if
�� 
(
�� 
user
�� 
==
�� 
null
�� 
)
�� 
return
�� $
NotFound
��% -
(
��- .
)
��. /
;
��/ 0
return
�� 
View
�� 
(
�� 
user
�� 
)
�� 
;
�� 
}
�� 	
}
�� 
}�� �
sC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\Controllers\LogController.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
Controllers& 1
{		 
[

 
	Authorize

 
(

 
Policy

 
=

 
AuthorizationConsts

 +
.

+ , 
AdministrationPolicy

, @
)

@ A
]

A B
public 

class 
LogController 
:  
BaseController! /
{ 
private 
readonly 
ILogService $
_logService% 0
;0 1
public 
LogController 
( 
ILogService (

logService) 3
,3 4
ILogger 
< #
ConfigurationController +
>+ ,
logger- 3
)3 4
:5 6
base7 ;
(; <
logger< B
)B C
{ 	
_logService 
= 

logService $
;$ %
} 	
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
IActionResult '
>' (
	ErrorsLog) 2
(2 3
int3 6
?6 7
page8 <
,< =
string> D
searchE K
)K L
{ 	
ViewBag 
. 
Search 
= 
search #
;# $
var 
logs 
= 
await 
_logService (
.( )
GetLogsAsync) 5
(5 6
search6 <
,< =
page> B
??C E
$numF G
)G H
;H I
return 
View 
( 
logs 
) 
; 
} 	
} 
} ��
C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\Data\Migrations\20180809151050_DbInit.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
Data& *
.* +

Migrations+ 5
{ 
public 

partial 
class 
DbInit 
:  !
	Migration" +
{ 
	protected		 
override		 
void		 
Up		  "
(		" #
MigrationBuilder		# 3
migrationBuilder		4 D
)		D E
{

 	
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str $
,$ %
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
int& )
>) *
(* +
nullable+ 3
:3 4
false5 :
): ;
. 

Annotation #
(# $
$str$ G
,G H,
 SqlServerValueGenerationStrategyI i
.i j
IdentityColumnj x
)x y
,y z
Enabled 
= 
table #
.# $
Column$ *
<* +
bool+ /
>/ 0
(0 1
nullable1 9
:9 :
false; @
)@ A
,A B
Name 
= 
table  
.  !
Column! '
<' (
string( .
>. /
(/ 0
	maxLength0 9
:9 :
$num; >
,> ?
nullable@ H
:H I
falseJ O
)O P
,P Q
DisplayName 
=  !
table" '
.' (
Column( .
<. /
string/ 5
>5 6
(6 7
	maxLength7 @
:@ A
$numB E
,E F
nullableG O
:O P
trueQ U
)U V
,V W
Description 
=  !
table" '
.' (
Column( .
<. /
string/ 5
>5 6
(6 7
	maxLength7 @
:@ A
$numB F
,F G
nullableH P
:P Q
trueR V
)V W
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 6
,6 7
x8 9
=>: <
x= >
.> ?
Id? A
)A B
;B C
} 
) 
; 
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str 
,  
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
int& )
>) *
(* +
nullable+ 3
:3 4
false5 :
): ;
.   

Annotation   #
(  # $
$str  $ G
,  G H,
 SqlServerValueGenerationStrategy  I i
.  i j
IdentityColumn  j x
)  x y
,  y z
Enabled!! 
=!! 
table!! #
.!!# $
Column!!$ *
<!!* +
bool!!+ /
>!!/ 0
(!!0 1
nullable!!1 9
:!!9 :
false!!; @
)!!@ A
,!!A B
ClientId"" 
="" 
table"" $
.""$ %
Column""% +
<""+ ,
string"", 2
>""2 3
(""3 4
	maxLength""4 =
:""= >
$num""? B
,""B C
nullable""D L
:""L M
false""N S
)""S T
,""T U
ProtocolType##  
=##! "
table### (
.##( )
Column##) /
<##/ 0
string##0 6
>##6 7
(##7 8
	maxLength##8 A
:##A B
$num##C F
,##F G
nullable##H P
:##P Q
false##R W
)##W X
,##X Y
RequireClientSecret$$ '
=$$( )
table$$* /
.$$/ 0
Column$$0 6
<$$6 7
bool$$7 ;
>$$; <
($$< =
nullable$$= E
:$$E F
false$$G L
)$$L M
,$$M N

ClientName%% 
=%%  
table%%! &
.%%& '
Column%%' -
<%%- .
string%%. 4
>%%4 5
(%%5 6
	maxLength%%6 ?
:%%? @
$num%%A D
,%%D E
nullable%%F N
:%%N O
true%%P T
)%%T U
,%%U V
Description&& 
=&&  !
table&&" '
.&&' (
Column&&( .
<&&. /
string&&/ 5
>&&5 6
(&&6 7
	maxLength&&7 @
:&&@ A
$num&&B F
,&&F G
nullable&&H P
:&&P Q
true&&R V
)&&V W
,&&W X
	ClientUri'' 
='' 
table''  %
.''% &
Column''& ,
<'', -
string''- 3
>''3 4
(''4 5
	maxLength''5 >
:''> ?
$num''@ D
,''D E
nullable''F N
:''N O
true''P T
)''T U
,''U V
LogoUri(( 
=(( 
table(( #
.((# $
Column(($ *
<((* +
string((+ 1
>((1 2
(((2 3
	maxLength((3 <
:((< =
$num((> B
,((B C
nullable((D L
:((L M
true((N R
)((R S
,((S T
RequireConsent)) "
=))# $
table))% *
.))* +
Column))+ 1
<))1 2
bool))2 6
>))6 7
())7 8
nullable))8 @
:))@ A
false))B G
)))G H
,))H I 
AllowRememberConsent** (
=**) *
table**+ 0
.**0 1
Column**1 7
<**7 8
bool**8 <
>**< =
(**= >
nullable**> F
:**F G
false**H M
)**M N
,**N O,
 AlwaysIncludeUserClaimsInIdToken++ 4
=++5 6
table++7 <
.++< =
Column++= C
<++C D
bool++D H
>++H I
(++I J
nullable++J R
:++R S
false++T Y
)++Y Z
,++Z [
RequirePkce,, 
=,,  !
table,," '
.,,' (
Column,,( .
<,,. /
bool,,/ 3
>,,3 4
(,,4 5
nullable,,5 =
:,,= >
false,,? D
),,D E
,,,E F
AllowPlainTextPkce-- &
=--' (
table--) .
.--. /
Column--/ 5
<--5 6
bool--6 :
>--: ;
(--; <
nullable--< D
:--D E
false--F K
)--K L
,--L M'
AllowAccessTokensViaBrowser.. /
=..0 1
table..2 7
...7 8
Column..8 >
<..> ?
bool..? C
>..C D
(..D E
nullable..E M
:..M N
false..O T
)..T U
,..U V!
FrontChannelLogoutUri// )
=//* +
table//, 1
.//1 2
Column//2 8
<//8 9
string//9 ?
>//? @
(//@ A
	maxLength//A J
://J K
$num//L P
,//P Q
nullable//R Z
://Z [
true//\ `
)//` a
,//a b-
!FrontChannelLogoutSessionRequired00 5
=006 7
table008 =
.00= >
Column00> D
<00D E
bool00E I
>00I J
(00J K
nullable00K S
:00S T
false00U Z
)00Z [
,00[ \ 
BackChannelLogoutUri11 (
=11) *
table11+ 0
.110 1
Column111 7
<117 8
string118 >
>11> ?
(11? @
	maxLength11@ I
:11I J
$num11K O
,11O P
nullable11Q Y
:11Y Z
true11[ _
)11_ `
,11` a,
 BackChannelLogoutSessionRequired22 4
=225 6
table227 <
.22< =
Column22= C
<22C D
bool22D H
>22H I
(22I J
nullable22J R
:22R S
false22T Y
)22Y Z
,22Z [
AllowOfflineAccess33 &
=33' (
table33) .
.33. /
Column33/ 5
<335 6
bool336 :
>33: ;
(33; <
nullable33< D
:33D E
false33F K
)33K L
,33L M!
IdentityTokenLifetime44 )
=44* +
table44, 1
.441 2
Column442 8
<448 9
int449 <
>44< =
(44= >
nullable44> F
:44F G
false44H M
)44M N
,44N O
AccessTokenLifetime55 '
=55( )
table55* /
.55/ 0
Column550 6
<556 7
int557 :
>55: ;
(55; <
nullable55< D
:55D E
false55F K
)55K L
,55L M%
AuthorizationCodeLifetime66 -
=66. /
table660 5
.665 6
Column666 <
<66< =
int66= @
>66@ A
(66A B
nullable66B J
:66J K
false66L Q
)66Q R
,66R S
ConsentLifetime77 #
=77$ %
table77& +
.77+ ,
Column77, 2
<772 3
int773 6
>776 7
(777 8
nullable778 @
:77@ A
true77B F
)77F G
,77G H(
AbsoluteRefreshTokenLifetime88 0
=881 2
table883 8
.888 9
Column889 ?
<88? @
int88@ C
>88C D
(88D E
nullable88E M
:88M N
false88O T
)88T U
,88U V'
SlidingRefreshTokenLifetime99 /
=990 1
table992 7
.997 8
Column998 >
<99> ?
int99? B
>99B C
(99C D
nullable99D L
:99L M
false99N S
)99S T
,99T U
RefreshTokenUsage:: %
=::& '
table::( -
.::- .
Column::. 4
<::4 5
int::5 8
>::8 9
(::9 :
nullable::: B
:::B C
false::D I
)::I J
,::J K,
 UpdateAccessTokenClaimsOnRefresh;; 4
=;;5 6
table;;7 <
.;;< =
Column;;= C
<;;C D
bool;;D H
>;;H I
(;;I J
nullable;;J R
:;;R S
false;;T Y
);;Y Z
,;;Z ["
RefreshTokenExpiration<< *
=<<+ ,
table<<- 2
.<<2 3
Column<<3 9
<<<9 :
int<<: =
><<= >
(<<> ?
nullable<<? G
:<<G H
false<<I N
)<<N O
,<<O P
AccessTokenType== #
===$ %
table==& +
.==+ ,
Column==, 2
<==2 3
int==3 6
>==6 7
(==7 8
nullable==8 @
:==@ A
false==B G
)==G H
,==H I
EnableLocalLogin>> $
=>>% &
table>>' ,
.>>, -
Column>>- 3
<>>3 4
bool>>4 8
>>>8 9
(>>9 :
nullable>>: B
:>>B C
false>>D I
)>>I J
,>>J K
IncludeJwtId??  
=??! "
table??# (
.??( )
Column??) /
<??/ 0
bool??0 4
>??4 5
(??5 6
nullable??6 >
:??> ?
false??@ E
)??E F
,??F G"
AlwaysSendClientClaims@@ *
=@@+ ,
table@@- 2
.@@2 3
Column@@3 9
<@@9 :
bool@@: >
>@@> ?
(@@? @
nullable@@@ H
:@@H I
false@@J O
)@@O P
,@@P Q
ClientClaimsPrefixAA &
=AA' (
tableAA) .
.AA. /
ColumnAA/ 5
<AA5 6
stringAA6 <
>AA< =
(AA= >
	maxLengthAA> G
:AAG H
$numAAI L
,AAL M
nullableAAN V
:AAV W
trueAAX \
)AA\ ]
,AA] ^
PairWiseSubjectSaltBB '
=BB( )
tableBB* /
.BB/ 0
ColumnBB0 6
<BB6 7
stringBB7 =
>BB= >
(BB> ?
	maxLengthBB? H
:BBH I
$numBBJ M
,BBM N
nullableBBO W
:BBW X
trueBBY ]
)BB] ^
}CC 
,CC 
constraintsDD 
:DD 
tableDD "
=>DD# %
{EE 
tableFF 
.FF 

PrimaryKeyFF $
(FF$ %
$strFF% 1
,FF1 2
xFF3 4
=>FF5 7
xFF8 9
.FF9 :
IdFF: <
)FF< =
;FF= >
}GG 
)GG 
;GG 
migrationBuilderII 
.II 
CreateTableII (
(II( )
nameJJ 
:JJ 
$strJJ )
,JJ) *
columnsKK 
:KK 
tableKK 
=>KK !
newKK" %
{LL 
IdMM 
=MM 
tableMM 
.MM 
ColumnMM %
<MM% &
intMM& )
>MM) *
(MM* +
nullableMM+ 3
:MM3 4
falseMM5 :
)MM: ;
.NN 

AnnotationNN #
(NN# $
$strNN$ G
,NNG H,
 SqlServerValueGenerationStrategyNNI i
.NNi j
IdentityColumnNNj x
)NNx y
,NNy z
EnabledOO 
=OO 
tableOO #
.OO# $
ColumnOO$ *
<OO* +
boolOO+ /
>OO/ 0
(OO0 1
nullableOO1 9
:OO9 :
falseOO; @
)OO@ A
,OOA B
NamePP 
=PP 
tablePP  
.PP  !
ColumnPP! '
<PP' (
stringPP( .
>PP. /
(PP/ 0
	maxLengthPP0 9
:PP9 :
$numPP; >
,PP> ?
nullablePP@ H
:PPH I
falsePPJ O
)PPO P
,PPP Q
DisplayNameQQ 
=QQ  !
tableQQ" '
.QQ' (
ColumnQQ( .
<QQ. /
stringQQ/ 5
>QQ5 6
(QQ6 7
	maxLengthQQ7 @
:QQ@ A
$numQQB E
,QQE F
nullableQQG O
:QQO P
trueQQQ U
)QQU V
,QQV W
DescriptionRR 
=RR  !
tableRR" '
.RR' (
ColumnRR( .
<RR. /
stringRR/ 5
>RR5 6
(RR6 7
	maxLengthRR7 @
:RR@ A
$numRRB F
,RRF G
nullableRRH P
:RRP Q
trueRRR V
)RRV W
,RRW X
RequiredSS 
=SS 
tableSS $
.SS$ %
ColumnSS% +
<SS+ ,
boolSS, 0
>SS0 1
(SS1 2
nullableSS2 :
:SS: ;
falseSS< A
)SSA B
,SSB C
	EmphasizeTT 
=TT 
tableTT  %
.TT% &
ColumnTT& ,
<TT, -
boolTT- 1
>TT1 2
(TT2 3
nullableTT3 ;
:TT; <
falseTT= B
)TTB C
,TTC D#
ShowInDiscoveryDocumentUU +
=UU, -
tableUU. 3
.UU3 4
ColumnUU4 :
<UU: ;
boolUU; ?
>UU? @
(UU@ A
nullableUUA I
:UUI J
falseUUK P
)UUP Q
}VV 
,VV 
constraintsWW 
:WW 
tableWW "
=>WW# %
{XX 
tableYY 
.YY 

PrimaryKeyYY $
(YY$ %
$strYY% ;
,YY; <
xYY= >
=>YY? A
xYYB C
.YYC D
IdYYD F
)YYF G
;YYG H
}ZZ 
)ZZ 
;ZZ 
migrationBuilder\\ 
.\\ 
CreateTable\\ (
(\\( )
name]] 
:]] 
$str]] 
,]] 
columns^^ 
:^^ 
table^^ 
=>^^ !
new^^" %
{__ 
Id`` 
=`` 
table`` 
.`` 
Column`` %
<``% &
long``& *
>``* +
(``+ ,
nullable``, 4
:``4 5
false``6 ;
)``; <
.aa 

Annotationaa #
(aa# $
$straa$ G
,aaG H,
 SqlServerValueGenerationStrategyaaI i
.aai j
IdentityColumnaaj x
)aax y
,aay z
Messagebb 
=bb 
tablebb #
.bb# $
Columnbb$ *
<bb* +
stringbb+ 1
>bb1 2
(bb2 3
nullablebb3 ;
:bb; <
truebb= A
)bbA B
,bbB C
MessageTemplatecc #
=cc$ %
tablecc& +
.cc+ ,
Columncc, 2
<cc2 3
stringcc3 9
>cc9 :
(cc: ;
nullablecc; C
:ccC D
trueccE I
)ccI J
,ccJ K
Leveldd 
=dd 
tabledd !
.dd! "
Columndd" (
<dd( )
stringdd) /
>dd/ 0
(dd0 1
	maxLengthdd1 :
:dd: ;
$numdd< ?
,dd? @
nullableddA I
:ddI J
trueddK O
)ddO P
,ddP Q
	TimeStampee 
=ee 
tableee  %
.ee% &
Columnee& ,
<ee, -
DateTimeOffsetee- ;
>ee; <
(ee< =
nullableee= E
:eeE F
falseeeG L
)eeL M
,eeM N
	Exceptionff 
=ff 
tableff  %
.ff% &
Columnff& ,
<ff, -
stringff- 3
>ff3 4
(ff4 5
nullableff5 =
:ff= >
trueff? C
)ffC D
,ffD E
LogEventgg 
=gg 
tablegg $
.gg$ %
Columngg% +
<gg+ ,
stringgg, 2
>gg2 3
(gg3 4
nullablegg4 <
:gg< =
truegg> B
)ggB C
,ggC D

Propertieshh 
=hh  
tablehh! &
.hh& '
Columnhh' -
<hh- .
stringhh. 4
>hh4 5
(hh5 6
typehh6 :
:hh: ;
$strhh< A
,hhA B
nullablehhC K
:hhK L
truehhM Q
)hhQ R
}ii 
,ii 
constraintsjj 
:jj 
tablejj "
=>jj# %
{kk 
tablell 
.ll 

PrimaryKeyll $
(ll$ %
$strll% -
,ll- .
xll/ 0
=>ll1 3
xll4 5
.ll5 6
Idll6 8
)ll8 9
;ll9 :
}mm 
)mm 
;mm 
migrationBuilderoo 
.oo 
CreateTableoo (
(oo( )
namepp 
:pp 
$strpp '
,pp' (
columnsqq 
:qq 
tableqq 
=>qq !
newqq" %
{rr 
Keyss 
=ss 
tabless 
.ss  
Columnss  &
<ss& '
stringss' -
>ss- .
(ss. /
	maxLengthss/ 8
:ss8 9
$numss: =
,ss= >
nullabless? G
:ssG H
falsessI N
)ssN O
,ssO P
Typett 
=tt 
tablett  
.tt  !
Columntt! '
<tt' (
stringtt( .
>tt. /
(tt/ 0
	maxLengthtt0 9
:tt9 :
$numtt; =
,tt= >
nullablett? G
:ttG H
falsettI N
)ttN O
,ttO P
	SubjectIduu 
=uu 
tableuu  %
.uu% &
Columnuu& ,
<uu, -
stringuu- 3
>uu3 4
(uu4 5
	maxLengthuu5 >
:uu> ?
$numuu@ C
,uuC D
nullableuuE M
:uuM N
trueuuO S
)uuS T
,uuT U
ClientIdvv 
=vv 
tablevv $
.vv$ %
Columnvv% +
<vv+ ,
stringvv, 2
>vv2 3
(vv3 4
	maxLengthvv4 =
:vv= >
$numvv? B
,vvB C
nullablevvD L
:vvL M
falsevvN S
)vvS T
,vvT U
CreationTimeww  
=ww! "
tableww# (
.ww( )
Columnww) /
<ww/ 0
DateTimeww0 8
>ww8 9
(ww9 :
nullableww: B
:wwB C
falsewwD I
)wwI J
,wwJ K

Expirationxx 
=xx  
tablexx! &
.xx& '
Columnxx' -
<xx- .
DateTimexx. 6
>xx6 7
(xx7 8
nullablexx8 @
:xx@ A
truexxB F
)xxF G
,xxG H
Datayy 
=yy 
tableyy  
.yy  !
Columnyy! '
<yy' (
stringyy( .
>yy. /
(yy/ 0
	maxLengthyy0 9
:yy9 :
$numyy; @
,yy@ A
nullableyyB J
:yyJ K
falseyyL Q
)yyQ R
}zz 
,zz 
constraints{{ 
:{{ 
table{{ "
=>{{# %
{|| 
table}} 
.}} 

PrimaryKey}} $
(}}$ %
$str}}% 9
,}}9 :
x}}; <
=>}}= ?
x}}@ A
.}}A B
Key}}B E
)}}E F
;}}F G
}~~ 
)~~ 
;~~ 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� 
,
�� 
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
int
��& )
>
��) *
(
��* +
nullable
��+ 3
:
��3 4
false
��5 :
)
��: ;
.
�� 

Annotation
�� #
(
��# $
$str
��$ G
,
��G H.
 SqlServerValueGenerationStrategy
��I i
.
��i j
IdentityColumn
��j x
)
��x y
,
��y z
Name
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
	maxLength
��0 9
:
��9 :
$num
��; >
,
��> ?
nullable
��@ H
:
��H I
true
��J N
)
��N O
,
��O P
NormalizedName
�� "
=
��# $
table
��% *
.
��* +
Column
��+ 1
<
��1 2
string
��2 8
>
��8 9
(
��9 :
	maxLength
��: C
:
��C D
$num
��E H
,
��H I
nullable
��J R
:
��R S
true
��T X
)
��X Y
,
��Y Z
ConcurrencyStamp
�� $
=
��% &
table
��' ,
.
��, -
Column
��- 3
<
��3 4
string
��4 :
>
��: ;
(
��; <
nullable
��< D
:
��D E
true
��F J
)
��J K
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% /
,
��/ 0
x
��1 2
=>
��3 5
x
��6 7
.
��7 8
Id
��8 :
)
��: ;
;
��; <
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� 
,
�� 
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
int
��& )
>
��) *
(
��* +
nullable
��+ 3
:
��3 4
false
��5 :
)
��: ;
.
�� 

Annotation
�� #
(
��# $
$str
��$ G
,
��G H.
 SqlServerValueGenerationStrategy
��I i
.
��i j
IdentityColumn
��j x
)
��x y
,
��y z
UserName
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
string
��, 2
>
��2 3
(
��3 4
	maxLength
��4 =
:
��= >
$num
��? B
,
��B C
nullable
��D L
:
��L M
true
��N R
)
��R S
,
��S T 
NormalizedUserName
�� &
=
��' (
table
��) .
.
��. /
Column
��/ 5
<
��5 6
string
��6 <
>
��< =
(
��= >
	maxLength
��> G
:
��G H
$num
��I L
,
��L M
nullable
��N V
:
��V W
true
��X \
)
��\ ]
,
��] ^
Email
�� 
=
�� 
table
�� !
.
��! "
Column
��" (
<
��( )
string
��) /
>
��/ 0
(
��0 1
	maxLength
��1 :
:
��: ;
$num
��< ?
,
��? @
nullable
��A I
:
��I J
true
��K O
)
��O P
,
��P Q
NormalizedEmail
�� #
=
��$ %
table
��& +
.
��+ ,
Column
��, 2
<
��2 3
string
��3 9
>
��9 :
(
��: ;
	maxLength
��; D
:
��D E
$num
��F I
,
��I J
nullable
��K S
:
��S T
true
��U Y
)
��Y Z
,
��Z [
EmailConfirmed
�� "
=
��# $
table
��% *
.
��* +
Column
��+ 1
<
��1 2
bool
��2 6
>
��6 7
(
��7 8
nullable
��8 @
:
��@ A
false
��B G
)
��G H
,
��H I
PasswordHash
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
string
��0 6
>
��6 7
(
��7 8
nullable
��8 @
:
��@ A
true
��B F
)
��F G
,
��G H
SecurityStamp
�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
string
��1 7
>
��7 8
(
��8 9
nullable
��9 A
:
��A B
true
��C G
)
��G H
,
��H I
ConcurrencyStamp
�� $
=
��% &
table
��' ,
.
��, -
Column
��- 3
<
��3 4
string
��4 :
>
��: ;
(
��; <
nullable
��< D
:
��D E
true
��F J
)
��J K
,
��K L
PhoneNumber
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
string
��/ 5
>
��5 6
(
��6 7
nullable
��7 ?
:
��? @
true
��A E
)
��E F
,
��F G"
PhoneNumberConfirmed
�� (
=
��) *
table
��+ 0
.
��0 1
Column
��1 7
<
��7 8
bool
��8 <
>
��< =
(
��= >
nullable
��> F
:
��F G
false
��H M
)
��M N
,
��N O
TwoFactorEnabled
�� $
=
��% &
table
��' ,
.
��, -
Column
��- 3
<
��3 4
bool
��4 8
>
��8 9
(
��9 :
nullable
��: B
:
��B C
false
��D I
)
��I J
,
��J K

LockoutEnd
�� 
=
��  
table
��! &
.
��& '
Column
��' -
<
��- .
DateTimeOffset
��. <
>
��< =
(
��= >
nullable
��> F
:
��F G
true
��H L
)
��L M
,
��M N
LockoutEnabled
�� "
=
��# $
table
��% *
.
��* +
Column
��+ 1
<
��1 2
bool
��2 6
>
��6 7
(
��7 8
nullable
��8 @
:
��@ A
false
��B G
)
��G H
,
��H I
AccessFailedCount
�� %
=
��& '
table
��( -
.
��- .
Column
��. 4
<
��4 5
int
��5 8
>
��8 9
(
��9 :
nullable
��: B
:
��B C
false
��D I
)
��I J
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% /
,
��/ 0
x
��1 2
=>
��3 5
x
��6 7
.
��7 8
Id
��8 :
)
��: ;
;
��; <
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� !
,
��! "
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
int
��& )
>
��) *
(
��* +
nullable
��+ 3
:
��3 4
false
��5 :
)
��: ;
.
�� 

Annotation
�� #
(
��# $
$str
��$ G
,
��G H.
 SqlServerValueGenerationStrategy
��I i
.
��i j
IdentityColumn
��j x
)
��x y
,
��y z
Type
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
	maxLength
��0 9
:
��9 :
$num
��; >
,
��> ?
nullable
��@ H
:
��H I
false
��J O
)
��O P
,
��P Q
ApiResourceId
�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
int
��1 4
>
��4 5
(
��5 6
nullable
��6 >
:
��> ?
false
��@ E
)
��E F
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 3
,
��3 4
x
��5 6
=>
��7 9
x
��: ;
.
��; <
Id
��< >
)
��> ?
;
��? @
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� G
,
��G H
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
ApiResourceId
��' 4
,
��4 5
principalTable
�� &
:
��& '
$str
��( 6
,
��6 7
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� !
,
��! "
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
int
��& )
>
��) *
(
��* +
nullable
��+ 3
:
��3 4
false
��5 :
)
��: ;
.
�� 

Annotation
�� #
(
��# $
$str
��$ G
,
��G H.
 SqlServerValueGenerationStrategy
��I i
.
��i j
IdentityColumn
��j x
)
��x y
,
��y z
Name
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
	maxLength
��0 9
:
��9 :
$num
��; >
,
��> ?
nullable
��@ H
:
��H I
false
��J O
)
��O P
,
��P Q
DisplayName
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
string
��/ 5
>
��5 6
(
��6 7
	maxLength
��7 @
:
��@ A
$num
��B E
,
��E F
nullable
��G O
:
��O P
true
��Q U
)
��U V
,
��V W
Description
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
string
��/ 5
>
��5 6
(
��6 7
	maxLength
��7 @
:
��@ A
$num
��B F
,
��F G
nullable
��H P
:
��P Q
true
��R V
)
��V W
,
��W X
Required
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
bool
��, 0
>
��0 1
(
��1 2
nullable
��2 :
:
��: ;
false
��< A
)
��A B
,
��B C
	Emphasize
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
bool
��- 1
>
��1 2
(
��2 3
nullable
��3 ;
:
��; <
false
��= B
)
��B C
,
��C D%
ShowInDiscoveryDocument
�� +
=
��, -
table
��. 3
.
��3 4
Column
��4 :
<
��: ;
bool
��; ?
>
��? @
(
��@ A
nullable
��A I
:
��I J
false
��K P
)
��P Q
,
��Q R
ApiResourceId
�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
int
��1 4
>
��4 5
(
��5 6
nullable
��6 >
:
��> ?
false
��@ E
)
��E F
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 3
,
��3 4
x
��5 6
=>
��7 9
x
��: ;
.
��; <
Id
��< >
)
��> ?
;
��? @
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� G
,
��G H
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
ApiResourceId
��' 4
,
��4 5
principalTable
�� &
:
��& '
$str
��( 6
,
��6 7
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� "
,
��" #
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 

Expiration
�� 
=
��  
table
��! &
.
��& '
Column
��' -
<
��- .
DateTime
��. 6
>
��6 7
(
��7 8
nullable
��8 @
:
��@ A
true
��B F
)
��F G
,
��G H
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
int
��& )
>
��) *
(
��* +
nullable
��+ 3
:
��3 4
false
��5 :
)
��: ;
.
�� 

Annotation
�� #
(
��# $
$str
��$ G
,
��G H.
 SqlServerValueGenerationStrategy
��I i
.
��i j
IdentityColumn
��j x
)
��x y
,
��y z
Description
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
string
��/ 5
>
��5 6
(
��6 7
	maxLength
��7 @
:
��@ A
$num
��B F
,
��F G
nullable
��H P
:
��P Q
true
��R V
)
��V W
,
��W X
Value
�� 
=
�� 
table
�� !
.
��! "
Column
��" (
<
��( )
string
��) /
>
��/ 0
(
��0 1
	maxLength
��1 :
:
��: ;
$num
��< @
,
��@ A
nullable
��B J
:
��J K
true
��L P
)
��P Q
,
��Q R
Type
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
	maxLength
��0 9
:
��9 :
$num
��; >
,
��> ?
nullable
��@ H
:
��H I
true
��J N
)
��N O
,
��O P
ApiResourceId
�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
int
��1 4
>
��4 5
(
��5 6
nullable
��6 >
:
��> ?
false
��@ E
)
��E F
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 4
,
��4 5
x
��6 7
=>
��8 :
x
��; <
.
��< =
Id
��= ?
)
��? @
;
��@ A
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� H
,
��H I
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
ApiResourceId
��' 4
,
��4 5
principalTable
�� &
:
��& '
$str
��( 6
,
��6 7
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� $
,
��$ %
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
int
��& )
>
��) *
(
��* +
nullable
��+ 3
:
��3 4
false
��5 :
)
��: ;
.
�� 

Annotation
�� #
(
��# $
$str
��$ G
,
��G H.
 SqlServerValueGenerationStrategy
��I i
.
��i j
IdentityColumn
��j x
)
��x y
,
��y z
Type
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
	maxLength
��0 9
:
��9 :
$num
��; >
,
��> ?
nullable
��@ H
:
��H I
false
��J O
)
��O P
,
��P Q
Value
�� 
=
�� 
table
�� !
.
��! "
Column
��" (
<
��( )
string
��) /
>
��/ 0
(
��0 1
	maxLength
��1 :
:
��: ;
$num
��< ?
,
��? @
nullable
��A I
:
��I J
false
��K P
)
��P Q
,
��Q R
ClientId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
int
��, /
>
��/ 0
(
��0 1
nullable
��1 9
:
��9 :
false
��; @
)
��@ A
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 6
,
��6 7
x
��8 9
=>
��: <
x
��= >
.
��> ?
Id
��? A
)
��A B
;
��B C
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� @
,
��@ A
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
ClientId
��' /
,
��/ 0
principalTable
�� &
:
��& '
$str
��( 1
,
��1 2
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� )
,
��) *
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
int
��& )
>
��) *
(
��* +
nullable
��+ 3
:
��3 4
false
��5 :
)
��: ;
.
�� 

Annotation
�� #
(
��# $
$str
��$ G
,
��G H.
 SqlServerValueGenerationStrategy
��I i
.
��i j
IdentityColumn
��j x
)
��x y
,
��y z
Origin
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
string
��* 0
>
��0 1
(
��1 2
	maxLength
��2 ;
:
��; <
$num
��= @
,
��@ A
nullable
��B J
:
��J K
false
��L Q
)
��Q R
,
��R S
ClientId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
int
��, /
>
��/ 0
(
��0 1
nullable
��1 9
:
��9 :
false
��; @
)
��@ A
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% ;
,
��; <
x
��= >
=>
��? A
x
��B C
.
��C D
Id
��D F
)
��F G
;
��G H
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� E
,
��E F
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
ClientId
��' /
,
��/ 0
principalTable
�� &
:
��& '
$str
��( 1
,
��1 2
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� (
,
��( )
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
int
��& )
>
��) *
(
��* +
nullable
��+ 3
:
��3 4
false
��5 :
)
��: ;
.
�� 

Annotation
�� #
(
��# $
$str
��$ G
,
��G H.
 SqlServerValueGenerationStrategy
��I i
.
��i j
IdentityColumn
��j x
)
��x y
,
��y z
	GrantType
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
string
��- 3
>
��3 4
(
��4 5
	maxLength
��5 >
:
��> ?
$num
��@ C
,
��C D
nullable
��E M
:
��M N
false
��O T
)
��T U
,
��U V
ClientId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
int
��, /
>
��/ 0
(
��0 1
nullable
��1 9
:
��9 :
false
��; @
)
��@ A
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% :
,
��: ;
x
��< =
=>
��> @
x
��A B
.
��B C
Id
��C E
)
��E F
;
��F G
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� D
,
��D E
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
ClientId
��' /
,
��/ 0
principalTable
�� &
:
��& '
$str
��( 1
,
��1 2
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� -
,
��- .
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
int
��& )
>
��) *
(
��* +
nullable
��+ 3
:
��3 4
false
��5 :
)
��: ;
.
�� 

Annotation
�� #
(
��# $
$str
��$ G
,
��G H.
 SqlServerValueGenerationStrategy
��I i
.
��i j
IdentityColumn
��j x
)
��x y
,
��y z
Provider
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
string
��, 2
>
��2 3
(
��3 4
	maxLength
��4 =
:
��= >
$num
��? B
,
��B C
nullable
��D L
:
��L M
false
��N S
)
��S T
,
��T U
ClientId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
int
��, /
>
��/ 0
(
��0 1
nullable
��1 9
:
��9 :
false
��; @
)
��@ A
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% ?
,
��? @
x
��A B
=>
��C E
x
��F G
.
��G H
Id
��H J
)
��J K
;
��K L
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� I
,
��I J
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
ClientId
��' /
,
��/ 0
principalTable
�� &
:
��& '
$str
��( 1
,
��1 2
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� 4
,
��4 5
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
int
��& )
>
��) *
(
��* +
nullable
��+ 3
:
��3 4
false
��5 :
)
��: ;
.
�� 

Annotation
�� #
(
��# $
$str
��$ G
,
��G H.
 SqlServerValueGenerationStrategy
��I i
.
��i j
IdentityColumn
��j x
)
��x y
,
��y z#
PostLogoutRedirectUri
�� )
=
��* +
table
��, 1
.
��1 2
Column
��2 8
<
��8 9
string
��9 ?
>
��? @
(
��@ A
	maxLength
��A J
:
��J K
$num
��L P
,
��P Q
nullable
��R Z
:
��Z [
false
��\ a
)
��a b
,
��b c
ClientId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
int
��, /
>
��/ 0
(
��0 1
nullable
��1 9
:
��9 :
false
��; @
)
��@ A
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% F
,
��F G
x
��H I
=>
��J L
x
��M N
.
��N O
Id
��O Q
)
��Q R
;
��R S
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� P
,
��P Q
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
ClientId
��' /
,
��/ 0
principalTable
�� &
:
��& '
$str
��( 1
,
��1 2
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� (
,
��( )
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
int
��& )
>
��) *
(
��* +
nullable
��+ 3
:
��3 4
false
��5 :
)
��: ;
.
�� 

Annotation
�� #
(
��# $
$str
��$ G
,
��G H.
 SqlServerValueGenerationStrategy
��I i
.
��i j
IdentityColumn
��j x
)
��x y
,
��y z
Key
�� 
=
�� 
table
�� 
.
��  
Column
��  &
<
��& '
string
��' -
>
��- .
(
��. /
	maxLength
��/ 8
:
��8 9
$num
��: =
,
��= >
nullable
��? G
:
��G H
false
��I N
)
��N O
,
��O P
Value
�� 
=
�� 
table
�� !
.
��! "
Column
��" (
<
��( )
string
��) /
>
��/ 0
(
��0 1
	maxLength
��1 :
:
��: ;
$num
��< @
,
��@ A
nullable
��B J
:
��J K
false
��L Q
)
��Q R
,
��R S
ClientId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
int
��, /
>
��/ 0
(
��0 1
nullable
��1 9
:
��9 :
false
��; @
)
��@ A
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% :
,
��: ;
x
��< =
=>
��> @
x
��A B
.
��B C
Id
��C E
)
��E F
;
��F G
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� D
,
��D E
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
ClientId
��' /
,
��/ 0
principalTable
�� &
:
��& '
$str
��( 1
,
��1 2
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� *
,
��* +
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
int
��& )
>
��) *
(
��* +
nullable
��+ 3
:
��3 4
false
��5 :
)
��: ;
.
�� 

Annotation
�� #
(
��# $
$str
��$ G
,
��G H.
 SqlServerValueGenerationStrategy
��I i
.
��i j
IdentityColumn
��j x
)
��x y
,
��y z
RedirectUri
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
string
��/ 5
>
��5 6
(
��6 7
	maxLength
��7 @
:
��@ A
$num
��B F
,
��F G
nullable
��H P
:
��P Q
false
��R W
)
��W X
,
��X Y
ClientId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
int
��, /
>
��/ 0
(
��0 1
nullable
��1 9
:
��9 :
false
��; @
)
��@ A
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% <
,
��< =
x
��> ?
=>
��@ B
x
��C D
.
��D E
Id
��E G
)
��G H
;
��H I
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� F
,
��F G
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
ClientId
��' /
,
��/ 0
principalTable
�� &
:
��& '
$str
��( 1
,
��1 2
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� $
,
��$ %
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
int
��& )
>
��) *
(
��* +
nullable
��+ 3
:
��3 4
false
��5 :
)
��: ;
.
�� 

Annotation
�� #
(
��# $
$str
��$ G
,
��G H.
 SqlServerValueGenerationStrategy
��I i
.
��i j
IdentityColumn
��j x
)
��x y
,
��y z
Scope
�� 
=
�� 
table
�� !
.
��! "
Column
��" (
<
��( )
string
��) /
>
��/ 0
(
��0 1
	maxLength
��1 :
:
��: ;
$num
��< ?
,
��? @
nullable
��A I
:
��I J
false
��K P
)
��P Q
,
��Q R
ClientId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
int
��, /
>
��/ 0
(
��0 1
nullable
��1 9
:
��9 :
false
��; @
)
��@ A
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 6
,
��6 7
x
��8 9
=>
��: <
x
��= >
.
��> ?
Id
��? A
)
��A B
;
��B C
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� @
,
��@ A
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
ClientId
��' /
,
��/ 0
principalTable
�� &
:
��& '
$str
��( 1
,
��1 2
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� %
,
��% &
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 

Expiration
�� 
=
��  
table
��! &
.
��& '
Column
��' -
<
��- .
DateTime
��. 6
>
��6 7
(
��7 8
nullable
��8 @
:
��@ A
true
��B F
)
��F G
,
��G H
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
int
��& )
>
��) *
(
��* +
nullable
��+ 3
:
��3 4
false
��5 :
)
��: ;
.
�� 

Annotation
�� #
(
��# $
$str
��$ G
,
��G H.
 SqlServerValueGenerationStrategy
��I i
.
��i j
IdentityColumn
��j x
)
��x y
,
��y z
Description
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
string
��/ 5
>
��5 6
(
��6 7
	maxLength
��7 @
:
��@ A
$num
��B F
,
��F G
nullable
��H P
:
��P Q
true
��R V
)
��V W
,
��W X
Value
�� 
=
�� 
table
�� !
.
��! "
Column
��" (
<
��( )
string
��) /
>
��/ 0
(
��0 1
	maxLength
��1 :
:
��: ;
$num
��< @
,
��@ A
nullable
��B J
:
��J K
false
��L Q
)
��Q R
,
��R S
Type
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
	maxLength
��0 9
:
��9 :
$num
��; >
,
��> ?
nullable
��@ H
:
��H I
true
��J N
)
��N O
,
��O P
ClientId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
int
��, /
>
��/ 0
(
��0 1
nullable
��1 9
:
��9 :
false
��; @
)
��@ A
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 7
,
��7 8
x
��9 :
=>
��; =
x
��> ?
.
��? @
Id
��@ B
)
��B C
;
��C D
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� A
,
��A B
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
ClientId
��' /
,
��/ 0
principalTable
�� &
:
��& '
$str
��( 1
,
��1 2
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� &
,
��& '
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
int
��& )
>
��) *
(
��* +
nullable
��+ 3
:
��3 4
false
��5 :
)
��: ;
.
�� 

Annotation
�� #
(
��# $
$str
��$ G
,
��G H.
 SqlServerValueGenerationStrategy
��I i
.
��i j
IdentityColumn
��j x
)
��x y
,
��y z
Type
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
	maxLength
��0 9
:
��9 :
$num
��; >
,
��> ?
nullable
��@ H
:
��H I
false
��J O
)
��O P
,
��P Q 
IdentityResourceId
�� &
=
��' (
table
��) .
.
��. /
Column
��/ 5
<
��5 6
int
��6 9
>
��9 :
(
��: ;
nullable
��; C
:
��C D
false
��E J
)
��J K
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 8
,
��8 9
x
��: ;
=>
��< >
x
��? @
.
��@ A
Id
��A C
)
��C D
;
��D E
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� V
,
��V W
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& ' 
IdentityResourceId
��' 9
,
��9 :
principalTable
�� &
:
��& '
$str
��( ;
,
��; <
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� "
,
��" #
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
int
��& )
>
��) *
(
��* +
nullable
��+ 3
:
��3 4
false
��5 :
)
��: ;
.
�� 

Annotation
�� #
(
��# $
$str
��$ G
,
��G H.
 SqlServerValueGenerationStrategy
��I i
.
��i j
IdentityColumn
��j x
)
��x y
,
��y z
RoleId
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
int
��* -
>
��- .
(
��. /
nullable
��/ 7
:
��7 8
false
��9 >
)
��> ?
,
��? @
	ClaimType
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
string
��- 3
>
��3 4
(
��4 5
nullable
��5 =
:
��= >
true
��? C
)
��C D
,
��D E

ClaimValue
�� 
=
��  
table
��! &
.
��& '
Column
��' -
<
��- .
string
��. 4
>
��4 5
(
��5 6
nullable
��6 >
:
��> ?
true
��@ D
)
��D E
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 4
,
��4 5
x
��6 7
=>
��8 :
x
��; <
.
��< =
Id
��= ?
)
��? @
;
��@ A
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� :
,
��: ;
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
RoleId
��' -
,
��- .
principalTable
�� &
:
��& '
$str
��( /
,
��/ 0
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� "
,
��" #
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
int
��& )
>
��) *
(
��* +
nullable
��+ 3
:
��3 4
false
��5 :
)
��: ;
.
�� 

Annotation
�� #
(
��# $
$str
��$ G
,
��G H.
 SqlServerValueGenerationStrategy
��I i
.
��i j
IdentityColumn
��j x
)
��x y
,
��y z
UserId
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
int
��* -
>
��- .
(
��. /
nullable
��/ 7
:
��7 8
false
��9 >
)
��> ?
,
��? @
	ClaimType
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
string
��- 3
>
��3 4
(
��4 5
nullable
��5 =
:
��= >
true
��? C
)
��C D
,
��D E

ClaimValue
�� 
=
��  
table
��! &
.
��& '
Column
��' -
<
��- .
string
��. 4
>
��4 5
(
��5 6
nullable
��6 >
:
��> ?
true
��@ D
)
��D E
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 4
,
��4 5
x
��6 7
=>
��8 :
x
��; <
.
��< =
Id
��= ?
)
��? @
;
��@ A
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� :
,
��: ;
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
UserId
��' -
,
��- .
principalTable
�� &
:
��& '
$str
��( /
,
��/ 0
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� "
,
��" #
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
LoginProvider
�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
string
��1 7
>
��7 8
(
��8 9
nullable
��9 A
:
��A B
false
��C H
)
��H I
,
��I J
ProviderKey
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
string
��/ 5
>
��5 6
(
��6 7
nullable
��7 ?
:
��? @
false
��A F
)
��F G
,
��G H!
ProviderDisplayName
�� '
=
��( )
table
��* /
.
��/ 0
Column
��0 6
<
��6 7
string
��7 =
>
��= >
(
��> ?
nullable
��? G
:
��G H
true
��I M
)
��M N
,
��N O
UserId
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
int
��* -
>
��- .
(
��. /
nullable
��/ 7
:
��7 8
false
��9 >
)
��> ?
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 4
,
��4 5
x
��6 7
=>
��8 :
new
��; >
{
��? @
x
��A B
.
��B C
LoginProvider
��C P
,
��P Q
x
��R S
.
��S T
ProviderKey
��T _
}
��` a
)
��a b
;
��b c
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� :
,
��: ;
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
UserId
��' -
,
��- .
principalTable
�� &
:
��& '
$str
��( /
,
��/ 0
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� !
,
��! "
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
UserId
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
int
��* -
>
��- .
(
��. /
nullable
��/ 7
:
��7 8
false
��9 >
)
��> ?
,
��? @
RoleId
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
int
��* -
>
��- .
(
��. /
nullable
��/ 7
:
��7 8
false
��9 >
)
��> ?
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 3
,
��3 4
x
��5 6
=>
��7 9
new
��: =
{
��> ?
x
��@ A
.
��A B
UserId
��B H
,
��H I
x
��J K
.
��K L
RoleId
��L R
}
��S T
)
��T U
;
��U V
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� 9
,
��9 :
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
RoleId
��' -
,
��- .
principalTable
�� &
:
��& '
$str
��( /
,
��/ 0
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� 9
,
��9 :
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
UserId
��' -
,
��- .
principalTable
�� &
:
��& '
$str
��( /
,
��/ 0
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� "
,
��" #
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
UserId
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
int
��* -
>
��- .
(
��. /
nullable
��/ 7
:
��7 8
false
��9 >
)
��> ?
,
��? @
LoginProvider
�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
string
��1 7
>
��7 8
(
��8 9
nullable
��9 A
:
��A B
false
��C H
)
��H I
,
��I J
Name
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
nullable
��0 8
:
��8 9
false
��: ?
)
��? @
,
��@ A
Value
�� 
=
�� 
table
�� !
.
��! "
Column
��" (
<
��( )
string
��) /
>
��/ 0
(
��0 1
nullable
��1 9
:
��9 :
true
��; ?
)
��? @
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 4
,
��4 5
x
��6 7
=>
��8 :
new
��; >
{
��? @
x
��A B
.
��B C
UserId
��C I
,
��I J
x
��K L
.
��L M
LoginProvider
��M Z
,
��Z [
x
��\ ]
.
��] ^
Name
��^ b
}
��c d
)
��d e
;
��e f
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� :
,
��: ;
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
UserId
��' -
,
��- .
principalTable
�� &
:
��& '
$str
��( /
,
��/ 0
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� &
,
��& '
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
int
��& )
>
��) *
(
��* +
nullable
��+ 3
:
��3 4
false
��5 :
)
��: ;
.
�� 

Annotation
�� #
(
��# $
$str
��$ G
,
��G H.
 SqlServerValueGenerationStrategy
��I i
.
��i j
IdentityColumn
��j x
)
��x y
,
��y z
Type
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
	maxLength
��0 9
:
��9 :
$num
��; >
,
��> ?
nullable
��@ H
:
��H I
false
��J O
)
��O P
,
��P Q

ApiScopeId
�� 
=
��  
table
��! &
.
��& '
Column
��' -
<
��- .
int
��. 1
>
��1 2
(
��2 3
nullable
��3 ;
:
��; <
false
��= B
)
��B C
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 8
,
��8 9
x
��: ;
=>
��< >
x
��? @
.
��@ A
Id
��A C
)
��C D
;
��D E
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� F
,
��F G
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '

ApiScopeId
��' 1
,
��1 2
principalTable
�� &
:
��& '
$str
��( 3
,
��3 4
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 2
,
��2 3
table
�� 
:
�� 
$str
�� "
,
��" #
column
�� 
:
�� 
$str
�� '
)
��' (
;
��( )
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� ,
,
��, -
table
�� 
:
�� 
$str
�� %
,
��% &
column
�� 
:
�� 
$str
�� 
,
�� 
unique
�� 
:
�� 
true
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 4
,
��4 5
table
�� 
:
�� 
$str
�� '
,
��' (
column
�� 
:
�� 
$str
�� $
)
��$ %
;
��% &
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 2
,
��2 3
table
�� 
:
�� 
$str
�� "
,
��" #
column
�� 
:
�� 
$str
�� '
)
��' (
;
��( )
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� )
,
��) *
table
�� 
:
�� 
$str
�� "
,
��" #
column
�� 
:
�� 
$str
�� 
,
�� 
unique
�� 
:
�� 
true
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 3
,
��3 4
table
�� 
:
�� 
$str
�� #
,
��# $
column
�� 
:
�� 
$str
�� '
)
��' (
;
��( )
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 0
,
��0 1
table
�� 
:
�� 
$str
�� %
,
��% &
column
�� 
:
�� 
$str
�� "
)
��" #
;
��# $
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 5
,
��5 6
table
�� 
:
�� 
$str
�� *
,
��* +
column
�� 
:
�� 
$str
�� "
)
��" #
;
��# $
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 4
,
��4 5
table
�� 
:
�� 
$str
�� )
,
��) *
column
�� 
:
�� 
$str
�� "
)
��" #
;
��# $
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 9
,
��9 :
table
�� 
:
�� 
$str
�� .
,
��. /
column
�� 
:
�� 
$str
�� "
)
��" #
;
��# $
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� @
,
��@ A
table
�� 
:
�� 
$str
�� 5
,
��5 6
column
�� 
:
�� 
$str
�� "
)
��" #
;
��# $
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 4
,
��4 5
table
�� 
:
�� 
$str
�� )
,
��) *
column
�� 
:
�� 
$str
�� "
)
��" #
;
��# $
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 6
,
��6 7
table
�� 
:
�� 
$str
�� +
,
��+ ,
column
�� 
:
�� 
$str
�� "
)
��" #
;
��# $
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� +
,
��+ ,
table
�� 
:
�� 
$str
��  
,
��  !
column
�� 
:
�� 
$str
�� "
,
��" #
unique
�� 
:
�� 
true
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 0
,
��0 1
table
�� 
:
�� 
$str
�� %
,
��% &
column
�� 
:
�� 
$str
�� "
)
��" #
;
��# $
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 1
,
��1 2
table
�� 
:
�� 
$str
�� &
,
��& '
column
�� 
:
�� 
$str
�� "
)
��" #
;
��# $
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� <
,
��< =
table
�� 
:
�� 
$str
�� '
,
��' (
column
�� 
:
�� 
$str
�� ,
)
��, -
;
��- .
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 1
,
��1 2
table
�� 
:
�� 
$str
�� *
,
��* +
column
�� 
:
�� 
$str
�� 
,
�� 
unique
�� 
:
�� 
true
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� B
,
��B C
table
�� 
:
�� 
$str
�� (
,
��( )
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! ,
,
��, -
$str
��. 8
,
��8 9
$str
��: @
}
��A B
)
��B C
;
��C D
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� ,
,
��, -
table
�� 
:
�� 
$str
�� #
,
��# $
column
�� 
:
�� 
$str
��  
)
��  !
;
��! "
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� %
,
��% &
table
�� 
:
�� 
$str
�� 
,
�� 
column
�� 
:
�� 
$str
�� (
,
��( )
unique
�� 
:
�� 
true
�� 
,
�� 
filter
�� 
:
�� 
$str
�� 6
)
��6 7
;
��7 8
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� ,
,
��, -
table
�� 
:
�� 
$str
�� #
,
��# $
column
�� 
:
�� 
$str
��  
)
��  !
;
��! "
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� ,
,
��, -
table
�� 
:
�� 
$str
�� #
,
��# $
column
�� 
:
�� 
$str
��  
)
��  !
;
��! "
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� +
,
��+ ,
table
�� 
:
�� 
$str
�� "
,
��" #
column
�� 
:
�� 
$str
��  
)
��  !
;
��! "
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� "
,
��" #
table
�� 
:
�� 
$str
�� 
,
�� 
column
�� 
:
�� 
$str
�� )
)
��) *
;
��* +
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� %
,
��% &
table
�� 
:
�� 
$str
�� 
,
�� 
column
�� 
:
�� 
$str
�� ,
,
��, -
unique
�� 
:
�� 
true
�� 
,
�� 
filter
�� 
:
�� 
$str
�� :
)
��: ;
;
��; <
}
�� 	
	protected
�� 
override
�� 
void
�� 
Down
��  $
(
��$ %
MigrationBuilder
��% 5
migrationBuilder
��6 F
)
��F G
{
�� 	
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� !
)
��! "
;
��" #
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� &
)
��& '
;
��' (
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� "
)
��" #
;
��# $
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� $
)
��$ %
;
��% &
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� )
)
��) *
;
��* +
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� (
)
��( )
;
��) *
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� -
)
��- .
;
��. /
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� 4
)
��4 5
;
��5 6
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� (
)
��( )
;
��) *
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� *
)
��* +
;
��+ ,
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� $
)
��$ %
;
��% &
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� %
)
��% &
;
��& '
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� &
)
��& '
;
��' (
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� '
)
��' (
;
��( )
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� "
)
��" #
;
��# $
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� "
)
��" #
;
��# $
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� "
)
��" #
;
��# $
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� !
)
��! "
;
��" #
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� "
)
��" #
;
��# $
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� !
)
��! "
;
��" #
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� 
)
��  
;
��  !
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� )
)
��) *
;
��* +
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� $
)
��$ %
;
��% &
}
�� 	
}
�� 
}�� �S
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\ExceptionHandling\ControllerExceptionFilterAttribute.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
ExceptionHandling& 7
{ 
public 

class .
"ControllerExceptionFilterAttribute 3
:4 5$
ExceptionFilterAttribute6 N
{ 
private 
readonly &
ITempDataDictionaryFactory 3&
_tempDataDictionaryFactory4 N
;N O
private 
readonly "
IModelMetadataProvider /"
_modelMetadataProvider0 F
;F G
public .
"ControllerExceptionFilterAttribute 1
(1 2&
ITempDataDictionaryFactory2 L%
tempDataDictionaryFactoryM f
,f g"
IModelMetadataProvider "!
modelMetadataProvider# 8
)8 9
{ 	&
_tempDataDictionaryFactory &
=' (%
tempDataDictionaryFactory) B
;B C"
_modelMetadataProvider "
=# $!
modelMetadataProvider% :
;: ;
} 	
public 
override 
void 
OnException (
(( )
ExceptionContext) 9
context: A
)A B
{ 	
if 
( 
! 
( 
context 
. 
	Exception #
is$ &*
UserFriendlyErrorPageException' E
)E F
&&G I
!J K
(K L
contextL S
.S T
	ExceptionT ]
is^ `%
UserFriendlyViewExceptiona z
)z {
){ |
return	} �
;
� �
if 
( 
CreateNotification "
(" #
context# *
,* +
out, /
var0 3
tempData4 <
)< =
)= >
return? E
;E F+
HandleUserFriendlyViewException!! +
(!!+ ,
context!!, 3
)!!3 4
;!!4 5
ProcessException"" 
("" 
context"" $
,""$ %
tempData""& .
)"". /
;""/ 0
ClearNotification%% 
(%% 
tempData%% &
)%%& '
;%%' (
}&& 	
private(( 
void(( 
ClearNotification(( &
(((& '
ITempDataDictionary((' :
tempData((; C
)((C D
{)) 	
tempData** 
.** 
Remove** 
(** 
NotificationHelpers** /
.**/ 0
NotificationKey**0 ?
)**? @
;**@ A
}++ 	
private-- 
bool-- 
CreateNotification-- '
(--' (
ExceptionContext--( 8
context--9 @
,--@ A
out--B E
ITempDataDictionary--F Y
tempData--Z b
)--b c
{.. 	
tempData// 
=// &
_tempDataDictionaryFactory// 1
.//1 2
GetTempData//2 =
(//= >
context//> E
.//E F
HttpContext//F Q
)//Q R
;//R S
CreateNotification00 
(00 
NotificationHelpers00 2
.002 3
	AlertType003 <
.00< =
Error00= B
,00B C
tempData00D L
,00L M
context00N U
.00U V
	Exception00V _
.00_ `
Message00` g
)00g h
;00h i
return22 
!22 
tempData22 
.22 
ContainsKey22 (
(22( )
NotificationHelpers22) <
.22< =
NotificationKey22= L
)22L M
;22M N
}33 	
private55 
void55 
ProcessException55 %
(55% &
ExceptionContext55& 6
context557 >
,55> ?
ITempDataDictionary55@ S
tempData55T \
)55\ ]
{66 	
if77 
(77 
!77 
(77 
context77 
.77 
ActionDescriptor77 *
is77+ -&
ControllerActionDescriptor77. H&
controllerActionDescriptor77I c
)77c d
)77d e
return77f l
;77l m
const99 
string99 
errorViewName99 &
=99' (
$str99) 0
;990 1
var;; 
result;; 
=;; 
new;; 

ViewResult;; '
{<< 
ViewName== 
=== 
context== "
.==" #
	Exception==# ,
is==- /%
UserFriendlyViewException==0 I
?>> &
controllerActionDescriptor>> 0
.>>0 1

ActionName>>1 ;
:?? 
errorViewName?? #
,??# $
TempData@@ 
=@@ 
tempData@@ #
,@@# $
ViewDataAA 
=AA 
newAA 
ViewDataDictionaryAA 1
(AA1 2"
_modelMetadataProviderAA2 H
,AAH I
contextAAJ Q
.AAQ R

ModelStateAAR \
)AA\ ]
{BB 
{CC 
$strCC $
,CC$ %
tempDataCC& .
[CC. /
NotificationHelpersCC/ B
.CCB C
NotificationKeyCCC R
]CCR S
}CCS T
,CCT U
}DD 
}EE 
;EE 
ifHH 
(HH 
contextHH 
.HH 
	ExceptionHH !
isHH" $%
UserFriendlyViewExceptionHH% >
	exceptionHH? H
)HHH I
{II 
resultJJ 
.JJ 
ViewDataJJ 
.JJ  
ModelJJ  %
=JJ& '
	exceptionJJ( 1
.JJ1 2
ModelJJ2 7
;JJ7 8
}KK 
contextMM 
.MM 
ExceptionHandledMM $
=MM% &
trueMM' +
;MM+ ,
contextNN 
.NN 
ResultNN 
=NN 
resultNN #
;NN# $
}OO 	
privateQQ 
voidQQ +
HandleUserFriendlyViewExceptionQQ 4
(QQ4 5
ExceptionContextQQ5 E
contextQQF M
)QQM N
{RR 	
ifSS 
(SS 
!SS 
(SS 
contextSS 
.SS 
	ExceptionSS #
isSS$ &%
UserFriendlyViewExceptionSS' @%
userFriendlyViewExceptionSSA Z
)SSZ [
)SS[ \
returnSS] c
;SSc d
ifUU 
(UU %
userFriendlyViewExceptionUU )
.UU) *
ErrorMessagesUU* 7
!=UU8 :
nullUU; ?
&&UU@ B%
userFriendlyViewExceptionUUC \
.UU\ ]
ErrorMessagesUU] j
.UUj k
AnyUUk n
(UUn o
)UUo p
)UUp q
{VV 
foreachWW 
(WW 
varWW 
messageWW $
inWW% '%
userFriendlyViewExceptionWW( A
.WWA B
ErrorMessagesWWB O
)WWO P
{XX 
contextYY 
.YY 

ModelStateYY &
.YY& '
AddModelErrorYY' 4
(YY4 5
messageYY5 <
.YY< =
ErrorKeyYY= E
,YYE F
messageYYG N
.YYN O
ErrorMessageYYO [
)YY[ \
;YY\ ]
}ZZ 
}[[ 
else\\ 
{]] 
context^^ 
.^^ 

ModelState^^ "
.^^" #
AddModelError^^# 0
(^^0 1%
userFriendlyViewException^^1 J
.^^J K
ErrorKey^^K S
,^^S T
context^^U \
.^^\ ]
	Exception^^] f
.^^f g
Message^^g n
)^^n o
;^^o p
}__ 
}`` 	
	protectedbb 
voidbb 
CreateNotificationbb )
(bb) *
NotificationHelpersbb* =
.bb= >
	AlertTypebb> G
typebbH L
,bbL M
ITempDataDictionarybbN a
tempDatabbb j
,bbj k
stringbbl r
messagebbs z
,bbz {
string	bb| �
title
bb� �
=
bb� �
$str
bb� �
)
bb� �
{cc 	
vardd 
toastdd 
=dd 
newdd 
NotificationHelpersdd /
.dd/ 0
Alertdd0 5
{ee 
Typeff 
=ff 
typeff 
,ff 
Messagegg 
=gg 
messagegg !
,gg! "
Titlehh 
=hh 
titlehh 
}ii 
;ii 
varkk 
alertskk 
=kk 
newkk 
Listkk !
<kk! "
NotificationHelperskk" 5
.kk5 6
Alertkk6 ;
>kk; <
(kk< =
)kk= >
;kk> ?
ifmm 
(mm 
tempDatamm 
.mm 
ContainsKeymm $
(mm$ %
NotificationHelpersmm% 8
.mm8 9
NotificationKeymm9 H
)mmH I
)mmI J
{nn 
alertsoo 
=oo 
JsonConvertoo $
.oo$ %
DeserializeObjectoo% 6
<oo6 7
Listoo7 ;
<oo; <
NotificationHelpersoo< O
.ooO P
AlertooP U
>ooU V
>ooV W
(ooW X
tempDataooX `
[oo` a
NotificationHelpersooa t
.oot u
NotificationKey	oou �
]
oo� �
.
oo� �
ToString
oo� �
(
oo� �
)
oo� �
)
oo� �
;
oo� �
tempDatapp 
.pp 
Removepp 
(pp  
NotificationHelperspp  3
.pp3 4
NotificationKeypp4 C
)ppC D
;ppD E
}qq 
alertsss 
.ss 
Addss 
(ss 
toastss 
)ss 
;ss 
varuu 
settingsuu 
=uu 
newuu "
JsonSerializerSettingsuu 5
{vv 
TypeNameHandlingww  
=ww! "
TypeNameHandlingww# 3
.ww3 4
Allww4 7
}xx 
;xx 
varzz 
	alertJsonzz 
=zz 
JsonConvertzz '
.zz' (
SerializeObjectzz( 7
(zz7 8
alertszz8 >
,zz> ?
settingszz@ H
)zzH I
;zzI J
tempData|| 
.|| 
Add|| 
(|| 
NotificationHelpers|| ,
.||, -
NotificationKey||- <
,||< =
	alertJson||> G
)||G H
;||H I
}}} 	
}~~ 
} �

qC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\Helpers\DateTimeHelpers.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
Helpers& -
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
} �X
tC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\Helpers\DbMigrationHelpers.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
Helpers& -
{ 
public 

static 
class 
DbMigrationHelpers *
{ 
public 
static 
async 
Task  
EnsureSeedData! /
(/ 0
IWebHost0 8
host9 =
)= >
{ 	
using 
( 
var 
serviceScope #
=$ %
host& *
.* +
Services+ 3
.3 4
CreateScope4 ?
(? @
)@ A
)A B
{ 
var 
services 
= 
serviceScope +
.+ ,
ServiceProvider, ;
;; <
await 
EnsureSeedData $
($ %
services% -
)- .
;. /
} 
} 	
public!! 
static!! 
async!! 
Task!!  
EnsureSeedData!!! /
(!!/ 0
IServiceProvider!!0 @
serviceProvider!!A P
)!!P Q
{"" 	
using## 
(## 
var## 
scope## 
=## 
serviceProvider## .
.##. /
GetRequiredService##/ A
<##A B 
IServiceScopeFactory##B V
>##V W
(##W X
)##X Y
.##Y Z
CreateScope##Z e
(##e f
)##f g
)##g h
{$$ 
var%% 
context%% 
=%% 
scope%% #
.%%# $
ServiceProvider%%$ 3
.%%3 4
GetRequiredService%%4 F
<%%F G
AdminDbContext%%G U
>%%U V
(%%V W
)%%W X
;%%X Y
var&& 
userManager&& 
=&&  !
scope&&" '
.&&' (
ServiceProvider&&( 7
.&&7 8
GetRequiredService&&8 J
<&&J K
UserManager&&K V
<&&V W
UserIdentity&&W c
>&&c d
>&&d e
(&&e f
)&&f g
;&&g h
var'' 
roleManager'' 
=''  !
scope''" '
.''' (
ServiceProvider''( 7
.''7 8
GetRequiredService''8 J
<''J K
RoleManager''K V
<''V W
UserIdentityRole''W g
>''g h
>''h i
(''i j
)''j k
;''k l
context)) 
.)) 
Database))  
.))  !
Migrate))! (
())( )
)))) *
;))* +
await** (
EnsureSeedIdentityServerData** 2
(**2 3
context**3 :
)**: ;
;**; <
await++ "
EnsureSeedIdentityData++ ,
(++, -
userManager++- 8
,++8 9
roleManager++: E
)++E F
;++F G
},, 
}-- 	
private// 
static// 
async// 
Task// !"
EnsureSeedIdentityData//" 8
(//8 9
UserManager//9 D
<//D E
UserIdentity//E Q
>//Q R
userManager//S ^
,//^ _
RoleManager00 
<00 
UserIdentityRole00 (
>00( )
roleManager00* 5
)005 6
{11 	
if44 
(44 
!44 
await44 
roleManager44 "
.44" #
RoleExistsAsync44# 2
(442 3
AuthorizationConsts443 F
.44F G
AdministrationRole44G Y
)44Y Z
)44Z [
{55 
var66 
role66 
=66 
new66 
UserIdentityRole66 /
{660 1
Name662 6
=667 8
AuthorizationConsts669 L
.66L M
AdministrationRole66M _
}66` a
;66a b
await88 
roleManager88 !
.88! "
CreateAsync88" -
(88- .
role88. 2
)882 3
;883 4
}99 
if;; 
(;; 
await;; 
userManager;; !
.;;! "
FindByNameAsync;;" 1
(;;1 2
Users;;2 7
.;;7 8
AdminUserName;;8 E
);;E F
==;;G I
null;;J N
);;N O
{<< 
var== 
user== 
=== 
new== 
UserIdentity== +
{>> 
UserName?? 
=?? 
Users?? $
.??$ %
AdminUserName??% 2
,??2 3
Email@@ 
=@@ 
Users@@ !
.@@! "

AdminEmail@@" ,
,@@, -
EmailConfirmedAA "
=AA# $
trueAA% )
}BB 
;BB 
varDD 
resultDD 
=DD 
awaitDD "
userManagerDD# .
.DD. /
CreateAsyncDD/ :
(DD: ;
userDD; ?
,DD? @
UsersDDA F
.DDF G
AdminPasswordDDG T
)DDT U
;DDU V
ifFF 
(FF 
resultFF 
.FF 
	SucceededFF $
)FF$ %
{GG 
awaitHH 
userManagerHH %
.HH% &
AddToRoleAsyncHH& 4
(HH4 5
userHH5 9
,HH9 :
AuthorizationConstsHH; N
.HHN O
AdministrationRoleHHO a
)HHa b
;HHb c
}II 
}JJ 
stringNN 
consumidorRoleNN !
=NN" #
$strNN$ 4
;NN4 5
ifOO 
(OO 
!OO 
awaitOO 
roleManagerOO "
.OO" #
RoleExistsAsyncOO# 2
(OO2 3
consumidorRoleOO3 A
)OOA B
)OOB C
{PP 
varQQ 
roleQQ 
=QQ 
newQQ 
UserIdentityRoleQQ /
{QQ0 1
NameQQ2 6
=QQ7 8
consumidorRoleQQ9 G
}QQH I
;QQI J
awaitSS 
roleManagerSS !
.SS! "
CreateAsyncSS" -
(SS- .
roleSS. 2
)SS2 3
;SS3 4
}TT 
forXX 
(XX 
intXX 
iXX 
=XX 
$numXX 
;XX 
iXX 
<XX 
$numXX  "
;XX" #
iXX$ %
++XX% '
)XX' (
{YY 
stringZZ 

consumidorZZ !
=ZZ" #
$"ZZ$ &

consumidorZZ& 0
{ZZ0 1
iZZ1 2
+ZZ3 4
$numZZ5 6
}ZZ6 7
"ZZ7 8
;ZZ8 9
string[[ 
email[[ 
=[[ 
$"[[ !
{[[! "

consumidor[[" ,
}[[, -

@email.com[[- 7
"[[7 8
;[[8 9
if]] 
(]] 
await]] 
userManager]] %
.]]% &
FindByNameAsync]]& 5
(]]5 6

consumidor]]6 @
)]]@ A
==]]B D
null]]E I
)]]I J
{^^ 
var__ 
user__ 
=__ 
new__ "
UserIdentity__# /
{`` 
UserNameaa  
=aa! "

consumidoraa# -
,aa- .
Emailbb 
=bb 
emailbb  %
,bb% &
EmailConfirmedcc &
=cc' (
truecc) -
}dd 
;dd 
varff 
resultff 
=ff  
awaitff! &
userManagerff' 2
.ff2 3
CreateAsyncff3 >
(ff> ?
userff? C
,ffC D
$strffE R
)ffR S
;ffS T
ifhh 
(hh 
resulthh 
.hh 
	Succeededhh (
)hh( )
{ii 
awaitjj 
userManagerjj )
.jj) *
AddToRoleAsyncjj* 8
(jj8 9
userjj9 =
,jj= >
consumidorRolejj? M
)jjM N
;jjN O
}kk 
}ll 
}mm 
}pp 	
privaterr 
staticrr 
asyncrr 
Taskrr !(
EnsureSeedIdentityServerDatarr" >
(rr> ?
AdminDbContextrr? M
contextrrN U
)rrU V
{ss 	
iftt 
(tt 
!tt 
contexttt 
.tt 
Clientstt  
.tt  !
Anytt! $
(tt$ %
)tt% &
)tt& '
{uu 
foreachvv 
(vv 
varvv 
clientvv #
invv$ &
Clientsvv' .
.vv. /
GetAdminClientvv/ =
(vv= >
)vv> ?
.vv? @
ToListvv@ F
(vvF G
)vvG H
)vvH I
{ww 
awaitxx 
contextxx !
.xx! "
Clientsxx" )
.xx) *
AddAsyncxx* 2
(xx2 3
clientxx3 9
.xx9 :
ToEntityxx: B
(xxB C
)xxC D
)xxD E
;xxE F
}yy 
await{{ 
context{{ 
.{{ 
SaveChangesAsync{{ .
({{. /
){{/ 0
;{{0 1
}|| 
if~~ 
(~~ 
!~~ 
context~~ 
.~~ 
IdentityResources~~ *
.~~* +
Any~~+ .
(~~. /
)~~/ 0
)~~0 1
{ 
var
�� 
identityResources
�� %
=
��& '
ClientResources
��( 7
.
��7 8"
GetIdentityResources
��8 L
(
��L M
)
��M N
.
��N O
ToList
��O U
(
��U V
)
��V W
;
��W X
foreach
�� 
(
�� 
var
�� 
resource
�� %
in
��& (
identityResources
��) :
)
��: ;
{
�� 
await
�� 
context
�� !
.
��! "
IdentityResources
��" 3
.
��3 4
AddAsync
��4 <
(
��< =
resource
��= E
.
��E F
ToEntity
��F N
(
��N O
)
��O P
)
��P Q
;
��Q R
}
�� 
await
�� 
context
�� 
.
�� 
SaveChangesAsync
�� .
(
��. /
)
��/ 0
;
��0 1
}
�� 
if
�� 
(
�� 
!
�� 
context
�� 
.
�� 
ApiResources
�� %
.
��% &
Any
��& )
(
��) *
)
��* +
)
��+ ,
{
�� 
foreach
�� 
(
�� 
var
�� 
resource
�� %
in
��& (
ClientResources
��) 8
.
��8 9
GetApiResources
��9 H
(
��H I
)
��I J
.
��J K
ToList
��K Q
(
��Q R
)
��R S
)
��S T
{
�� 
await
�� 
context
�� !
.
��! "
ApiResources
��" .
.
��. /
AddAsync
��/ 7
(
��7 8
resource
��8 @
.
��@ A
ToEntity
��A I
(
��I J
)
��J K
)
��K L
;
��L M
}
�� 
await
�� 
context
�� 
.
�� 
SaveChangesAsync
�� .
(
��. /
)
��/ 0
;
��0 1
}
�� 
}
�� 	
}
�� 
}�� �
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\Helpers\Identity\IdentityErrorMessages.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
Helpers& -
.- .
Identity. 6
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

uC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\Helpers\NotificationHelpers.cs
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

class 
NotificationHelpers $
{ 
public 
const 
string 
NotificationKey +
=, -
$str. P
;P Q
public 
class 
Alert 
{ 	
public		 
	AlertType		 
Type		 !
{		" #
get		$ '
;		' (
set		) ,
;		, -
}		. /
public

 
string

 
Message

 !
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
string 
Title 
{  !
get" %
;% &
set' *
;* +
}, -
} 	
public 
enum 
	AlertType 
{ 	
Info 
, 
Success 
, 
Warning 
, 
Error 
} 	
} 
} ��
pC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\Helpers\StartupHelpers.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
Helpers& -
{ 
public$$ 

static$$ 
class$$ 
StartupHelpers$$ &
{%% 
public&& 
static&& 
void&& 
RegisterDbContexts&& -
(&&- .
this&&. 2
IServiceCollection&&3 E
services&&F N
,&&N O
IConfigurationRoot&&P b
configuration&&c p
)&&p q
{'' 	
var(( 
migrationsAssembly(( "
=((# $
typeof((% +
(((+ ,
Startup((, 3
)((3 4
.((4 5
GetTypeInfo((5 @
(((@ A
)((A B
.((B C
Assembly((C K
.((K L
GetName((L S
(((S T
)((T U
.((U V
Name((V Z
;((Z [
var** #
operationalStoreOptions** '
=**( )
new*** -#
OperationalStoreOptions**. E
(**E F
)**F G
;**G H
services++ 
.++ 
AddSingleton++ !
(++! "#
operationalStoreOptions++" 9
)++9 :
;++: ;
var-- 
storeOptions-- 
=-- 
new-- "%
ConfigurationStoreOptions--# <
(--< =
)--= >
;--> ?
services.. 
... 
AddSingleton.. !
(..! "
storeOptions.." .
)... /
;../ 0
services00 
.00 
AddDbContext00 !
<00! "
AdminDbContext00" 0
>000 1
(001 2
options002 9
=>00: <
options00= D
.00D E
UseSqlServer00E Q
(00Q R
configuration00R _
.00_ `
GetConnectionString00` s
(00s t 
ConfigurationConsts	00t �
.
00� �&
AdminConnectionStringKey
00� �
)
00� �
,
00� �

optionsSql
00� �
=>
00� �

optionsSql
00� �
.
00� � 
MigrationsAssembly
00� �
(
00� � 
migrationsAssembly
00� �
)
00� �
)
00� �
)
00� �
;
00� �
}11 	
public33 
static33 
void33 %
RegisterDbContextsStaging33 4
(334 5
this335 9
IServiceCollection33: L
services33M U
)33U V
{44 	
var55 
databaseName55 
=55 
Guid55 #
.55# $
NewGuid55$ +
(55+ ,
)55, -
.55- .
ToString55. 6
(556 7
)557 8
;558 9
var77 #
operationalStoreOptions77 '
=77( )
new77* -#
OperationalStoreOptions77. E
(77E F
)77F G
;77G H
services88 
.88 
AddSingleton88 !
(88! "#
operationalStoreOptions88" 9
)889 :
;88: ;
var:: 
storeOptions:: 
=:: 
new:: "%
ConfigurationStoreOptions::# <
(::< =
)::= >
;::> ?
services;; 
.;; 
AddSingleton;; !
(;;! "
storeOptions;;" .
);;. /
;;;/ 0
services== 
.== 
AddDbContext== !
<==! "
AdminDbContext==" 0
>==0 1
(==1 2
optionsBuilder==2 @
=>==A C
optionsBuilder==D R
.==R S
UseInMemoryDatabase==S f
(==f g
databaseName==g s
)==s t
)==t u
;==u v
}>> 	
public@@ 
static@@ 
void@@ 
UseSecurityHeaders@@ -
(@@- .
this@@. 2
IApplicationBuilder@@3 F
app@@G J
)@@J K
{AA 	
appBB 
.BB 
UseForwardedHeadersBB #
(BB# $
newBB$ '#
ForwardedHeadersOptionsBB( ?
(BB? @
)BB@ A
{CC 
ForwardedHeadersDD  
=DD! "
ForwardedHeadersDD# 3
.DD3 4
XForwardedForDD4 A
|DDB C
ForwardedHeadersDDD T
.DDT U
XForwardedProtoDDU d
}EE 
)EE 
;EE 
appFF 
.FF 
UseHstsFF 
(FF 
optionsFF 
=>FF  "
optionsFF# *
.FF* +
MaxAgeFF+ 1
(FF1 2
daysFF2 6
:FF6 7
$numFF8 ;
)FF; <
)FF< =
;FF= >
appGG 
.GG 
UseXXssProtectionGG !
(GG! "
optionsGG" )
=>GG* ,
optionsGG- 4
.GG4 5 
EnabledWithBlockModeGG5 I
(GGI J
)GGJ K
)GGK L
;GGL M
appHH 
.HH "
UseXContentTypeOptionsHH &
(HH& '
)HH' (
;HH( )
appII 
.II 
UseXfoII 
(II 
optionsII 
=>II !
optionsII" )
.II) *

SameOriginII* 4
(II4 5
)II5 6
)II6 7
;II7 8
appJJ 
.JJ 
UseReferrerPolicyJJ !
(JJ! "
optionsJJ" )
=>JJ* ,
optionsJJ- 4
.JJ4 5

NoReferrerJJ5 ?
(JJ? @
)JJ@ A
)JJA B
;JJB C
varKK 
allowCspUrlsKK 
=KK 
newKK "
ListKK# '
<KK' (
stringKK( .
>KK. /
{LL 
$strMM /
,MM/ 0
$strNN ,
}OO 
;OO 
appQQ 
.QQ 
UseCspQQ 
(QQ 
optionsQQ 
=>QQ !
{RR 
optionsSS 
.SS 
FontSourcesSS #
(SS# $
configurationSS$ 1
=>SS2 4
{TT 
configurationUU !
.UU! "
SelfSrcUU" )
=UU* +
trueUU, 0
;UU0 1
configurationVV !
.VV! "
CustomSourcesVV" /
=VV0 1
allowCspUrlsVV2 >
;VV> ?
}WW 
)WW 
;WW 
optionsZZ 
.ZZ 
ScriptSourcesZZ %
(ZZ% &
configurationZZ& 3
=>ZZ4 6
{[[ 
configuration\\ !
.\\! "
SelfSrc\\" )
=\\* +
true\\, 0
;\\0 1
configuration]] !
.]]! "
UnsafeInlineSrc]]" 1
=]]2 3
true]]4 8
;]]8 9
configuration^^ !
.^^! "
UnsafeEvalSrc^^" /
=^^0 1
true^^2 6
;^^6 7
}__ 
)__ 
;__ 
optionsaa 
.aa 
StyleSourcesaa $
(aa$ %
configurationaa% 2
=>aa3 5
{bb 
configurationcc !
.cc! "
SelfSrccc" )
=cc* +
truecc, 0
;cc0 1
configurationdd !
.dd! "
CustomSourcesdd" /
=dd0 1
allowCspUrlsdd2 >
;dd> ?
configurationee !
.ee! "
UnsafeInlineSrcee" 1
=ee2 3
trueee4 8
;ee8 9
}ff 
)ff 
;ff 
}gg 
)gg 
;gg 
}hh 	
publicjj 
staticjj 
voidjj %
ConfigureAuthentificationjj 4
(jj4 5
thisjj5 9
IApplicationBuilderjj: M
appjjN Q
,jjQ R
IHostingEnvironmentjjS f
envjjg j
)jjj k
{kk 	
appll 
.ll 
UseAuthenticationll !
(ll! "
)ll" #
;ll# $
ifnn 
(nn 
envnn 
.nn 
	IsStagingnn 
(nn 
)nn 
)nn  
{oo 
apppp 
.pp 
UseMiddlewarepp !
<pp! ".
"AuthenticatedTestRequestMiddlewarepp" D
>ppD E
(ppE F
)ppF G
;ppG H
}qq 
}rr 	
publictt 
statictt 
voidtt !
ConfigureLocalizationtt 0
(tt0 1
thistt1 5
IApplicationBuildertt6 I
appttJ M
)ttM N
{uu 	
varvv 
optionsvv 
=vv 
appvv 
.vv 
ApplicationServicesvv 1
.vv1 2

GetServicevv2 <
<vv< =
IOptionsvv= E
<vvE F&
RequestLocalizationOptionsvvF `
>vv` a
>vva b
(vvb c
)vvc d
;vvd e
appww 
.ww "
UseRequestLocalizationww &
(ww& '
optionsww' .
.ww. /
Valueww/ 4
)ww4 5
;ww5 6
}xx 	
publiczz 
staticzz 
voidzz 

AddLoggingzz %
(zz% &
thiszz& *
IApplicationBuilderzz+ >
appzz? B
,zzB C
ILoggerFactoryzzD R
loggerFactoryzzS `
,zz` a
IConfigurationzzb p
configurationzzq ~
)zz~ 
{{{ 	
}
�� 	
public
�� 
static
�� 
void
�� 
AddDbContexts
�� (
(
��( )
this
��) - 
IServiceCollection
��. @
services
��A I
,
��I J!
IHostingEnvironment
��K ^ 
hostingEnvironment
��_ q
,
��q r!
IConfigurationRoot��s �
configuration��� �
)��� �
{
�� 	
if
�� 
(
��  
hostingEnvironment
�� "
.
��" #
	IsStaging
��# ,
(
��, -
)
��- .
)
��. /
{
�� 
services
�� 
.
�� '
RegisterDbContextsStaging
�� 2
(
��2 3
)
��3 4
;
��4 5
}
�� 
else
�� 
{
�� 
services
�� 
.
��  
RegisterDbContexts
�� +
(
��+ ,
configuration
��, 9
)
��9 :
;
��: ;
}
�� 
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
��! "!
AuthorizationConsts
��" 5
.
��5 6"
AdministrationPolicy
��6 J
,
��J K
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
��0 1!
AuthorizationConsts
��1 D
.
��D E 
AdministrationRole
��E W
)
��W X
)
��X Y
;
��Y Z
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
�� 
AddServices
�� &
(
��& '
this
��' + 
IServiceCollection
��, >
services
��? G
)
��G H
{
�� 	
services
�� 
.
�� 
AddTransient
�� !
<
��! "
IClientRepository
��" 3
,
��3 4
ClientRepository
��5 E
>
��E F
(
��F G
)
��G H
;
��H I
services
�� 
.
�� 
AddTransient
�� !
<
��! ")
IIdentityResourceRepository
��" =
,
��= >(
IdentityResourceRepository
��? Y
>
��Y Z
(
��Z [
)
��[ \
;
��\ ]
services
�� 
.
�� 
AddTransient
�� !
<
��! "!
IIdentityRepository
��" 5
,
��5 6 
IdentityRepository
��7 I
>
��I J
(
��J K
)
��K L
;
��L M
services
�� 
.
�� 
AddTransient
�� !
<
��! "$
IApiResourceRepository
��" 8
,
��8 9#
ApiResourceRepository
��: O
>
��O P
(
��P Q
)
��Q R
;
��R S
services
�� 
.
�� 
AddTransient
�� !
<
��! "'
IPersistedGrantRepository
��" ;
,
��; <&
PersistedGrantRepository
��= U
>
��U V
(
��V W
)
��W X
;
��X Y
services
�� 
.
�� 
AddTransient
�� !
<
��! "
ILogRepository
��" 0
,
��0 1
LogRepository
��2 ?
>
��? @
(
��@ A
)
��A B
;
��B C
services
�� 
.
�� 
AddTransient
�� !
<
��! "
ILogService
��" -
,
��- .

LogService
��/ 9
>
��9 :
(
��: ;
)
��; <
;
��< =
services
�� 
.
�� 
AddTransient
�� !
<
��! "
IClientService
��" 0
,
��0 1
ClientService
��2 ?
>
��? @
(
��@ A
)
��A B
;
��B C
services
�� 
.
�� 
AddTransient
�� !
<
��! "!
IApiResourceService
��" 5
,
��5 6 
ApiResourceService
��7 I
>
��I J
(
��J K
)
��K L
;
��L M
services
�� 
.
�� 
AddTransient
�� !
<
��! "&
IIdentityResourceService
��" :
,
��: ;%
IdentityResourceService
��< S
>
��S T
(
��T U
)
��U V
;
��V W
services
�� 
.
�� 
AddTransient
�� !
<
��! "$
IPersistedGrantService
��" 8
,
��8 9#
PersistedGrantService
��: O
>
��O P
(
��P Q
)
��Q R
;
��R S
services
�� 
.
�� 
AddTransient
�� !
<
��! "
IIdentityService
��" 2
,
��2 3
IdentityService
��4 C
>
��C D
(
��D E
)
��E F
;
��F G
services
�� 
.
�� 
	AddScoped
�� 
<
�� *
IApiResourceServiceResources
�� ;
,
��; <)
ApiResourceServiceResources
��= X
>
��X Y
(
��Y Z
)
��Z [
;
��[ \
services
�� 
.
�� 
	AddScoped
�� 
<
�� %
IClientServiceResources
�� 6
,
��6 7$
ClientServiceResources
��8 N
>
��N O
(
��O P
)
��P Q
;
��Q R
services
�� 
.
�� 
	AddScoped
�� 
<
�� /
!IIdentityResourceServiceResources
�� @
,
��@ A.
 IdentityResourceServiceResources
��B b
>
��b c
(
��c d
)
��d e
;
��e f
services
�� 
.
�� 
	AddScoped
�� 
<
�� '
IIdentityServiceResources
�� 8
,
��8 9&
IdentityServiceResources
��: R
>
��R S
(
��S T
)
��T U
;
��U V
services
�� 
.
�� 
	AddScoped
�� 
<
�� -
IPersistedGrantServiceResources
�� >
,
��> ?,
PersistedGrantServiceResources
��@ ^
>
��^ _
(
��_ `
)
��` a
;
��a b
services
�� 
.
�� 
	AddScoped
�� 
<
�� 0
"ControllerExceptionFilterAttribute
�� A
>
��A B
(
��B C
)
��C D
;
��D E
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
AddAuthentication
�� ,
(
��, -
this
��- 1 
IServiceCollection
��2 D
services
��E M
,
��M N!
IHostingEnvironment
��O b 
hostingEnvironment
��c u
)
��u v
{
�� 	
services
�� 
.
�� 
AddIdentity
��  
<
��  !
UserIdentity
��! -
,
��- .
UserIdentityRole
��/ ?
>
��? @
(
��@ A
)
��A B
.
�� &
AddEntityFrameworkStores
�� )
<
��) *
AdminDbContext
��* 8
>
��8 9
(
��9 :
)
��: ;
.
�� &
AddDefaultTokenProviders
�� )
(
��) *
)
��* +
;
��+ ,
if
�� 
(
��  
hostingEnvironment
�� "
.
��" #
	IsStaging
��# ,
(
��, -
)
��- .
)
��. /
{
�� 
services
�� 
.
�� 
AddAuthentication
�� *
(
��* +
options
��+ 2
=>
��3 5
{
�� 
options
�� 
.
�� 
DefaultScheme
�� )
=
��* +*
CookieAuthenticationDefaults
��, H
.
��H I"
AuthenticationScheme
��I ]
;
��] ^
options
�� 
.
�� $
DefaultChallengeScheme
�� 2
=
��3 4*
CookieAuthenticationDefaults
��5 Q
.
��Q R"
AuthenticationScheme
��R f
;
��f g
options
�� 
.
�� '
DefaultAuthenticateScheme
�� 5
=
��6 7*
CookieAuthenticationDefaults
��8 T
.
��T U"
AuthenticationScheme
��U i
;
��i j
options
�� 
.
�� !
DefaultForbidScheme
�� /
=
��0 1*
CookieAuthenticationDefaults
��2 N
.
��N O"
AuthenticationScheme
��O c
;
��c d
options
�� 
.
�� !
DefaultSignInScheme
�� /
=
��0 1*
CookieAuthenticationDefaults
��2 N
.
��N O"
AuthenticationScheme
��O c
;
��c d
options
�� 
.
�� "
DefaultSignOutScheme
�� 0
=
��1 2*
CookieAuthenticationDefaults
��3 O
.
��O P"
AuthenticationScheme
��P d
;
��d e
}
�� 
)
�� 
.
�� 
	AddCookie
�� 
(
�� *
CookieAuthenticationDefaults
�� ;
.
��; <"
AuthenticationScheme
��< P
,
��P Q
options
�� 
=>
��  "
{
��# $
options
��% ,
.
��, -
Cookie
��- 3
.
��3 4
Name
��4 8
=
��9 :!
AuthorizationConsts
��; N
.
��N O%
IdentityAdminCookieName
��O f
;
��f g
}
��h i
)
��i j
;
��j k
}
�� 
else
�� 
{
�� 
services
�� 
.
�� 
AddAuthentication
�� *
(
��* +
options
��+ 2
=>
��3 5
{
�� 
options
�� 
.
�� 
DefaultScheme
�� )
=
��* +*
CookieAuthenticationDefaults
��, H
.
��H I"
AuthenticationScheme
��I ]
;
��] ^
options
�� 
.
�� $
DefaultChallengeScheme
�� 2
=
��3 4!
AuthorizationConsts
��5 H
.
��H I&
OidcAuthenticationScheme
��I a
;
��a b
options
�� 
.
�� '
DefaultAuthenticateScheme
�� 5
=
��6 7*
CookieAuthenticationDefaults
��8 T
.
��T U"
AuthenticationScheme
��U i
;
��i j
options
�� 
.
�� !
DefaultForbidScheme
�� /
=
��0 1*
CookieAuthenticationDefaults
��2 N
.
��N O"
AuthenticationScheme
��O c
;
��c d
options
�� 
.
�� !
DefaultSignInScheme
�� /
=
��0 1*
CookieAuthenticationDefaults
��2 N
.
��N O"
AuthenticationScheme
��O c
;
��c d
options
�� 
.
�� "
DefaultSignOutScheme
�� 0
=
��1 2*
CookieAuthenticationDefaults
��3 O
.
��O P"
AuthenticationScheme
��P d
;
��d e
}
�� 
)
�� 
.
�� 
	AddCookie
�� 
(
�� *
CookieAuthenticationDefaults
�� ;
.
��; <"
AuthenticationScheme
��< P
,
��P Q
options
�� 
=>
��  "
{
��# $
options
��% ,
.
��, -
Cookie
��- 3
.
��3 4
Name
��4 8
=
��9 :!
AuthorizationConsts
��; N
.
��N O%
IdentityAdminCookieName
��O f
;
��f g
}
��h i
)
��i j
.
�� 
AddOpenIdConnect
�� %
(
��% &!
AuthorizationConsts
��& 9
.
��9 :&
OidcAuthenticationScheme
��: R
,
��R S
options
��T [
=>
��\ ^
{
�� 
options
�� 
.
��  
	Authority
��  )
=
��* +!
AuthorizationConsts
��, ?
.
��? @#
IdentityServerBaseUrl
��@ U
;
��U V
options
�� 
.
��  "
RequireHttpsMetadata
��  4
=
��5 6
false
��7 <
;
��< =
options
�� 
.
��  
ClientId
��  (
=
��) *!
AuthorizationConsts
��+ >
.
��> ?
OidcClientId
��? K
;
��K L
options
�� 
.
��  
Scope
��  %
.
��% &
Clear
��& +
(
��+ ,
)
��, -
;
��- .
options
�� 
.
��  
Scope
��  %
.
��% &
Add
��& )
(
��) *!
AuthorizationConsts
��* =
.
��= >
ScopeOpenId
��> I
)
��I J
;
��J K
options
�� 
.
��  
Scope
��  %
.
��% &
Add
��& )
(
��) *!
AuthorizationConsts
��* =
.
��= >
ScopeProfile
��> J
)
��J K
;
��K L
options
�� 
.
��  
Scope
��  %
.
��% &
Add
��& )
(
��) *!
AuthorizationConsts
��* =
.
��= >

ScopeEmail
��> H
)
��H I
;
��I J
options
�� 
.
��  
Scope
��  %
.
��% &
Add
��& )
(
��) *!
AuthorizationConsts
��* =
.
��= >

ScopeRoles
��> H
)
��H I
;
��I J
options
�� 
.
��  

SaveTokens
��  *
=
��+ ,
true
��- 1
;
��1 2
options
�� 
.
��  '
TokenValidationParameters
��  9
=
��: ;
new
��< ?'
TokenValidationParameters
��@ Y
{
�� 
NameClaimType
�� )
=
��* +
JwtClaimTypes
��, 9
.
��9 :
Name
��: >
,
��> ?
RoleClaimType
�� )
=
��* +
JwtClaimTypes
��, 9
.
��9 :
Role
��: >
,
��> ?
}
�� 
;
�� 
options
�� 
.
��  
Events
��  &
=
��' (
new
��) ,!
OpenIdConnectEvents
��- @
{
�� 
OnMessageReceived
�� -
=
��. /
OnMessageReceived
��0 A
,
��A B*
OnRedirectToIdentityProvider
�� 8
=
��9 :*
OnRedirectToIdentityProvider
��; W
}
�� 
;
�� 
}
�� 
)
�� 
;
�� 
}
�� 
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
��? @&
IdentityAdminRedirectUri
��@ X
;
��X Y
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
�� 
}�� �V
|C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\Helpers\TagHelpers\PickerTagHelper.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
Helpers& -
.- .

TagHelpers. 8
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
|C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\Helpers\TagHelpers\SwitchTagHelper.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
Helpers& -
.- .

TagHelpers. 8
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
lC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\Helpers\UrlHelpers.cs
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
} �	
{C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\Infrastructure\AdminDbContextSeed.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
Infrastructure& 4
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
using 
( 
context 
) 
{ 
await 
Helpers 
. 
DbMigrationHelpers 0
.0 1
EnsureSeedData1 ?
(? @
Program@ G
.G H
hostH L
)L M
;M N
} 
} 	
} 
} �
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\Infrastructure\Exceptions\FailingMiddlewareAppBuilderExtensions.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
Infrastructure& 4
.4 5
Middlewares5 @
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
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\Infrastructure\Middlewares\FailingMiddleware.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
Infrastructure& 4
.4 5
Middlewares5 @
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
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\Infrastructure\Middlewares\FailingOptions.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
Infrastructure& 4
.4 5
Middlewares5 @
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
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\Infrastructure\Middlewares\FailingStartupFilter.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
Infrastructure& 4
.4 5
Middlewares5 @
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

�C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\Infrastructure\Middlewares\WebHostBuildertExtensions.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
Infrastructure& 4
.4 5
Middlewares5 @
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
�C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\Middlewares\AuthenticatedTestRequestMiddleware.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
Middlewares& 1
{ 
public		 

class		 .
"AuthenticatedTestRequestMiddleware		 3
{

 
private 
readonly 
RequestDelegate (
_next) .
;. /
public 
const 
string  
TestUserPrefixHeader 0
=1 2
$str3 =
;= >
public 
const 
string 

TestUserId &
=' (
$str) 1
;1 2
public 
const 
string 
TestUserName (
=) *
$str+ 5
;5 6
public 
const 
string 
TestUserRoles )
=* +
$str, 7
;7 8
public .
"AuthenticatedTestRequestMiddleware 1
(1 2
RequestDelegate2 A
nextB F
)F G
{ 	
_next 
= 
next 
; 
} 	
public 
async 
Task 
Invoke  
(  !
HttpContext! ,
context- 4
)4 5
{ 	
if 
( 
context 
. 
Request 
.  
Headers  '
.' (
Keys( ,
., -
Contains- 5
(5 6
$"6 8
{8 9 
TestUserPrefixHeader9 M
}M N
-N O
{O P
TestUserNameP \
}\ ]
"] ^
)^ _
)_ `
{ 
var 
name 
= 
context 
. 
Request #
.# $
Headers$ +
[+ ,
$", .
{. / 
TestUserPrefixHeader/ C
}C D
-D E
{E F
TestUserNameF R
}R S
"S T
]T U
.U V
FirstV [
([ \
)\ ]
;] ^
var 
id 
= 
context 
. 
Request #
.# $
Headers$ +
.+ ,
Keys, 0
.0 1
Contains1 9
(9 :
$": <
{< = 
TestUserPrefixHeader= Q
}Q R
-R S
{S T

TestUserIdT ^
}^ _
"_ `
)` a
?   
context   !
.  ! "
Request  " )
.  ) *
Headers  * 1
[  1 2
$"  2 4
{  4 5 
TestUserPrefixHeader  5 I
}  I J
-  J K
{  K L

TestUserId  L V
}  V W
"  W X
]  X Y
.  Y Z
First  Z _
(  _ `
)  ` a
:  b c
string  d j
.  j k
Empty  k p
;  p q
var"" 
claims"" 
="" 
new""  
List""! %
<""% &
Claim""& +
>""+ ,
{## 
new$$ 
Claim$$ 
($$ 

ClaimTypes$$ (
.$$( )
Name$$) -
,$$- .
name$$/ 3
)$$3 4
,$$4 5
new%% 
Claim%% 
(%% 

ClaimTypes%% (
.%%( )
NameIdentifier%%) 7
,%%7 8
id%%9 ;
)%%; <
,%%< =
}&& 
;&& 
AddRoles(( 
((( 
context((  
,((  !
claims((" (
)((( )
;(() *
var** 
claimsIdentity** "
=**# $
new**% (
ClaimsIdentity**) 7
(**7 8
claims**8 >
,**> ?
$str**@ I
)**I J
;**J K
var,, 
claimsPrincipal,, #
=,,$ %
new,,& )
ClaimsPrincipal,,* 9
(,,9 :
claimsIdentity,,: H
),,H I
;,,I J
context-- 
.-- 
User-- 
=-- 
claimsPrincipal-- .
;--. /
}.. 
await00 
_next00 
(00 
context00 
)00  
;00  !
}11 	
private33 
void33 
AddRoles33 
(33 
HttpContext33 )
context33* 1
,331 2
List333 7
<337 8
Claim338 =
>33= >
claims33? E
)33E F
{44 	
var55 
roles55 
=55 
context55 
.55  
Request55  '
.55' (
Headers55( /
.55/ 0
Keys550 4
.554 5
Contains555 =
(55= >
$"55> @
{55@ A 
TestUserPrefixHeader55A U
}55U V
-55V W
{55W X
TestUserRoles55X e
}55e f
"55f g
)55g h
?66 
context66 
.66 
Request66 !
.66! "
Headers66" )
[66) *
$"66* ,
{66, - 
TestUserPrefixHeader66- A
}66A B
-66B C
{66C D
TestUserRoles66D Q
}66Q R
"66R S
]66S T
.66T U
First66U Z
(66Z [
)66[ \
:77 
string77 
.77 
Empty77 
;77 
var99 
	rolesList99 
=99 
new99 
List99  $
<99$ %
string99% +
>99+ ,
(99, -
)99- .
;99. /
if;; 
(;; 
!;; 
string;; 
.;; 
IsNullOrEmpty;; %
(;;% &
roles;;& +
);;+ ,
);;, -
{<< 
	rolesList== 
.== 
AddRange== "
(==" #
roles==# (
.==( )
Split==) .
(==. /
$char==/ 2
)==2 3
)==3 4
;==4 5
}>> 
claims@@ 
.@@ 
AddRange@@ 
(@@ 
	rolesList@@ %
.@@% &
Select@@& ,
(@@, -
role@@- 1
=>@@2 4
new@@5 8
Claim@@9 >
(@@> ?

ClaimTypes@@? I
.@@I J
Role@@J N
,@@N O
role@@P T
)@@T U
)@@U V
)@@V W
;@@W X
}AA 	
}BB 
}CC �A
aC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\Program.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
{ 
public 

class 
Program 
{ 
public 
static 
readonly 
string %
	Namespace& /
=0 1
typeof2 8
(8 9
Program9 @
)@ A
.A B
	NamespaceB K
;K L
public 
static 
readonly 
string %
AppName& -
=. /
	Namespace0 9
.9 :
	Substring: C
(C D
	NamespaceD M
.M N
LastIndexOfN Y
(Y Z
$charZ ]
,] ^
	Namespace_ h
.h i
LastIndexOfi t
(t u
$charu x
)x y
-z {
$num| }
)} ~
+	 �
$num
� �
)
� �
;
� �
public 
static 
IWebHost 
host #
;# $
public 
static 
int 
Main 
( 
string %
[% &
]& '
args( ,
), -
{ 	
var 
configuration 
= 
GetConfiguration  0
(0 1
)1 2
;2 3
Serilog 
. 
ILogger 
log 
=  !
CreateSerilogLogger" 5
(5 6
configuration6 C
)C D
;D E
Log 
. 
Logger 
= 
log 
; 
try 
{ 
Log   
.   
Information   
(    
$str    P
,  P Q
AppName  R Y
)  Y Z
;  Z [
host!! 
=!! 
BuildWebHost!! #
(!!# $
configuration!!$ 1
,!!1 2
log!!3 6
,!!6 7
args!!8 <
)!!< =
;!!= >
Log## 
.## 
Information## 
(##  
$str##  O
,##O P
AppName##Q X
)##X Y
;##Y Z
_$$ 
=$$ 
host$$ 
.$$ 
MigrateDbContext$$ )
<$$) *
AdminDbContext$$* 8
>$$8 9
($$9 :
($$: ;
context$$; B
,$$B C
services$$D L
)$$L M
=>$$N P
{%% 
var&& 
env&& 
=&& 
services&& &
.&&& '

GetService&&' 1
<&&1 2
IHostingEnvironment&&2 E
>&&E F
(&&F G
)&&G H
;&&H I
var'' 
settings''  
=''! "
services''# +
.''+ ,

GetService'', 6
<''6 7
IOptions''7 ?
<''? @
ProgramSettings''@ O
>''O P
>''P Q
(''Q R
)''R S
;''S T
var(( 
logger(( 
=((  
services((! )
.(() *

GetService((* 4
<((4 5
ILogger((5 <
<((< =
AdminDbContextSeed((= O
>((O P
>((P Q
(((Q R
)((R S
;((S T
new** 
AdminDbContextSeed** *
(*** +
)**+ ,
.++ 
	SeedAsync++ "
(++" #
context++# *
,++* +
env++, /
,++/ 0
settings++1 9
,++9 :
logger++; A
)++A B
.,, 
Wait,, 
(,, 
),, 
;,,  
}-- 
)-- 
;-- 
Log00 
.00 
Information00 
(00  
$str00  M
,00M N
AppName00O V
)00V W
;00W X
host11 
.11 
Run11 
(11 
)11 
;11 
return33 
$num33 
;33 
}44 
catch55 
(55 
	Exception55 
ex55 
)55  
{66 
Log77 
.77 
Fatal77 
(77 
ex77 
,77 
$str77 W
,77W X
AppName77Y `
)77` a
;77a b
return88 
$num88 
;88 
}99 
finally:: 
{;; 
Log<< 
.<< 
CloseAndFlush<< !
(<<! "
)<<" #
;<<# $
}== 
}>> 	
private@@ 
static@@ 
IWebHost@@ 
BuildWebHost@@  ,
(@@, -
IConfiguration@@- ;
configuration@@< I
,@@I J
Serilog@@K R
.@@R S
ILogger@@S Z
logger@@[ a
,@@a b
string@@c i
[@@i j
]@@j k
args@@l p
)@@p q
=>@@r t
WebHostAA 
.AA  
CreateDefaultBuilderAA 0
(AA0 1
argsAA1 5
)AA5 6
.BB  
CaptureStartupErrorsBB -
(BB- .
falseBB. 3
)BB3 4
.CC 

UseFailingCC #
(CC# $
optionsCC$ +
=>CC, .
optionsCC/ 6
.CC6 7

ConfigPathCC7 A
=CCB C
$strCCD N
)CCN O
.DD 

UseStartupDD #
<DD# $
StartupDD$ +
>DD+ ,
(DD, -
)DD- .
.EE 
UseContentRootEE '
(EE' (
	DirectoryEE( 1
.EE1 2
GetCurrentDirectoryEE2 E
(EEE F
)EEF G
)EEG H
.FF 
UseConfigurationFF )
(FF) *
configurationFF* 7
)FF7 8
.GG 

UseSerilogGG #
(GG# $
loggerGG$ *
)GG* +
.HH 
BuildHH 
(HH 
)HH  
;HH  !
privateJJ 
staticJJ 
SerilogJJ 
.JJ 
ILoggerJJ &
CreateSerilogLoggerJJ' :
(JJ: ;
IConfigurationJJ; I
configurationJJJ W
)JJW X
{KK 	
varMM 
logstashUrlMM 
=MM 
configurationMM +
[MM+ ,
$strMM, B
]MMB C
;MMC D
returnNN 
newNN 
LoggerConfigurationNN *
(NN* +
)NN+ ,
.OO 
MinimumLevelOO 
.OO 
DebugOO #
(OO# $
)OO$ %
.PP 
EnrichPP 
.PP 
WithPropertyPP $
(PP$ %
$strPP% 9
,PP9 :
AppNamePP; B
)PPB C
.QQ 
EnrichQQ 
.QQ 
FromLogContextQQ &
(QQ& '
)QQ' (
.RR 
WriteToRR 
.RR 
ConsoleRR  
(RR  !
)RR! "
.TT 
WriteToTT 
.TT 
HttpTT 
(TT 
stringTT $
.TT$ %
IsNullOrWhiteSpaceTT% 7
(TT7 8
logstashUrlTT8 C
)TTC D
?TTE F
$strTTG b
:TTc d
logstashUrlTTe p
)TTp q
.UU 
ReadFromUU 
.UU 
ConfigurationUU '
(UU' (
configurationUU( 5
)UU5 6
.VV 
CreateLoggerVV 
(VV 
)VV 
;VV  
}WW 	
privateYY 
staticYY 
IConfigurationYY %
GetConfigurationYY& 6
(YY6 7
)YY7 8
{ZZ 	
var[[ 
builder[[ 
=[[ 
new[[  
ConfigurationBuilder[[ 2
([[2 3
)[[3 4
.\\ 
SetBasePath\\ 
(\\ 
	Directory\\ &
.\\& '
GetCurrentDirectory\\' :
(\\: ;
)\\; <
)\\< =
.]] 
AddJsonFile]] 
(]] 
$str]] /
,]]/ 0
optional]]1 9
:]]9 :
false]]; @
,]]@ A
reloadOnChange]]B P
:]]P Q
true]]R V
)]]V W
.^^ #
AddEnvironmentVariables^^ (
(^^( )
)^^) *
;^^* +
return`` 
builder`` 
.`` 
Build``  
(``  !
)``! "
;``" #
}aa 	
}bb 
}cc �
iC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\ProgramSettings.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
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
} �/
aC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\Startup.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
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
.'' 
AddCustomDbContext'' #
(''# $
Configuration''$ 1
)''1 2
.(( 
AddHealthChecks((  
(((  !
Configuration((! .
)((. /
.)) "
AddCustomConfiguration)) '
())' (
Configuration))( 5
)))5 6
;))6 7
services++ 
.++ 
AddAuthentication++ &
(++& '
HostingEnvironment++' 9
)++9 :
;++: ;
services,, 
.,, 
AddServices,,  
(,,  !
),,! "
;,," #
services-- 
.-- 
AddMvcLocalization-- '
(--' (
)--( )
;--) *
services.. 
... $
AddAuthorizationPolicies.. -
(..- .
)... /
;../ 0
}// 	
public11 
void11 
	Configure11 
(11 
IApplicationBuilder11 1
app112 5
,115 6
IHostingEnvironment117 J
env11K N
,11N O
ILoggerFactory11P ^
loggerFactory11_ l
)11l m
{22 	
var33 
pathBase33 
=33 
Configuration33 (
[33( )
$str33) 4
]334 5
;335 6
if44 
(44 
!44 
string44 
.44 
IsNullOrEmpty44 %
(44% &
pathBase44& .
)44. /
)44/ 0
{55 
loggerFactory66 
.66 
CreateLogger66 *
<66* +
Startup66+ 2
>662 3
(663 4
)664 5
.665 6
LogDebug666 >
(66> ?
$str66? ]
,66] ^
pathBase66_ g
)66g h
;66h i
app77 
.77 
UsePathBase77 
(77  
pathBase77  (
)77( )
;77) *
}88 
app:: 
.:: 
UseCors:: 
(:: 
$str:: $
)::$ %
;::% &
app<< 
.<< 
UseHealthChecks<< 
(<<  
$str<<  +
,<<+ ,
new<<- 0
HealthCheckOptions<<1 C
{== 
	Predicate>> 
=>> 
r>> 
=>>>  
r>>! "
.>>" #
Name>># '
.>>' (
Contains>>( 0
(>>0 1
$str>>1 7
)>>7 8
}?? 
)?? 
;?? 
appAA 
.AA 
UseHealthChecksAA 
(AA  
$strAA  %
,AA% &
newAA' *
HealthCheckOptionsAA+ =
(AA= >
)AA> ?
{BB 
	PredicateCC 
=CC 
_CC 
=>CC  
trueCC! %
,CC% &
ResponseWriterDD 
=DD  
UIResponseWriterDD! 1
.DD1 2&
WriteHealthCheckUIResponseDD2 L
}EE 
)EE 
;EE 
appGG 
.GG 
UseSecurityHeadersGG "
(GG" #
)GG# $
;GG$ %
appHH 
.HH 
UseStaticFilesHH 
(HH 
)HH  
;HH  !
appII 
.II %
ConfigureAuthentificationII )
(II) *
envII* -
)II- .
;II. /
appJJ 
.JJ !
ConfigureLocalizationJJ %
(JJ% &
)JJ& '
;JJ' (
appLL 
.LL 
UseMvcLL 
(LL 
routesLL 
=>LL  
{MM 
routesNN 
.NN 
MapRouteNN 
(NN  
$strNN  )
,NN) *
$strNN+ S
)NNS T
;NNT U
}OO 
)OO 
;OO 
}PP 	
}QQ 
}RR 