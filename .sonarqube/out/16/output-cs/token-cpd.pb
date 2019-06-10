≤)
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
errorNumbersToAdd	(({ å
:
((å ç
null
((é í
)
((í ì
;
((ì î
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
}JJ ï¢
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
AuthorizationConsts	88~ ë
.
88ë í-
ApiTansacoesFinanceirashttpsuri
88í ±
}
88± ≤+
/swagger/oauth2-redirect.html
88≤ œ
"
88œ –
}
88— “
,
88“ ”"
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
AuthorizationConsts	99~ ë
.
99ë í-
ApiTansacoesFinanceirashttpsuri
99í ±
}
99± ≤!
/swagger/index.html
99≤ ≈
"
99≈ ∆
}
99« »
,
99» …
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
ÑÑ 
Client
ÑÑ 
{
ÖÖ  !
ClientId
ÜÜ( 0
=
ÜÜ1 2
$str
ÜÜ3 ?
,
ÜÜ? @
ClientSecrets
áá( 5
=
áá6 7
{
àà( )
new
ââ0 3
Secret
ââ4 :
{
ää0 1
Type
ãã8 <
=
ãã= >%
IdentityServerConstants
ãã? V
.
ããV W
SecretTypes
ããW b
.
ããb c#
X509CertificateBase64
ããc x
,
ããx y
Value
åå8 =
=
åå> ?
$stråå@  
}
çç0 1
}
éé( )
,
éé) *
AllowedGrantTypes
êê( 9
=
êê: ;

GrantTypes
êê< F
.
êêF G
ClientCredentials
êêG X
,
êêX Y
AllowedScopes
ëë( 5
=
ëë6 7
{
ëë8 9
$str
ëë: @
,
ëë@ A
$str
ëëB R
}
ëëS T
}
íí  !
,
íí! "
new
óó 
Client
óó 
{
òò  !
ClientId
ôô( 0
=
ôô1 2
$str
ôô3 B
,
ôôB C
ClientSecrets
öö( 5
=
öö6 7
{
õõ( )
new
úú0 3
Secret
úú4 :
(
úú: ;
$str
úú; C
.
úúC D
Sha256
úúD J
(
úúJ K
)
úúK L
)
úúL M
}
ùù( )
,
ùù) *
AllowedScopes
üü( 5
=
üü6 7
{
üü8 9
$str
üü: @
,
üü@ A
$str
üüB R
}
üüS T
}
††  !
,
††! "
new
•• 
Client
•• 
{
¶¶  !
ClientId
ßß( 0
=
ßß1 2
$str
ßß3 =
,
ßß= >
ClientSecrets
®®( 5
=
®®6 7
{
©©( )
new
™™0 3
Secret
™™4 :
(
™™: ;
$str
™™; C
.
™™C D
Sha256
™™D J
(
™™J K
)
™™K L
)
™™L M
}
´´( )
,
´´) *
AllowedGrantTypes
≠≠( 9
=
≠≠: ;

GrantTypes
≠≠< F
.
≠≠F G#
ResourceOwnerPassword
≠≠G \
,
≠≠\ ] 
AllowOfflineAccess
ØØ( :
=
ØØ; <
true
ØØ= A
,
ØØA B
AllowedScopes
∞∞( 5
=
∞∞6 7
{
±±( )%
IdentityServerConstants
≤≤0 G
.
≤≤G H
StandardScopes
≤≤H V
.
≤≤V W
OpenId
≤≤W ]
,
≤≤] ^
$str
≥≥0 @
,
≥≥@ A
$str
¥¥0 6
,
¥¥6 7
$str
¥¥8 H
}
µµ( )
}
∂∂  !
,
∂∂! "
new
ªª 
Client
ªª 
{
ºº  !
ClientId
ΩΩ( 0
=
ΩΩ1 2
$str
ΩΩ3 D
,
ΩΩD E!
RequireClientSecret
ææ( ;
=
ææ< =
false
ææ> C
,
ææC D
AllowedGrantTypes
¿¿( 9
=
¿¿: ;

GrantTypes
¿¿< F
.
¿¿F G#
ResourceOwnerPassword
¿¿G \
,
¿¿\ ] 
AllowOfflineAccess
¬¬( :
=
¬¬; <
true
¬¬= A
,
¬¬A B
AllowedScopes
√√( 5
=
√√6 7
{
ƒƒ( )%
IdentityServerConstants
≈≈0 G
.
≈≈G H
StandardScopes
≈≈H V
.
≈≈V W
OpenId
≈≈W ]
,
≈≈] ^%
IdentityServerConstants
∆∆0 G
.
∆∆G H
StandardScopes
∆∆H V
.
∆∆V W
Email
∆∆W \
,
∆∆\ ]
$str
««0 6
,
««6 7
$str
««8 H
}
»»( )
}
……  !
,
……! "
new
ŒŒ 
Client
ŒŒ 
{
œœ  !
ClientId
––( 0
=
––1 2
$str
––3 H
,
––H I

ClientName
——( 2
=
——3 4
$str
——5 V
,
——V W!
RequireClientSecret
““( ;
=
““< =
false
““> C
,
““C D
AllowedGrantTypes
‘‘( 9
=
‘‘: ;

GrantTypes
‘‘< F
.
‘‘F G
Hybrid
‘‘G M
,
‘‘M N
RequirePkce
’’( 3
=
’’4 5
true
’’6 :
,
’’: ;
RedirectUris
◊◊( 4
=
◊◊5 6
{
◊◊7 8
$str
◊◊9 Q
}
◊◊R S
,
◊◊S T 
AllowOfflineAccess
ŸŸ( :
=
ŸŸ; <
true
ŸŸ= A
,
ŸŸA B
AllowedScopes
€€( 5
=
€€6 7
{
‹‹( )%
IdentityServerConstants
››0 G
.
››G H
StandardScopes
››H V
.
››V W
OpenId
››W ]
,
››] ^%
IdentityServerConstants
ﬁﬁ0 G
.
ﬁﬁG H
StandardScopes
ﬁﬁH V
.
ﬁﬁV W
Profile
ﬁﬁW ^
,
ﬁﬁ^ _%
IdentityServerConstants
ﬂﬂ0 G
.
ﬂﬂG H
StandardScopes
ﬂﬂH V
.
ﬂﬂV W
Email
ﬂﬂW \
,
ﬂﬂ\ ]
$str
‡‡0 6
,
‡‡6 7
$str
‡‡8 H
,
‡‡H I
}
··( )
,
··) *
}
‚‚  !
,
‚‚! "
new
ÁÁ 
Client
ÁÁ 
{
ËË  !
ClientId
ÈÈ( 0
=
ÈÈ1 2
$str
ÈÈ3 G
,
ÈÈG H
ClientSecrets
ÍÍ( 5
=
ÍÍ6 7
{
ÎÎ( )
new
ÏÏ0 3
Secret
ÏÏ4 :
(
ÏÏ: ;
$str
ÏÏ; C
.
ÏÏC D
Sha256
ÏÏD J
(
ÏÏJ K
)
ÏÏK L
)
ÏÏL M
}
ÌÌ( )
,
ÌÌ) *
AllowedGrantTypes
ÔÔ( 9
=
ÔÔ: ;

GrantTypes
ÔÔ< F
.
ÔÔF G#
ResourceOwnerPassword
ÔÔG \
,
ÔÔ\ ]
AllowedScopes
( 5
=
6 7
{
8 9
$str
: @
,
@ A
$str
B R
}
S T
,
T U
AccessTokenType
ÚÚ( 7
=
ÚÚ8 9
AccessTokenType
ÚÚ: I
.
ÚÚI J
	Reference
ÚÚJ S
}
ÛÛ  !
,
ÛÛ! "
new
¯¯ 
Client
¯¯ 
{
˘˘  !
ClientId
˚˚( 0
=
˚˚1 2
$str
˚˚3 A
,
˚˚A B

ClientName
¸¸( 2
=
¸¸3 4
$str
¸¸5 C
,
¸¸C D
	ClientUri
˝˝( 1
=
˝˝2 3
$str
˝˝4 N
,
˝˝N O
AllowedGrantTypes
ˇˇ( 9
=
ˇˇ: ;

GrantTypes
ˇˇ< F
.
ˇˇF G
Implicit
ˇˇG O
,
ˇˇO P)
AllowAccessTokensViaBrowser
ÄÄ( C
=
ÄÄD E
true
ÄÄF J
,
ÄÄJ K
RedirectUris
ÇÇ( 4
=
ÇÇ5 6
{
ÇÇ8 9
$str
ÇÇ: ^
}
ÇÇ_ `
,
ÇÇ` a#
FrontChannelLogoutUri
ÉÉ( =
=
ÉÉ> ?
$str
ÉÉ@ e
,
ÉÉe f$
PostLogoutRedirectUris
ÑÑ( >
=
ÑÑ? @
{
ÑÑA B
$str
ÑÑC q
}
ÑÑr s
,
ÑÑs t
AllowedScopes
ÜÜ( 5
=
ÜÜ6 7
{
áá( )%
IdentityServerConstants
àà0 G
.
ààG H
StandardScopes
ààH V
.
ààV W
OpenId
ààW ]
,
àà] ^%
IdentityServerConstants
ââ0 G
.
ââG H
StandardScopes
ââH V
.
ââV W
Profile
ââW ^
,
ââ^ _%
IdentityServerConstants
ää0 G
.
ääG H
StandardScopes
ääH V
.
ääV W
Email
ääW \
,
ää\ ]
$str
ãã0 6
,
ãã6 7
$str
ãã8 H
}
åå( )
,
åå) *
}
çç  !
,
çç! "
new
íí 
Client
íí 
{
ìì  !
ClientId
îî( 0
=
îî1 2
$str
îî3 ?
,
îî? @

ClientName
ïï( 2
=
ïï3 4
$str
ïï5 A
,
ïïA B
	ClientUri
ññ( 1
=
ññ2 3
$str
ññ4 N
,
ññN O
AllowedGrantTypes
òò( 9
=
òò: ;

GrantTypes
òò< F
.
òòF G
Implicit
òòG O
,
òòO P
RedirectUris
ôô( 4
=
ôô5 6
{
ôô7 8
$str
ôô9 _
}
ôô` a
,
ôôa b#
FrontChannelLogoutUri
öö( =
=
öö> ?
$str
öö@ e
,
ööe f$
PostLogoutRedirectUris
õõ( >
=
õõ? @
{
õõA B
$str
õõC \
}
õõ] ^
,
õõ^ _
AllowedScopes
ùù( 5
=
ùù6 7
{
ùù8 9%
IdentityServerConstants
ùù: Q
.
ùùQ R
StandardScopes
ùùR `
.
ùù` a
OpenId
ùùa g
}
ùùh i
,
ùùi j
}
ûû  !
,
ûû! "
new
££ 
Client
££ 
{
§§  !
ClientId
••( 0
=
••1 2
$str
••3 ?
,
••? @

ClientName
¶¶( 2
=
¶¶3 4
$str
¶¶5 A
,
¶¶A B
	ClientUri
ßß( 1
=
ßß2 3
$str
ßß4 N
,
ßßN O
ClientSecrets
©©( 5
=
©©6 7
{
™™( )
new
´´0 3
Secret
´´4 :
(
´´: ;
$str
´´; C
.
´´C D
Sha256
´´D J
(
´´J K
)
´´K L
)
´´L M
}
¨¨( )
,
¨¨) *
AllowedGrantTypes
ÆÆ( 9
=
ÆÆ: ;

GrantTypes
ÆÆ< F
.
ÆÆF G
Hybrid
ÆÆG M
,
ÆÆM N)
AllowAccessTokensViaBrowser
ØØ( C
=
ØØD E
false
ØØF K
,
ØØK L
RedirectUris
±±( 4
=
±±5 6
{
±±7 8
$str
±±9 ]
}
±±^ _
,
±±_ `#
FrontChannelLogoutUri
≤≤( =
=
≤≤> ?
$str
≤≤@ e
,
≤≤e f$
PostLogoutRedirectUris
≥≥( >
=
≥≥? @
{
≥≥A B
$str
≥≥C q
}
≥≥r s
,
≥≥s t 
AllowOfflineAccess
µµ( :
=
µµ; <
true
µµ= A
,
µµA B
AllowedScopes
∑∑( 5
=
∑∑6 7
{
∏∏( )%
IdentityServerConstants
ππ0 G
.
ππG H
StandardScopes
ππH V
.
ππV W
OpenId
ππW ]
,
ππ] ^%
IdentityServerConstants
∫∫0 G
.
∫∫G H
StandardScopes
∫∫H V
.
∫∫V W
Profile
∫∫W ^
,
∫∫^ _%
IdentityServerConstants
ªª0 G
.
ªªG H
StandardScopes
ªªH V
.
ªªV W
Email
ªªW \
,
ªª\ ]
$str
ºº0 6
,
ºº6 7
$str
ºº8 H
,
ººH I
}
ΩΩ( )
,
ΩΩ) *
}
ææ  !
,
ææ! "
new
√√ 
Client
√√ 
{
ƒƒ  !
ClientId
≈≈( 0
=
≈≈1 2
$str
≈≈3 =
,
≈≈= >

ClientName
∆∆( 2
=
∆∆3 4
$str
∆∆5 R
,
∆∆R S
	ClientUri
««( 1
=
««2 3
$str
««4 N
,
««N O
AllowedGrantTypes
……( 9
=
……: ;

GrantTypes
……< F
.
……F G
Implicit
……G O
,
……O P)
AllowAccessTokensViaBrowser
  ( C
=
  D E
true
  F J
,
  J K
RedirectUris
ÃÃ( 4
=
ÃÃ5 6
{
ÃÃ7 8
$str
ÃÃ9 \
}
ÃÃ] ^
,
ÃÃ^ _
AllowedScopes
ÕÕ( 5
=
ÕÕ6 7
{
ÕÕ8 9
$str
ÕÕ: @
,
ÕÕ@ A
$str
ÕÕB R
}
ÕÕS T
,
ÕÕT U
}
ŒŒ  !
,
ŒŒ! "
new
”” 
Client
”” 
{
‘‘  !
ClientId
’’( 0
=
’’1 2
$str
’’3 <
,
’’< =

ClientName
÷÷( 2
=
÷÷3 4
$str
÷÷5 M
,
÷÷M N
	ClientUri
◊◊( 1
=
◊◊2 3
$str
◊◊4 N
,
◊◊N O
AllowedGrantTypes
ŸŸ( 9
=
ŸŸ: ;

GrantTypes
ŸŸ< F
.
ŸŸF G
Implicit
ŸŸG O
,
ŸŸO P)
AllowAccessTokensViaBrowser
⁄⁄( C
=
⁄⁄D E
true
⁄⁄F J
,
⁄⁄J K!
RequireClientSecret
€€( ;
=
€€< =
false
€€> C
,
€€C D
AccessTokenType
‹‹( 7
=
‹‹8 9
AccessTokenType
‹‹: I
.
‹‹I J
	Reference
‹‹J S
,
‹‹S T
RedirectUris
ﬁﬁ( 4
=
ﬁﬁ5 6
{
ﬂﬂ( )
$str
‡‡0 R
,
‡‡R S
$str
··0 U
,
··U V
$str
‚‚0 S
,
‚‚S T
$str
„„0 R
,
„„R S
}
‰‰( )
,
‰‰) *$
PostLogoutRedirectUris
ÊÊ( >
=
ÊÊ? @
{
ÊÊA B
$str
ÊÊC e
}
ÊÊf g
,
ÊÊg h 
AllowedCorsOrigins
ÁÁ( :
=
ÁÁ; <
{
ÁÁ= >
$str
ÁÁ? V
}
ÁÁW X
,
ÁÁX Y
AllowedScopes
ÈÈ( 5
=
ÈÈ6 7
{
ÍÍ( )%
IdentityServerConstants
ÎÎ0 G
.
ÎÎG H
StandardScopes
ÎÎH V
.
ÎÎV W
OpenId
ÎÎW ]
,
ÎÎ] ^%
IdentityServerConstants
ÏÏ0 G
.
ÏÏG H
StandardScopes
ÏÏH V
.
ÏÏV W
Profile
ÏÏW ^
,
ÏÏ^ _%
IdentityServerConstants
ÌÌ0 G
.
ÌÌG H
StandardScopes
ÌÌH V
.
ÌÌV W
Email
ÌÌW \
,
ÌÌ\ ]
$str
ÓÓ0 6
,
ÓÓ6 7
$str
ÓÓ8 H
}
ÔÔ( )
,
ÔÔ) *
}
  !
,
! "
}
ÒÒ 
;
ÒÒ 
}
ÚÚ 	
}
ÛÛ 
}ÙÙ €
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
ShowInDiscoveryDocument	## ñ
=
##ó ò
true
##ô ù
,
##ù û
Description
##ü ™
=
##´ ¨
$str
##≠ È
}
##Í Î
,
##Î Ï
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
ShowInDiscoveryDocument	$$m Ñ
=
$$Ö Ü
true
$$á ã
,
$$ã å
Description
$$ç ò
=
$$ô ö
$str
$$õ —
}
$$“ ”
,
$$” ‘
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
}++ ¨
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
}		 ê
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
}!! ‰
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
} »
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
OidcAuthenticationScheme	n Ü
}
á à
,
à â
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
} Û,
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
NotificationKey	%%u Ñ
]
%%Ñ Ö
.
%%Ö Ü
ToString
%%Ü é
(
%%é è
)
%%è ê
)
%%ê ë
;
%%ë í
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
}JJ Çõ
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
;	DD Ä
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
ÄÄ 
async
ÄÄ 
Task
ÄÄ 
<
ÄÄ 
IActionResult
ÄÄ '
>
ÄÄ' (
ClientClaims
ÄÄ) 5
(
ÄÄ5 6
int
ÄÄ6 9
id
ÄÄ: <
,
ÄÄ< =
int
ÄÄ> A
?
ÄÄA B
page
ÄÄC G
)
ÄÄG H
{
ÅÅ 	
if
ÇÇ 
(
ÇÇ 
id
ÇÇ 
==
ÇÇ 
$num
ÇÇ 
)
ÇÇ 
return
ÇÇ 
NotFound
ÇÇ  (
(
ÇÇ( )
)
ÇÇ) *
;
ÇÇ* +
var
ÑÑ 
claims
ÑÑ 
=
ÑÑ 
await
ÑÑ 
_clientService
ÑÑ -
.
ÑÑ- ."
GetClientClaimsAsync
ÑÑ. B
(
ÑÑB C
id
ÑÑC E
,
ÑÑE F
page
ÑÑG K
??
ÑÑL N
$num
ÑÑO P
)
ÑÑP Q
;
ÑÑQ R
return
ÜÜ 
View
ÜÜ 
(
ÜÜ 
claims
ÜÜ 
)
ÜÜ 
;
ÜÜ  
}
áá 	
[
ââ 	
HttpGet
ââ	 
]
ââ 
public
ää 
async
ää 
Task
ää 
<
ää 
IActionResult
ää '
>
ää' (
ClientProperties
ää) 9
(
ää9 :
int
ää: =
id
ää> @
,
ää@ A
int
ääB E
?
ääE F
page
ääG K
)
ääK L
{
ãã 	
if
åå 
(
åå 
id
åå 
==
åå 
$num
åå 
)
åå 
return
åå 
NotFound
åå  (
(
åå( )
)
åå) *
;
åå* +
var
éé 

properties
éé 
=
éé 
await
éé "
_clientService
éé# 1
.
éé1 2&
GetClientPropertiesAsync
éé2 J
(
ééJ K
id
ééK M
,
ééM N
page
ééO S
??
ééT V
$num
ééW X
)
ééX Y
;
ééY Z
return
êê 
View
êê 
(
êê 

properties
êê "
)
êê" #
;
êê# $
}
ëë 	
[
ìì 	
HttpPost
ìì	 
]
ìì 
[
îî 	&
ValidateAntiForgeryToken
îî	 !
]
îî! "
public
ïï 
async
ïï 
Task
ïï 
<
ïï 
IActionResult
ïï '
>
ïï' (
ClientProperties
ïï) 9
(
ïï9 :!
ClientPropertiesDto
ïï: M
clientProperty
ïïN \
)
ïï\ ]
{
ññ 	
if
óó 
(
óó 
!
óó 

ModelState
óó 
.
óó 
IsValid
óó #
)
óó# $
{
òò 
return
ôô 
View
ôô 
(
ôô 
clientProperty
ôô *
)
ôô* +
;
ôô+ ,
}
öö 
await
úú 
_clientService
úú  
.
úú  !$
AddClientPropertyAsync
úú! 7
(
úú7 8
clientProperty
úú8 F
)
úúF G
;
úúG H!
SuccessNotification
ùù 
(
ùù  
string
ùù  &
.
ùù& '
Format
ùù' -
(
ùù- .

_localizer
ùù. 8
[
ùù8 9
$str
ùù9 S
]
ùùS T
,
ùùT U
clientProperty
ùùV d
.
ùùd e
ClientId
ùùe m
,
ùùm n
clientProperty
ùùo }
.
ùù} ~

ClientNameùù~ à
)ùùà â
,ùùâ ä

_localizerùùã ï
[ùùï ñ
$strùùñ §
]ùù§ •
)ùù• ¶
;ùù¶ ß
return
üü 
RedirectToAction
üü #
(
üü# $
nameof
üü$ *
(
üü* +
ClientProperties
üü+ ;
)
üü; <
,
üü< =
new
üü> A
{
üüB C
Id
üüD F
=
üüG H
clientProperty
üüI W
.
üüW X
ClientId
üüX `
}
üüa b
)
üüb c
;
üüc d
}
†† 	
[
¢¢ 	
HttpPost
¢¢	 
]
¢¢ 
[
££ 	&
ValidateAntiForgeryToken
££	 !
]
££! "
public
§§ 
async
§§ 
Task
§§ 
<
§§ 
IActionResult
§§ '
>
§§' (
ClientClaims
§§) 5
(
§§5 6
ClientClaimsDto
§§6 E
clientClaim
§§F Q
)
§§Q R
{
•• 	
if
¶¶ 
(
¶¶ 
!
¶¶ 

ModelState
¶¶ 
.
¶¶ 
IsValid
¶¶ #
)
¶¶# $
{
ßß 
return
®® 
View
®® 
(
®® 
clientClaim
®® '
)
®®' (
;
®®( )
}
©© 
await
´´ 
_clientService
´´  
.
´´  !!
AddClientClaimAsync
´´! 4
(
´´4 5
clientClaim
´´5 @
)
´´@ A
;
´´A B!
SuccessNotification
¨¨ 
(
¨¨  
string
¨¨  &
.
¨¨& '
Format
¨¨' -
(
¨¨- .

_localizer
¨¨. 8
[
¨¨8 9
$str
¨¨9 P
]
¨¨P Q
,
¨¨Q R
clientClaim
¨¨S ^
.
¨¨^ _
Value
¨¨_ d
,
¨¨d e
clientClaim
¨¨f q
.
¨¨q r

ClientName
¨¨r |
)
¨¨| }
,
¨¨} ~

_localizer¨¨ â
[¨¨â ä
$str¨¨ä ò
]¨¨ò ô
)¨¨ô ö
;¨¨ö õ
return
ÆÆ 
RedirectToAction
ÆÆ #
(
ÆÆ# $
nameof
ÆÆ$ *
(
ÆÆ* +
ClientClaims
ÆÆ+ 7
)
ÆÆ7 8
,
ÆÆ8 9
new
ÆÆ: =
{
ÆÆ> ?
Id
ÆÆ@ B
=
ÆÆC D
clientClaim
ÆÆE P
.
ÆÆP Q
ClientId
ÆÆQ Y
}
ÆÆZ [
)
ÆÆ[ \
;
ÆÆ\ ]
}
ØØ 	
[
±± 	
HttpGet
±±	 
]
±± 
public
≤≤ 
async
≤≤ 
Task
≤≤ 
<
≤≤ 
IActionResult
≤≤ '
>
≤≤' (
ClientClaimDelete
≤≤) :
(
≤≤: ;
int
≤≤; >
id
≤≤? A
)
≤≤A B
{
≥≥ 	
if
¥¥ 
(
¥¥ 
id
¥¥ 
==
¥¥ 
$num
¥¥ 
)
¥¥ 
return
¥¥ 
NotFound
¥¥  (
(
¥¥( )
)
¥¥) *
;
¥¥* +
var
∂∂ 
clientClaim
∂∂ 
=
∂∂ 
await
∂∂ #
_clientService
∂∂$ 2
.
∂∂2 3!
GetClientClaimAsync
∂∂3 F
(
∂∂F G
id
∂∂G I
)
∂∂I J
;
∂∂J K
return
∏∏ 
View
∏∏ 
(
∏∏ 
nameof
∏∏ 
(
∏∏ 
ClientClaimDelete
∏∏ 0
)
∏∏0 1
,
∏∏1 2
clientClaim
∏∏3 >
)
∏∏> ?
;
∏∏? @
}
ππ 	
[
ªª 	
HttpGet
ªª	 
]
ªª 
public
ºº 
async
ºº 
Task
ºº 
<
ºº 
IActionResult
ºº '
>
ºº' ("
ClientPropertyDelete
ºº) =
(
ºº= >
int
ºº> A
id
ººB D
)
ººD E
{
ΩΩ 	
if
ææ 
(
ææ 
id
ææ 
==
ææ 
$num
ææ 
)
ææ 
return
ææ 
NotFound
ææ  (
(
ææ( )
)
ææ) *
;
ææ* +
var
¿¿ 
clientProperty
¿¿ 
=
¿¿  
await
¿¿! &
_clientService
¿¿' 5
.
¿¿5 6$
GetClientPropertyAsync
¿¿6 L
(
¿¿L M
id
¿¿M O
)
¿¿O P
;
¿¿P Q
return
¬¬ 
View
¬¬ 
(
¬¬ 
nameof
¬¬ 
(
¬¬ "
ClientPropertyDelete
¬¬ 3
)
¬¬3 4
,
¬¬4 5
clientProperty
¬¬6 D
)
¬¬D E
;
¬¬E F
}
√√ 	
[
≈≈ 	
HttpPost
≈≈	 
]
≈≈ 
public
∆∆ 
async
∆∆ 
Task
∆∆ 
<
∆∆ 
IActionResult
∆∆ '
>
∆∆' (
ClientClaimDelete
∆∆) :
(
∆∆: ;
ClientClaimsDto
∆∆; J
clientClaim
∆∆K V
)
∆∆V W
{
«« 	
await
»» 
_clientService
»»  
.
»»  !$
DeleteClientClaimAsync
»»! 7
(
»»7 8
clientClaim
»»8 C
)
»»C D
;
»»D E!
SuccessNotification
…… 
(
……  

_localizer
……  *
[
……* +
$str
……+ E
]
……E F
,
……F G

_localizer
……H R
[
……R S
$str
……S a
]
……a b
)
……b c
;
……c d
return
ÀÀ 
RedirectToAction
ÀÀ #
(
ÀÀ# $
nameof
ÀÀ$ *
(
ÀÀ* +
ClientClaims
ÀÀ+ 7
)
ÀÀ7 8
,
ÀÀ8 9
new
ÀÀ: =
{
ÀÀ> ?
Id
ÀÀ@ B
=
ÀÀC D
clientClaim
ÀÀE P
.
ÀÀP Q
ClientId
ÀÀQ Y
}
ÀÀZ [
)
ÀÀ[ \
;
ÀÀ\ ]
}
ÃÃ 	
[
ŒŒ 	
HttpPost
ŒŒ	 
]
ŒŒ 
[
œœ 	&
ValidateAntiForgeryToken
œœ	 !
]
œœ! "
public
–– 
async
–– 
Task
–– 
<
–– 
IActionResult
–– '
>
––' ("
ClientPropertyDelete
––) =
(
––= >!
ClientPropertiesDto
––> Q
clientProperty
––R `
)
––` a
{
—— 	
await
““ 
_clientService
““  
.
““  !'
DeleteClientPropertyAsync
““! :
(
““: ;
clientProperty
““; I
)
““I J
;
““J K!
SuccessNotification
”” 
(
””  

_localizer
””  *
[
””* +
$str
””+ H
]
””H I
,
””I J

_localizer
””K U
[
””U V
$str
””V d
]
””d e
)
””e f
;
””f g
return
’’ 
RedirectToAction
’’ #
(
’’# $
nameof
’’$ *
(
’’* +
ClientProperties
’’+ ;
)
’’; <
,
’’< =
new
’’> A
{
’’B C
Id
’’D F
=
’’G H
clientProperty
’’I W
.
’’W X
ClientId
’’X `
}
’’a b
)
’’b c
;
’’c d
}
÷÷ 	
[
ÿÿ 	
HttpGet
ÿÿ	 
]
ÿÿ 
public
ŸŸ 
async
ŸŸ 
Task
ŸŸ 
<
ŸŸ 
IActionResult
ŸŸ '
>
ŸŸ' (
ClientSecrets
ŸŸ) 6
(
ŸŸ6 7
int
ŸŸ7 :
id
ŸŸ; =
,
ŸŸ= >
int
ŸŸ? B
?
ŸŸB C
page
ŸŸD H
)
ŸŸH I
{
⁄⁄ 	
if
€€ 
(
€€ 
id
€€ 
==
€€ 
$num
€€ 
)
€€ 
return
€€ 
NotFound
€€  (
(
€€( )
)
€€) *
;
€€* +
var
›› 
clientSecrets
›› 
=
›› 
await
››  %
_clientService
››& 4
.
››4 5#
GetClientSecretsAsync
››5 J
(
››J K
id
››K M
,
››M N
page
››O S
??
››T V
$num
››W X
)
››X Y
;
››Y Z
_clientService
ﬁﬁ 
.
ﬁﬁ )
BuildClientSecretsViewModel
ﬁﬁ 6
(
ﬁﬁ6 7
clientSecrets
ﬁﬁ7 D
)
ﬁﬁD E
;
ﬁﬁE F
return
‡‡ 
View
‡‡ 
(
‡‡ 
clientSecrets
‡‡ %
)
‡‡% &
;
‡‡& '
}
·· 	
[
„„ 	
HttpPost
„„	 
]
„„ 
[
‰‰ 	&
ValidateAntiForgeryToken
‰‰	 !
]
‰‰! "
public
ÂÂ 
async
ÂÂ 
Task
ÂÂ 
<
ÂÂ 
IActionResult
ÂÂ '
>
ÂÂ' (
ClientSecrets
ÂÂ) 6
(
ÂÂ6 7
ClientSecretsDto
ÂÂ7 G
clientSecret
ÂÂH T
)
ÂÂT U
{
ÊÊ 	
await
ÁÁ 
_clientService
ÁÁ  
.
ÁÁ  !"
AddClientSecretAsync
ÁÁ! 5
(
ÁÁ5 6
clientSecret
ÁÁ6 B
)
ÁÁB C
;
ÁÁC D!
SuccessNotification
ËË 
(
ËË  
string
ËË  &
.
ËË& '
Format
ËË' -
(
ËË- .

_localizer
ËË. 8
[
ËË8 9
$str
ËË9 Q
]
ËËQ R
,
ËËR S
clientSecret
ËËT `
.
ËË` a

ClientName
ËËa k
)
ËËk l
,
ËËl m

_localizer
ËËn x
[
ËËx y
$strËËy á
]ËËá à
)ËËà â
;ËËâ ä
return
ÍÍ 
RedirectToAction
ÍÍ #
(
ÍÍ# $
nameof
ÍÍ$ *
(
ÍÍ* +
ClientSecrets
ÍÍ+ 8
)
ÍÍ8 9
,
ÍÍ9 :
new
ÍÍ; >
{
ÍÍ? @
Id
ÍÍA C
=
ÍÍD E
clientSecret
ÍÍF R
.
ÍÍR S
ClientId
ÍÍS [
}
ÍÍ\ ]
)
ÍÍ] ^
;
ÍÍ^ _
}
ÎÎ 	
[
ÌÌ 	
HttpGet
ÌÌ	 
]
ÌÌ 
public
ÓÓ 
async
ÓÓ 
Task
ÓÓ 
<
ÓÓ 
IActionResult
ÓÓ '
>
ÓÓ' ( 
ClientSecretDelete
ÓÓ) ;
(
ÓÓ; <
int
ÓÓ< ?
id
ÓÓ@ B
)
ÓÓB C
{
ÔÔ 	
if
 
(
 
id
 
==
 
$num
 
)
 
return
 
NotFound
  (
(
( )
)
) *
;
* +
var
ÚÚ 
clientSecret
ÚÚ 
=
ÚÚ 
await
ÚÚ $
_clientService
ÚÚ% 3
.
ÚÚ3 4"
GetClientSecretAsync
ÚÚ4 H
(
ÚÚH I
id
ÚÚI K
)
ÚÚK L
;
ÚÚL M
return
ÙÙ 
View
ÙÙ 
(
ÙÙ 
nameof
ÙÙ 
(
ÙÙ  
ClientSecretDelete
ÙÙ 1
)
ÙÙ1 2
,
ÙÙ2 3
clientSecret
ÙÙ4 @
)
ÙÙ@ A
;
ÙÙA B
}
ıı 	
[
˜˜ 	
HttpPost
˜˜	 
]
˜˜ 
[
¯¯ 	&
ValidateAntiForgeryToken
¯¯	 !
]
¯¯! "
public
˘˘ 
async
˘˘ 
Task
˘˘ 
<
˘˘ 
IActionResult
˘˘ '
>
˘˘' ( 
ClientSecretDelete
˘˘) ;
(
˘˘; <
ClientSecretsDto
˘˘< L
clientSecret
˘˘M Y
)
˘˘Y Z
{
˙˙ 	
await
˚˚ 
_clientService
˚˚  
.
˚˚  !%
DeleteClientSecretAsync
˚˚! 8
(
˚˚8 9
clientSecret
˚˚9 E
)
˚˚E F
;
˚˚F G!
SuccessNotification
¸¸ 
(
¸¸  

_localizer
¸¸  *
[
¸¸* +
$str
¸¸+ F
]
¸¸F G
,
¸¸G H

_localizer
¸¸I S
[
¸¸S T
$str
¸¸T b
]
¸¸b c
)
¸¸c d
;
¸¸d e
return
˛˛ 
RedirectToAction
˛˛ #
(
˛˛# $
nameof
˛˛$ *
(
˛˛* +
ClientSecrets
˛˛+ 8
)
˛˛8 9
,
˛˛9 :
new
˛˛; >
{
˛˛? @
Id
˛˛A C
=
˛˛D E
clientSecret
˛˛F R
.
˛˛R S
ClientId
˛˛S [
}
˛˛\ ]
)
˛˛] ^
;
˛˛^ _
}
ˇˇ 	
[
ÅÅ 	
HttpGet
ÅÅ	 
]
ÅÅ 
public
ÇÇ 
async
ÇÇ 
Task
ÇÇ 
<
ÇÇ 
IActionResult
ÇÇ '
>
ÇÇ' (
SearchScopes
ÇÇ) 5
(
ÇÇ5 6
string
ÇÇ6 <
scope
ÇÇ= B
,
ÇÇB C
int
ÇÇD G
limit
ÇÇH M
=
ÇÇN O
$num
ÇÇP Q
)
ÇÇQ R
{
ÉÉ 	
var
ÑÑ 
scopes
ÑÑ 
=
ÑÑ 
await
ÑÑ 
_clientService
ÑÑ -
.
ÑÑ- .
GetScopesAsync
ÑÑ. <
(
ÑÑ< =
scope
ÑÑ= B
,
ÑÑB C
limit
ÑÑD I
)
ÑÑI J
;
ÑÑJ K
return
ÜÜ 
Ok
ÜÜ 
(
ÜÜ 
scopes
ÜÜ 
)
ÜÜ 
;
ÜÜ 
}
áá 	
[
ââ 	
HttpGet
ââ	 
]
ââ 
public
ää 
IActionResult
ää 
SearchClaims
ää )
(
ää) *
string
ää* 0
claim
ää1 6
,
ää6 7
int
ää8 ;
limit
ää< A
=
ääB C
$num
ääD E
)
ääE F
{
ãã 	
var
åå 
claims
åå 
=
åå 
_clientService
åå '
.
åå' (
GetStandardClaims
åå( 9
(
åå9 :
claim
åå: ?
,
åå? @
limit
ååA F
)
ååF G
;
ååG H
return
éé 
Ok
éé 
(
éé 
claims
éé 
)
éé 
;
éé 
}
èè 	
[
ëë 	
HttpGet
ëë	 
]
ëë 
public
íí 
IActionResult
íí 
SearchGrantTypes
íí -
(
íí- .
string
íí. 4
grant
íí5 :
,
íí: ;
int
íí< ?
limit
íí@ E
=
ííF G
$num
ííH I
)
ííI J
{
ìì 	
var
îî 
grants
îî 
=
îî 
_clientService
îî '
.
îî' (
GetGrantTypes
îî( 5
(
îî5 6
grant
îî6 ;
,
îî; <
limit
îî= B
)
îîB C
;
îîC D
return
ññ 
Ok
ññ 
(
ññ 
grants
ññ 
)
ññ 
;
ññ 
}
óó 	
[
ôô 	
HttpGet
ôô	 
]
ôô 
public
öö 
async
öö 
Task
öö 
<
öö 
IActionResult
öö '
>
öö' (
Clients
öö) 0
(
öö0 1
int
öö1 4
?
öö4 5
page
öö6 :
,
öö: ;
string
öö< B
search
ööC I
)
ööI J
{
õõ 	
ViewBag
úú 
.
úú 
Search
úú 
=
úú 
search
úú #
;
úú# $
return
ùù 
View
ùù 
(
ùù 
await
ùù 
_clientService
ùù ,
.
ùù, -
GetClientsAsync
ùù- <
(
ùù< =
search
ùù= C
,
ùùC D
page
ùùE I
??
ùùJ L
$num
ùùM N
)
ùùN O
)
ùùO P
;
ùùP Q
}
ûû 	
[
†† 	
HttpGet
††	 
]
†† 
public
°° 
async
°° 
Task
°° 
<
°° 
IActionResult
°° '
>
°°' ($
IdentityResourceDelete
°°) ?
(
°°? @
int
°°@ C
id
°°D F
)
°°F G
{
¢¢ 	
if
££ 
(
££ 
id
££ 
==
££ 
$num
££ 
)
££ 
return
££ 
NotFound
££  (
(
££( )
)
££) *
;
££* +
var
•• 
identityResource
••  
=
••! "
await
••# (&
_identityResourceService
••) A
.
••A B&
GetIdentityResourceAsync
••B Z
(
••Z [
id
••[ ]
)
••] ^
;
••^ _
return
ßß 
View
ßß 
(
ßß 
identityResource
ßß (
)
ßß( )
;
ßß) *
}
®® 	
[
™™ 	
HttpPost
™™	 
]
™™ 
[
´´ 	&
ValidateAntiForgeryToken
´´	 !
]
´´! "
public
¨¨ 
async
¨¨ 
Task
¨¨ 
<
¨¨ 
IActionResult
¨¨ '
>
¨¨' ($
IdentityResourceDelete
¨¨) ?
(
¨¨? @!
IdentityResourceDto
¨¨@ S
identityResource
¨¨T d
)
¨¨d e
{
≠≠ 	
await
ÆÆ &
_identityResourceService
ÆÆ *
.
ÆÆ* +)
DeleteIdentityResourceAsync
ÆÆ+ F
(
ÆÆF G
identityResource
ÆÆG W
)
ÆÆW X
;
ÆÆX Y!
SuccessNotification
ØØ 
(
ØØ  

_localizer
ØØ  *
[
ØØ* +
$str
ØØ+ J
]
ØØJ K
,
ØØK L

_localizer
ØØM W
[
ØØW X
$str
ØØX f
]
ØØf g
)
ØØg h
;
ØØh i
return
±± 
RedirectToAction
±± #
(
±±# $
nameof
±±$ *
(
±±* +
IdentityResources
±±+ <
)
±±< =
)
±±= >
;
±±> ?
}
≤≤ 	
[
¥¥ 	
HttpPost
¥¥	 
]
¥¥ 
[
µµ 	&
ValidateAntiForgeryToken
µµ	 !
]
µµ! "
public
∂∂ 
async
∂∂ 
Task
∂∂ 
<
∂∂ 
IActionResult
∂∂ '
>
∂∂' (
IdentityResource
∂∂) 9
(
∂∂9 :!
IdentityResourceDto
∂∂: M
identityResource
∂∂N ^
)
∂∂^ _
{
∑∑ 	
if
∏∏ 
(
∏∏ 
!
∏∏ 

ModelState
∏∏ 
.
∏∏ 
IsValid
∏∏ #
)
∏∏# $
{
ππ 
return
∫∫ 
View
∫∫ 
(
∫∫ 
identityResource
∫∫ ,
)
∫∫, -
;
∫∫- .
}
ªª 
identityResource
ΩΩ 
=
ΩΩ &
_identityResourceService
ΩΩ 7
.
ΩΩ7 8,
BuildIdentityResourceViewModel
ΩΩ8 V
(
ΩΩV W
identityResource
ΩΩW g
)
ΩΩg h
;
ΩΩh i
if
øø 
(
øø 
identityResource
øø  
.
øø  !
Id
øø! #
==
øø$ &
$num
øø' (
)
øø( )
await
øø* /&
_identityResourceService
øø0 H
.
øøH I&
AddIdentityResourceAsync
øøI a
(
øøa b
identityResource
øøb r
)
øør s
;
øøs t
else
¿¿ 
await
¿¿ &
_identityResourceService
¿¿ /
.
¿¿/ 0)
UpdateIdentityResourceAsync
¿¿0 K
(
¿¿K L
identityResource
¿¿L \
)
¿¿\ ]
;
¿¿] ^!
SuccessNotification
¬¬ 
(
¬¬  
string
¬¬  &
.
¬¬& '
Format
¬¬' -
(
¬¬- .

_localizer
¬¬. 8
[
¬¬8 9
$str
¬¬9 U
]
¬¬U V
,
¬¬V W
identityResource
¬¬X h
.
¬¬h i
Name
¬¬i m
)
¬¬m n
,
¬¬n o

_localizer
¬¬p z
[
¬¬z {
$str¬¬{ â
]¬¬â ä
)¬¬ä ã
;¬¬ã å
return
ƒƒ 
RedirectToAction
ƒƒ #
(
ƒƒ# $
nameof
ƒƒ$ *
(
ƒƒ* +
IdentityResources
ƒƒ+ <
)
ƒƒ< =
)
ƒƒ= >
;
ƒƒ> ?
}
≈≈ 	
[
«« 	
HttpPost
««	 
]
«« 
[
»» 	&
ValidateAntiForgeryToken
»»	 !
]
»»! "
public
…… 
async
…… 
Task
…… 
<
…… 
IActionResult
…… '
>
……' (
ApiResource
……) 4
(
……4 5
ApiResourceDto
……5 C
apiResource
……D O
)
……O P
{
   	
if
ÀÀ 
(
ÀÀ 
!
ÀÀ 

ModelState
ÀÀ 
.
ÀÀ 
IsValid
ÀÀ #
)
ÀÀ# $
{
ÃÃ 
return
ÕÕ 
View
ÕÕ 
(
ÕÕ 
apiResource
ÕÕ '
)
ÕÕ' (
;
ÕÕ( )
}
ŒŒ 
ComboBoxHelpers
–– 
.
–– "
PopulateValuesToList
–– 0
(
––0 1
apiResource
––1 <
.
––< =
UserClaimsItems
––= L
,
––L M
apiResource
––N Y
.
––Y Z

UserClaims
––Z d
)
––d e
;
––e f
if
““ 
(
““ 
apiResource
““ 
.
““ 
Id
““ 
==
““ !
$num
““" #
)
““# $
await
““% *!
_apiResourceService
““+ >
.
““> ?!
AddApiResourceAsync
““? R
(
““R S
apiResource
““S ^
)
““^ _
;
““_ `
else
”” 
await
”” !
_apiResourceService
”” *
.
””* +$
UpdateApiResourceAsync
””+ A
(
””A B
apiResource
””B M
)
””M N
;
””N O!
SuccessNotification
’’ 
(
’’  
string
’’  &
.
’’& '
Format
’’' -
(
’’- .

_localizer
’’. 8
[
’’8 9
$str
’’9 P
]
’’P Q
,
’’Q R
apiResource
’’S ^
.
’’^ _
Name
’’_ c
)
’’c d
,
’’d e

_localizer
’’f p
[
’’p q
$str
’’q 
]’’ Ä
)’’Ä Å
;’’Å Ç
return
◊◊ 
RedirectToAction
◊◊ #
(
◊◊# $
nameof
◊◊$ *
(
◊◊* +
ApiResources
◊◊+ 7
)
◊◊7 8
)
◊◊8 9
;
◊◊9 :
}
ÿÿ 	
[
⁄⁄ 	
HttpGet
⁄⁄	 
]
⁄⁄ 
public
€€ 
async
€€ 
Task
€€ 
<
€€ 
IActionResult
€€ '
>
€€' (
ApiResourceDelete
€€) :
(
€€: ;
int
€€; >
id
€€? A
)
€€A B
{
‹‹ 	
if
›› 
(
›› 
id
›› 
==
›› 
$num
›› 
)
›› 
return
›› 
NotFound
››  (
(
››( )
)
››) *
;
››* +
var
ﬂﬂ 
apiResource
ﬂﬂ 
=
ﬂﬂ 
await
ﬂﬂ #!
_apiResourceService
ﬂﬂ$ 7
.
ﬂﬂ7 8!
GetApiResourceAsync
ﬂﬂ8 K
(
ﬂﬂK L
id
ﬂﬂL N
)
ﬂﬂN O
;
ﬂﬂO P
return
·· 
View
·· 
(
·· 
apiResource
·· #
)
··# $
;
··$ %
}
‚‚ 	
[
‰‰ 	
HttpPost
‰‰	 
]
‰‰ 
[
ÂÂ 	&
ValidateAntiForgeryToken
ÂÂ	 !
]
ÂÂ! "
public
ÊÊ 
async
ÊÊ 
Task
ÊÊ 
<
ÊÊ 
IActionResult
ÊÊ '
>
ÊÊ' (
ApiResourceDelete
ÊÊ) :
(
ÊÊ: ;
ApiResourceDto
ÊÊ; I
apiResource
ÊÊJ U
)
ÊÊU V
{
ÁÁ 	
await
ËË !
_apiResourceService
ËË %
.
ËË% &$
DeleteApiResourceAsync
ËË& <
(
ËË< =
apiResource
ËË= H
)
ËËH I
;
ËËI J!
SuccessNotification
ÈÈ 
(
ÈÈ  

_localizer
ÈÈ  *
[
ÈÈ* +
$str
ÈÈ+ E
]
ÈÈE F
,
ÈÈF G

_localizer
ÈÈH R
[
ÈÈR S
$str
ÈÈS a
]
ÈÈa b
)
ÈÈb c
;
ÈÈc d
return
ÎÎ 
RedirectToAction
ÎÎ #
(
ÎÎ# $
nameof
ÎÎ$ *
(
ÎÎ* +
ApiResources
ÎÎ+ 7
)
ÎÎ7 8
)
ÎÎ8 9
;
ÎÎ9 :
}
ÏÏ 	
[
ÓÓ 	
HttpGet
ÓÓ	 
]
ÓÓ 
[
ÔÔ 	
Route
ÔÔ	 
(
ÔÔ 
$str
ÔÔ &
)
ÔÔ& '
]
ÔÔ' (
[
 	
Route
	 
(
 
$str
 /
)
/ 0
]
0 1
public
ÒÒ 
async
ÒÒ 
Task
ÒÒ 
<
ÒÒ 
IActionResult
ÒÒ '
>
ÒÒ' (
ApiResource
ÒÒ) 4
(
ÒÒ4 5
int
ÒÒ5 8
id
ÒÒ9 ;
)
ÒÒ; <
{
ÚÚ 	
if
ÛÛ 
(
ÛÛ 
id
ÛÛ 
==
ÛÛ 
$num
ÛÛ 
)
ÛÛ 
{
ÙÙ 
var
ıı 
apiResourceDto
ıı "
=
ıı# $
new
ıı% (
ApiResourceDto
ıı) 7
(
ıı7 8
)
ıı8 9
;
ıı9 :
return
ˆˆ 
View
ˆˆ 
(
ˆˆ 
apiResourceDto
ˆˆ *
)
ˆˆ* +
;
ˆˆ+ ,
}
˜˜ 
var
˘˘ 
apiResource
˘˘ 
=
˘˘ 
await
˘˘ #!
_apiResourceService
˘˘$ 7
.
˘˘7 8!
GetApiResourceAsync
˘˘8 K
(
˘˘K L
id
˘˘L N
)
˘˘N O
;
˘˘O P
return
˚˚ 
View
˚˚ 
(
˚˚ 
apiResource
˚˚ #
)
˚˚# $
;
˚˚$ %
}
¸¸ 	
[
˛˛ 	
HttpGet
˛˛	 
]
˛˛ 
public
ˇˇ 
async
ˇˇ 
Task
ˇˇ 
<
ˇˇ 
IActionResult
ˇˇ '
>
ˇˇ' (

ApiSecrets
ˇˇ) 3
(
ˇˇ3 4
int
ˇˇ4 7
id
ˇˇ8 :
,
ˇˇ: ;
int
ˇˇ< ?
?
ˇˇ? @
page
ˇˇA E
)
ˇˇE F
{
ÄÄ 	
if
ÅÅ 
(
ÅÅ 
id
ÅÅ 
==
ÅÅ 
$num
ÅÅ 
)
ÅÅ 
return
ÅÅ 
NotFound
ÅÅ  (
(
ÅÅ( )
)
ÅÅ) *
;
ÅÅ* +
var
ÉÉ 

apiSecrets
ÉÉ 
=
ÉÉ 
await
ÉÉ "!
_apiResourceService
ÉÉ# 6
.
ÉÉ6 7 
GetApiSecretsAsync
ÉÉ7 I
(
ÉÉI J
id
ÉÉJ L
,
ÉÉL M
page
ÉÉN R
??
ÉÉS U
$num
ÉÉV W
)
ÉÉW X
;
ÉÉX Y!
_apiResourceService
ÑÑ 
.
ÑÑ  &
BuildApiSecretsViewModel
ÑÑ  8
(
ÑÑ8 9

apiSecrets
ÑÑ9 C
)
ÑÑC D
;
ÑÑD E
return
ÜÜ 
View
ÜÜ 
(
ÜÜ 

apiSecrets
ÜÜ "
)
ÜÜ" #
;
ÜÜ# $
}
áá 	
[
ââ 	
HttpPost
ââ	 
]
ââ 
[
ää 	&
ValidateAntiForgeryToken
ää	 !
]
ää! "
public
ãã 
async
ãã 
Task
ãã 
<
ãã 
IActionResult
ãã '
>
ãã' (

ApiSecrets
ãã) 3
(
ãã3 4
ApiSecretsDto
ãã4 A
	apiSecret
ããB K
)
ããK L
{
åå 	
if
çç 
(
çç 
!
çç 

ModelState
çç 
.
çç 
IsValid
çç #
)
çç# $
{
éé 
return
èè 
View
èè 
(
èè 
	apiSecret
èè %
)
èè% &
;
èè& '
}
êê 
await
íí !
_apiResourceService
íí %
.
íí% &
AddApiSecretAsync
íí& 7
(
íí7 8
	apiSecret
íí8 A
)
ííA B
;
ííB C!
SuccessNotification
ìì 
(
ìì  

_localizer
ìì  *
[
ìì* +
$str
ìì+ @
]
ìì@ A
,
ììA B

_localizer
ììC M
[
ììM N
$str
ììN \
]
ìì\ ]
)
ìì] ^
;
ìì^ _
return
ïï 
RedirectToAction
ïï #
(
ïï# $
nameof
ïï$ *
(
ïï* +

ApiSecrets
ïï+ 5
)
ïï5 6
,
ïï6 7
new
ïï8 ;
{
ïï< =
Id
ïï> @
=
ïïA B
	apiSecret
ïïC L
.
ïïL M
ApiResourceId
ïïM Z
}
ïï[ \
)
ïï\ ]
;
ïï] ^
}
ññ 	
[
òò 	
HttpGet
òò	 
]
òò 
public
ôô 
async
ôô 
Task
ôô 
<
ôô 
IActionResult
ôô '
>
ôô' (
	ApiScopes
ôô) 2
(
ôô2 3
int
ôô3 6
id
ôô7 9
,
ôô9 :
int
ôô; >
?
ôô> ?
page
ôô@ D
,
ôôD E
int
ôôF I
?
ôôI J
scope
ôôK P
)
ôôP Q
{
öö 	
if
õõ 
(
õõ 
id
õõ 
==
õõ 
$num
õõ 
||
õõ 
!
õõ 

ModelState
õõ &
.
õõ& '
IsValid
õõ' .
)
õõ. /
return
õõ0 6
NotFound
õõ7 ?
(
õõ? @
)
õõ@ A
;
õõA B
if
ùù 
(
ùù 
scope
ùù 
==
ùù 
null
ùù 
)
ùù 
{
ûû 
var
üü 
apiScopesDto
üü  
=
üü! "
await
üü# (!
_apiResourceService
üü) <
.
üü< =
GetApiScopesAsync
üü= N
(
üüN O
id
üüO Q
,
üüQ R
page
üüS W
??
üüX Z
$num
üü[ \
)
üü\ ]
;
üü] ^
return
°° 
View
°° 
(
°° 
apiScopesDto
°° (
)
°°( )
;
°°) *
}
¢¢ 
else
££ 
{
§§ 
var
•• 
apiScopesDto
••  
=
••! "
await
••# (!
_apiResourceService
••) <
.
••< =
GetApiScopeAsync
••= M
(
••M N
id
••N P
,
••P Q
scope
••R W
.
••W X
Value
••X ]
)
••] ^
;
••^ _
return
¶¶ 
View
¶¶ 
(
¶¶ 
apiScopesDto
¶¶ (
)
¶¶( )
;
¶¶) *
}
ßß 
}
®® 	
[
™™ 	
HttpPost
™™	 
]
™™ 
[
´´ 	&
ValidateAntiForgeryToken
´´	 !
]
´´! "
public
¨¨ 
async
¨¨ 
Task
¨¨ 
<
¨¨ 
IActionResult
¨¨ '
>
¨¨' (
	ApiScopes
¨¨) 2
(
¨¨2 3
ApiScopesDto
¨¨3 ?
apiScope
¨¨@ H
)
¨¨H I
{
≠≠ 	
if
ÆÆ 
(
ÆÆ 
!
ÆÆ 

ModelState
ÆÆ 
.
ÆÆ 
IsValid
ÆÆ #
)
ÆÆ# $
{
ØØ 
return
∞∞ 
View
∞∞ 
(
∞∞ 
apiScope
∞∞ $
)
∞∞$ %
;
∞∞% &
}
±± !
_apiResourceService
≥≥ 
.
≥≥  $
BuildApiScopeViewModel
≥≥  6
(
≥≥6 7
apiScope
≥≥7 ?
)
≥≥? @
;
≥≥@ A
if
µµ 
(
µµ 
apiScope
µµ 
.
µµ 

ApiScopeId
µµ #
==
µµ$ &
$num
µµ' (
)
µµ( )
await
µµ* /!
_apiResourceService
µµ0 C
.
µµC D
AddApiScopeAsync
µµD T
(
µµT U
apiScope
µµU ]
)
µµ] ^
;
µµ^ _
else
∂∂ 
await
∂∂ !
_apiResourceService
∂∂ *
.
∂∂* +!
UpdateApiScopeAsync
∂∂+ >
(
∂∂> ?
apiScope
∂∂? G
)
∂∂G H
;
∂∂H I!
SuccessNotification
∏∏ 
(
∏∏  
string
∏∏  &
.
∏∏& '
Format
∏∏' -
(
∏∏- .

_localizer
∏∏. 8
[
∏∏8 9
$str
∏∏9 M
]
∏∏M N
,
∏∏N O
apiScope
∏∏P X
.
∏∏X Y
Name
∏∏Y ]
)
∏∏] ^
,
∏∏^ _

_localizer
∏∏` j
[
∏∏j k
$str
∏∏k y
]
∏∏y z
)
∏∏z {
;
∏∏{ |
return
∫∫ 
RedirectToAction
∫∫ #
(
∫∫# $
nameof
∫∫$ *
(
∫∫* +
	ApiScopes
∫∫+ 4
)
∫∫4 5
)
∫∫5 6
;
∫∫6 7
}
ªª 	
[
ΩΩ 	
HttpGet
ΩΩ	 
]
ΩΩ 
public
ææ 
async
ææ 
Task
ææ 
<
ææ 
IActionResult
ææ '
>
ææ' (
ApiScopeDelete
ææ) 7
(
ææ7 8
int
ææ8 ;
id
ææ< >
,
ææ> ?
int
ææ@ C
scope
ææD I
)
ææI J
{
øø 	
if
¿¿ 
(
¿¿ 
id
¿¿ 
==
¿¿ 
$num
¿¿ 
||
¿¿ 
scope
¿¿  
==
¿¿! #
$num
¿¿$ %
)
¿¿% &
return
¿¿' -
NotFound
¿¿. 6
(
¿¿6 7
)
¿¿7 8
;
¿¿8 9
var
¬¬ 
apiScope
¬¬ 
=
¬¬ 
await
¬¬  !
_apiResourceService
¬¬! 4
.
¬¬4 5
GetApiScopeAsync
¬¬5 E
(
¬¬E F
id
¬¬F H
,
¬¬H I
scope
¬¬J O
)
¬¬O P
;
¬¬P Q
return
ƒƒ 
View
ƒƒ 
(
ƒƒ 
nameof
ƒƒ 
(
ƒƒ 
ApiScopeDelete
ƒƒ -
)
ƒƒ- .
,
ƒƒ. /
apiScope
ƒƒ0 8
)
ƒƒ8 9
;
ƒƒ9 :
}
≈≈ 	
[
«« 	
HttpPost
««	 
]
«« 
[
»» 	&
ValidateAntiForgeryToken
»»	 !
]
»»! "
public
…… 
async
…… 
Task
…… 
<
…… 
IActionResult
…… '
>
……' (
ApiScopeDelete
……) 7
(
……7 8
ApiScopesDto
……8 D
apiScope
……E M
)
……M N
{
   	
await
ÀÀ !
_apiResourceService
ÀÀ %
.
ÀÀ% &!
DeleteApiScopeAsync
ÀÀ& 9
(
ÀÀ9 :
apiScope
ÀÀ: B
)
ÀÀB C
;
ÀÀC D!
SuccessNotification
ÃÃ 
(
ÃÃ  

_localizer
ÃÃ  *
[
ÃÃ* +
$str
ÃÃ+ B
]
ÃÃB C
,
ÃÃC D

_localizer
ÃÃE O
[
ÃÃO P
$str
ÃÃP ^
]
ÃÃ^ _
)
ÃÃ_ `
;
ÃÃ` a
return
ŒŒ 
RedirectToAction
ŒŒ #
(
ŒŒ# $
nameof
ŒŒ$ *
(
ŒŒ* +
	ApiScopes
ŒŒ+ 4
)
ŒŒ4 5
,
ŒŒ5 6
new
ŒŒ7 :
{
ŒŒ; <
Id
ŒŒ= ?
=
ŒŒ@ A
apiScope
ŒŒB J
.
ŒŒJ K
ApiResourceId
ŒŒK X
}
ŒŒY Z
)
ŒŒZ [
;
ŒŒ[ \
}
œœ 	
[
—— 	
HttpGet
——	 
]
—— 
public
““ 
async
““ 
Task
““ 
<
““ 
IActionResult
““ '
>
““' (
ApiResources
““) 5
(
““5 6
int
““6 9
?
““9 :
page
““; ?
,
““? @
string
““A G
search
““H N
)
““N O
{
”” 	
ViewBag
‘‘ 
.
‘‘ 
Search
‘‘ 
=
‘‘ 
search
‘‘ #
;
‘‘# $
var
’’ 
apiResources
’’ 
=
’’ 
await
’’ $!
_apiResourceService
’’% 8
.
’’8 9"
GetApiResourcesAsync
’’9 M
(
’’M N
search
’’N T
,
’’T U
page
’’V Z
??
’’[ ]
$num
’’^ _
)
’’_ `
;
’’` a
return
◊◊ 
View
◊◊ 
(
◊◊ 
apiResources
◊◊ $
)
◊◊$ %
;
◊◊% &
}
ÿÿ 	
[
⁄⁄ 	
HttpGet
⁄⁄	 
]
⁄⁄ 
public
€€ 
async
€€ 
Task
€€ 
<
€€ 
IActionResult
€€ '
>
€€' (
IdentityResources
€€) :
(
€€: ;
int
€€; >
?
€€> ?
page
€€@ D
,
€€D E
string
€€F L
search
€€M S
)
€€S T
{
‹‹ 	
ViewBag
›› 
.
›› 
Search
›› 
=
›› 
search
›› #
;
››# $
var
ﬁﬁ "
identityResourcesDto
ﬁﬁ $
=
ﬁﬁ% &
await
ﬁﬁ' ,&
_identityResourceService
ﬁﬁ- E
.
ﬁﬁE F'
GetIdentityResourcesAsync
ﬁﬁF _
(
ﬁﬁ_ `
search
ﬁﬁ` f
,
ﬁﬁf g
page
ﬁﬁh l
??
ﬁﬁm o
$num
ﬁﬁp q
)
ﬁﬁq r
;
ﬁﬁr s
return
‡‡ 
View
‡‡ 
(
‡‡ "
identityResourcesDto
‡‡ ,
)
‡‡, -
;
‡‡- .
}
·· 	
[
„„ 	
HttpGet
„„	 
]
„„ 
public
‰‰ 
async
‰‰ 
Task
‰‰ 
<
‰‰ 
IActionResult
‰‰ '
>
‰‰' (
ApiSecretDelete
‰‰) 8
(
‰‰8 9
int
‰‰9 <
id
‰‰= ?
)
‰‰? @
{
ÂÂ 	
if
ÊÊ 
(
ÊÊ 
id
ÊÊ 
==
ÊÊ 
$num
ÊÊ 
)
ÊÊ 
return
ÊÊ 
NotFound
ÊÊ  (
(
ÊÊ( )
)
ÊÊ) *
;
ÊÊ* +
var
ËË 
clientSecret
ËË 
=
ËË 
await
ËË $!
_apiResourceService
ËË% 8
.
ËË8 9
GetApiSecretAsync
ËË9 J
(
ËËJ K
id
ËËK M
)
ËËM N
;
ËËN O
return
ÍÍ 
View
ÍÍ 
(
ÍÍ 
nameof
ÍÍ 
(
ÍÍ 
ApiSecretDelete
ÍÍ .
)
ÍÍ. /
,
ÍÍ/ 0
clientSecret
ÍÍ1 =
)
ÍÍ= >
;
ÍÍ> ?
}
ÎÎ 	
[
ÌÌ 	
HttpPost
ÌÌ	 
]
ÌÌ 
[
ÓÓ 	&
ValidateAntiForgeryToken
ÓÓ	 !
]
ÓÓ! "
public
ÔÔ 
async
ÔÔ 
Task
ÔÔ 
<
ÔÔ 
IActionResult
ÔÔ '
>
ÔÔ' (
ApiSecretDelete
ÔÔ) 8
(
ÔÔ8 9
ApiSecretsDto
ÔÔ9 F
	apiSecret
ÔÔG P
)
ÔÔP Q
{
 	
await
ÒÒ !
_apiResourceService
ÒÒ %
.
ÒÒ% &"
DeleteApiSecretAsync
ÒÒ& :
(
ÒÒ: ;
	apiSecret
ÒÒ; D
)
ÒÒD E
;
ÒÒE F!
SuccessNotification
ÚÚ 
(
ÚÚ  

_localizer
ÚÚ  *
[
ÚÚ* +
$str
ÚÚ+ C
]
ÚÚC D
,
ÚÚD E

_localizer
ÚÚF P
[
ÚÚP Q
$str
ÚÚQ _
]
ÚÚ_ `
)
ÚÚ` a
;
ÚÚa b
return
ÙÙ 
RedirectToAction
ÙÙ #
(
ÙÙ# $
nameof
ÙÙ$ *
(
ÙÙ* +

ApiSecrets
ÙÙ+ 5
)
ÙÙ5 6
,
ÙÙ6 7
new
ÙÙ8 ;
{
ÙÙ< =
Id
ÙÙ> @
=
ÙÙA B
	apiSecret
ÙÙC L
.
ÙÙL M
ApiResourceId
ÙÙM Z
}
ÙÙ[ \
)
ÙÙ\ ]
;
ÙÙ] ^
}
ıı 	
[
˜˜ 	
HttpGet
˜˜	 
]
˜˜ 
[
¯¯ 	
Route
¯¯	 
(
¯¯ 
$str
¯¯ &
)
¯¯& '
]
¯¯' (
[
˘˘ 	
Route
˘˘	 
(
˘˘ 
$str
˘˘ /
)
˘˘/ 0
]
˘˘0 1
public
˙˙ 
async
˙˙ 
Task
˙˙ 
<
˙˙ 
IActionResult
˙˙ '
>
˙˙' (
IdentityResource
˙˙) 9
(
˙˙9 :
int
˙˙: =
id
˙˙> @
)
˙˙@ A
{
˚˚ 	
if
¸¸ 
(
¸¸ 
id
¸¸ 
==
¸¸ 
$num
¸¸ 
)
¸¸ 
{
˝˝ 
var
˛˛ !
identityResourceDto
˛˛ '
=
˛˛( )
new
˛˛* -!
IdentityResourceDto
˛˛. A
(
˛˛A B
)
˛˛B C
;
˛˛C D
return
ˇˇ 
View
ˇˇ 
(
ˇˇ !
identityResourceDto
ˇˇ /
)
ˇˇ/ 0
;
ˇˇ0 1
}
ÄÄ 
var
ÇÇ 
identityResource
ÇÇ  
=
ÇÇ! "
await
ÇÇ# (&
_identityResourceService
ÇÇ) A
.
ÇÇA B&
GetIdentityResourceAsync
ÇÇB Z
(
ÇÇZ [
id
ÇÇ[ ]
)
ÇÇ] ^
;
ÇÇ^ _
return
ÑÑ 
View
ÑÑ 
(
ÑÑ 
identityResource
ÑÑ (
)
ÑÑ( )
;
ÑÑ) *
}
ÖÖ 	
}
ÜÜ 
}áá Æ5
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
}SS ≥
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
}.. Üû
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
ÅÅ 
	userRoles
