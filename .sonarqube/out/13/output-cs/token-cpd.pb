≥
C:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin.EntityFramework\Constants\TableConsts.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
EntityFramework& 5
.5 6
	Constants6 ?
{ 
public 

static 
class 
TableConsts #
{ 
public 
const 
string 
IdentityRoles )
=* +
$str, 3
;3 4
public 
const 
string 
IdentityRoleClaims .
=/ 0
$str1 =
;= >
public 
const 
string 
IdentityUserRoles -
=. /
$str0 ;
;; <
public 
const 
string 
IdentityUsers )
=* +
$str, 3
;3 4
public		 
const		 
string		 
IdentityUserLogins		 .
=		/ 0
$str		1 =
;		= >
public

 
const

 
string

 
IdentityUserClaims

 .
=

/ 0
$str

1 =
;

= >
public 
const 
string 
IdentityUserTokens .
=/ 0
$str1 =
;= >
public 
const 
string 
Logging #
=$ %
$str& +
;+ ,
} 
} ∂î
ÉC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin.EntityFramework\DbContexts\AdminDbContext.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
EntityFramework& 5
.5 6

DbContexts6 @
{ 
public 

class 
AdminDbContext 
:  !
IdentityDbContext" 3
<3 4
UserIdentity4 @
,@ A
UserIdentityRoleB R
,R S
intT W
,W X!
UserIdentityUserClaimY n
,n o!
UserIdentityUserRole	p Ñ
,
Ñ Ö#
UserIdentityUserLogin
Ü õ
,
õ ú#
UserIdentityRoleClaim
ù ≤
,
≤ ≥#
UserIdentityUserToken
¥ …
>
…  
,
  À#
IConfigurationDbContext 
,  $
IPersistedGrantDbContext! 9
{ 
private 
readonly 
	IMediator "
	_mediator# ,
;, -
private !
IDbContextTransaction %
_currentTransaction& 9
;9 :
private 
readonly %
ConfigurationStoreOptions 2
_storeOptions3 @
;@ A
private 
readonly #
OperationalStoreOptions 0
_operationalOptions1 D
;D E
public 
bool  
HasActiveTransaction (
=>) +
_currentTransaction, ?
!=@ B
nullC G
;G H
public 
AdminDbContext 
( 
DbContextOptions .
<. /
AdminDbContext/ =
>= >
options? F
)F G
:H I
baseJ N
(N O
optionsO V
)V W
{X Y
}Z [
public!! 
AdminDbContext!! 
(!! 
DbContextOptions!! .
<!!. /
AdminDbContext!!/ =
>!!= >
options!!? F
,!!F G%
ConfigurationStoreOptions"" %
storeOptions""& 2
,""2 3#
OperationalStoreOptions## '
operationalOptions##( :
)##: ;
:$$ 
base$$ 
($$ 
options$$ 
)$$ 
{%% 	
_storeOptions&& 
=&& 
storeOptions&& (
;&&( )
_operationalOptions'' 
=''  !
operationalOptions''" 4
;''4 5
}(( 	
public** 
AdminDbContext** 
(** 
DbContextOptions** .
<**. /
AdminDbContext**/ =
>**= >
options**? F
,**F G
	IMediator**H Q
mediator**R Z
)**Z [
:**\ ]
base**^ b
(**b c
options**c j
)**j k
{++ 	
	_mediator,, 
=,, 
mediator,,  
??,,! #
throw,,$ )
new,,* -!
ArgumentNullException,,. C
(,,C D
nameof,,D J
(,,J K
mediator,,K S
),,S T
),,T U
;,,U V
System.. 
... 
Diagnostics.. 
... 
Debug.. $
...$ %
	WriteLine..% .
(... /
$str../ H
+..I J
this..K O
...O P
GetHashCode..P [
(..[ \
)..\ ]
)..] ^
;..^ _
}// 	
public11 
DbSet11 
<11 
ApiResource11  
>11  !
ApiResources11" .
{11/ 0
get111 4
;114 5
set116 9
;119 :
}11; <
public33 
DbSet33 
<33 
IdentityResource33 %
>33% &
IdentityResources33' 8
{339 :
get33; >
;33> ?
set33@ C
;33C D
}33E F
public55 
DbSet55 
<55 
	ApiSecret55 
>55 

ApiSecrets55  *
{55+ ,
get55- 0
;550 1
set552 5
;555 6
}557 8
public77 
DbSet77 
<77 
ApiScope77 
>77 
	ApiScopes77 (
{77) *
get77+ .
;77. /
set770 3
;773 4
}775 6
public99 
DbSet99 
<99 
ApiScopeClaim99 "
>99" #
ApiScopeClaims99$ 2
{993 4
get995 8
;998 9
set99: =
;99= >
}99? @
public;; 
DbSet;; 
<;; 
IdentityClaim;; "
>;;" #
IdentityClaims;;$ 2
{;;3 4
get;;5 8
;;;8 9
set;;: =
;;;= >
};;? @
public== 
DbSet== 
<== 
ApiResourceClaim== %
>==% &
ApiResourceClaims==' 8
{==9 :
get==; >
;==> ?
set==@ C
;==C D
}==E F
public?? 
DbSet?? 
<?? 
Client?? 
>?? 
Clients?? $
{??% &
get??' *
;??* +
set??, /
;??/ 0
}??1 2
publicAA 
DbSetAA 
<AA 
ClientGrantTypeAA $
>AA$ %
ClientGrantTypesAA& 6
{AA7 8
getAA9 <
;AA< =
setAA> A
;AAA B
}AAC D
publicCC 
DbSetCC 
<CC 
ClientScopeCC  
>CC  !
ClientScopesCC" .
{CC/ 0
getCC1 4
;CC4 5
setCC6 9
;CC9 :
}CC; <
publicEE 
DbSetEE 
<EE 
ClientSecretEE !
>EE! "
ClientSecretsEE# 0
{EE1 2
getEE3 6
;EE6 7
setEE8 ;
;EE; <
}EE= >
publicGG 
DbSetGG 
<GG '
ClientPostLogoutRedirectUriGG 0
>GG0 1(
ClientPostLogoutRedirectUrisGG2 N
{GGO P
getGGQ T
;GGT U
setGGV Y
;GGY Z
}GG[ \
publicII 
DbSetII 
<II 
ClientCorsOriginII %
>II% &
ClientCorsOriginsII' 8
{II9 :
getII; >
;II> ?
setII@ C
;IIC D
}IIE F
publicKK 
DbSetKK 
<KK  
ClientIdPRestrictionKK )
>KK) *!
ClientIdPRestrictionsKK+ @
{KKA B
getKKC F
;KKF G
setKKH K
;KKK L
}KKM N
publicMM 
DbSetMM 
<MM 
ClientRedirectUriMM &
>MM& '
ClientRedirectUrisMM( :
{MM; <
getMM= @
;MM@ A
setMMB E
;MME F
}MMG H
publicOO 
DbSetOO 
<OO 
ClientClaimOO  
>OO  !
ClientClaimsOO" .
{OO/ 0
getOO1 4
;OO4 5
setOO6 9
;OO9 :
}OO; <
publicQQ 
DbSetQQ 
<QQ 
ClientPropertyQQ #
>QQ# $
ClientPropertiesQQ% 5
{QQ6 7
getQQ8 ;
;QQ; <
setQQ= @
;QQ@ A
}QQB C
publicSS 
DbSetSS 
<SS 
PersistedGrantSS #
>SS# $
PersistedGrantsSS% 4
{SS5 6
getSS7 :
;SS: ;
setSS< ?
;SS? @
}SSA B
publicUU 
DbSetUU 
<UU 
LogUU 
>UU 
LogsUU 
{UU  
getUU! $
;UU$ %
setUU& )
;UU) *
}UU+ ,
publicWW 
TaskWW 
<WW 
intWW 
>WW 
SaveChangesAsyncWW )
(WW) *
)WW* +
{XX 	
returnYY 
baseYY 
.YY 
SaveChangesAsyncYY (
(YY( )
)YY) *
;YY* +
}ZZ 	
	protected\\ 
override\\ 
void\\ 
OnModelCreating\\  /
(\\/ 0
ModelBuilder\\0 <
builder\\= D
)\\D E
{]] 	
base^^ 
.^^ 
OnModelCreating^^  
(^^  !
builder^^! (
)^^( )
;^^) *$
ConfigureIdentityContext`` $
(``$ %
builder``% ,
)``, -
;``- .
varbb #
operationalStoreOptionsbb '
=bb( )
(bb* +
_operationalOptionsbb+ >
!=bb? A
nullbbB F
)bbF G
?bbH I
_operationalOptionsbbJ ]
:bb^ _
newbb` c#
OperationalStoreOptionsbbd {
(bb{ |
)bb| }
;bb} ~
varcc 
storeOptionscc 
=cc 
(cc  
_storeOptionscc  -
!=cc. 0
nullcc1 5
)cc5 6
?cc7 8
_storeOptionscc9 F
:ccG H
newccI L%
ConfigurationStoreOptionsccM f
(ccf g
)ccg h
;cch i
builderee 
.ee "
ConfigureClientContextee *
(ee* +
storeOptionsee+ 7
)ee7 8
;ee8 9
builderff 
.ff %
ConfigureResourcesContextff -
(ff- .
storeOptionsff. :
)ff: ;
;ff; <
buildergg 
.gg *
ConfigurePersistedGrantContextgg 2
(gg2 3#
operationalStoreOptionsgg3 J
)ggJ K
;ggK L
}hh 	
privatejj 
voidjj $
ConfigureIdentityContextjj -
(jj- .
ModelBuilderjj. :
builderjj; B
)jjB C
{kk 	
builderll 
.ll 
Entityll 
<ll 
UserIdentityRolell +
>ll+ ,
(ll, -
)ll- .
.ll. /
ToTablell/ 6
(ll6 7
TableConstsll7 B
.llB C
IdentityRolesllC P
)llP Q
;llQ R
buildermm 
.mm 
Entitymm 
<mm !
UserIdentityRoleClaimmm 0
>mm0 1
(mm1 2
)mm2 3
.mm3 4
ToTablemm4 ;
(mm; <
TableConstsmm< G
.mmG H
IdentityRoleClaimsmmH Z
)mmZ [
;mm[ \
buildernn 
.nn 
Entitynn 
<nn  
UserIdentityUserRolenn /
>nn/ 0
(nn0 1
)nn1 2
.nn2 3
ToTablenn3 :
(nn: ;
TableConstsnn; F
.nnF G
IdentityUserRolesnnG X
)nnX Y
;nnY Z
builderpp 
.pp 
Entitypp 
<pp 
UserIdentitypp '
>pp' (
(pp( )
)pp) *
.pp* +
ToTablepp+ 2
(pp2 3
TableConstspp3 >
.pp> ?
IdentityUserspp? L
)ppL M
;ppM N
builderqq 
.qq 
Entityqq 
<qq !
UserIdentityUserLoginqq 0
>qq0 1
(qq1 2
)qq2 3
.qq3 4
ToTableqq4 ;
(qq; <
TableConstsqq< G
.qqG H
IdentityUserLoginsqqH Z
)qqZ [
;qq[ \
builderrr 
.rr 
Entityrr 
<rr !
UserIdentityUserClaimrr 0
>rr0 1
(rr1 2
)rr2 3
.rr3 4
ToTablerr4 ;
(rr; <
TableConstsrr< G
.rrG H
IdentityUserClaimsrrH Z
)rrZ [
;rr[ \
builderss 
.ss 
Entityss 
<ss !
UserIdentityUserTokenss 0
>ss0 1
(ss1 2
)ss2 3
.ss3 4
ToTabless4 ;
(ss; <
TableConstsss< G
.ssG H
IdentityUserTokensssH Z
)ssZ [
;ss[ \
}tt 	
publicvv 
asyncvv 
Taskvv 
<vv 
boolvv 
>vv 
SaveEntitiesAsyncvv  1
(vv1 2
CancellationTokenvv2 C
cancellationTokenvvD U
=vvV W
defaultvvX _
(vv_ `
CancellationTokenvv` q
)vvq r
)vvr s
{ww 	
_xx 
=xx 
awaitxx 
basexx 
.xx 
SaveChangesAsyncxx +
(xx+ ,
cancellationTokenxx, =
)xx= >
;xx> ?
returnyy 
trueyy 
;yy 
}zz 	
public|| 
async|| 
Task|| 
<|| !
IDbContextTransaction|| /
>||/ 0!
BeginTransactionAsync||1 F
(||F G
)||G H
{}} 	
if~~ 
(~~ 
_currentTransaction~~ #
!=~~$ &
null~~' +
)~~+ ,
return~~- 3
null~~4 8
;~~8 9!
_currentTransaction
ÄÄ 
=
ÄÄ  !
await
ÄÄ" '
Database
ÄÄ( 0
.
ÄÄ0 1#
BeginTransactionAsync
ÄÄ1 F
(
ÄÄF G
IsolationLevel
ÄÄG U
.
ÄÄU V
ReadCommitted
ÄÄV c
)
ÄÄc d
;
ÄÄd e
return
ÇÇ !
_currentTransaction
ÇÇ &
;
ÇÇ& '
}
ÉÉ 	
public
ÖÖ 
void
ÖÖ !
RollbackTransaction
ÖÖ '
(
ÖÖ' (
)
ÖÖ( )
{
ÜÜ 	
try
áá 
{
àà !
_currentTransaction
ââ #
?
ââ# $
.
ââ$ %
Rollback
ââ% -
(
ââ- .
)
ââ. /
;
ââ/ 0
}
ää 
finally
ãã 
{
åå 
if
çç 
(
çç !
_currentTransaction
çç '
!=
çç( *
null
çç+ /
)
çç/ 0
{
éé !
_currentTransaction
èè '
.
èè' (
Dispose
èè( /
(
èè/ 0
)
èè0 1
;
èè1 2!
_currentTransaction
êê '
=
êê( )
null
êê* .
;
êê. /
}
ëë 
}
íí 
}
ìì 	
public
ïï 
async
ïï 
Task
ïï $
CommitTransactionAsync
ïï 0
(
ïï0 1#
IDbContextTransaction
ïï1 F
transaction
ïïG R
)
ïïR S
{
ññ 	
if
óó 
(
óó 
transaction
óó 
==
óó 
null
óó #
)
óó# $
throw
óó% *
new
óó+ .#
ArgumentNullException
óó/ D
(
óóD E
nameof
óóE K
(
óóK L
transaction
óóL W
)
óóW X
)
óóX Y
;
óóY Z
if
òò 
(
òò 
transaction
òò 
!=
òò !
_currentTransaction
òò 2
)
òò2 3
throw
òò4 9
new
òò: ='
InvalidOperationException
òò> W
(
òòW X
$"
òòX Z
Transaction 
òòZ f
{
òòf g
transaction
òòg r
.
òòr s
TransactionIdòòs Ä
}òòÄ Å
 is not currentòòÅ ê
"òòê ë
)òòë í
;òòí ì
try
öö 
{
õõ 
await
úú 
SaveChangesAsync
úú &
(
úú& '
)
úú' (
;
úú( )
transaction
ùù 
.
ùù 
Commit
ùù "
(
ùù" #
)
ùù# $
;
ùù$ %
}
ûû 
catch
üü 
{
†† !
RollbackTransaction
°° #
(
°°# $
)
°°$ %
;
°°% &
throw
¢¢ 
;
¢¢ 
}
££ 
finally
§§ 
{
•• 
if
¶¶ 
(
¶¶ !
_currentTransaction
¶¶ '
!=
¶¶( *
null
¶¶+ /
)
¶¶/ 0
{
ßß !
_currentTransaction
®® '
.
®®' (
Dispose
®®( /
(
®®/ 0
)
®®0 1
;
®®1 2!
_currentTransaction
©© '
=
©©( )
null
©©* .
;
©©. /
}
™™ 
}
´´ 
}
¨¨ 	
}
≠≠ 
public
ØØ 

class
ØØ )
AdminDbContextDesignFactory
ØØ ,
:
ØØ- .)
IDesignTimeDbContextFactory
ØØ/ J
<
ØØJ K
AdminDbContext
ØØK Y
>
ØØY Z
{
∞∞ 
public
±± 
AdminDbContext
±± 
CreateDbContext
±± -
(
±±- .
string
±±. 4
[
±±4 5
]
±±5 6
args
±±7 ;
)
±±; <
{
≤≤ 	
var
≥≥ 
optionsBuilder
≥≥ 
=
≥≥  
new
≥≥! $%
DbContextOptionsBuilder
≥≥% <
<
≥≥< =
AdminDbContext
≥≥= K
>
≥≥K L
(
≥≥L M
)
≥≥M N
.
¥¥ 
UseSqlServer
¥¥ 
(
¥¥ 
$str
¥¥ f
)
¥¥f g
;
¥¥g h
return
∂∂ 
new
∂∂ 
AdminDbContext
∂∂ %
(
∂∂% &
optionsBuilder
∂∂& 4
.
∂∂4 5
Options
∂∂5 <
,
∂∂< =
new
∂∂> A

NoMediator
∂∂B L
(
∂∂L M
)
∂∂M N
)
∂∂N O
;
∂∂O P
}
∑∑ 	
class
ππ 

NoMediator
ππ 
:
ππ 
	IMediator
ππ $
{
∫∫ 	
public
ªª 
Task
ªª 
Publish
ªª 
<
ªª  
TNotification
ªª  -
>
ªª- .
(
ªª. /
TNotification
ªª/ <
notification
ªª= I
,
ªªI J
CancellationToken
ªªK \
cancellationToken
ªª] n
=
ªªo p
default
ªªq x
(
ªªx y 
CancellationTokenªªy ä
)ªªä ã
)ªªã å
whereªªç í
TNotificationªªì †
:ªª° ¢
INotificationªª£ ∞
{
ºº 
return
ΩΩ 
Task
ΩΩ 
.
ΩΩ 
CompletedTask
ΩΩ )
;
ΩΩ) *
}
ææ 
public
¿¿ 
Task
¿¿ 
<
¿¿ 
	TResponse
¿¿ !
>
¿¿! "
Send
¿¿# '
<
¿¿' (
	TResponse
¿¿( 1
>
¿¿1 2
(
¿¿2 3
IRequest
¿¿3 ;
<
¿¿; <
	TResponse
¿¿< E
>
¿¿E F
request
¿¿G N
,
¿¿N O
CancellationToken
¿¿P a
cancellationToken
¿¿b s
=
¿¿t u
default
¿¿v }
(
¿¿} ~ 
CancellationToken¿¿~ è
)¿¿è ê
)¿¿ê ë
{
¡¡ 
return
¬¬ 
Task
¬¬ 
.
¬¬ 

FromResult
¬¬ &
<
¬¬& '
	TResponse
¬¬' 0
>
¬¬0 1
(
¬¬1 2
default
¬¬2 9
(
¬¬9 :
	TResponse
¬¬: C
)
¬¬C D
)
¬¬D E
;
¬¬E F
}
√√ 
public
≈≈ 
Task
≈≈ 
Send
≈≈ 
(
≈≈ 
IRequest
≈≈ %
request
≈≈& -
,
≈≈- .
CancellationToken
≈≈/ @
cancellationToken
≈≈A R
=
≈≈S T
default
≈≈U \
(
≈≈\ ]
CancellationToken
≈≈] n
)
≈≈n o
)
≈≈o p
{
∆∆ 
return
«« 
Task
«« 
.
«« 
CompletedTask
«« )
;
««) *
}
»» 
}
…… 	
}
   
}ÀÀ ‰
àC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin.EntityFramework\Entities\Identity\UserIdentity.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
EntityFramework& 5
.5 6
Entities6 >
.> ?
Identity? G
{ 
public 

class 
UserIdentity 
: 
IdentityUser  ,
<, -
int- 0
>0 1
{ 
} 
}		 ˜
çC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin.EntityFramework\Entities\Identity\UserIdentityClaim.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
EntityFramework& 5
.5 6
Entities6 >
.> ?
Identity? G
{ 
public 

class !
UserIdentityUserClaim &
:' (
IdentityUserClaim) :
<: ;
int; >
>> ?
{ 
} 
} Ï
åC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin.EntityFramework\Entities\Identity\UserIdentityRole.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
EntityFramework& 5
.5 6
Entities6 >
.> ?
Identity? G
{ 
public 

class 
UserIdentityRole !
:" #
IdentityRole$ 0
<0 1
int1 4
>4 5
{ 
} 
}		 ˚
ëC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin.EntityFramework\Entities\Identity\UserIdentityRoleClaim.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
EntityFramework& 5
.5 6
Entities6 >
.> ?
Identity? G
{ 
public 

class !
UserIdentityRoleClaim &
:' (
IdentityRoleClaim) :
<: ;
int; >
>> ?
{ 
} 
}		 ˚
ëC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin.EntityFramework\Entities\Identity\UserIdentityUserLogin.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
EntityFramework& 5
.5 6
Entities6 >
.> ?
Identity? G
{ 
public 

class !
UserIdentityUserLogin &
:' (
IdentityUserLogin) :
<: ;
int; >
>> ?
{ 
} 
}		 ¯
êC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin.EntityFramework\Entities\Identity\UserIdentityUserRole.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
EntityFramework& 5
.5 6
Entities6 >
.> ?
Identity? G
{ 
public 

class  
UserIdentityUserRole %
:& '
IdentityUserRole( 8
<8 9
int9 <
>< =
{ 
} 
}		 ˚
ëC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin.EntityFramework\Entities\Identity\UserIdentityUserToken.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
EntityFramework& 5
.5 6
Entities6 >
.> ?
Identity? G
{ 
public 

class !
UserIdentityUserToken &
:' (
IdentityUserToken) :
<: ;
int; >
>> ?
{ 
} 
}		 ‡
vC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin.EntityFramework\Entities\Log.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
EntityFramework& 5
.5 6
Entities6 >
{ 
[		 
Table		 

(		
 
TableConsts		 
.		 
Logging		 
)		 
]		  
public

 

class

 
Log

 
{ 
[ 	
Key	 
] 
public 
long 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
string 
Message 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
MessageTemplate %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
[ 	
	MaxLength	 
( 
$num 
) 
] 
public 
string 
Level 
{ 
get !
;! "
set# &
;& '
}( )
public 
DateTimeOffset 
	TimeStamp '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
string 
	Exception 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
LogEvent 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Column	 
( 
TypeName 
= 
$str  
)  !
]! "
public 
string 

Properties  
{! "
get# &
;& '
set( +
;+ ,
}- .
[ 	
	NotMapped	 
] 
public   
XElement   
PropertiesXml   %
=>  & (
XElement  ) 1
.  1 2
Parse  2 7
(  7 8

Properties  8 B
)  B C
;  C D
}!! 
}"" Æ
âC:\DEV\MAGVA\TransacoesFinanceiras\src\Middle\Security\src\MAGVA.Middle.Security.Admin.EntityFramework\Entities\PersistedGrantDataView.cs
	namespace 	
MAGVA
 
. 
Middle 
. 
Security 
.  
Admin  %
.% &
EntityFramework& 5
.5 6
Entities6 >
{ 
public 

class "
PersistedGrantDataView '
{ 
public 
string 
	SubjectId 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
SubjectName !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
}		 