ÅÅ 
=
ÅÅ 
await
ÅÅ !
_identityService
ÅÅ" 2
.
ÅÅ2 3%
BuildUserRolesViewModel
ÅÅ3 J
(
ÅÅJ K
id
ÅÅK M
,
ÅÅM N
page
ÅÅO S
)
ÅÅS T
;
ÅÅT U
return
ÉÉ 
View
ÉÉ 
(
ÉÉ 
	userRoles
ÉÉ !
)
ÉÉ! "
;
ÉÉ" #
}
ÑÑ 	
[
ÜÜ 	
HttpPost
ÜÜ	 
]
ÜÜ 
[
áá 	&
ValidateAntiForgeryToken
áá	 !
]
áá! "
public
àà 
async
àà 
Task
àà 
<
àà 
IActionResult
àà '
>
àà' (
	UserRoles
àà) 2
(
àà2 3
UserRolesDto
àà3 ?
role
àà@ D
)
ààD E
{
ââ 	
await
ää 
_identityService
ää "
.
ää" #!
CreateUserRoleAsync
ää# 6
(
ää6 7
role
ää7 ;
)
ää; <
;
ää< =!
SuccessNotification
ãã 
(
ãã  

_localizer
ãã  *
[
ãã* +
$str
ãã+ B
]
ããB C
,
ããC D

_localizer
ããE O
[
ããO P
$str
ããP ^
]
ãã^ _
)
ãã_ `
;
ãã` a
return
çç 
RedirectToAction
çç #
(
çç# $
nameof
çç$ *
(
çç* +
	UserRoles
çç+ 4
)
çç4 5
,
çç5 6
new
çç7 :
{
çç; <
Id
çç= ?
=
çç@ A
role
ççB F
.
ççF G
UserId
ççG M
}
ççN O
)
ççO P
;
ççP Q
}
éé 	
[
êê 	
HttpGet
êê	 
]
êê 
public
ëë 
async
ëë 
Task
ëë 
<
ëë 
IActionResult
ëë '
>
ëë' (
UserRolesDelete
ëë) 8
(
ëë8 9
int
ëë9 <
id
ëë= ?
,
ëë? @
int
ëëA D
roleId
ëëE K
)
ëëK L
{
íí 	
await
ìì 
_identityService
ìì "
.
ìì" #
ExistsUserAsync
ìì# 2
(
ìì2 3
id
ìì3 5
)
ìì5 6
;
ìì6 7
await
îî 
_identityService
îî "
.
îî" #
ExistsRoleAsync
îî# 2
(
îî2 3
roleId
îî3 9
)
îî9 :
;
îî: ;
var
ññ 
roles
ññ 
=
ññ 
await
ññ 
_identityService
ññ .
.
ññ. /
GetRolesAsync
ññ/ <
(
ññ< =
)
ññ= >
;
ññ> ?
var
òò 
rolesDto
òò 
=
òò 
new
òò 
UserRolesDto
òò +
{
ôô 
UserId
öö 
=
öö 
id
öö 
,
öö 
	RolesList
õõ 
=
õõ 
roles
õõ !
.
õõ! "
Select
õõ" (
(
õõ( )
x
õõ) *
=>
õõ+ -
new
õõ. 1

SelectItem
õõ2 <
(
õõ< =
x
õõ= >
.
õõ> ?
Id
õõ? A
.
õõA B
ToString
õõB J
(
õõJ K
)
õõK L
,
õõL M
x
õõN O
.
õõO P
Name
õõP T
)
õõT U
)
õõU V
.
õõV W
ToList
õõW ]
(
õõ] ^
)
õõ^ _
,
õõ_ `
RoleId
úú 
=
úú 
roleId
úú 
}
ùù 
;
ùù 
return
üü 
View
üü 
(
üü 
rolesDto
üü  
)
üü  !
;
üü! "
}
†† 	
[
¢¢ 	
HttpPost
¢¢	 
]
¢¢ 
[
££ 	&
ValidateAntiForgeryToken
££	 !
]
££! "
public
§§ 
async
§§ 
Task
§§ 
<
§§ 
IActionResult
§§ '
>
§§' (
UserRolesDelete
§§) 8
(
§§8 9
UserRolesDto
§§9 E
role
§§F J
)
§§J K
{
•• 	
await
¶¶ 
_identityService
¶¶ "
.
¶¶" #!
DeleteUserRoleAsync
¶¶# 6
(
¶¶6 7
role
¶¶7 ;
)
¶¶; <
;
¶¶< =!
SuccessNotification
ßß 
(
ßß  

_localizer
ßß  *
[
ßß* +
$str
ßß+ B
]
ßßB C
,
ßßC D

_localizer
ßßE O
[
ßßO P
$str
ßßP ^
]
ßß^ _
)
ßß_ `
;
ßß` a
return
©© 
RedirectToAction
©© #
(
©©# $
nameof
©©$ *
(
©©* +
	UserRoles
©©+ 4
)
©©4 5
,
©©5 6
new
©©7 :
{
©©; <
Id
©©= ?
=
©©@ A
role
©©B F
.
©©F G
UserId
©©G M
}
©©N O
)
©©O P
;
©©P Q
}
™™ 	
[
¨¨ 	
HttpPost
¨¨	 
]
¨¨ 
[
≠≠ 	&
ValidateAntiForgeryToken
≠≠	 !
]
≠≠! "
public
ÆÆ 
async
ÆÆ 
Task
ÆÆ 
<
ÆÆ 
IActionResult
ÆÆ '
>
ÆÆ' (

UserClaims
ÆÆ) 3
(
ÆÆ3 4
UserClaimsDto
ÆÆ4 A
claim
ÆÆB G
)
ÆÆG H
{
ØØ 	
if
∞∞ 
(
∞∞ 
!
∞∞ 

ModelState
∞∞ 
.
∞∞ 
IsValid
∞∞ #
)
∞∞# $
{
±± 
return
≤≤ 
View
≤≤ 
(
≤≤ 
claim
≤≤ !
)
≤≤! "
;
≤≤" #
}
≥≥ 
await
µµ 
_identityService
µµ "
.
µµ" ##
CreateUserClaimsAsync
µµ# 8
(
µµ8 9
claim
µµ9 >
)
µµ> ?
;
µµ? @!
SuccessNotification
∂∂ 
(
∂∂  
string
∂∂  &
.
∂∂& '
Format
∂∂' -
(
∂∂- .

_localizer
∂∂. 8
[
∂∂8 9
$str
∂∂9 R
]
∂∂R S
,
∂∂S T
claim
∂∂U Z
.
∂∂Z [
	ClaimType
∂∂[ d
,
∂∂d e
claim
∂∂f k
.
∂∂k l

ClaimValue
∂∂l v
)
∂∂v w
,
∂∂w x

_localizer∂∂y É
[∂∂É Ñ
$str∂∂Ñ í
]∂∂í ì
)∂∂ì î
;∂∂î ï
return
∏∏ 
RedirectToAction
∏∏ #
(
∏∏# $
nameof
∏∏$ *
(
∏∏* +

UserClaims
∏∏+ 5
)
∏∏5 6
,
∏∏6 7
new
∏∏8 ;
{
∏∏< =
Id
∏∏> @
=
∏∏A B
claim
∏∏C H
.
∏∏H I
UserId
∏∏I O
}
∏∏P Q
)
∏∏Q R
;
∏∏R S
}
ππ 	
[
ªª 	
HttpGet
ªª	 
]
ªª 
public
ºº 
async
ºº 
Task
ºº 
<
ºº 
IActionResult
ºº '
>
ºº' (

UserClaims
ºº) 3
(
ºº3 4
int
ºº4 7
id
ºº8 :
,
ºº: ;
int
ºº< ?
?
ºº? @
page
ººA E
)
ººE F
{
ΩΩ 	
if
ææ 
(
ææ 
id
ææ 
==
ææ 
$num
ææ 
)
ææ 
return
ææ 
NotFound
ææ  (
(
ææ( )
)
ææ) *
;
ææ* +
var
¿¿ 
claims
¿¿ 
=
¿¿ 
await
¿¿ 
_identityService
¿¿ /
.
¿¿/ 0 
GetUserClaimsAsync
¿¿0 B
(
¿¿B C
id
¿¿C E
,
¿¿E F
page
¿¿G K
??
¿¿L N
$num
¿¿O P
)
¿¿P Q
;
¿¿Q R
claims
¡¡ 
.
¡¡ 
UserId
¡¡ 
=
¡¡ 
id
¡¡ 
;
¡¡ 
return
√√ 
View
√√ 
(
√√ 
claims
√√ 
)
√√ 
;
√√  
}
ƒƒ 	
[
∆∆ 	
HttpGet
∆∆	 
]
∆∆ 
public
«« 
async
«« 
Task
«« 
<
«« 
IActionResult
«« '
>
««' (
UserClaimsDelete
««) 9
(
««9 :
int
««: =
id
««> @
,
««@ A
int
««B E
claimId
««F M
)
««M N
{
»» 	
if
…… 
(
…… 
id
…… 
==
…… 
$num
…… 
||
…… 
claimId
…… "
==
……# %
$num
……& '
)
……' (
return
……) /
NotFound
……0 8
(
……8 9
)
……9 :
;
……: ;
var
ÀÀ 
claim
ÀÀ 
=
ÀÀ 
await
ÀÀ 
_identityService
ÀÀ .
.
ÀÀ. /
GetUserClaimAsync
ÀÀ/ @
(
ÀÀ@ A
id
ÀÀA C
,
ÀÀC D
claimId
ÀÀE L
)
ÀÀL M
;
ÀÀM N
if
ÃÃ 
(
ÃÃ 
claim
ÃÃ 
==
ÃÃ 
null
ÃÃ 
)
ÃÃ 
return
ÃÃ %
NotFound
ÃÃ& .
(
ÃÃ. /
)
ÃÃ/ 0
;
ÃÃ0 1
return
ŒŒ 
View
ŒŒ 
(
ŒŒ 
claim
ŒŒ 
)
ŒŒ 
;
ŒŒ 
}
œœ 	
[
—— 	
HttpPost
——	 
]
—— 
[
““ 	&
ValidateAntiForgeryToken
““	 !
]
““! "
public
”” 
async
”” 
Task
”” 
<
”” 
IActionResult
”” '
>
””' (
UserClaimsDelete
””) 9
(
””9 :
UserClaimsDto
””: G
claim
””H M
)
””M N
{
‘‘ 	
await
’’ 
_identityService
’’ "
.
’’" ##
DeleteUserClaimsAsync
’’# 8
(
’’8 9
claim
’’9 >
)
’’> ?
;
’’? @!
SuccessNotification
÷÷ 
(
÷÷  

_localizer
÷÷  *
[
÷÷* +
$str
÷÷+ D
]
÷÷D E
,
÷÷E F

_localizer
÷÷G Q
[
÷÷Q R
$str
÷÷R `
]
÷÷` a
)
÷÷a b
;
÷÷b c
return
ÿÿ 
RedirectToAction
ÿÿ #
(
ÿÿ# $
nameof
ÿÿ$ *
(
ÿÿ* +

UserClaims
ÿÿ+ 5
)
ÿÿ5 6
,
ÿÿ6 7
new
ÿÿ8 ;
{
ÿÿ< =
Id
ÿÿ> @
=
ÿÿA B
claim
ÿÿC H
.
ÿÿH I
UserId
ÿÿI O
}
ÿÿP Q
)
ÿÿQ R
;
ÿÿR S
}
ŸŸ 	
[
€€ 	
HttpGet
€€	 
]
€€ 
public
‹‹ 
async
‹‹ 
Task
‹‹ 
<
‹‹ 
IActionResult
‹‹ '
>
‹‹' (
UserProviders
‹‹) 6
(
‹‹6 7
int
‹‹7 :
id
‹‹; =
)
‹‹= >
{
›› 	
if
ﬁﬁ 
(
ﬁﬁ 
id
ﬁﬁ 
==
ﬁﬁ 
$num
ﬁﬁ 
)
ﬁﬁ 
return
ﬁﬁ 
NotFound
ﬁﬁ  (
(
ﬁﬁ( )
)
ﬁﬁ) *
;
ﬁﬁ* +
var
‡‡ 
	providers
‡‡ 
=
‡‡ 
await
‡‡ !
_identityService
‡‡" 2
.
‡‡2 3#
GetUserProvidersAsync
‡‡3 H
(
‡‡H I
id
‡‡I K
)
‡‡K L
;
‡‡L M
return
‚‚ 
View
‚‚ 
(
‚‚ 
	providers
‚‚ !
)
‚‚! "
;
‚‚" #
}
„„ 	
[
ÂÂ 	
HttpGet
ÂÂ	 
]
ÂÂ 
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
ÊÊ' (!
UserProvidersDelete
ÊÊ) <
(
ÊÊ< =
int
ÊÊ= @
id
ÊÊA C
,
ÊÊC D
string
ÊÊE K
providerKey
ÊÊL W
)
ÊÊW X
{
ÁÁ 	
if
ËË 
(
ËË 
id
ËË 
==
ËË 
$num
ËË 
||
ËË 
string
ËË !
.
ËË! "
IsNullOrEmpty
ËË" /
(
ËË/ 0
providerKey
ËË0 ;
)
ËË; <
)
ËË< =
return
ËË> D
NotFound
ËËE M
(
ËËM N
)
ËËN O
;
ËËO P
var
ÍÍ 
provider
ÍÍ 
=
ÍÍ 
await
ÍÍ  
_identityService
ÍÍ! 1
.
ÍÍ1 2"
GetUserProviderAsync
ÍÍ2 F
(
ÍÍF G
id
ÍÍG I
,
ÍÍI J
providerKey
ÍÍK V
)
ÍÍV W
;
ÍÍW X
if
ÎÎ 
(
ÎÎ 
provider
ÎÎ 
==
ÎÎ 
null
ÎÎ  
)
ÎÎ  !
return
ÎÎ" (
NotFound
ÎÎ) 1
(
ÎÎ1 2
)
ÎÎ2 3
;
ÎÎ3 4
return
ÌÌ 
View
ÌÌ 
(
ÌÌ 
provider
ÌÌ  
)
ÌÌ  !
;
ÌÌ! "
}
ÓÓ 	
[
 	
HttpPost
	 
]
 
[
ÒÒ 	&
ValidateAntiForgeryToken
ÒÒ	 !
]
ÒÒ! "
public
ÚÚ 
async
ÚÚ 
Task
ÚÚ 
<
ÚÚ 
IActionResult
ÚÚ '
>
ÚÚ' (!
UserProvidersDelete
ÚÚ) <
(
ÚÚ< =
UserProviderDto
ÚÚ= L
provider
ÚÚM U
)
ÚÚU V
{
ÛÛ 	
await
ÙÙ 
_identityService
ÙÙ "
.
ÙÙ" #&
DeleteUserProvidersAsync
ÙÙ# ;
(
ÙÙ; <
provider
ÙÙ< D
)
ÙÙD E
;
ÙÙE F!
SuccessNotification
ıı 
(
ıı  

_localizer
ıı  *
[
ıı* +
$str
ıı+ G
]
ııG H
,
ııH I

_localizer
ııJ T
[
ııT U
$str
ııU c
]
ııc d
)
ııd e
;
ııe f
return
˜˜ 
RedirectToAction
˜˜ #
(
˜˜# $
nameof
˜˜$ *
(
˜˜* +
UserProviders
˜˜+ 8
)
˜˜8 9
,
˜˜9 :
new
˜˜; >
{
˜˜? @
Id
˜˜A C
=
˜˜D E
provider
˜˜F N
.
˜˜N O
UserId
˜˜O U
}
˜˜V W
)
˜˜W X
;
˜˜X Y
}
¯¯ 	
[
˙˙ 	
HttpGet
˙˙	 
]
˙˙ 
public
˚˚ 
async
˚˚ 
Task
˚˚ 
<
˚˚ 
IActionResult
˚˚ '
>
˚˚' ( 
UserChangePassword
˚˚) ;
(
˚˚; <
int
˚˚< ?
id
˚˚@ B
)
˚˚B C
{
¸¸ 	
if
˝˝ 
(
˝˝ 
id
˝˝ 
==
˝˝ 
$num
˝˝ 
)
˝˝ 
return
˝˝ 
NotFound
˝˝  (
(
˝˝( )
)
˝˝) *
;
˝˝* +
var
ˇˇ 
user
ˇˇ 
=
ˇˇ 
await
ˇˇ 
_identityService
ˇˇ -
.
ˇˇ- .
GetUserAsync
ˇˇ. :
(
ˇˇ: ;
new
ˇˇ; >
UserDto
ˇˇ? F
{
ˇˇG H
Id
ˇˇI K
=
ˇˇL M
id
ˇˇN P
}
ˇˇQ R
)
ˇˇR S
;
ˇˇS T
var
ÄÄ 
userDto
ÄÄ 
=
ÄÄ 
new
ÄÄ #
UserChangePasswordDto
ÄÄ 3
{
ÄÄ4 5
UserId
ÄÄ6 <
=
ÄÄ= >
id
ÄÄ? A
,
ÄÄA B
UserName
ÄÄC K
=
ÄÄL M
user
ÄÄN R
.
ÄÄR S
UserName
ÄÄS [
}
ÄÄ\ ]
;
ÄÄ] ^
return
ÇÇ 
View
ÇÇ 
(
ÇÇ 
userDto
ÇÇ 
)
ÇÇ  
;
ÇÇ  !
}
ÉÉ 	
[
ÖÖ 	
HttpPost
ÖÖ	 
]
ÖÖ 
[
ÜÜ 	&
ValidateAntiForgeryToken
ÜÜ	 !
]
ÜÜ! "
public
áá 
async
áá 
Task
áá 
<
áá 
IActionResult
áá '
>
áá' ( 
UserChangePassword
áá) ;
(
áá; <#
UserChangePasswordDto
áá< Q
userPassword
ááR ^
)
áá^ _
{
àà 	
if
ââ 
(
ââ 
!
ââ 

ModelState
ââ 
.
ââ 
IsValid
ââ #
)
ââ# $
{
ää 
return
ãã 
View
ãã 
(
ãã 
userPassword
ãã (
)
ãã( )
;
ãã) *
}
åå 
var
éé 
identityResult
éé 
=
éé  
await
éé! &
_identityService
éé' 7
.
éé7 8%
UserChangePasswordAsync
éé8 O
(
ééO P
userPassword
ééP \
)
éé\ ]
;
éé] ^
if
êê 
(
êê 
!
êê 
identityResult
êê 
.
êê  
Errors
êê  &
.
êê& '
Any
êê' *
(
êê* +
)
êê+ ,
)
êê, -
{
ëë !
SuccessNotification
íí #
(
íí# $

_localizer
íí$ .
[
íí. /
$str
íí/ J
]
ííJ K
,
ííK L

_localizer
ííM W
[
ííW X
$str
ííX f
]
ííf g
)
ííg h
;
ííh i
return
îî 
RedirectToAction
îî '
(
îî' (
$str
îî( 5
,
îî5 6
new
îî7 :
{
îî; <
Id
îî= ?
=
îî@ A
userPassword
îîB N
.
îîN O
UserId
îîO U
}
îîV W
)
îîW X
;
îîX Y
}
ïï 
foreach
óó 
(
óó 
var
óó 
error
óó 
in
óó !
identityResult
óó" 0
.
óó0 1
Errors
óó1 7
)
óó7 8
{
òò 

ModelState
ôô 
.
ôô 
AddModelError
ôô (
(
ôô( )
string
ôô) /
.
ôô/ 0
Empty
ôô0 5
,
ôô5 6
error
ôô7 <
.
ôô< =
Description
ôô= H
)
ôôH I
;
ôôI J
}
öö 
return
úú 
View
úú 
(
úú 
userPassword
úú $
)
úú$ %
;
úú% &
}
ùù 	
[
üü 	
HttpPost
üü	 
]
üü 
[
†† 	&
ValidateAntiForgeryToken
††	 !
]
††! "
public
°° 
async
°° 
Task
°° 
<
°° 
IActionResult
°° '
>
°°' (

RoleClaims
°°) 3
(
°°3 4
RoleClaimsDto
°°4 A
claim
°°B G
)
°°G H
{
¢¢ 	
if
££ 
(
££ 
!
££ 

ModelState
££ 
.
££ 
IsValid
££ #
)
££# $
{
§§ 
return
•• 
View
•• 
(
•• 
claim
•• !
)
••! "
;
••" #
}
¶¶ 
await
®® 
_identityService
®® "
.
®®" ##
CreateRoleClaimsAsync
®®# 8
(
®®8 9
claim
®®9 >
)
®®> ?
;
®®? @!
SuccessNotification
©© 
(
©©  
string
©©  &
.
©©& '
Format
©©' -
(
©©- .

_localizer
©©. 8
[
©©8 9
$str
©©9 R
]
©©R S
,
©©S T
claim
©©U Z
.
©©Z [
	ClaimType
©©[ d
,
©©d e
claim
©©f k
.
©©k l

ClaimValue
©©l v
)
©©v w
,
©©w x

_localizer©©y É
[©©É Ñ
$str©©Ñ í
]©©í ì
)©©ì î
;©©î ï
return
´´ 
RedirectToAction
´´ #
(
´´# $
nameof
´´$ *
(
´´* +

RoleClaims
´´+ 5
)
´´5 6
,
´´6 7
new
´´8 ;
{
´´< =
Id
´´> @
=
´´A B
claim
´´C H
.
´´H I
RoleId
´´I O
}
´´P Q
)
´´Q R
;
´´R S
}
¨¨ 	
[
ÆÆ 	
HttpGet
ÆÆ	 
]
ÆÆ 
public
ØØ 
async
ØØ 
Task
ØØ 
<
ØØ 
IActionResult
ØØ '
>
ØØ' (

RoleClaims
ØØ) 3
(
ØØ3 4
int
ØØ4 7
id
ØØ8 :
,
ØØ: ;
int
ØØ< ?
?
ØØ? @
page
ØØA E
)
ØØE F
{
∞∞ 	
if
±± 
(
±± 
id
±± 
==
±± 
$num
±± 
)
±± 
return
±± 
NotFound
±±  (
(
±±( )
)
±±) *
;
±±* +
var
≥≥ 
claims
≥≥ 
=
≥≥ 
await
≥≥ 
_identityService
≥≥ /
.
≥≥/ 0 
GetRoleClaimsAsync
≥≥0 B
(
≥≥B C
id
≥≥C E
,
≥≥E F
page
≥≥G K
??
≥≥L N
$num
≥≥O P
)
≥≥P Q
;
≥≥Q R
claims
¥¥ 
.
¥¥ 
RoleId
¥¥ 
=
¥¥ 
id
¥¥ 
;
¥¥ 
return
∂∂ 
View
∂∂ 
(
∂∂ 
claims
∂∂ 
)
∂∂ 
;
∂∂  
}
∑∑ 	
[
ππ 	
HttpGet
ππ	 
]
ππ 
public
∫∫ 
async
∫∫ 
Task
∫∫ 
<
∫∫ 
IActionResult
∫∫ '
>
∫∫' (
RoleClaimsDelete
∫∫) 9
(
∫∫9 :
int
∫∫: =
id
∫∫> @
,
∫∫@ A
int
∫∫B E
claimId
∫∫F M
)
∫∫M N
{
ªª 	
if
ºº 
(
ºº 
id
ºº 
==
ºº 
$num
ºº 
||
ºº 
claimId
ºº "
==
ºº# %
$num
ºº& '
)
ºº' (
return
ºº) /
NotFound
ºº0 8
(
ºº8 9
)
ºº9 :
;
ºº: ;
var
ææ 
claim
ææ 
=
ææ 
await
ææ 
_identityService
ææ .
.
ææ. /
GetRoleClaimAsync
ææ/ @
(
ææ@ A
id
ææA C
,
ææC D
claimId
ææE L
)
ææL M
;
ææM N
return
¿¿ 
View
¿¿ 
(
¿¿ 
claim
¿¿ 
)
¿¿ 
;
¿¿ 
}
¡¡ 	
[
√√ 	
HttpPost
√√	 
]
√√ 
[
ƒƒ 	&
ValidateAntiForgeryToken
ƒƒ	 !
]
ƒƒ! "
public
≈≈ 
async
≈≈ 
Task
≈≈ 
<
≈≈ 
IActionResult
≈≈ '
>
≈≈' (
RoleClaimsDelete
≈≈) 9
(
≈≈9 :
RoleClaimsDto
≈≈: G
claim
≈≈H M
)
≈≈M N
{
∆∆ 	
await
«« 
_identityService
«« "
.
««" ##
DeleteRoleClaimsAsync
««# 8
(
««8 9
claim
««9 >
)
««> ?
;
««? @!
SuccessNotification
»» 
(
»»  

_localizer
»»  *
[
»»* +
$str
»»+ D
]
»»D E
,
»»E F

_localizer
»»G Q
[
»»Q R
$str
»»R `
]
»»` a
)
»»a b
;
»»b c
return
   
RedirectToAction
   #
(
  # $
nameof
  $ *
(
  * +

RoleClaims
  + 5
)
  5 6
,
  6 7
new
  8 ;
{
  < =
Id
  > @
=
  A B
claim
  C H
.
  H I
RoleId
  I O
}
  P Q
)
  Q R
;
  R S
}
ÀÀ 	
[
ÕÕ 	
HttpGet
ÕÕ	 
]
ÕÕ 
public
ŒŒ 
async
ŒŒ 
Task
ŒŒ 
<
ŒŒ 
IActionResult
ŒŒ '
>
ŒŒ' (

RoleDelete
ŒŒ) 3
(
ŒŒ3 4
int
ŒŒ4 7
id
ŒŒ8 :
)
ŒŒ: ;
{
œœ 	
if
–– 
(
–– 
id
–– 
==
–– 
$num
–– 
)
–– 
return
–– 
NotFound
––  (
(
––( )
)
––) *
;
––* +
var
““ 
roleDto
““ 
=
““ 
await
““ 
_identityService
““  0
.
““0 1
GetRoleAsync
““1 =
(
““= >
new
““> A
RoleDto
““B I
{
““J K
Id
““L N
=
““O P
id
““Q S
}
““T U
)
““U V
;
““V W
if
”” 
(
”” 
roleDto
”” 
==
”” 
null
”” 
)
””  
return
””! '
NotFound
””( 0
(
””0 1
)
””1 2
;
””2 3
return
’’ 
View
’’ 
(
’’ 
roleDto
’’ 
)
’’  
;
’’  !
}
÷÷ 	
[
ÿÿ 	
HttpPost
ÿÿ	 
]
ÿÿ 
[
ŸŸ 	&
ValidateAntiForgeryToken
ŸŸ	 !
]
ŸŸ! "
public
⁄⁄ 
async
⁄⁄ 
Task
⁄⁄ 
<
⁄⁄ 
IActionResult
⁄⁄ '
>
⁄⁄' (

RoleDelete
⁄⁄) 3
(
⁄⁄3 4
RoleDto
⁄⁄4 ;
role
⁄⁄< @
)
⁄⁄@ A
{
€€ 	
await
‹‹ 
_identityService
‹‹ "
.
‹‹" #
DeleteRoleAsync
‹‹# 2
(
‹‹2 3
role
‹‹3 7
)
‹‹7 8
;
‹‹8 9!
SuccessNotification
›› 
(
››  

_localizer
››  *
[
››* +
$str
››+ >
]
››> ?
,
››? @

_localizer
››A K
[
››K L
$str
››L Z
]
››Z [
)
››[ \
;
››\ ]
return
ﬂﬂ 
RedirectToAction
ﬂﬂ #
(
ﬂﬂ# $
nameof
ﬂﬂ$ *
(
ﬂﬂ* +
Roles
ﬂﬂ+ 0
)
ﬂﬂ0 1
)
ﬂﬂ1 2
;
ﬂﬂ2 3
}
‡‡ 	
[
‚‚ 	
HttpPost
‚‚	 
]
‚‚ 
[
„„ 	&
ValidateAntiForgeryToken
„„	 !
]
„„! "
public
‰‰ 
async
‰‰ 
Task
‰‰ 
<
‰‰ 
IActionResult
‰‰ '
>
‰‰' (

UserDelete
‰‰) 3
(
‰‰3 4
UserDto
‰‰4 ;
user
‰‰< @
)
‰‰@ A
{
ÂÂ 	
await
ÊÊ 
_identityService
ÊÊ "
.
ÊÊ" #
DeleteUserAsync
ÊÊ# 2
(
ÊÊ2 3
user
ÊÊ3 7
)
ÊÊ7 8
;
ÊÊ8 9!
SuccessNotification
ÁÁ 
(
ÁÁ  

_localizer
ÁÁ  *
[
ÁÁ* +
$str
ÁÁ+ >
]
ÁÁ> ?
,
ÁÁ? @

_localizer
ÁÁA K
[
ÁÁK L
$str
ÁÁL Z
]
ÁÁZ [
)
ÁÁ[ \
;
ÁÁ\ ]
return
ÈÈ 
RedirectToAction
ÈÈ #
(
ÈÈ# $
nameof
ÈÈ$ *
(
ÈÈ* +
Users
ÈÈ+ 0
)
ÈÈ0 1
)
ÈÈ1 2
;
ÈÈ2 3
}
ÍÍ 	
[
ÏÏ 	
HttpGet
ÏÏ	 
]
ÏÏ 
public
ÌÌ 
async
ÌÌ 
Task
ÌÌ 
<
ÌÌ 
IActionResult
ÌÌ '
>
ÌÌ' (

UserDelete
ÌÌ) 3
(
ÌÌ3 4
int
ÌÌ4 7
id
ÌÌ8 :
)
ÌÌ: ;
{
ÓÓ 	
if
ÔÔ 
(
ÔÔ 
id
ÔÔ 
==
ÔÔ 
$num
ÔÔ 
)
ÔÔ 
return
ÔÔ 
NotFound
ÔÔ  (
(
ÔÔ( )
)
ÔÔ) *
;
ÔÔ* +
var
ÒÒ 
user
ÒÒ 
=
ÒÒ 
await
ÒÒ 
_identityService
ÒÒ -
.
ÒÒ- .
GetUserAsync
ÒÒ. :
(
ÒÒ: ;
new
ÒÒ; >
UserDto
ÒÒ? F
(
ÒÒF G
)
ÒÒG H
{
ÒÒI J
Id
ÒÒK M
=
ÒÒN O
id
ÒÒP R
}
ÒÒS T
)
ÒÒT U
;
ÒÒU V
if
ÚÚ 
(
ÚÚ 
user
ÚÚ 
==
ÚÚ 
null
ÚÚ 
)
ÚÚ 
return
ÚÚ $
NotFound
ÚÚ% -
(
ÚÚ- .
)
ÚÚ. /
;
ÚÚ/ 0
return
ÙÙ 
View
ÙÙ 
(
ÙÙ 
user
ÙÙ 
)
ÙÙ 
;
ÙÙ 
}
ıı 	
}
ˆˆ 
}˜˜ ¸
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
} ê‡
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
ÄÄ 
.
ÄÄ 
CreateTable
ÄÄ (
(
ÄÄ( )
name
ÅÅ 
:
ÅÅ 
$str
ÅÅ 
,
ÅÅ 
columns
ÇÇ 
:
ÇÇ 
table
ÇÇ 
=>
ÇÇ !
new
ÇÇ" %
{
ÉÉ 
Id
ÑÑ 
=
ÑÑ 
table
ÑÑ 
.
ÑÑ 
Column
ÑÑ %
<
ÑÑ% &
int
ÑÑ& )
>
ÑÑ) *
(
ÑÑ* +
nullable
ÑÑ+ 3
:
ÑÑ3 4
false
ÑÑ5 :
)
ÑÑ: ;
.
ÖÖ 

Annotation
ÖÖ #
(
ÖÖ# $
$str
ÖÖ$ G
,
ÖÖG H.
 SqlServerValueGenerationStrategy
ÖÖI i
.
ÖÖi j
IdentityColumn
ÖÖj x
)
ÖÖx y
,
ÖÖy z
Name
ÜÜ 
=
ÜÜ 
table
ÜÜ  
.
ÜÜ  !
Column
ÜÜ! '
<
ÜÜ' (
string
ÜÜ( .
>
ÜÜ. /
(
ÜÜ/ 0
	maxLength
ÜÜ0 9
:
ÜÜ9 :
$num
ÜÜ; >
,
ÜÜ> ?
nullable
ÜÜ@ H
:
ÜÜH I
true
ÜÜJ N
)
ÜÜN O
,
ÜÜO P
NormalizedName
áá "
=
áá# $
table
áá% *
.
áá* +
Column
áá+ 1
<
áá1 2
string
áá2 8
>
áá8 9
(
áá9 :
	maxLength
áá: C
:
ááC D
$num
ááE H
,
ááH I
nullable
ááJ R
:
ááR S
true
ááT X
)
ááX Y
,
ááY Z
ConcurrencyStamp
àà $
=
àà% &
table
àà' ,
.
àà, -
Column
àà- 3
<
àà3 4
string
àà4 :
>
àà: ;
(
àà; <
nullable
àà< D
:
ààD E
true
ààF J
)
ààJ K
}
ââ 
,
ââ 
constraints
ää 
:
ää 
table
ää "
=>
ää# %
{
ãã 
table
åå 
.
åå 

PrimaryKey
åå $
(
åå$ %
$str
åå% /
,
åå/ 0
x
åå1 2
=>
åå3 5
x
åå6 7
.
åå7 8
Id
åå8 :
)
åå: ;
;
åå; <
}
çç 
)
çç 
;
çç 
migrationBuilder
èè 
.
èè 
CreateTable
èè (
(
èè( )
name
êê 
:
êê 
$str
êê 
,
êê 
columns
ëë 
:
ëë 
table
ëë 
=>
ëë !
new
ëë" %
{
íí 
Id
ìì 
=
ìì 
table
ìì 
.
ìì 
Column
ìì %
<
ìì% &
int
ìì& )
>
ìì) *
(
ìì* +
nullable
ìì+ 3
:
ìì3 4
false
ìì5 :
)
ìì: ;
.
îî 

Annotation
îî #
(
îî# $
$str
îî$ G
,
îîG H.
 SqlServerValueGenerationStrategy
îîI i
.
îîi j
IdentityColumn
îîj x
)
îîx y
,
îîy z
UserName
ïï 
=
ïï 
table
ïï $
.
ïï$ %
Column
ïï% +
<
ïï+ ,
string
ïï, 2
>
ïï2 3
(
ïï3 4
	maxLength
ïï4 =
:
ïï= >
$num
ïï? B
,
ïïB C
nullable
ïïD L
:
ïïL M
true
ïïN R
)
ïïR S
,
ïïS T 
NormalizedUserName
ññ &
=
ññ' (
table
ññ) .
.
ññ. /
Column
ññ/ 5
<
ññ5 6
string
ññ6 <
>
ññ< =
(
ññ= >
	maxLength
ññ> G
:
ññG H
$num
ññI L
,
ññL M
nullable
ññN V
:
ññV W
true
ññX \
)
ññ\ ]
,
ññ] ^
Email
óó 
=
óó 
table
óó !
.
óó! "
Column
óó" (
<
óó( )
string
óó) /
>
óó/ 0
(
óó0 1
	maxLength
óó1 :
:
óó: ;
$num
óó< ?
,
óó? @
nullable
óóA I
:
óóI J
true
óóK O
)
óóO P
,
óóP Q
NormalizedEmail
òò #
=
òò$ %
table
òò& +
.
òò+ ,
Column
òò, 2
<
òò2 3
string
òò3 9
>
òò9 :
(
òò: ;
	maxLength
òò; D
:
òòD E
$num
òòF I
,
òòI J
nullable
òòK S
:
òòS T
true
òòU Y
)
òòY Z
,
òòZ [
EmailConfirmed
ôô "
=
ôô# $
table
ôô% *
.
ôô* +
Column
ôô+ 1
<
ôô1 2
bool
ôô2 6
>
ôô6 7
(
ôô7 8
nullable
ôô8 @
:
ôô@ A
false
ôôB G
)
ôôG H
,
ôôH I
PasswordHash
öö  
=
öö! "
table
öö# (
.
öö( )
Column
öö) /
<
öö/ 0
string
öö0 6
>
öö6 7
(
öö7 8
nullable
öö8 @
:
öö@ A
true
ööB F
)
ööF G
,
ööG H
SecurityStamp
õõ !
=
õõ" #
table
õõ$ )
.
õõ) *
Column
õõ* 0
<
õõ0 1
string
õõ1 7
>
õõ7 8
(
õõ8 9
nullable
õõ9 A
:
õõA B
true
õõC G
)
õõG H
,
õõH I
ConcurrencyStamp
úú $
=
úú% &
table
úú' ,
.
úú, -
Column
úú- 3
<
úú3 4
string
úú4 :
>
úú: ;
(
úú; <
nullable
úú< D
:
úúD E
true
úúF J
)
úúJ K
,
úúK L
PhoneNumber
ùù 
=
ùù  !
table
ùù" '
.
ùù' (
Column
ùù( .
<
ùù. /
string
ùù/ 5
>
ùù5 6
(
ùù6 7
nullable
ùù7 ?
:
ùù? @
true
ùùA E
)
ùùE F
,
ùùF G"
PhoneNumberConfirmed
ûû (
=
ûû) *
table
ûû+ 0
.
ûû0 1
Column
ûû1 7
<
ûû7 8
bool
ûû8 <
>
ûû< =
(
ûû= >
nullable
ûû> F
:
ûûF G
false
ûûH M
)
ûûM N
,
ûûN O
TwoFactorEnabled
üü $
=
üü% &
table
üü' ,
.
üü, -
Column
üü- 3
<
üü3 4
bool
üü4 8
>
üü8 9
(
üü9 :
nullable
üü: B
:
üüB C
false
üüD I
)
üüI J
,
üüJ K

LockoutEnd
†† 
=
††  
table
††! &
.
††& '
Column
††' -
<
††- .
DateTimeOffset
††. <
>
††< =
(
††= >
nullable
††> F
:
††F G
true
††H L
)
††L M
,
††M N
LockoutEnabled
°° "
=
°°# $
table
°°% *
.
°°* +
Column
°°+ 1
<
°°1 2
bool
°°2 6
>
°°6 7
(
°°7 8
nullable
°°8 @
:
°°@ A
false
°°B G
)
°°G H
,
°°H I
AccessFailedCount
¢¢ %
=
¢¢& '
table
¢¢( -
.
¢¢- .
Column
¢¢. 4
<
¢¢4 5
int
¢¢5 8
>
¢¢8 9
(
¢¢9 :
nullable
¢¢: B
:
¢¢B C
false
¢¢D I
)
¢¢I J
}
££ 
,
££ 
constraints
§§ 
:
§§ 
table
§§ "
=>
§§# %
{
•• 
table
¶¶ 
.
¶¶ 

PrimaryKey
¶¶ $
(
¶¶$ %
$str
¶¶% /
,
¶¶/ 0
x
¶¶1 2
=>
¶¶3 5
x
¶¶6 7
.
¶¶7 8
Id
¶¶8 :
)
¶¶: ;
;
¶¶; <
}
ßß 
)
ßß 
;
ßß 
migrationBuilder
©© 
.
©© 
CreateTable
©© (
(
©©( )
name
™™ 
:
™™ 
$str
™™ !
,
™™! "
columns
´´ 
:
´´ 
table
´´ 
=>
´´ !
new
´´" %
{
¨¨ 
Id
≠≠ 
=
≠≠ 
table
≠≠ 
.
≠≠ 
Column
≠≠ %
<
≠≠% &
int
≠≠& )
>
≠≠) *
(
≠≠* +
nullable
≠≠+ 3
:
≠≠3 4
false
≠≠5 :
)
≠≠: ;
.
ÆÆ 

Annotation
ÆÆ #
(
ÆÆ# $
$str
ÆÆ$ G
,
ÆÆG H.
 SqlServerValueGenerationStrategy
ÆÆI i
.
ÆÆi j
IdentityColumn
ÆÆj x
)
ÆÆx y
,
ÆÆy z
Type
ØØ 
=
ØØ 
table
ØØ  
.
ØØ  !
Column
ØØ! '
<
ØØ' (
string
ØØ( .
>
ØØ. /
(
ØØ/ 0
	maxLength
ØØ0 9
:
ØØ9 :
$num
ØØ; >
,
ØØ> ?
nullable
ØØ@ H
:
ØØH I
false
ØØJ O
)
ØØO P
,
ØØP Q
ApiResourceId
∞∞ !
=
∞∞" #
table
∞∞$ )
.
∞∞) *
Column
∞∞* 0
<
∞∞0 1
int
∞∞1 4
>
∞∞4 5
(
∞∞5 6
nullable
∞∞6 >
:
∞∞> ?
false
∞∞@ E
)
∞∞E F
}
±± 
,
±± 
constraints
≤≤ 
:
≤≤ 
table
≤≤ "
=>
≤≤# %
{
≥≥ 
table
¥¥ 
.
¥¥ 

PrimaryKey
¥¥ $
(
¥¥$ %
$str
¥¥% 3
,
¥¥3 4
x
¥¥5 6
=>
¥¥7 9
x
¥¥: ;
.
¥¥; <
Id
¥¥< >
)
¥¥> ?
;
¥¥? @
table
µµ 
.
µµ 

ForeignKey
µµ $
(
µµ$ %
name
∂∂ 
:
∂∂ 
$str
∂∂ G
,
∂∂G H
column
∑∑ 
:
∑∑ 
x
∑∑  !
=>
∑∑" $
x
∑∑% &
.
∑∑& '
ApiResourceId
∑∑' 4
,
∑∑4 5
principalTable
∏∏ &
:
∏∏& '
$str
∏∏( 6
,
∏∏6 7
principalColumn
ππ '
:
ππ' (
$str
ππ) -
,
ππ- .
onDelete
∫∫  
:
∫∫  !
ReferentialAction
∫∫" 3
.
∫∫3 4
Cascade
∫∫4 ;
)
∫∫; <
;
∫∫< =
}
ªª 
)
ªª 
;
ªª 
migrationBuilder
ΩΩ 
.
ΩΩ 
CreateTable
ΩΩ (
(
ΩΩ( )
name
ææ 
:
ææ 
$str
ææ !
,
ææ! "
columns
øø 
:
øø 
table
øø 
=>
øø !
new
øø" %
{
¿¿ 
Id
¡¡ 
=
¡¡ 
table
¡¡ 
.
¡¡ 
Column
¡¡ %
<
¡¡% &
int
¡¡& )
>
¡¡) *
(
¡¡* +
nullable
¡¡+ 3
:
¡¡3 4
false
¡¡5 :
)
¡¡: ;
.
¬¬ 

Annotation
¬¬ #
(
¬¬# $
$str
¬¬$ G
,
¬¬G H.
 SqlServerValueGenerationStrategy
¬¬I i
.
¬¬i j
IdentityColumn
¬¬j x
)
¬¬x y
,
¬¬y z
Name
√√ 
=
√√ 
table
√√  
.
√√  !
Column
√√! '
<
√√' (
string
√√( .
>
√√. /
(
√√/ 0
	maxLength
√√0 9
:
√√9 :
$num
√√; >
,
√√> ?
nullable
√√@ H
:
√√H I
false
√√J O
)
√√O P
,
√√P Q
DisplayName
ƒƒ 
=
ƒƒ  !
table
ƒƒ" '
.
ƒƒ' (
Column
ƒƒ( .
<
ƒƒ. /
string
ƒƒ/ 5
>
ƒƒ5 6
(
ƒƒ6 7
	maxLength
ƒƒ7 @
:
ƒƒ@ A
$num
ƒƒB E
,
ƒƒE F
nullable
ƒƒG O
:
ƒƒO P
true
ƒƒQ U
)
ƒƒU V
,
ƒƒV W
Description
≈≈ 
=
≈≈  !
table
≈≈" '
.
≈≈' (
Column
≈≈( .
<
≈≈. /
string
≈≈/ 5
>
≈≈5 6
(
≈≈6 7
	maxLength
≈≈7 @
:
≈≈@ A
$num
≈≈B F
,
≈≈F G
nullable
≈≈H P
:
≈≈P Q
true
≈≈R V
)
≈≈V W
,
≈≈W X
Required
∆∆ 
=
∆∆ 
table
∆∆ $
.
∆∆$ %
Column
∆∆% +
<
∆∆+ ,
bool
∆∆, 0
>
∆∆0 1
(
∆∆1 2
nullable
∆∆2 :
:
∆∆: ;
false
∆∆< A
)
∆∆A B
,
∆∆B C
	Emphasize
«« 
=
«« 
table
««  %
.
««% &
Column
««& ,
<
««, -
bool
««- 1
>
««1 2
(
««2 3
nullable
««3 ;
:
««; <
false
««= B
)
««B C
,
««C D%
ShowInDiscoveryDocument
»» +
=
»», -
table
»». 3
.
»»3 4
Column
»»4 :
<
»»: ;
bool
»»; ?
>
»»? @
(
»»@ A
nullable
»»A I
:
»»I J
false
»»K P
)
»»P Q
,
»»Q R
ApiResourceId
…… !
=
……" #
table
……$ )
.
……) *
Column
……* 0
<
……0 1
int
……1 4
>
……4 5
(
……5 6
nullable
……6 >
:
……> ?
false
……@ E
)
……E F
}
   
,
   
constraints
ÀÀ 
:
ÀÀ 
table
ÀÀ "
=>
ÀÀ# %
{
ÃÃ 
table
ÕÕ 
.
ÕÕ 

PrimaryKey
ÕÕ $
(
ÕÕ$ %
$str
ÕÕ% 3
,
ÕÕ3 4
x
ÕÕ5 6
=>
ÕÕ7 9
x
ÕÕ: ;
.
ÕÕ; <
Id
ÕÕ< >
)
ÕÕ> ?
;
ÕÕ? @
table
ŒŒ 
.
ŒŒ 

ForeignKey
ŒŒ $
(
ŒŒ$ %
name
œœ 
:
œœ 
$str
œœ G
,
œœG H
column
–– 
:
–– 
x
––  !
=>
––" $
x
––% &
.
––& '
ApiResourceId
––' 4
,
––4 5
principalTable
—— &
:
——& '
$str
——( 6
,
——6 7
principalColumn
““ '
:
““' (
$str
““) -
,
““- .
onDelete
””  
:
””  !
ReferentialAction
””" 3
.
””3 4
Cascade
””4 ;
)
””; <
;
””< =
}
‘‘ 
)
‘‘ 
;
‘‘ 
migrationBuilder
÷÷ 
.
÷÷ 
CreateTable
÷÷ (
(
÷÷( )
name
◊◊ 
:
◊◊ 
$str
◊◊ "
,
◊◊" #
columns
ÿÿ 
:
ÿÿ 
table
ÿÿ 
=>
ÿÿ !
new
ÿÿ" %
{
ŸŸ 

Expiration
⁄⁄ 
=
⁄⁄  
table
⁄⁄! &
.
⁄⁄& '
Column
⁄⁄' -
<
⁄⁄- .
DateTime
⁄⁄. 6
>
⁄⁄6 7
(
⁄⁄7 8
nullable
⁄⁄8 @
:
⁄⁄@ A
true
⁄⁄B F
)
⁄⁄F G
,
⁄⁄G H
Id
€€ 
=
€€ 
table
€€ 
.
€€ 
Column
€€ %
<
€€% &
int
€€& )
>
€€) *
(
€€* +
nullable
€€+ 3
:
€€3 4
false
€€5 :
)
€€: ;
.
‹‹ 

Annotation
‹‹ #
(
‹‹# $
$str
‹‹$ G
,
‹‹G H.
 SqlServerValueGenerationStrategy
‹‹I i
.
‹‹i j
IdentityColumn
‹‹j x
)
‹‹x y
,
‹‹y z
Description
›› 
=
››  !
table
››" '
.
››' (
Column
››( .
<
››. /
string
››/ 5
>
››5 6
(
››6 7
	maxLength
››7 @
:
››@ A
$num
››B F
,
››F G
nullable
››H P
:
››P Q
true
››R V
)
››V W
,
››W X
Value
ﬁﬁ 
=
ﬁﬁ 
table
ﬁﬁ !
.
ﬁﬁ! "
Column
ﬁﬁ" (
<
ﬁﬁ( )
string
ﬁﬁ) /
>
ﬁﬁ/ 0
(
ﬁﬁ0 1
	maxLength
ﬁﬁ1 :
:
ﬁﬁ: ;
$num
ﬁﬁ< @
,
ﬁﬁ@ A
nullable
ﬁﬁB J
:
ﬁﬁJ K
true
ﬁﬁL P
)
ﬁﬁP Q
,
ﬁﬁQ R
Type
ﬂﬂ 
=
ﬂﬂ 
table
ﬂﬂ  
.
ﬂﬂ  !
Column
ﬂﬂ! '
<
ﬂﬂ' (
string
ﬂﬂ( .
>
ﬂﬂ. /
(
ﬂﬂ/ 0
	maxLength
ﬂﬂ0 9
:
ﬂﬂ9 :
$num
ﬂﬂ; >
,
ﬂﬂ> ?
nullable
ﬂﬂ@ H
:
ﬂﬂH I
true
ﬂﬂJ N
)
ﬂﬂN O
,
ﬂﬂO P
ApiResourceId
‡‡ !
=
‡‡" #
table
‡‡$ )
.
‡‡) *
Column
‡‡* 0
<
‡‡0 1
int
‡‡1 4
>
‡‡4 5
(
‡‡5 6
nullable
‡‡6 >
:
‡‡> ?
false
‡‡@ E
)
‡‡E F
}
·· 
,
·· 
constraints
‚‚ 
:
‚‚ 
table
‚‚ "
=>
‚‚# %
{
„„ 
table
‰‰ 
.
‰‰ 

PrimaryKey
‰‰ $
(
‰‰$ %
$str
‰‰% 4
,
‰‰4 5
x
‰‰6 7
=>
‰‰8 :
x
‰‰; <
.
‰‰< =
Id
‰‰= ?
)
‰‰? @
;
‰‰@ A
table
ÂÂ 
.
ÂÂ 

ForeignKey
ÂÂ $
(
ÂÂ$ %
name
ÊÊ 
:
ÊÊ 
$str
ÊÊ H
,
ÊÊH I
column
ÁÁ 
:
ÁÁ 
x
ÁÁ  !
=>
ÁÁ" $
x
ÁÁ% &
.
ÁÁ& '
ApiResourceId
ÁÁ' 4
,
ÁÁ4 5
principalTable
ËË &
:
ËË& '
$str
ËË( 6
,
ËË6 7
principalColumn
ÈÈ '
:
ÈÈ' (
$str
ÈÈ) -
,
ÈÈ- .
onDelete
ÍÍ  
:
ÍÍ  !
ReferentialAction
ÍÍ" 3
.
ÍÍ3 4
Cascade
ÍÍ4 ;
)
ÍÍ; <
;
ÍÍ< =
}
ÎÎ 
)
ÎÎ 
;
ÎÎ 
migrationBuilder
ÌÌ 
.
ÌÌ 
CreateTable
ÌÌ (
(
ÌÌ( )
name
ÓÓ 
:
ÓÓ 
$str
ÓÓ $
,
ÓÓ$ %
columns
ÔÔ 
:
ÔÔ 
table
ÔÔ 
=>
ÔÔ !
new
ÔÔ" %
{
 
Id
ÒÒ 
=
ÒÒ 
table
ÒÒ 
.
ÒÒ 
Column
ÒÒ %
<
ÒÒ% &
int
ÒÒ& )
>
ÒÒ) *
(
ÒÒ* +
nullable
ÒÒ+ 3
:
ÒÒ3 4
false
ÒÒ5 :
)
ÒÒ: ;
.
ÚÚ 

Annotation
ÚÚ #
(
ÚÚ# $
$str
ÚÚ$ G
,
ÚÚG H.
 SqlServerValueGenerationStrategy
ÚÚI i
.
ÚÚi j
IdentityColumn
ÚÚj x
)
ÚÚx y
,
ÚÚy z
Type
ÛÛ 
=
ÛÛ 
table
ÛÛ  
.
ÛÛ  !
Column
ÛÛ! '
<
ÛÛ' (
string
ÛÛ( .
>
ÛÛ. /
(
ÛÛ/ 0
	maxLength
ÛÛ0 9
:
ÛÛ9 :
$num
ÛÛ; >
,
ÛÛ> ?
nullable
ÛÛ@ H
:
ÛÛH I
false
ÛÛJ O
)
ÛÛO P
,
ÛÛP Q
Value
ÙÙ 
=
ÙÙ 
table
ÙÙ !
.
ÙÙ! "
Column
ÙÙ" (
<
ÙÙ( )
string
ÙÙ) /
>
ÙÙ/ 0
(
ÙÙ0 1
	maxLength
ÙÙ1 :
:
ÙÙ: ;
$num
ÙÙ< ?
,
ÙÙ? @
nullable
ÙÙA I
:
ÙÙI J
false
ÙÙK P
)
ÙÙP Q
,
ÙÙQ R
ClientId
ıı 
=
ıı 
table
ıı $
.
ıı$ %
Column
ıı% +
<
ıı+ ,
int
ıı, /
>
ıı/ 0
(
ıı0 1
nullable
ıı1 9
:
ıı9 :
false
ıı; @
)
ıı@ A
}
ˆˆ 
,
ˆˆ 
constraints
˜˜ 
:
˜˜ 
table
˜˜ "
=>
˜˜# %
{
¯¯ 
table
˘˘ 
.
˘˘ 

PrimaryKey
˘˘ $
(
˘˘$ %
$str
˘˘% 6
,
˘˘6 7
x
˘˘8 9
=>
˘˘: <
x
˘˘= >
.
˘˘> ?
Id
˘˘? A
)
˘˘A B
;
˘˘B C
table
˙˙ 
.
˙˙ 

ForeignKey
˙˙ $
(
˙˙$ %
name
˚˚ 
:
˚˚ 
$str
˚˚ @
,
˚˚@ A
column
¸¸ 
:
¸¸ 
x
¸¸  !
=>
¸¸" $
x
¸¸% &
.
¸¸& '
ClientId
¸¸' /
,
¸¸/ 0
principalTable
˝˝ &
:
˝˝& '
$str
˝˝( 1
,
˝˝1 2
principalColumn
˛˛ '
:
˛˛' (
$str
˛˛) -
,
˛˛- .
onDelete
ˇˇ  
:
ˇˇ  !
ReferentialAction
ˇˇ" 3
.
ˇˇ3 4
Cascade
ˇˇ4 ;
)
ˇˇ; <
;
ˇˇ< =
}
ÄÄ 
)
ÄÄ 
;
ÄÄ 
migrationBuilder
ÇÇ 
.
ÇÇ 
CreateTable
ÇÇ (
(
ÇÇ( )
name
ÉÉ 
:
ÉÉ 
$str
ÉÉ )
,
ÉÉ) *
columns
ÑÑ 
:
ÑÑ 
table
ÑÑ 
=>
ÑÑ !
new
ÑÑ" %
{
ÖÖ 
Id
ÜÜ 
=
ÜÜ 
table
ÜÜ 
.
ÜÜ 
Column
ÜÜ %
<
ÜÜ% &
int
ÜÜ& )
>
ÜÜ) *
(
ÜÜ* +
nullable
ÜÜ+ 3
:
ÜÜ3 4
false
ÜÜ5 :
)
ÜÜ: ;
.
áá 

Annotation
áá #
(
áá# $
$str
áá$ G
,
ááG H.
 SqlServerValueGenerationStrategy
ááI i
.
áái j
IdentityColumn
ááj x
)
ááx y
,
ááy z
Origin
àà 
=
àà 
table
àà "
.
àà" #
Column
àà# )
<
àà) *
string
àà* 0
>
àà0 1
(
àà1 2
	maxLength
àà2 ;
:
àà; <
$num
àà= @
,
àà@ A
nullable
ààB J
:
ààJ K
false
ààL Q
)
ààQ R
,
ààR S
ClientId
ââ 
=
ââ 
table
ââ $
.
ââ$ %
Column
ââ% +
<
ââ+ ,
int
ââ, /
>
ââ/ 0
(
ââ0 1
nullable
ââ1 9
:
ââ9 :
false
ââ; @
)
ââ@ A
}
ää 
,
ää 
constraints
ãã 
:
ãã 
table
ãã "
=>
ãã# %
{
åå 
table
çç 
.
çç 

PrimaryKey
çç $
(
çç$ %
$str
çç% ;
,
çç; <
x
çç= >
=>
çç? A
x
ççB C
.
ççC D
Id
ççD F
)
ççF G
;
ççG H
table
éé 
.
éé 

ForeignKey
éé $
(
éé$ %
name
èè 
:
èè 
$str
èè E
,
èèE F
column
êê 
:
êê 
x
êê  !
=>
êê" $
x
êê% &
.
êê& '
ClientId
êê' /
,
êê/ 0
principalTable
ëë &
:
ëë& '
$str
ëë( 1
,
ëë1 2
principalColumn
íí '
:
íí' (
$str
íí) -
,
íí- .
onDelete
ìì  
:
ìì  !
ReferentialAction
ìì" 3
.
ìì3 4
Cascade
ìì4 ;
)
ìì; <
;
ìì< =
}
îî 
)
îî 
;
îî 
migrationBuilder
ññ 
.
ññ 
CreateTable
ññ (
(
ññ( )
name
óó 
:
óó 
$str
óó (
,
óó( )
columns
òò 
:
òò 
table
òò 
=>
òò !
new
òò" %
{
ôô 
Id
öö 
=
öö 
table
öö 
.
öö 
Column
öö %
<
öö% &
int
öö& )
>
öö) *
(
öö* +
nullable
öö+ 3
:
öö3 4
false
öö5 :
)
öö: ;
.
õõ 

Annotation
õõ #
(
õõ# $
$str
õõ$ G
,
õõG H.
 SqlServerValueGenerationStrategy
õõI i
.
õõi j
IdentityColumn
õõj x
)
õõx y
,
õõy z
	GrantType
úú 
=
úú 
table
úú  %
.
úú% &
Column
úú& ,
<
úú, -
string
úú- 3
>
úú3 4
(
úú4 5
	maxLength
úú5 >
:
úú> ?
$num
úú@ C
,
úúC D
nullable
úúE M
:
úúM N
false
úúO T
)
úúT U
,
úúU V
ClientId
ùù 
=
ùù 
table
ùù $
.
ùù$ %
Column
ùù% +
<
ùù+ ,
int
ùù, /
>
ùù/ 0
(
ùù0 1
nullable
ùù1 9
:
ùù9 :
false
ùù; @
)
ùù@ A
}
ûû 
,
ûû 
constraints
üü 
:
üü 
table
üü "
=>
üü# %
{
†† 
table
°° 
.
°° 

PrimaryKey
°° $
(
°°$ %
$str
°°% :
,
°°: ;
x
°°< =
=>
°°> @
x
°°A B
.
°°B C
Id
°°C E
)
°°E F
;
°°F G
table
¢¢ 
.
¢¢ 

ForeignKey
¢¢ $
(
¢¢$ %
name
££ 
:
££ 
$str
££ D
,
££D E
column
§§ 
:
§§ 
x
§§  !
=>
§§" $
x
§§% &
.
§§& '
ClientId
§§' /
,
§§/ 0
principalTable
•• &
:
••& '
$str
••( 1
,
••1 2
principalColumn
¶¶ '
:
¶¶' (
$str
¶¶) -
,
¶¶- .
onDelete
ßß  
:
ßß  !
ReferentialAction
ßß" 3
.
ßß3 4
Cascade
ßß4 ;
)
ßß; <
;
ßß< =
}
®® 
)
®® 
;
®® 
migrationBuilder
™™ 
.
™™ 
CreateTable
™™ (
(
™™( )
name
´´ 
:
´´ 
$str
´´ -
,
´´- .
columns
¨¨ 
:
¨¨ 
table
¨¨ 
=>
¨¨ !
new
¨¨" %
{
≠≠ 
Id
ÆÆ 
=
ÆÆ 
table
ÆÆ 
.
ÆÆ 
Column
ÆÆ %
<
ÆÆ% &
int
ÆÆ& )
>
ÆÆ) *
(
ÆÆ* +
nullable
ÆÆ+ 3
:
ÆÆ3 4
false
ÆÆ5 :
)
ÆÆ: ;
.
ØØ 

Annotation
ØØ #
(
ØØ# $
$str
ØØ$ G
,
ØØG H.
 SqlServerValueGenerationStrategy
ØØI i
.
ØØi j
IdentityColumn
ØØj x
)
ØØx y
,
ØØy z
Provider
∞∞ 
=
∞∞ 
table
∞∞ $
.
∞∞$ %
Column
∞∞% +
<
∞∞+ ,
string
∞∞, 2
>
∞∞2 3
(
∞∞3 4
	maxLength
∞∞4 =
:
∞∞= >
$num
∞∞? B
,
∞∞B C
nullable
∞∞D L
:
∞∞L M
false
∞∞N S
)
∞∞S T
,
∞∞T U
ClientId
±± 
=
±± 
table
±± $
.
±±$ %
Column
±±% +
<
±±+ ,
int
±±, /
>
±±/ 0
(
±±0 1
nullable
±±1 9
:
±±9 :
false
±±; @
)
±±@ A
}
≤≤ 
,
≤≤ 
constraints
≥≥ 
:
≥≥ 
table
≥≥ "
=>
≥≥# %
{
¥¥ 
table
µµ 
.
µµ 

PrimaryKey
µµ $
(
µµ$ %
$str
µµ% ?
,
µµ? @
x
µµA B
=>
µµC E
x
µµF G
.
µµG H
Id
µµH J
)
µµJ K
;
µµK L
table
∂∂ 
.
∂∂ 

ForeignKey
∂∂ $
(
∂∂$ %
name
∑∑ 
:
∑∑ 
$str
∑∑ I
,
∑∑I J
column
∏∏ 
:
∏∏ 
x
∏∏  !
=>
∏∏" $
x
∏∏% &
.
∏∏& '
ClientId
∏∏' /
,
∏∏/ 0
principalTable
ππ &
:
ππ& '
$str
ππ( 1
,
ππ1 2
principalColumn
∫∫ '
:
∫∫' (
$str
∫∫) -
,
∫∫- .
onDelete
ªª  
:
ªª  !
ReferentialAction
ªª" 3
.
ªª3 4
Cascade
ªª4 ;
)
ªª; <
;
ªª< =
}
ºº 
)
ºº 
;
ºº 
migrationBuilder
ææ 
.
ææ 
CreateTable
ææ (
(
ææ( )
name
øø 
:
øø 
$str
øø 4
,
øø4 5
columns
¿¿ 
:
¿¿ 
table
¿¿ 
=>
¿¿ !
new
¿¿" %
{
¡¡ 
Id
¬¬ 
=
¬¬ 
table
¬¬ 
.
¬¬ 
Column
¬¬ %
<
¬¬% &
int
¬¬& )
>
¬¬) *
(
¬¬* +
nullable
¬¬+ 3
:
¬¬3 4
false
¬¬5 :
)
¬¬: ;
.
√√ 

Annotation
√√ #
(
√√# $
$str
√√$ G
,
√√G H.
 SqlServerValueGenerationStrategy
√√I i
.
√√i j
IdentityColumn
√√j x
)
√√x y
,
√√y z#
PostLogoutRedirectUri
ƒƒ )
=
ƒƒ* +
table
ƒƒ, 1
.
ƒƒ1 2
Column
ƒƒ2 8
<
ƒƒ8 9
string
ƒƒ9 ?
>
ƒƒ? @
(
ƒƒ@ A
	maxLength
ƒƒA J
:
ƒƒJ K
$num
ƒƒL P
,
ƒƒP Q
nullable
ƒƒR Z
:
ƒƒZ [
false
ƒƒ\ a
)
ƒƒa b
,
ƒƒb c
ClientId
≈≈ 
=
≈≈ 
table
≈≈ $
.
≈≈$ %
Column
≈≈% +
<
≈≈+ ,
int
≈≈, /
>
≈≈/ 0
(
≈≈0 1
nullable
≈≈1 9
:
≈≈9 :
false
≈≈; @
)
≈≈@ A
}
∆∆ 
,
∆∆ 
constraints
«« 
:
«« 
table
«« "
=>
««# %
{
»» 
table
…… 
.
…… 

PrimaryKey
…… $
(
……$ %
$str
……% F
,
……F G
x
……H I
=>
……J L
x
……M N
.
……N O
Id
……O Q
)
……Q R
;
……R S
table
   
.
   

ForeignKey
   $
(
  $ %
name
ÀÀ 
:
ÀÀ 
$str
ÀÀ P
,
ÀÀP Q
column
ÃÃ 
:
ÃÃ 
x
ÃÃ  !
=>
ÃÃ" $
x
ÃÃ% &
.
ÃÃ& '
ClientId
ÃÃ' /
,
ÃÃ/ 0
principalTable
ÕÕ &
:
ÕÕ& '
$str
ÕÕ( 1
,
ÕÕ1 2
principalColumn
ŒŒ '
:
ŒŒ' (
$str
ŒŒ) -
,
ŒŒ- .
onDelete
œœ  
:
œœ  !
ReferentialAction
œœ" 3
.
œœ3 4
Cascade
œœ4 ;
)
œœ; <
;
œœ< =
}
–– 
)
–– 
;
–– 
migrationBuilder
““ 
.
““ 
CreateTable
““ (
(
““( )
name
”” 
:
”” 
$str
”” (
,
””( )
columns
‘‘ 
:
‘‘ 
table
‘‘ 
=>
‘‘ !
new
‘‘" %
{
’’ 
Id
÷÷ 
=
÷÷ 
table
÷÷ 
.
÷÷ 
Column
÷÷ %
<
÷÷% &
int
÷÷& )
>
÷÷) *
(
÷÷* +
nullable
÷÷+ 3
:
÷÷3 4
false
÷÷5 :
)
÷÷: ;
.
◊◊ 

Annotation
◊◊ #
(
◊◊# $
$str
◊◊$ G
,
◊◊G H.
 SqlServerValueGenerationStrategy
◊◊I i
.
◊◊i j
IdentityColumn
◊◊j x
)
◊◊x y
,
◊◊y z
Key
ÿÿ 
=
ÿÿ 
table
ÿÿ 
.
ÿÿ  
Column
ÿÿ  &
<
ÿÿ& '
string
ÿÿ' -
>
ÿÿ- .
(
ÿÿ. /
	maxLength
ÿÿ/ 8
:
ÿÿ8 9
$num
ÿÿ: =
,
ÿÿ= >
nullable
ÿÿ? G
:
ÿÿG H
false
ÿÿI N
)
ÿÿN O
,
ÿÿO P
Value
ŸŸ 
=
ŸŸ 
table
ŸŸ !
.
ŸŸ! "
Column
ŸŸ" (
<
ŸŸ( )
string
ŸŸ) /
>
ŸŸ/ 0
(
ŸŸ0 1
	maxLength
ŸŸ1 :
:
ŸŸ: ;
$num
ŸŸ< @
,
ŸŸ@ A
nullable
ŸŸB J
:
ŸŸJ K
false
ŸŸL Q
)
ŸŸQ R
,
ŸŸR S
ClientId
⁄⁄ 
=
⁄⁄ 
table
⁄⁄ $
.
⁄⁄$ %
Column
⁄⁄% +
<
⁄⁄+ ,
int
⁄⁄, /
>
⁄⁄/ 0
(
⁄⁄0 1
nullable
⁄⁄1 9
:
⁄⁄9 :
false
⁄⁄; @
)
⁄⁄@ A
}
€€ 
,
€€ 
constraints
‹‹ 
:
‹‹ 
table
‹‹ "
=>
‹‹# %
{
›› 
table
ﬁﬁ 
.
ﬁﬁ 

PrimaryKey
ﬁﬁ $
(
ﬁﬁ$ %
$str
ﬁﬁ% :
,
ﬁﬁ: ;
x
ﬁﬁ< =
=>
ﬁﬁ> @
x
ﬁﬁA B
.
ﬁﬁB C
Id
ﬁﬁC E
)
ﬁﬁE F
;
ﬁﬁF G
table
ﬂﬂ 
.
ﬂﬂ 

ForeignKey
ﬂﬂ $
(
ﬂﬂ$ %
name
‡‡ 
:
‡‡ 
$str
‡‡ D
,
‡‡D E
column
·· 
:
·· 
x
··  !
=>
··" $
x
··% &
.
··& '
ClientId
··' /
,
··/ 0
principalTable
‚‚ &
:
‚‚& '
$str
‚‚( 1
,
‚‚1 2
principalColumn
„„ '
:
„„' (
$str
„„) -
,
„„- .
onDelete
‰‰  
:
‰‰  !
ReferentialAction
‰‰" 3
.
‰‰3 4
Cascade
‰‰4 ;
)
‰‰; <
;
‰‰< =
}
ÂÂ 
)
ÂÂ 
;
ÂÂ 
migrationBuilder
ÁÁ 
.
ÁÁ 
CreateTable
ÁÁ (
(
ÁÁ( )
name
ËË 
:
ËË 
$str
ËË *
,
ËË* +
columns
ÈÈ 
:
ÈÈ 
table
ÈÈ 
=>
ÈÈ !
new
ÈÈ" %
{
ÍÍ 
Id
ÎÎ 
=
ÎÎ 
table
ÎÎ 
.
ÎÎ 
Column
ÎÎ %
<
ÎÎ% &
int
ÎÎ& )
>
ÎÎ) *
(
ÎÎ* +
nullable
ÎÎ+ 3
:
ÎÎ3 4
false
ÎÎ5 :
)
ÎÎ: ;
.
ÏÏ 

Annotation
ÏÏ #
(
ÏÏ# $
$str
ÏÏ$ G
,
ÏÏG H.
 SqlServerValueGenerationStrategy
ÏÏI i
.
ÏÏi j
IdentityColumn
ÏÏj x
)
ÏÏx y
,
ÏÏy z
RedirectUri
ÌÌ 
=
ÌÌ  !
table
ÌÌ" '
.
ÌÌ' (
Column
ÌÌ( .
<
ÌÌ. /
string
ÌÌ/ 5
>
ÌÌ5 6
(
ÌÌ6 7
	maxLength
ÌÌ7 @
:
ÌÌ@ A
$num
ÌÌB F
,
ÌÌF G
nullable
ÌÌH P
:
ÌÌP Q
false
ÌÌR W
)
ÌÌW X
,
ÌÌX Y
ClientId
ÓÓ 
=
ÓÓ 
table
ÓÓ $
.
ÓÓ$ %
Column
ÓÓ% +
<
ÓÓ+ ,
int
ÓÓ, /
>
ÓÓ/ 0
(
ÓÓ0 1
nullable
ÓÓ1 9
:
ÓÓ9 :
false
ÓÓ; @
)
ÓÓ@ A
}
ÔÔ 
,
ÔÔ 
constraints
 
:
 
table
 "
=>
# %
{
ÒÒ 
table
ÚÚ 
.
ÚÚ 

PrimaryKey
ÚÚ $
(
ÚÚ$ %
$str
ÚÚ% <
,
ÚÚ< =
x
ÚÚ> ?
=>
ÚÚ@ B
x
ÚÚC D
.
ÚÚD E
Id
ÚÚE G
)
ÚÚG H
;
ÚÚH I
table
ÛÛ 
.
ÛÛ 

ForeignKey
ÛÛ $
(
ÛÛ$ %
name
ÙÙ 
:
ÙÙ 
$str
ÙÙ F
,
ÙÙF G
column
ıı 
:
ıı 
x
ıı  !
=>
ıı" $
x
ıı% &
.
ıı& '
ClientId
ıı' /
,
ıı/ 0
principalTable
ˆˆ &
:
ˆˆ& '
$str
ˆˆ( 1
,
ˆˆ1 2
principalColumn
˜˜ '
:
˜˜' (
$str
˜˜) -
,
˜˜- .
onDelete
¯¯  
:
¯¯  !
ReferentialAction
¯¯" 3
.
¯¯3 4
Cascade
¯¯4 ;
)
¯¯; <
;
¯¯< =
}
˘˘ 
)
˘˘ 
;
˘˘ 
migrationBuilder
˚˚ 
.
˚˚ 
CreateTable
˚˚ (
(
˚˚( )
name
¸¸ 
:
¸¸ 
$str
¸¸ $
,
¸¸$ %
columns
˝˝ 
:
˝˝ 
table
˝˝ 
=>
˝˝ !
new
˝˝" %
{
˛˛ 
Id
ˇˇ 
=
ˇˇ 
table
ˇˇ 
.
ˇˇ 
Column
ˇˇ %
<
ˇˇ% &
int
ˇˇ& )
>
ˇˇ) *
(
ˇˇ* +
nullable
ˇˇ+ 3
:
ˇˇ3 4
false
ˇˇ5 :
)
ˇˇ: ;
.
ÄÄ 

Annotation
ÄÄ #
(
ÄÄ# $
$str
ÄÄ$ G
,
ÄÄG H.
 SqlServerValueGenerationStrategy
ÄÄI i
.
ÄÄi j
IdentityColumn
ÄÄj x
)
ÄÄx y
,
ÄÄy z
Scope
ÅÅ 
=
ÅÅ 
table
ÅÅ !
.
ÅÅ! "
Column
ÅÅ" (
<
ÅÅ( )
string
ÅÅ) /
>
ÅÅ/ 0
(
ÅÅ0 1
	maxLength
ÅÅ1 :
:
ÅÅ: ;
$num
ÅÅ< ?
,
ÅÅ? @
nullable
ÅÅA I
:
ÅÅI J
false
ÅÅK P
)
ÅÅP Q
,
ÅÅQ R
ClientId
ÇÇ 
=
ÇÇ 
table
ÇÇ $
.
ÇÇ$ %
Column
ÇÇ% +
<
ÇÇ+ ,
int
ÇÇ, /
>
ÇÇ/ 0
(
ÇÇ0 1
nullable
ÇÇ1 9
:
ÇÇ9 :
false
ÇÇ; @
)
ÇÇ@ A
}
ÉÉ 
,
ÉÉ 
constraints
ÑÑ 
:
ÑÑ 
table
ÑÑ "
=>
ÑÑ# %
{
ÖÖ 
table
ÜÜ 
.
ÜÜ 

PrimaryKey
ÜÜ $
(
ÜÜ$ %
$str
ÜÜ% 6
,
ÜÜ6 7
x
ÜÜ8 9
=>
ÜÜ: <
x
ÜÜ= >
.
ÜÜ> ?
Id
ÜÜ? A
)
ÜÜA B
;
ÜÜB C
table
áá 
.
áá 

ForeignKey
áá $
(
áá$ %
name
àà 
:
àà 
$str
àà @
,
àà@ A
column
ââ 
:
ââ 
x
ââ  !
=>
ââ" $
x
ââ% &
.
ââ& '
ClientId
ââ' /
,
ââ/ 0
principalTable
ää &
:
ää& '
$str
ää( 1
,
ää1 2
principalColumn
ãã '
:
ãã' (
$str
ãã) -
,
ãã- .
onDelete
åå  
:
åå  !
ReferentialAction
åå" 3
.
åå3 4
Cascade
åå4 ;
)
åå; <
;
åå< =
}
çç 
)
çç 
;
çç 
migrationBuilder
èè 
.
èè 
CreateTable
èè (
(
èè( )
name
êê 
:
êê 
$str
êê %
,
êê% &
columns
ëë 
:
ëë 
table
ëë 
=>
ëë !
new
ëë" %
{
íí 

Expiration
ìì 
=
ìì  
table
ìì! &
.
ìì& '
Column
ìì' -
<
ìì- .
DateTime
ìì. 6
>
ìì6 7
(
ìì7 8
nullable
ìì8 @
:
ìì@ A
true
ììB F
)
ììF G
,
ììG H
Id
îî 
=
îî 
table
îî 
.
îî 
Column
îî %
<
îî% &
int
îî& )
>
îî) *
(
îî* +
nullable
îî+ 3
:
îî3 4
false
îî5 :
)
îî: ;
.
ïï 

Annotation
ïï #
(
ïï# $
$str
ïï$ G
,
ïïG H.
 SqlServerValueGenerationStrategy
ïïI i
.
ïïi j
IdentityColumn
ïïj x
)
ïïx y
,
ïïy z
Description
ññ 
=
ññ  !
table
ññ" '
.
ññ' (
Column
ññ( .
<
ññ. /
string
ññ/ 5
>
ññ5 6
(
ññ6 7
	maxLength
ññ7 @
:
ññ@ A
$num
ññB F
,
ññF G
nullable
ññH P
:
ññP Q
true
ññR V
)
ññV W
,
ññW X
Value
óó 
=
óó 
table
óó !
.
óó! "
Column
óó" (
<
óó( )
string
óó) /
>
óó/ 0
(
óó0 1
	maxLength
óó1 :
:
óó: ;
$num
óó< @
,
óó@ A
nullable
óóB J
:
óóJ K
false
óóL Q
)
óóQ R
,
óóR S
Type
òò 
=
òò 
table
òò  
.
òò  !
Column
òò! '
<
òò' (
string
òò( .
>
òò. /
(
òò/ 0
	maxLength
òò0 9
:
òò9 :
$num
òò; >
,
òò> ?
nullable
òò@ H
:
òòH I
true
òòJ N
)
òòN O
,
òòO P
ClientId
ôô 
=
ôô 
table
ôô $
.
ôô$ %
Column
ôô% +
<
ôô+ ,
int
ôô, /
>
ôô/ 0
(
ôô0 1
nullable
ôô1 9
:
ôô9 :
false
ôô; @
)
ôô@ A
}
öö 
,
öö 
constraints
õõ 
:
õõ 
table
õõ "
=>
õõ# %
{
úú 
table
ùù 
.
ùù 

PrimaryKey
ùù $
(
ùù$ %
$str
ùù% 7
,
ùù7 8
x
ùù9 :
=>
ùù; =
x
ùù> ?
.
ùù? @
Id
ùù@ B
)
ùùB C
;
ùùC D
table
ûû 
.
ûû 

ForeignKey
ûû $
(
ûû$ %
name
üü 
:
üü 
$str
üü A
,
üüA B
column
†† 
:
†† 
x
††  !
=>
††" $
x
††% &
.
††& '
ClientId
††' /
,
††/ 0
principalTable
°° &
:
°°& '
$str
°°( 1
,
°°1 2
principalColumn
¢¢ '
:
¢¢' (
$str
¢¢) -
,
¢¢- .
onDelete
££  
:
££  !
ReferentialAction
££" 3
.
££3 4
Cascade
££4 ;
)
££; <
;
££< =
}
§§ 
)
§§ 
;
§§ 
migrationBuilder
¶¶ 
.
¶¶ 
CreateTable
¶¶ (
(
¶¶( )
name
ßß 
:
ßß 
$str
ßß &
,
ßß& '
columns
®® 
:
®® 
table
®® 
=>
®® !
new
®®" %
{
©© 
Id
™™ 
=
™™ 
table
™™ 
.
™™ 
Column
™™ %
<
™™% &
int
™™& )
>
™™) *
(
™™* +
nullable
™™+ 3
:
™™3 4
false
™™5 :
)
™™: ;
.
´´ 

Annotation
´´ #
(
´´# $
$str
´´$ G
,
´´G H.
 SqlServerValueGenerationStrategy
´´I i
.
´´i j
IdentityColumn
´´j x
)
´´x y
,
´´y z
Type
¨¨ 
=
¨¨ 
table
¨¨  
.
¨¨  !
Column
¨¨! '
<
¨¨' (
string
¨¨( .
>
¨¨. /
(
¨¨/ 0
	maxLength
¨¨0 9
:
¨¨9 :
$num
¨¨; >
,
¨¨> ?
nullable
¨¨@ H
:
¨¨H I
false
¨¨J O
)
¨¨O P
,
¨¨P Q 
IdentityResourceId
≠≠ &
=
≠≠' (
table
≠≠) .
.
≠≠. /
Column
≠≠/ 5
<
≠≠5 6
int
≠≠6 9
>
≠≠9 :
(
≠≠: ;
nullable
≠≠; C
:
≠≠C D
false
≠≠E J
)
≠≠J K
}
ÆÆ 
,
ÆÆ 
constraints
ØØ 
:
ØØ 
table
ØØ "
=>
ØØ# %
{
∞∞ 
table
±± 
.
±± 

PrimaryKey
±± $
(
±±$ %
$str
±±% 8
,
±±8 9
x
±±: ;
=>
±±< >
x
±±? @
.
±±@ A
Id
±±A C
)
±±C D
;
±±D E
table
≤≤ 
.
≤≤ 

ForeignKey
≤≤ $
(
≤≤$ %
name
≥≥ 
:
≥≥ 
$str
≥≥ V
,
≥≥V W
column
¥¥ 
:
¥¥ 
x
¥¥  !
=>
¥¥" $
x
¥¥% &
.
¥¥& ' 
IdentityResourceId
¥¥' 9
,
¥¥9 :
principalTable
µµ &
:
µµ& '
$str
µµ( ;
,
µµ; <
principalColumn
∂∂ '
:
∂∂' (
$str
∂∂) -
,
∂∂- .
onDelete
∑∑  
:
∑∑  !
ReferentialAction
∑∑" 3
.
∑∑3 4
Cascade
∑∑4 ;
)
∑∑; <
;
∑∑< =
}
∏∏ 
)
∏∏ 
;
∏∏ 
migrationBuilder
∫∫ 
.
∫∫ 
CreateTable
∫∫ (
(
∫∫( )
name
ªª 
:
ªª 
$str
ªª "
,
ªª" #
columns
ºº 
:
ºº 
table
ºº 
=>
ºº !
new
ºº" %
{
ΩΩ 
Id
ææ 
=
ææ 
table
ææ 
.
ææ 
Column
ææ %
<
ææ% &
int
ææ& )
>
ææ) *
(
ææ* +
nullable
ææ+ 3
:
ææ3 4
false
ææ5 :
)
ææ: ;
.
øø 

Annotation
øø #
(
øø# $
$str
øø$ G
,
øøG H.
 SqlServerValueGenerationStrategy
øøI i
.
øøi j
IdentityColumn
øøj x
)
øøx y
,
øøy z
RoleId
¿¿ 
=
¿¿ 
table
¿¿ "
.
¿¿" #
Column
¿¿# )
<
¿¿) *
int
¿¿* -
>
¿¿- .
(
¿¿. /
nullable
¿¿/ 7
:
¿¿7 8
false
¿¿9 >
)
¿¿> ?
,
¿¿? @
	ClaimType
¡¡ 
=
¡¡ 
table
¡¡  %
.
¡¡% &
Column
¡¡& ,
<
¡¡, -
string
¡¡- 3
>
¡¡3 4
(
¡¡4 5
nullable
¡¡5 =
:
¡¡= >
true
¡¡? C
)
¡¡C D
,
¡¡D E

ClaimValue
¬¬ 
=
¬¬  
table
¬¬! &
.
¬¬& '
Column
¬¬' -
<
¬¬- .
string
¬¬. 4
>
¬¬4 5
(
¬¬5 6
nullable
¬¬6 >
:
¬¬> ?
true
¬¬@ D
)
¬¬D E
}
√√ 
,
√√ 
constraints
ƒƒ 
:
ƒƒ 
table
ƒƒ "
=>
ƒƒ# %
{
≈≈ 
table
∆∆ 
.
∆∆ 

PrimaryKey
∆∆ $
(
∆∆$ %
$str
∆∆% 4
,
∆∆4 5
x
∆∆6 7
=>
∆∆8 :
x
∆∆; <
.
∆∆< =
Id
∆∆= ?
)
∆∆? @
;
∆∆@ A
table
«« 
.
«« 

ForeignKey
«« $
(
««$ %
name
»» 
:
»» 
$str
»» :
,
»»: ;
column
…… 
:
…… 
x
……  !
=>
……" $
x
……% &
.
……& '
RoleId
……' -
,
……- .
principalTable
   &
:
  & '
$str
  ( /
,
  / 0
principalColumn
ÀÀ '
:
ÀÀ' (
$str
ÀÀ) -
,
ÀÀ- .
onDelete
ÃÃ  
:
ÃÃ  !
ReferentialAction
ÃÃ" 3
.
ÃÃ3 4
Cascade
ÃÃ4 ;
)
ÃÃ; <
;
ÃÃ< =
}
ÕÕ 
)
ÕÕ 
;
ÕÕ 
migrationBuilder
œœ 
.
œœ 
CreateTable
œœ (
(
œœ( )
name
–– 
:
–– 
$str
–– "
,
––" #
columns
—— 
:
—— 
table
—— 
=>
—— !
new
——" %
{
““ 
Id
”” 
=
”” 
table
”” 
.
”” 
Column
”” %
<
””% &
int
””& )
>
””) *
(
””* +
nullable
””+ 3
:
””3 4
false
””5 :
)
””: ;
.
‘‘ 

Annotation
‘‘ #
(
‘‘# $
$str
‘‘$ G
,
‘‘G H.
 SqlServerValueGenerationStrategy
‘‘I i
.
‘‘i j
IdentityColumn
‘‘j x
)
‘‘x y
,
‘‘y z
UserId
’’ 
=
’’ 
table
’’ "
.
’’" #
Column
’’# )
<
’’) *
int
’’* -
>
’’- .
(
’’. /
nullable
’’/ 7
:
’’7 8
false
’’9 >
)
’’> ?
,
’’? @
	ClaimType
÷÷ 
=
÷÷ 
table
÷÷  %
.
÷÷% &
Column
÷÷& ,
<
÷÷, -
string
÷÷- 3
>
÷÷3 4
(
÷÷4 5
nullable
÷÷5 =
:
÷÷= >
true
÷÷? C
)
÷÷C D
,
÷÷D E

ClaimValue
◊◊ 
=
◊◊  
table
◊◊! &
.
◊◊& '
Column
◊◊' -
<
◊◊- .
string
◊◊. 4
>
◊◊4 5
(
◊◊5 6
nullable
◊◊6 >
:
◊◊> ?
true
◊◊@ D
)
◊◊D E
}
ÿÿ 
,
ÿÿ 
constraints
ŸŸ 
:
ŸŸ 
table
ŸŸ "
=>
ŸŸ# %
{
⁄⁄ 
table
€€ 
.
€€ 

PrimaryKey
€€ $
(
€€$ %
$str
€€% 4
,
€€4 5
x
€€6 7
=>
€€8 :
x
€€; <
.
€€< =
Id
€€= ?
)
€€? @
;
€€@ A
table
‹‹ 
.
‹‹ 

ForeignKey
‹‹ $
(
‹‹$ %
name
›› 
:
›› 
$str
›› :
,
››: ;
column
ﬁﬁ 
:
ﬁﬁ 
x
ﬁﬁ  !
=>
ﬁﬁ" $
x
ﬁﬁ% &
.
ﬁﬁ& '
UserId
ﬁﬁ' -
,
ﬁﬁ- .
principalTable
ﬂﬂ &
:
ﬂﬂ& '
$str
ﬂﬂ( /
,
ﬂﬂ/ 0
principalColumn
‡‡ '
:
‡‡' (
$str
‡‡) -
,
‡‡- .
onDelete
··  
:
··  !
ReferentialAction
··" 3
.
··3 4
Cascade
··4 ;
)
··; <
;
··< =
}
‚‚ 
)
‚‚ 
;
‚‚ 
migrationBuilder
‰‰ 
.
‰‰ 
CreateTable
‰‰ (
(
‰‰( )
name
ÂÂ 
:
ÂÂ 
$str
ÂÂ "
,
ÂÂ" #
columns
ÊÊ 
:
ÊÊ 
table
ÊÊ 
=>
ÊÊ !
new
ÊÊ" %
{
ÁÁ 
LoginProvider
ËË !
=
ËË" #
table
ËË$ )
.
ËË) *
Column
ËË* 0
<
ËË0 1
string
ËË1 7
>
ËË7 8
(
ËË8 9
nullable
ËË9 A
:
ËËA B
false
ËËC H
)
ËËH I
,
ËËI J
ProviderKey
ÈÈ 
=
ÈÈ  !
table
ÈÈ" '
.
ÈÈ' (
Column
ÈÈ( .
<
ÈÈ. /
string
ÈÈ/ 5
>
ÈÈ5 6
(
ÈÈ6 7
nullable
ÈÈ7 ?
:
ÈÈ? @
false
ÈÈA F
)
ÈÈF G
,
ÈÈG H!
ProviderDisplayName
ÍÍ '
=
ÍÍ( )
table
ÍÍ* /
.
ÍÍ/ 0
Column
ÍÍ0 6
<
ÍÍ6 7
string
ÍÍ7 =
>
ÍÍ= >
(
ÍÍ> ?
nullable
ÍÍ? G
:
ÍÍG H
true
ÍÍI M
)
ÍÍM N
,
ÍÍN O
UserId
ÎÎ 
=
ÎÎ 
table
ÎÎ "
.
ÎÎ" #
Column
ÎÎ# )
<
ÎÎ) *
int
ÎÎ* -
>
ÎÎ- .
(
ÎÎ. /
nullable
ÎÎ/ 7
:
ÎÎ7 8
false
ÎÎ9 >
)
ÎÎ> ?
}
ÏÏ 
,
ÏÏ 
constraints
ÌÌ 
:
ÌÌ 
table
ÌÌ "
=>
ÌÌ# %
{
ÓÓ 
table
ÔÔ 
.
ÔÔ 

PrimaryKey
ÔÔ $
(
ÔÔ$ %
$str
ÔÔ% 4
,
ÔÔ4 5
x
ÔÔ6 7
=>
ÔÔ8 :
new
ÔÔ; >
{
ÔÔ? @
x
ÔÔA B
.
ÔÔB C
LoginProvider
ÔÔC P
,
ÔÔP Q
x
ÔÔR S
.
ÔÔS T
ProviderKey
ÔÔT _
}
ÔÔ` a
)
ÔÔa b
;
ÔÔb c
table
 
.
 

ForeignKey
 $
(
$ %
name
ÒÒ 
:
ÒÒ 
$str
ÒÒ :
,
ÒÒ: ;
column
ÚÚ 
:
ÚÚ 
x
ÚÚ  !
=>
ÚÚ" $
x
ÚÚ% &
.
ÚÚ& '
UserId
ÚÚ' -
,
ÚÚ- .
principalTable
ÛÛ &
:
ÛÛ& '
$str
ÛÛ( /
,
ÛÛ/ 0
principalColumn
ÙÙ '
:
ÙÙ' (
$str
ÙÙ) -
,
ÙÙ- .
onDelete
ıı  
:
ıı  !
ReferentialAction
ıı" 3
.
ıı3 4
Cascade
ıı4 ;
)
ıı; <
;
ıı< =
}
ˆˆ 
)
ˆˆ 
;
ˆˆ 
migrationBuilder
¯¯ 
.
¯¯ 
CreateTable
¯¯ (
(
¯¯( )
name
˘˘ 
:
˘˘ 
$str
˘˘ !
,
˘˘! "
columns
˙˙ 
:
˙˙ 
table
˙˙ 
=>
˙˙ !
new
˙˙" %
{
˚˚ 
UserId
¸¸ 
=
¸¸ 
table
¸¸ "
.
¸¸" #
Column
¸¸# )
<
¸¸) *
int
¸¸* -
>
¸¸- .
(
¸¸. /
nullable
¸¸/ 7
:
¸¸7 8
false
¸¸9 >
)
¸¸> ?
,
¸¸? @
RoleId
˝˝ 
=
˝˝ 
table
˝˝ "
.
˝˝" #
Column
˝˝# )
<
˝˝) *
int
˝˝* -
>
˝˝- .
(
˝˝. /
nullable
˝˝/ 7
:
˝˝7 8
false
˝˝9 >
)
˝˝> ?
}
˛˛ 
,
˛˛ 
constraints
ˇˇ 
:
ˇˇ 
table
ˇˇ "
=>
ˇˇ# %
{
ÄÄ 
table
ÅÅ 
.
ÅÅ 

PrimaryKey
ÅÅ $
(
ÅÅ$ %
$str
ÅÅ% 3
,
ÅÅ3 4
x
ÅÅ5 6
=>
ÅÅ7 9
new
ÅÅ: =
{
ÅÅ> ?
x
ÅÅ@ A
.
ÅÅA B
UserId
ÅÅB H
,
ÅÅH I
x
ÅÅJ K
.
ÅÅK L
RoleId
ÅÅL R
}
ÅÅS T
)
ÅÅT U
;
ÅÅU V
table
ÇÇ 
.
ÇÇ 

ForeignKey
ÇÇ $
(
ÇÇ$ %
name
ÉÉ 
:
ÉÉ 
$str
ÉÉ 9
,
ÉÉ9 :
column
ÑÑ 
:
ÑÑ 
x
ÑÑ  !
=>
ÑÑ" $
x
ÑÑ% &
.
ÑÑ& '
RoleId
ÑÑ' -
,
ÑÑ- .
principalTable
ÖÖ &
:
ÖÖ& '
$str
ÖÖ( /
,
ÖÖ/ 0
principalColumn
ÜÜ '
:
ÜÜ' (
$str
ÜÜ) -
,
ÜÜ- .
onDelete
áá  
:
áá  !
ReferentialAction
áá" 3
.
áá3 4
Cascade
áá4 ;
)
áá; <
;
áá< =
table
àà 
.
àà 

ForeignKey
àà $
(
àà$ %
name
ââ 
:
ââ 
$str
ââ 9
,
ââ9 :
column
ää 
:
ää 
x
ää  !
=>
ää" $
x
ää% &
.
ää& '
UserId
ää' -
,
ää- .
principalTable
ãã &
:
ãã& '
$str
ãã( /
,
ãã/ 0
principalColumn
åå '
:
åå' (
$str
åå) -
,
åå- .
onDelete
çç  
:
çç  !
ReferentialAction
çç" 3
.
çç3 4
Cascade
çç4 ;
)
çç; <
;
çç< =
}
éé 
)
éé 
;
éé 
migrationBuilder
êê 
.
êê 
CreateTable
êê (
(
êê( )
name
ëë 
:
ëë 
$str
ëë "
,
ëë" #
columns
íí 
:
íí 
table
íí 
=>
íí !
new
íí" %
{
ìì 
UserId
îî 
=
îî 
table
îî "
.
îî" #
Column
îî# )
<
îî) *
int
îî* -
>
îî- .
(
îî. /
nullable
îî/ 7
:
îî7 8
false
îî9 >
)
îî> ?
,
îî? @
LoginProvider
ïï !
=
ïï" #
table
ïï$ )
.
ïï) *
Column
ïï* 0
<
ïï0 1
string
ïï1 7
>
ïï7 8
(
ïï8 9
nullable
ïï9 A
:
ïïA B
false
ïïC H
)
ïïH I
,
ïïI J
Name
ññ 
=
ññ 
table
ññ  
.
ññ  !
Column
ññ! '
<
ññ' (
string
ññ( .
>
ññ. /
(
ññ/ 0
nullable
ññ0 8
:
ññ8 9
false
ññ: ?
)
ññ? @
,
ññ@ A
Value
óó 
=
óó 
table
óó !
.
óó! "
Column
óó" (
<
óó( )
string
óó) /
>
óó/ 0
(
óó0 1
nullable
óó1 9
:
óó9 :
true
óó; ?
)
óó? @
}
òò 
,
òò 
constraints
ôô 
:
ôô 
table
ôô "
=>
ôô# %
{
öö 
table
õõ 
.
õõ 

PrimaryKey
õõ $
(
õõ$ %
$str
õõ% 4
,
õõ4 5
x
õõ6 7
=>
õõ8 :
new
õõ; >
{
õõ? @
x
õõA B
.
õõB C
UserId
õõC I
,
õõI J
x
õõK L
.
õõL M
LoginProvider
õõM Z
,
õõZ [
x
õõ\ ]
.
õõ] ^
Name
õõ^ b
}
õõc d
)
õõd e
;
õõe f
table
úú 
.
úú 

ForeignKey
úú $
(
úú$ %
name
ùù 
:
ùù 
$str
ùù :
,
ùù: ;
column
ûû 
:
ûû 
x
ûû  !
=>
ûû" $
x
ûû% &
.
ûû& '
UserId
ûû' -
,
ûû- .
principalTable
üü &
:
üü& '
$str
üü( /
,
üü/ 0
principalColumn
†† '
:
††' (
$str
††) -
,
††- .
onDelete
°°  
:
°°  !
ReferentialAction
°°" 3
.
°°3 4
Cascade
°°4 ;
)
°°; <
;
°°< =
}
¢¢ 
)
¢¢ 
;
¢¢ 
migrationBuilder
§§ 
.
§§ 
CreateTable
§§ (
(
§§( )
name
•• 
:
•• 
$str
•• &
,
••& '
columns
¶¶ 
:
¶¶ 
table
¶¶ 
=>
¶¶ !
new
¶¶" %
{
ßß 
Id
®® 
=
®® 
table
®® 
.
®® 
Column
®® %
<
®®% &
int
®®& )
>
®®) *
(
®®* +
nullable
®®+ 3
:
®®3 4
false
®®5 :
)
®®: ;
.
©© 

Annotation
©© #
(
©©# $
$str
©©$ G
,
©©G H.
 SqlServerValueGenerationStrategy
©©I i
.
©©i j
IdentityColumn
©©j x
)
©©x y
,
©©y z
Type
™™ 
=
™™ 
table
™™  
.
™™  !
Column
™™! '
<
™™' (
string
™™( .
>
™™. /
(
™™/ 0
	maxLength
™™0 9
:
™™9 :
$num
™™; >
,
™™> ?
nullable
™™@ H
:
™™H I
false
™™J O
)
™™O P
,
™™P Q

ApiScopeId
´´ 
=
´´  
table
´´! &
.
´´& '
Column
´´' -
<
´´- .
int
´´. 1
>
´´1 2
(
´´2 3
nullable
´´3 ;
:
´´; <
false
´´= B
)
´´B C
}
¨¨ 
,
¨¨ 
constraints
≠≠ 
:
≠≠ 
table
≠≠ "
=>
≠≠# %
{
ÆÆ 
table
ØØ 
.
ØØ 

PrimaryKey
ØØ $
(
ØØ$ %
$str
ØØ% 8
,
ØØ8 9
x
ØØ: ;
=>
ØØ< >
x
ØØ? @
.
ØØ@ A
Id
ØØA C
)
ØØC D
;
ØØD E
table
∞∞ 
.
∞∞ 

ForeignKey
∞∞ $
(
∞∞$ %
name
±± 
:
±± 
$str
±± F
,
±±F G
column
≤≤ 
:
≤≤ 
x
≤≤  !
=>
≤≤" $
x
≤≤% &
.
≤≤& '

ApiScopeId
≤≤' 1
,
≤≤1 2
principalTable
≥≥ &
:
≥≥& '
$str
≥≥( 3
,
≥≥3 4
principalColumn
¥¥ '
:
¥¥' (
$str
¥¥) -
,
¥¥- .
onDelete
µµ  
:
µµ  !
ReferentialAction
µµ" 3
.
µµ3 4
Cascade
µµ4 ;
)
µµ; <
;
µµ< =
}
∂∂ 
)
∂∂ 
;
∂∂ 
migrationBuilder
∏∏ 
.
∏∏ 
CreateIndex
∏∏ (
(
∏∏( )
name
ππ 
:
ππ 
$str
ππ 2
,
ππ2 3
table
∫∫ 
:
∫∫ 
$str
∫∫ "
,
∫∫" #
column
ªª 
:
ªª 
$str
ªª '
)
ªª' (
;
ªª( )
migrationBuilder
ΩΩ 
.
ΩΩ 
CreateIndex
ΩΩ (
(
ΩΩ( )
name
ææ 
:
ææ 
$str
ææ ,
,
ææ, -
table
øø 
:
øø 
$str
øø %
,
øø% &
column
¿¿ 
:
¿¿ 
$str
¿¿ 
,
¿¿ 
unique
¡¡ 
:
¡¡ 
true
¡¡ 
)
¡¡ 
;
¡¡ 
migrationBuilder
√√ 
.
√√ 
CreateIndex
√√ (
(
√√( )
name
ƒƒ 
:
ƒƒ 
$str
ƒƒ 4
,
ƒƒ4 5
table
≈≈ 
:
≈≈ 
$str
≈≈ '
,
≈≈' (
column
∆∆ 
:
∆∆ 
$str
∆∆ $
)
∆∆$ %
;
∆∆% &
migrationBuilder
»» 
.
»» 
CreateIndex
»» (
(
»»( )
name
…… 
:
…… 
$str
…… 2
,
……2 3
table
   
:
   
$str
   "
,
  " #
column
ÀÀ 
:
ÀÀ 
$str
ÀÀ '
)
ÀÀ' (
;
ÀÀ( )
migrationBuilder
ÕÕ 
.
ÕÕ 
CreateIndex
ÕÕ (
(
ÕÕ( )
name
ŒŒ 
:
ŒŒ 
$str
ŒŒ )
,
ŒŒ) *
table
œœ 
:
œœ 
$str
œœ "
,
œœ" #
column
–– 
:
–– 
$str
–– 
,
–– 
unique
—— 
:
—— 
true
—— 
)
—— 
;
—— 
migrationBuilder
”” 
.
”” 
CreateIndex
”” (
(
””( )
name
‘‘ 
:
‘‘ 
$str
‘‘ 3
,
‘‘3 4
table
’’ 
:
’’ 
$str
’’ #
,
’’# $
column
÷÷ 
:
÷÷ 
$str
÷÷ '
)
÷÷' (
;
÷÷( )
migrationBuilder
ÿÿ 
.
ÿÿ 
CreateIndex
ÿÿ (
(
ÿÿ( )
name
ŸŸ 
:
ŸŸ 
$str
ŸŸ 0
,
ŸŸ0 1
table
⁄⁄ 
:
⁄⁄ 
$str
⁄⁄ %
,
⁄⁄% &
column
€€ 
:
€€ 
$str
€€ "
)
€€" #
;
€€# $
migrationBuilder
›› 
.
›› 
CreateIndex
›› (
(
››( )
name
ﬁﬁ 
:
ﬁﬁ 
$str
ﬁﬁ 5
,
ﬁﬁ5 6
table
ﬂﬂ 
:
ﬂﬂ 
$str
ﬂﬂ *
,
ﬂﬂ* +
column
‡‡ 
:
‡‡ 
$str
‡‡ "
)
‡‡" #
;
‡‡# $
migrationBuilder
‚‚ 
.
‚‚ 
CreateIndex
‚‚ (
(
‚‚( )
name
„„ 
:
„„ 
$str
„„ 4
,
„„4 5
table
‰‰ 
:
‰‰ 
$str
‰‰ )
,
‰‰) *
column
ÂÂ 
:
ÂÂ 
$str
ÂÂ "
)
ÂÂ" #
;
ÂÂ# $
migrationBuilder
ÁÁ 
.
ÁÁ 
CreateIndex
ÁÁ (
(
ÁÁ( )
name
ËË 
:
ËË 
$str
ËË 9
,
ËË9 :
table
ÈÈ 
:
ÈÈ 
$str
ÈÈ .
,
ÈÈ. /
column
ÍÍ 
:
ÍÍ 
$str
ÍÍ "
)
ÍÍ" #
;
ÍÍ# $
migrationBuilder
ÏÏ 
.
ÏÏ 
CreateIndex
ÏÏ (
(
ÏÏ( )
name
ÌÌ 
:
ÌÌ 
$str
ÌÌ @
,
ÌÌ@ A
table
ÓÓ 
:
ÓÓ 
$str
ÓÓ 5
,
ÓÓ5 6
column
ÔÔ 
:
ÔÔ 
$str
ÔÔ "
)
ÔÔ" #
;
ÔÔ# $
migrationBuilder
ÒÒ 
.
ÒÒ 
CreateIndex
ÒÒ (
(
ÒÒ( )
name
ÚÚ 
:
ÚÚ 
$str
ÚÚ 4
,
ÚÚ4 5
table
ÛÛ 
:
ÛÛ 
$str
ÛÛ )
,
ÛÛ) *
column
ÙÙ 
:
ÙÙ 
$str
ÙÙ "
)
ÙÙ" #
;
ÙÙ# $
migrationBuilder
ˆˆ 
.
ˆˆ 
CreateIndex
ˆˆ (
(
ˆˆ( )
name
˜˜ 
:
˜˜ 
$str
˜˜ 6
,
˜˜6 7
table
¯¯ 
:
¯¯ 
$str
¯¯ +
,
¯¯+ ,
column
˘˘ 
:
˘˘ 
$str
˘˘ "
)
˘˘" #
;
˘˘# $
migrationBuilder
˚˚ 
.
˚˚ 
CreateIndex
˚˚ (
(
˚˚( )
name
¸¸ 
:
¸¸ 
$str
¸¸ +
,
¸¸+ ,
table
˝˝ 
:
˝˝ 
$str
˝˝  
,
˝˝  !
column
˛˛ 
:
˛˛ 
$str
˛˛ "
,
˛˛" #
unique
ˇˇ 
:
ˇˇ 
true
ˇˇ 
)
ˇˇ 
;
ˇˇ 
migrationBuilder
ÅÅ 
.
ÅÅ 
CreateIndex
ÅÅ (
(
ÅÅ( )
name
ÇÇ 
:
ÇÇ 
$str
ÇÇ 0
,
ÇÇ0 1
table
ÉÉ 
:
ÉÉ 
$str
ÉÉ %
,
ÉÉ% &
column
ÑÑ 
:
ÑÑ 
$str
ÑÑ "
)
ÑÑ" #
;
ÑÑ# $
migrationBuilder
ÜÜ 
.
ÜÜ 
CreateIndex
ÜÜ (
(
ÜÜ( )
name
áá 
:
áá 
$str
áá 1
,
áá1 2
table
àà 
:
àà 
$str
àà &
,
àà& '
column
ââ 
:
ââ 
$str
ââ "
)
ââ" #
;
ââ# $
migrationBuilder
ãã 
.
ãã 
CreateIndex
ãã (
(
ãã( )
name
åå 
:
åå 
$str
åå <
,
åå< =
table
çç 
:
çç 
$str
çç '
,
çç' (
column
éé 
:
éé 
$str
éé ,
)
éé, -
;
éé- .
migrationBuilder
êê 
.
êê 
CreateIndex
êê (
(
êê( )
name
ëë 
:
ëë 
$str
ëë 1
,
ëë1 2
table
íí 
:
íí 
$str
íí *
,
íí* +
column
ìì 
:
ìì 
$str
ìì 
,
ìì 
unique
îî 
:
îî 
true
îî 
)
îî 
;
îî 
migrationBuilder
ññ 
.
ññ 
CreateIndex
ññ (
(
ññ( )
name
óó 
:
óó 
$str
óó B
,
óóB C
table
òò 
:
òò 
$str
òò (
,
òò( )
columns
ôô 
:
ôô 
new
ôô 
[
ôô 
]
ôô 
{
ôô  
$str
ôô! ,
,
ôô, -
$str
ôô. 8
,
ôô8 9
$str
ôô: @
}
ôôA B
)
ôôB C
;
ôôC D
migrationBuilder
õõ 
.
õõ 
CreateIndex
õõ (
(
õõ( )
name
úú 
:
úú 
$str
úú ,
,
úú, -
table
ùù 
:
ùù 
$str
ùù #
,
ùù# $
column
ûû 
:
ûû 
$str
ûû  
)
ûû  !
;
ûû! "
migrationBuilder
†† 
.
†† 
CreateIndex
†† (
(
††( )
name
°° 
:
°° 
$str
°° %
,
°°% &
table
¢¢ 
:
¢¢ 
$str
¢¢ 
,
¢¢ 
column
££ 
:
££ 
$str
££ (
,
££( )
unique
§§ 
:
§§ 
true
§§ 
,
§§ 
filter
•• 
:
•• 
$str
•• 6
)
••6 7
;
••7 8
migrationBuilder
ßß 
.
ßß 
CreateIndex
ßß (
(
ßß( )
name
®® 
:
®® 
$str
®® ,
,
®®, -
table
©© 
:
©© 
$str
©© #
,
©©# $
column
™™ 
:
™™ 
$str
™™  
)
™™  !
;
™™! "
migrationBuilder
¨¨ 
.
¨¨ 
CreateIndex
¨¨ (
(
¨¨( )
name
≠≠ 
:
≠≠ 
$str
≠≠ ,
,
≠≠, -
table
ÆÆ 
:
ÆÆ 
$str
ÆÆ #
,
ÆÆ# $
column
ØØ 
:
ØØ 
$str
ØØ  
)
ØØ  !
;
ØØ! "
migrationBuilder
±± 
.
±± 
CreateIndex
±± (
(
±±( )
name
≤≤ 
:
≤≤ 
$str
≤≤ +
,
≤≤+ ,
table
≥≥ 
:
≥≥ 
$str
≥≥ "
,
≥≥" #
column
¥¥ 
:
¥¥ 
$str
¥¥  
)
¥¥  !
;
¥¥! "
migrationBuilder
∂∂ 
.
∂∂ 
CreateIndex
∂∂ (
(
∂∂( )
name
∑∑ 
:
∑∑ 
$str
∑∑ "
,
∑∑" #
table
∏∏ 
:
∏∏ 
$str
∏∏ 
,
∏∏ 
column
ππ 
:
ππ 
$str
ππ )
)
ππ) *
;
ππ* +
migrationBuilder
ªª 
.
ªª 
CreateIndex
ªª (
(
ªª( )
name
ºº 
:
ºº 
$str
ºº %
,
ºº% &
table
ΩΩ 
:
ΩΩ 
$str
ΩΩ 
,
ΩΩ 
column
ææ 
:
ææ 
$str
ææ ,
,
ææ, -
unique
øø 
:
øø 
true
øø 
,
øø 
filter
¿¿ 
:
¿¿ 
$str
¿¿ :
)
¿¿: ;
;
¿¿; <
}
¡¡ 	
	protected
√√ 
override
√√ 
void
√√ 
Down
√√  $
(
√√$ %
MigrationBuilder
√√% 5
migrationBuilder
√√6 F
)
√√F G
{
ƒƒ 	
migrationBuilder
≈≈ 
.
≈≈ 
	DropTable
≈≈ &
(
≈≈& '
name
∆∆ 
:
∆∆ 
$str
∆∆ !
)
∆∆! "
;
∆∆" #
migrationBuilder
»» 
.
»» 
	DropTable
»» &
(
»»& '
name
…… 
:
…… 
$str
…… &
)
……& '
;
……' (
migrationBuilder
ÀÀ 
.
ÀÀ 
	DropTable
ÀÀ &
(
ÀÀ& '
name
ÃÃ 
:
ÃÃ 
$str
ÃÃ "
)
ÃÃ" #
;
ÃÃ# $
migrationBuilder
ŒŒ 
.
ŒŒ 
	DropTable
ŒŒ &
(
ŒŒ& '
name
œœ 
:
œœ 
$str
œœ $
)
œœ$ %
;
œœ% &
migrationBuilder
—— 
.
—— 
	DropTable
—— &
(
——& '
name
““ 
:
““ 
$str
““ )
)
““) *
;
““* +
migrationBuilder
‘‘ 
.
‘‘ 
	DropTable
‘‘ &
(
‘‘& '
name
’’ 
:
’’ 
$str
’’ (
)
’’( )
;
’’) *
migrationBuilder
◊◊ 
.
◊◊ 
	DropTable
◊◊ &
(
◊◊& '
name
ÿÿ 
:
ÿÿ 
$str
ÿÿ -
)
ÿÿ- .
;
ÿÿ. /
migrationBuilder
⁄⁄ 
.
⁄⁄ 
	DropTable
⁄⁄ &
(
⁄⁄& '
name
€€ 
:
€€ 
$str
€€ 4
)
€€4 5
;
€€5 6
migrationBuilder
›› 
.
›› 
	DropTable
›› &
(
››& '
name
ﬁﬁ 
:
ﬁﬁ 
$str
ﬁﬁ (
)
ﬁﬁ( )
;
ﬁﬁ) *
migrationBuilder
‡‡ 
.
‡‡ 
	DropTable
‡‡ &
(
‡‡& '
name
·· 
:
·· 
$str
·· *
)
··* +
;
··+ ,
migrationBuilder
„„ 
.
„„ 
	DropTable
„„ &
(
„„& '
name
‰‰ 
:
‰‰ 
$str
‰‰ $
)
‰‰$ %
;
‰‰% &
migrationBuilder
ÊÊ 
.
ÊÊ 
	DropTable
ÊÊ &
(
ÊÊ& '
name
ÁÁ 
:
ÁÁ 
$str
ÁÁ %
)
ÁÁ% &
;
ÁÁ& '
migrationBuilder
ÈÈ 
.
ÈÈ 
	DropTable
ÈÈ &
(
ÈÈ& '
name
ÍÍ 
:
ÍÍ 
$str
ÍÍ &
)
ÍÍ& '
;
ÍÍ' (
migrationBuilder
ÏÏ 
.
ÏÏ 
	DropTable
ÏÏ &
(
ÏÏ& '
name
ÌÌ 
:
ÌÌ 
$str
ÌÌ 
)
ÌÌ 
;
ÌÌ 
migrationBuilder
ÔÔ 
.
ÔÔ 
	DropTable
ÔÔ &
(
ÔÔ& '
name
 
:
 
$str
 '
)
' (
;
( )
migrationBuilder
ÚÚ 
.
ÚÚ 
	DropTable
ÚÚ &
(
ÚÚ& '
name
ÛÛ 
:
ÛÛ 
$str
ÛÛ "
)
ÛÛ" #
;
ÛÛ# $
migrationBuilder
ıı 
.
ıı 
	DropTable
ıı &
(
ıı& '
name
ˆˆ 
:
ˆˆ 
$str
ˆˆ "
)
ˆˆ" #
;
ˆˆ# $
migrationBuilder
¯¯ 
.
¯¯ 
	DropTable
¯¯ &
(
¯¯& '
name
˘˘ 
:
˘˘ 
$str
˘˘ "
)
˘˘" #
;
˘˘# $
migrationBuilder
˚˚ 
.
˚˚ 
	DropTable
˚˚ &
(
˚˚& '
name
¸¸ 
:
¸¸ 
$str
¸¸ !
)
¸¸! "
;
¸¸" #
migrationBuilder
˛˛ 
.
˛˛ 
	DropTable
˛˛ &
(
˛˛& '
name
ˇˇ 
:
ˇˇ 
$str
ˇˇ "
)
ˇˇ" #
;
ˇˇ# $
migrationBuilder
ÅÅ 
.
ÅÅ 
	DropTable
ÅÅ &
(
ÅÅ& '
name
ÇÇ 
:
ÇÇ 
$str
ÇÇ !
)
ÇÇ! "
;
ÇÇ" #
migrationBuilder
ÑÑ 
.
ÑÑ 
	DropTable
ÑÑ &
(
ÑÑ& '
name
ÖÖ 
:
ÖÖ 
$str
ÖÖ 
)
ÖÖ  
;
ÖÖ  !
migrationBuilder
áá 
.
áá 
	DropTable
áá &
(
áá& '
name
àà 
:
àà 
$str
àà )
)
àà) *
;
àà* +
migrationBuilder
ää 
.
ää 
	DropTable
ää &
(
ää& '
name
ãã 
:
ãã 
$str
ãã 
)
ãã 
;
ãã 
migrationBuilder
çç 
.
çç 
	DropTable
çç &
(
çç& '
name
éé 
:
éé 
$str
éé 
)
éé 
;
éé 
migrationBuilder
êê 
.
êê 
	DropTable
êê &
(
êê& '
name
ëë 
:
ëë 
$str
ëë $
)
ëë$ %
;
ëë% &
}
íí 	
}
ìì 
}îî éS
éC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\ExceptionHandling\ControllerExceptionFilterAttribute.cs
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
return	} É
;
É Ñ
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
string	bb| Ç
title
bbÉ à
=
bbâ ä
$str
bbã ç
)
bbç é
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
NotificationKey	oou Ñ
]
ooÑ Ö
.
ooÖ Ü
ToString
ooÜ é
(
ooé è
)
ooè ê
)
ooê ë
;
ooë í
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
} ò

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
} ÑX
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
ÄÄ 
identityResources
ÄÄ %
=
ÄÄ& '
ClientResources
ÄÄ( 7
.
ÄÄ7 8"
GetIdentityResources
ÄÄ8 L
(
ÄÄL M
)
ÄÄM N
.
ÄÄN O
ToList
ÄÄO U
(
ÄÄU V
)
ÄÄV W
;
ÄÄW X
foreach
ÇÇ 
(
ÇÇ 
var
ÇÇ 
resource
ÇÇ %
in
ÇÇ& (
identityResources
ÇÇ) :
)
ÇÇ: ;
{
ÉÉ 
await
ÑÑ 
context
ÑÑ !
.
ÑÑ! "
IdentityResources
ÑÑ" 3
.
ÑÑ3 4
AddAsync
ÑÑ4 <
(
ÑÑ< =
resource
ÑÑ= E
.
ÑÑE F
ToEntity
ÑÑF N
(
ÑÑN O
)
ÑÑO P
)
ÑÑP Q
;
ÑÑQ R
}
ÖÖ 
await
áá 
context
áá 
.
áá 
SaveChangesAsync
áá .
(
áá. /
)
áá/ 0
;
áá0 1
}
àà 
if
ää 
(
ää 
!
ää 
context
ää 
.
ää 
ApiResources
ää %
.
ää% &
Any
ää& )
(
ää) *
)
ää* +
)
ää+ ,
{
ãã 
foreach
åå 
(
åå 
var
åå 
resource
åå %
in
åå& (
ClientResources
åå) 8
.
åå8 9
GetApiResources
åå9 H
(
ååH I
)
ååI J
.
ååJ K
ToList
ååK Q
(
ååQ R
)
ååR S
)
ååS T
{
çç 
await
éé 
context
éé !
.
éé! "
ApiResources
éé" .
.
éé. /
AddAsync
éé/ 7
(
éé7 8
resource
éé8 @
.
éé@ A
ToEntity
ééA I
(
ééI J
)
ééJ K
)
ééK L
;
ééL M
}
èè 
await
ëë 
context
ëë 
.
ëë 
SaveChangesAsync
ëë .
(
ëë. /
)
ëë/ 0
;
ëë0 1
}
íí 
}
ìì 	
}
îî 
}ïï ì
ÄC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\Helpers\Identity\IdentityErrorMessages.cs
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
} ≥

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
} Ëÿ
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
ConfigurationConsts	00t á
.
00á à&
AdminConnectionStringKey
00à †
)
00† °
,
00° ¢

optionsSql
00£ ≠
=>
00Æ ∞

optionsSql
00± ª
.
00ª º 
MigrationsAssembly
00º Œ
(
00Œ œ 
migrationsAssembly
00œ ·
)
00· ‚
)
00‚ „
)
00„ ‰
;
00‰ Â
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
ëë 	
public
ìì 
static
ìì 
void
ìì 
AddDbContexts
ìì (
(
ìì( )
this
ìì) - 
IServiceCollection
ìì. @
services
ììA I
,
ììI J!
IHostingEnvironment
ììK ^ 
hostingEnvironment
ìì_ q
,
ììq r!
IConfigurationRootììs Ö
configurationììÜ ì
)ììì î
{
îî 	
if
ïï 
(
ïï  
hostingEnvironment
ïï "
.
ïï" #
	IsStaging
ïï# ,
(
ïï, -
)
ïï- .
)
ïï. /
{
ññ 
services
óó 
.
óó '
RegisterDbContextsStaging
óó 2
(
óó2 3
)
óó3 4
;
óó4 5
}
òò 
else
ôô 
{
öö 
services
õõ 
.
õõ  
RegisterDbContexts
õõ +
(
õõ+ ,
configuration
õõ, 9
)
õõ9 :
;
õõ: ;
}
úú 
}
ùù 	
public
üü 
static
üü 
void
üü &
AddAuthorizationPolicies
üü 3
(
üü3 4
this
üü4 8 
IServiceCollection
üü9 K
services
üüL T
)
üüT U
{
†† 	
services
°° 
.
°° 
AddAuthorization
°° %
(
°°% &
options
°°& -
=>
°°. 0
{
¢¢ 
options
££ 
.
££ 
	AddPolicy
££ !
(
££! "!
AuthorizationConsts
££" 5
.
££5 6"
AdministrationPolicy
££6 J
,
££J K
policy
§§ 
=>
§§ 
policy
§§ $
.
§§$ %
RequireRole
§§% 0
(
§§0 1!
AuthorizationConsts
§§1 D
.
§§D E 
AdministrationRole
§§E W
)
§§W X
)
§§X Y
;
§§Y Z
}
•• 
)
•• 
;
•• 
}
¶¶ 	
public
®® 
static
®® 
void
®® 
AddServices
®® &
(
®®& '
this
®®' + 
IServiceCollection
®®, >
services
®®? G
)
®®G H
{
©© 	
services
´´ 
.
´´ 
AddTransient
´´ !
<
´´! "
IClientRepository
´´" 3
,
´´3 4
ClientRepository
´´5 E
>
´´E F
(
´´F G
)
´´G H
;
´´H I
services
¨¨ 
.
¨¨ 
AddTransient
¨¨ !
<
¨¨! ")
IIdentityResourceRepository
¨¨" =
,
¨¨= >(
IdentityResourceRepository
¨¨? Y
>
¨¨Y Z
(
¨¨Z [
)
¨¨[ \
;
¨¨\ ]
services
≠≠ 
.
≠≠ 
AddTransient
≠≠ !
<
≠≠! "!
IIdentityRepository
≠≠" 5
,
≠≠5 6 
IdentityRepository
≠≠7 I
>
≠≠I J
(
≠≠J K
)
≠≠K L
;
≠≠L M
services
ÆÆ 
.
ÆÆ 
AddTransient
ÆÆ !
<
ÆÆ! "$
IApiResourceRepository
ÆÆ" 8
,
ÆÆ8 9#
ApiResourceRepository
ÆÆ: O
>
ÆÆO P
(
ÆÆP Q
)
ÆÆQ R
;
ÆÆR S
services
ØØ 
.
ØØ 
AddTransient
ØØ !
<
ØØ! "'
IPersistedGrantRepository
ØØ" ;
,
ØØ; <&
PersistedGrantRepository
ØØ= U
>
ØØU V
(
ØØV W
)
ØØW X
;
ØØX Y
services
∞∞ 
.
∞∞ 
AddTransient
∞∞ !
<
∞∞! "
ILogRepository
∞∞" 0
,
∞∞0 1
LogRepository
∞∞2 ?
>
∞∞? @
(
∞∞@ A
)
∞∞A B
;
∞∞B C
services
≥≥ 
.
≥≥ 
AddTransient
≥≥ !
<
≥≥! "
ILogService
≥≥" -
,
≥≥- .

LogService
≥≥/ 9
>
≥≥9 :
(
≥≥: ;
)
≥≥; <
;
≥≥< =
services
¥¥ 
.
¥¥ 
AddTransient
¥¥ !
<
¥¥! "
IClientService
¥¥" 0
,
¥¥0 1
ClientService
¥¥2 ?
>
¥¥? @
(
¥¥@ A
)
¥¥A B
;
¥¥B C
services
µµ 
.
µµ 
AddTransient
µµ !
<
µµ! "!
IApiResourceService
µµ" 5
,
µµ5 6 
ApiResourceService
µµ7 I
>
µµI J
(
µµJ K
)
µµK L
;
µµL M
services
∂∂ 
.
∂∂ 
AddTransient
∂∂ !
<
∂∂! "&
IIdentityResourceService
∂∂" :
,
∂∂: ;%
IdentityResourceService
∂∂< S
>
∂∂S T
(
∂∂T U
)
∂∂U V
;
∂∂V W
services
∑∑ 
.
∑∑ 
AddTransient
∑∑ !
<
∑∑! "$
IPersistedGrantService
∑∑" 8
,
∑∑8 9#
PersistedGrantService
∑∑: O
>
∑∑O P
(
∑∑P Q
)
∑∑Q R
;
∑∑R S
services
∏∏ 
.
∏∏ 
AddTransient
∏∏ !
<
∏∏! "
IIdentityService
∏∏" 2
,
∏∏2 3
IdentityService
∏∏4 C
>
∏∏C D
(
∏∏D E
)
∏∏E F
;
∏∏F G
services
ªª 
.
ªª 
	AddScoped
ªª 
<
ªª *
IApiResourceServiceResources
ªª ;
,
ªª; <)
ApiResourceServiceResources
ªª= X
>
ªªX Y
(
ªªY Z
)
ªªZ [
;
ªª[ \
services
ºº 
.
ºº 
	AddScoped
ºº 
<
ºº %
IClientServiceResources
ºº 6
,
ºº6 7$
ClientServiceResources
ºº8 N
>
ººN O
(
ººO P
)
ººP Q
;
ººQ R
services
ΩΩ 
.
ΩΩ 
	AddScoped
ΩΩ 
<
ΩΩ /
!IIdentityResourceServiceResources
ΩΩ @
,
ΩΩ@ A.
 IdentityResourceServiceResources
ΩΩB b
>
ΩΩb c
(
ΩΩc d
)
ΩΩd e
;
ΩΩe f
services
ææ 
.
ææ 
	AddScoped
ææ 
<
ææ '
IIdentityServiceResources
ææ 8
,
ææ8 9&
IdentityServiceResources
ææ: R
>
ææR S
(
ææS T
)
ææT U
;
ææU V
services
øø 
.
øø 
	AddScoped
øø 
<
øø -
IPersistedGrantServiceResources
øø >
,
øø> ?,
PersistedGrantServiceResources
øø@ ^
>
øø^ _
(
øø_ `
)
øø` a
;
øøa b
services
¬¬ 
.
¬¬ 
	AddScoped
¬¬ 
<
¬¬ 0
"ControllerExceptionFilterAttribute
¬¬ A
>
¬¬A B
(
¬¬B C
)
¬¬C D
;
¬¬D E
}
√√ 	
public
≈≈ 
static
≈≈ 
void
≈≈  
AddMvcLocalization
≈≈ -
(
≈≈- .
this
≈≈. 2 
IServiceCollection
≈≈3 E
services
≈≈F N
)
≈≈N O
{
∆∆ 	
services
«« 
.
«« 
AddSingleton
«« !
<
««! "
ITempDataProvider
««" 3
,
««3 4$
CookieTempDataProvider
««5 K
>
««K L
(
««L M
)
««M N
;
««N O
services
…… 
.
…… 
AddLocalization
…… $
(
……$ %
opts
……% )
=>
……* ,
{
……- .
opts
……/ 3
.
……3 4
ResourcesPath
……4 A
=
……B C!
ConfigurationConsts
……D W
.
……W X
ResourcesPath
……X e
;
……e f
}
……g h
)
……h i
;
……i j
services
ÀÀ 
.
ÀÀ 
AddMvc
ÀÀ 
(
ÀÀ 
)
ÀÀ 
.
ÃÃ %
SetCompatibilityVersion
ÃÃ (
(
ÃÃ( )"
CompatibilityVersion
ÃÃ) =
.
ÃÃ= >
Version_2_1
ÃÃ> I
)
ÃÃI J
.
ÕÕ !
AddViewLocalization
ÕÕ $
(
ÕÕ$ %0
"LanguageViewLocationExpanderFormat
ŒŒ 6
.
ŒŒ6 7
Suffix
ŒŒ7 =
,
ŒŒ= >
opts
œœ 
=>
œœ 
{
œœ 
opts
œœ "
.
œœ" #
ResourcesPath
œœ# 0
=
œœ1 2!
ConfigurationConsts
œœ3 F
.
œœF G
ResourcesPath
œœG T
;
œœT U
}
œœV W
)
œœW X
.
–– ,
AddDataAnnotationsLocalization
–– /
(
––/ 0
)
––0 1
;
––1 2
services
““ 
.
““ 
	Configure
““ 
<
““ (
RequestLocalizationOptions
““ 9
>
““9 :
(
““: ;
opts
”” 
=>
”” 
{
‘‘ 
var
’’ 
supportedCultures
’’ )
=
’’* +
new
’’, /
[
’’/ 0
]
’’0 1
{
÷÷ 
new
◊◊ 
CultureInfo
◊◊ '
(
◊◊' (
$str
◊◊( /
)
◊◊/ 0
,
◊◊0 1
new
ÿÿ 
CultureInfo
ÿÿ '
(
ÿÿ' (
$str
ÿÿ( ,
)
ÿÿ, -
}
ŸŸ 
;
ŸŸ 
opts
€€ 
.
€€ #
DefaultRequestCulture
€€ .
=
€€/ 0
new
€€1 4
RequestCulture
€€5 C
(
€€C D
$str
€€D H
)
€€H I
;
€€I J
opts
‹‹ 
.
‹‹ 
SupportedCultures
‹‹ *
=
‹‹+ ,
supportedCultures
‹‹- >
;
‹‹> ?
opts
›› 
.
›› !
SupportedUICultures
›› ,
=
››- .
supportedCultures
››/ @
;
››@ A
}
ﬁﬁ 
)
ﬁﬁ 
;
ﬁﬁ 
}
ﬂﬂ 	
public
·· 
static
·· 
void
·· 
AddAuthentication
·· ,
(
··, -
this
··- 1 
IServiceCollection
··2 D
services
··E M
,
··M N!
IHostingEnvironment
··O b 
hostingEnvironment
··c u
)
··u v
{
‚‚ 	
services
„„ 
.
„„ 
AddIdentity
„„  
<
„„  !
UserIdentity
„„! -
,
„„- .
UserIdentityRole
„„/ ?
>
„„? @
(
„„@ A
)
„„A B
.
‰‰ &
AddEntityFrameworkStores
‰‰ )
<
‰‰) *
AdminDbContext
‰‰* 8
>
‰‰8 9
(
‰‰9 :
)
‰‰: ;
.
ÂÂ &
AddDefaultTokenProviders
ÂÂ )
(
ÂÂ) *
)
ÂÂ* +
;
ÂÂ+ ,
if
ËË 
(
ËË  
hostingEnvironment
ËË "
.
ËË" #
	IsStaging
ËË# ,
(
ËË, -
)
ËË- .
)
ËË. /
{
ÈÈ 
services
ÍÍ 
.
ÍÍ 
AddAuthentication
ÍÍ *
(
ÍÍ* +
options
ÍÍ+ 2
=>
ÍÍ3 5
{
ÎÎ 
options
ÏÏ 
.
ÏÏ 
DefaultScheme
ÏÏ )
=
ÏÏ* +*
CookieAuthenticationDefaults
ÏÏ, H
.
ÏÏH I"
AuthenticationScheme
ÏÏI ]
;
ÏÏ] ^
options
ÌÌ 
.
ÌÌ $
DefaultChallengeScheme
ÌÌ 2
=
ÌÌ3 4*
CookieAuthenticationDefaults
ÌÌ5 Q
.
ÌÌQ R"
AuthenticationScheme
ÌÌR f
;
ÌÌf g
options
ÔÔ 
.
ÔÔ '
DefaultAuthenticateScheme
ÔÔ 5
=
ÔÔ6 7*
CookieAuthenticationDefaults
ÔÔ8 T
.
ÔÔT U"
AuthenticationScheme
ÔÔU i
;
ÔÔi j
options
 
.
 !
DefaultForbidScheme
 /
=
0 1*
CookieAuthenticationDefaults
2 N
.
N O"
AuthenticationScheme
O c
;
c d
options
ÒÒ 
.
ÒÒ !
DefaultSignInScheme
ÒÒ /
=
ÒÒ0 1*
CookieAuthenticationDefaults
ÒÒ2 N
.
ÒÒN O"
AuthenticationScheme
ÒÒO c
;
ÒÒc d
options
ÚÚ 
.
ÚÚ "
DefaultSignOutScheme
ÚÚ 0
=
ÚÚ1 2*
CookieAuthenticationDefaults
ÚÚ3 O
.
ÚÚO P"
AuthenticationScheme
ÚÚP d
;
ÚÚd e
}
ÛÛ 
)
ÛÛ 
.
ÙÙ 
	AddCookie
ÙÙ 
(
ÙÙ *
CookieAuthenticationDefaults
ÙÙ ;
.
ÙÙ; <"
AuthenticationScheme
ÙÙ< P
,
ÙÙP Q
options
ıı 
=>
ıı  "
{
ıı# $
options
ıı% ,
.
ıı, -
Cookie
ıı- 3
.
ıı3 4
Name
ıı4 8
=
ıı9 :!
AuthorizationConsts
ıı; N
.
ııN O%
IdentityAdminCookieName
ııO f
;
ııf g
}
ııh i
)
ııi j
;
ııj k
}
ˆˆ 
else
˜˜ 
{
¯¯ 
services
˘˘ 
.
˘˘ 
AddAuthentication
˘˘ *
(
˘˘* +
options
˘˘+ 2
=>
˘˘3 5
{
˙˙ 
options
˚˚ 
.
˚˚ 
DefaultScheme
˚˚ )
=
˚˚* +*
CookieAuthenticationDefaults
˚˚, H
.
˚˚H I"
AuthenticationScheme
˚˚I ]
;
˚˚] ^
options
¸¸ 
.
¸¸ $
DefaultChallengeScheme
¸¸ 2
=
¸¸3 4!
AuthorizationConsts
¸¸5 H
.
¸¸H I&
OidcAuthenticationScheme
¸¸I a
;
¸¸a b
options
˛˛ 
.
˛˛ '
DefaultAuthenticateScheme
˛˛ 5
=
˛˛6 7*
CookieAuthenticationDefaults
˛˛8 T
.
˛˛T U"
AuthenticationScheme
˛˛U i
;
˛˛i j
options
ˇˇ 
.
ˇˇ !
DefaultForbidScheme
ˇˇ /
=
ˇˇ0 1*
CookieAuthenticationDefaults
ˇˇ2 N
.
ˇˇN O"
AuthenticationScheme
ˇˇO c
;
ˇˇc d
options
ÄÄ 
.
ÄÄ !
DefaultSignInScheme
ÄÄ /
=
ÄÄ0 1*
CookieAuthenticationDefaults
ÄÄ2 N
.
ÄÄN O"
AuthenticationScheme
ÄÄO c
;
ÄÄc d
options
ÅÅ 
.
ÅÅ "
DefaultSignOutScheme
ÅÅ 0
=
ÅÅ1 2*
CookieAuthenticationDefaults
ÅÅ3 O
.
ÅÅO P"
AuthenticationScheme
ÅÅP d
;
ÅÅd e
}
ÇÇ 
)
ÇÇ 
.
ÉÉ 
	AddCookie
ÉÉ 
(
ÉÉ *
CookieAuthenticationDefaults
ÉÉ ;
.
ÉÉ; <"
AuthenticationScheme
ÉÉ< P
,
ÉÉP Q
options
ÑÑ 
=>
ÑÑ  "
{
ÑÑ# $
options
ÑÑ% ,
.
ÑÑ, -
Cookie
ÑÑ- 3
.
ÑÑ3 4
Name
ÑÑ4 8
=
ÑÑ9 :!
AuthorizationConsts
ÑÑ; N
.
ÑÑN O%
IdentityAdminCookieName
ÑÑO f
;
ÑÑf g
}
ÑÑh i
)
ÑÑi j
.
ÖÖ 
AddOpenIdConnect
ÖÖ %
(
ÖÖ% &!
AuthorizationConsts
ÖÖ& 9
.
ÖÖ9 :&
OidcAuthenticationScheme
ÖÖ: R
,
ÖÖR S
options
ÖÖT [
=>
ÖÖ\ ^
{
ÜÜ 
options
áá 
.
áá  
	Authority
áá  )
=
áá* +!
AuthorizationConsts
áá, ?
.
áá? @#
IdentityServerBaseUrl
áá@ U
;
ááU V
options
àà 
.
àà  "
RequireHttpsMetadata
àà  4
=
àà5 6
false
àà7 <
;
àà< =
options
ää 
.
ää  
ClientId
ää  (
=
ää) *!
AuthorizationConsts
ää+ >
.
ää> ?
OidcClientId
ää? K
;
ääK L
options
åå 
.
åå  
Scope
åå  %
.
åå% &
Clear
åå& +
(
åå+ ,
)
åå, -
;
åå- .
options
çç 
.
çç  
Scope
çç  %
.
çç% &
Add
çç& )
(
çç) *!
AuthorizationConsts
çç* =
.
çç= >
ScopeOpenId
çç> I
)
ççI J
;
ççJ K
options
éé 
.
éé  
Scope
éé  %
.
éé% &
Add
éé& )
(
éé) *!
AuthorizationConsts
éé* =
.
éé= >
ScopeProfile
éé> J
)
ééJ K
;
ééK L
options
èè 
.
èè  
Scope
èè  %
.
èè% &
Add
èè& )
(
èè) *!
AuthorizationConsts
èè* =
.
èè= >

ScopeEmail
èè> H
)
èèH I
;
èèI J
options
êê 
.
êê  
Scope
êê  %
.
êê% &
Add
êê& )
(
êê) *!
AuthorizationConsts
êê* =
.
êê= >

ScopeRoles
êê> H
)
êêH I
;
êêI J
options
íí 
.
íí  

SaveTokens
íí  *
=
íí+ ,
true
íí- 1
;
íí1 2
options
îî 
.
îî  '
TokenValidationParameters
îî  9
=
îî: ;
new
îî< ?'
TokenValidationParameters
îî@ Y
{
ïï 
NameClaimType
ññ )
=
ññ* +
JwtClaimTypes
ññ, 9
.
ññ9 :
Name
ññ: >
,
ññ> ?
RoleClaimType
óó )
=
óó* +
JwtClaimTypes
óó, 9
.
óó9 :
Role
óó: >
,
óó> ?
}
òò 
;
òò 
options
öö 
.
öö  
Events
öö  &
=
öö' (
new
öö) ,!
OpenIdConnectEvents
öö- @
{
õõ 
OnMessageReceived
úú -
=
úú. /
OnMessageReceived
úú0 A
,
úúA B*
OnRedirectToIdentityProvider
ùù 8
=
ùù9 :*
OnRedirectToIdentityProvider
ùù; W
}
ûû 
;
ûû 
}
üü 
)
üü 
;
üü 
}
†† 
}
°° 	
private
££ 
static
££ 
Task
££ 
OnMessageReceived
££ -
(
££- .$
MessageReceivedContext
££. D
context
££E L
)
££L M
{
§§ 	
context
•• 
.
•• 

Properties
•• 
.
•• 
IsPersistent
•• +
=
••, -
true
••. 2
;
••2 3
context
¶¶ 
.
¶¶ 

Properties
¶¶ 
.
¶¶ 

ExpiresUtc
¶¶ )
=
¶¶* +
new
¶¶, /
DateTimeOffset
¶¶0 >
(
¶¶> ?
DateTime
¶¶? G
.
¶¶G H
Now
¶¶H K
.
¶¶K L
AddHours
¶¶L T
(
¶¶T U
$num
¶¶U W
)
¶¶W X
)
¶¶X Y
;
¶¶Y Z
return
®® 
Task
®® 
.
®® 

FromResult
®® "
(
®®" #
$num
®®# $
)
®®$ %
;
®®% &
}
©© 	
private
´´ 
static
´´ 
Task
´´ *
OnRedirectToIdentityProvider
´´ 8
(
´´8 9
RedirectContext
´´9 H
n
´´I J
)
´´J K
{
¨¨ 	
n
≠≠ 
.
≠≠ 
ProtocolMessage
≠≠ 
.
≠≠ 
RedirectUri
≠≠ )
=
≠≠* +!
AuthorizationConsts
≠≠, ?
.
≠≠? @&
IdentityAdminRedirectUri
≠≠@ X
;
≠≠X Y
return
ØØ 
Task
ØØ 
.
ØØ 

FromResult
ØØ "
(
ØØ" #
$num
ØØ# $
)
ØØ$ %
;
ØØ% &
}
∞∞ 	
}
±± 
}≤≤ –V
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
V<div data-bind=\'component: {{ name: \"picker\", params: {{ search: \"\", hiddenId: \"	AA1 á
{
AAá à
Id
AAà ä
}
AAä ã
\", url: \"
AAã ñ
{
AAñ ó
Url
AAó ö
}
AAö õ(
\", selectedItemsTitle: \"
AAõ µ
{
AAµ ∂ 
SelectedItemsTitle
AA∂ »
}
AA» …'
\", allowSuggestedItems: 
AA… ‚
{
AA‚ „!
AllowSuggestedItems
AA„ ˆ
.
AAˆ ˜
ToString
AA˜ ˇ
(
AAˇ Ä
)
AAÄ Å
.
AAÅ Ç
ToLower
AAÇ â
(
AAâ ä
)
AAä ã
}
AAã å%
, searchResultTitle: \"
AAå £
{
AA£ §
SearchResultTitle
AA§ µ
}
AAµ ∂)
\", suggestedItemsTitle: \"
AA∂ —
{
AA— “!
SuggestedItemsTitle
AA“ Â
}
AAÂ Ê)
\", noItemSelectedTitle: \"
AAÊ Å
{
AAÅ Ç!
NoItemSelectedTitle
AAÇ ï
}
AAï ñ,
\", searchInputPlaceholder: \"
AAñ ¥
{
AA¥ µ$
SearchInputPlaceholder
AAµ À
}
AAÀ Ã'
\", showAllItemsTitle: \"
AAÃ Â
{
AAÂ Ê
ShowAllItemsTitle
AAÊ ˜
}
AA˜ ¯!
\", selectedItems: 
AA¯ ã
{
AAã å
selectedItems
AAå ô
}
AAô ö
, minSearchText: 
AAö ´
{
AA´ ¨
MinSearchText
AA¨ π
}
AAπ ∫#
, topSuggestedItems: 
AA∫ œ
{
AAœ –
TopSuggestedItems
AA– ·
}
AA· ‚ 
 ,multipleSelect: 
AA‚ Ù
{
AAÙ ı
MultipleSelect
AAı É
.
AAÉ Ñ
ToString
AAÑ å
(
AAå ç
)
AAç é
.
AAé è
ToLower
AAè ñ
(
AAñ ó
)
AAó ò
}
AAò ô
 }}}}\'></div>
AAô ß
"
AAß ®
)
AA® ©
;
AA© ™
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
.	QQ Ä
SerializeObject
QQÄ è
(
QQè ê
SelectedItem
QQê ú
)
QQú ù
;
QQù û
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
}ii „
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
} ˘
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
} ˜	
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
} ú
ôC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\Infrastructure\Exceptions\FailingMiddlewareAppBuilderExtensions.cs
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
} ë5
ÜC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\Infrastructure\Middlewares\FailingMiddleware.cs
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
}UU ∏
ÉC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\Infrastructure\Middlewares\FailingOptions.cs
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
} ª
âC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\Infrastructure\Middlewares\FailingStartupFilter.cs
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
} ◊

éC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\Infrastructure\Middlewares\WebHostBuildertExtensions.cs
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
} œ3
àC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin\Middlewares\AuthenticatedTestRequestMiddleware.cs
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
}CC ‡A
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
+	 Ä
$num
Å Ç
)
Ç É
;
É Ñ
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
}cc â
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
} ò/
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