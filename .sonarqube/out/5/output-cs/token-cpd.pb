”
^C:\DEV\MAGVA\TransacoesFinanceiras\Simulator\CredNet.Payments\Controllers\PaymentController.cs
	namespace 	
CredNet
 
. 
Payments 
. 
Controllers &
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public		 

class		 
PaymentController		 "
:		# $
ControllerBase		% 3
{

 
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
ActionResult 
< 
Transaction '
>' (
Get) ,
(, -
int- 0
id1 3
)3 4
{ 	
return 
new 
Transaction "
(" #
$str# &
,& '
$num( )
,) *
$num+ ,
,, -
new. 1
Card2 6
(6 7
cardholdername 
: 
$str  .
,. /
number 
: 
$str *
,* +
expirationdate 
: 
$str  '
,' (
	cardbrand 
: 
$str !
,! "
password 
: 
$str '
,' (
type 
: 
$str 
, 
haspassword 
: 
false "
)" #
)# $
;$ %
} 	
[ 	
HttpPost	 
] 
public 
void 
Post 
( 
[ 
FromBody "
]" #
Transaction$ /
transaction0 ;
); <
{ 	
} 	
} 
} ò>
LC:\DEV\MAGVA\TransacoesFinanceiras\Simulator\CredNet.Payments\Models\Card.cs
	namespace 	
CredNet
 
. 
Payments 
. 
Models !
{ 
public 

class 
Card 
{ 
public 
string 
CardholderName $
{% &
get' *
;* +
private, 3
set4 7
;7 8
}9 :
public 
string 
Number 
{ 
get "
;" #
private$ +
set, /
;/ 0
}1 2
public 
string 
ExpirationDate $
{% &
get' *
;* +
private, 3
set4 7
;7 8
}9 :
private 
DateTime 
_ExpirationDate (
=>) + 
FormatExpirationDate, @
(@ A
)A B
;B C
public 
string 
	CardBrand 
{  !
get" %
;% &
private' .
set/ 2
;2 3
}4 5
public   
string   
Password   
{    
get  ! $
;  $ %
private  & -
set  . 1
;  1 2
}  3 4
public%% 
string%% 
Type%% 
{%% 
get%%  
;%%  !
private%%" )
set%%* -
;%%- .
}%%/ 0
private&& 
	_TypeEnum&& 
_Type&& 
=>&&  "
GetTypeEnum&&# .
(&&. /
)&&/ 0
;&&0 1
private'' 
enum'' 
	_TypeEnum'' 
{''  
Chip''! %
=''& '
$num''( )
,'') *
MagneticStripe''+ 9
='': ;
$num''< =
,''= >
InvalidType''? J
=''K L
$num''M N
}''O P
;''P Q
public,, 
bool,, 
HasPassword,, 
{,,  !
get,," %
;,,% &
set,,' *
;,,* +
},,, -
public.. 
Card.. 
(.. 
string.. 
cardholdername.. )
,..) *
string..+ 1
number..2 8
,..8 9
string..: @
expirationdate..A O
,..O P
string..Q W
	cardbrand..X a
,..a b
string..c i
password..j r
,..r s
string..t z
type..{ 
,	.. Ä
bool
..Å Ö
haspassword
..Ü ë
)
..ë í
{// 	
CardholderName00 
=00 
cardholdername00 +
;00+ ,
Number11 
=11 
number11 
;11 
ExpirationDate22 
=22 
expirationdate22 +
;22+ ,
	CardBrand33 
=33 
	cardbrand33 !
;33! "
Password44 
=44 
password44 
;44  
Type55 
=55 
type55 
;55 
HasPassword66 
=66 
haspassword66 %
;66% &
_88 
=88 
_ExpirationDate88 
;88  
_99 
=99 
_Type99 
;99 
}:: 	
private<< 
DateTime<<  
FormatExpirationDate<< -
(<<- .
)<<. /
{== 	
var>> 
arr>> 
=>> 
ExpirationDate>> $
.>>$ %
Split>>% *
(>>* +
$char>>+ .
)>>. /
;>>/ 0
if@@ 
(@@ 
arr@@ 
.@@ 
Length@@ 
==@@ 
$num@@ 
)@@  
ifAA 
(AA 
arrAA 
[AA 
$numAA 
]AA 
.AA 
LengthAA !
==AA" $
$numAA% &
&&AA' )
arrAA* -
[AA- .
$numAA. /
]AA/ 0
.AA0 1
LengthAA1 7
==AA8 :
$numAA; <
&&AA= ?
intAA@ C
.AAC D
TryParseAAD L
(AAL M
arrAAM P
[AAP Q
$numAAQ R
]AAR S
,AAS T
outAAU X
intAAY \
mesAA] `
)AA` a
&&AAb d
intAAe h
.AAh i
TryParseAAi q
(AAq r
arrAAr u
[AAu v
$numAAv w
]AAw x
,AAx y
outAAz }
int	AA~ Å
ano
AAÇ Ö
)
AAÖ Ü
)
AAÜ á
returnBB 
newBB 
DateTimeBB '
(BB' (
$numBB( ,
+BB- .
anoBB/ 2
,BB2 3
mesBB4 7
,BB7 8
DateTimeBB9 A
.BBA B
DaysInMonthBBB M
(BBM N
$numBBN R
+BBS T
anoBBU X
,BBX Y
mesBBZ ]
)BB] ^
)BB^ _
;BB_ `
NotificationDD 
.DD 
MessagesDD !
.DD! "
AddDD" %
(DD% &
$strDD& =
,DD= >
$"DD? A0
$A exipra√ß√£o do cart√£o informada 'DDA b
{DDb c
ExpirationDateDDc q
}DDq r
' √© inv√°lida.DDr 
"	DD Ä
)
DDÄ Å
;
DDÅ Ç
returnFF 
DateTimeFF 
.FF 
MinValueFF $
;FF$ %
}GG 	
privateII 
	_TypeEnumII 
GetTypeEnumII %
(II% &
)II& '
{JJ 	
constKK 
stringKK 
MAGNETICSTRIPEKK '
=KK( )
$strKK* :
;KK: ;
constLL 
stringLL 
CHIPLL 
=LL 
$strLL  &
;LL& '
	_TypeEnumNN 
typeEnumNN 
=NN  
	_TypeEnumNN! *
.NN* +
InvalidTypeNN+ 6
;NN6 7
ifPP 
(PP 
stringPP 
.PP 
IsNullOrEmptyPP $
(PP$ %
TypePP% )
)PP) *
)PP* +
{QQ 
NotificationRR 
.RR 
MessagesRR %
.RR% &
AddRR& )
(RR) *
$strRR* ?
,RR? @
$"RRA C>
2Nenhum valor foi informado para o tipo de cart√£o.RRC t
"RRt u
)RRu v
;RRv w
returnSS 
typeEnumSS 
;SS  
}TT 
ifVV 
(VV 
!VV 
TypeVV 
.VV 
ToUpperVV 
(VV 
)VV 
.VV  
EqualsVV  &
(VV& '
CHIPVV' +
)VV+ ,
&&VV- /
!VV0 1
TypeVV1 5
.VV5 6
ToUpperVV6 =
(VV= >
)VV> ?
.VV? @
EqualsVV@ F
(VVF G
MAGNETICSTRIPEVVG U
)VVU V
)VVV W
{WW 
NotificationXX 
.XX 
MessagesXX %
.XX% &
AddXX& )
(XX) *
$strXX* ?
,XX? @
$"XXA C4
(A informa√ß√£o do Tipo do cart√£o como 'XXC h
{XXh i
TypeXXi m
}XXm n
' √© inv√°lido.XXn {
"XX{ |
)XX| }
;XX} ~
returnYY 
typeEnumYY 
;YY  
}ZZ 
if\\ 
(\\ 
Type\\ 
.\\ 
ToUpper\\ 
(\\ 
)\\ 
.\\ 
Equals\\ %
(\\% &
CHIP\\& *
)\\* +
)\\+ ,
typeEnum]] 
=]] 
	_TypeEnum]] $
.]]$ %
Chip]]% )
;]]) *
if__ 
(__ 
Type__ 
.__ 
ToUpper__ 
(__ 
)__ 
.__ 
Equals__ %
(__% &
MAGNETICSTRIPE__& 4
)__4 5
)__5 6
typeEnum`` 
=`` 
	_TypeEnum`` $
.``$ %
MagneticStripe``% 3
;``3 4
returnbb 
typeEnumbb 
;bb 
}cc 	
}ff 
}gg ò
TC:\DEV\MAGVA\TransacoesFinanceiras\Simulator\CredNet.Payments\Models\Notification.cs
	namespace 	
CredNet
 
. 
Payments 
. 
Models !
{ 
public 

static 
class 
Notification $
{ 
public 
static 

Dictionary  
<  !
string! '
,' (
string) /
>/ 0
Messages1 9
{: ;
get< ?
;? @
setA D
;D E
}F G
=H I
newJ M

DictionaryN X
<X Y
stringY _
,_ `
stringa g
>g h
(h i
)i j
;j k
} 
}		 ›
SC:\DEV\MAGVA\TransacoesFinanceiras\Simulator\CredNet.Payments\Models\Transaction.cs
	namespace 	
CredNet
 
. 
Payments 
. 
Models !
{ 
public 

class 
Transaction 
{ 
public		 
decimal		 
Amount		 
{		 
get		  #
;		# $
set		% (
;		( )
}		* +
public 
string 
Type 
{ 
get  
;  !
set" %
;% &
}' (
public 
Card 
Card 
{ 
get 
; 
set  #
;# $
}% &
public 
int 
Number 
{ 
get 
;  
set! $
;$ %
}& '
public 
Transaction 
( 
string !
type" &
,& '
decimal( /
amount0 6
,6 7
int8 ;
number< B
,B C
CardD H
cardI M
)M N
{ 	
Type 
= 
type 
; 
Amount 
= 
amount 
; 
Number 
= 
number 
; 
Card 
= 
card 
; 
} 	
}   
}!! é	
HC:\DEV\MAGVA\TransacoesFinanceiras\Simulator\CredNet.Payments\Program.cs
	namespace 	
CredNet
 
. 
Payments 
{ 
public 

class 
Program 
{ 
public		 
static		 
void		 
Main		 
(		  
string		  &
[		& '
]		' (
args		) -
)		- .
{

 	 
CreateWebHostBuilder  
(  !
args! %
)% &
.& '
Build' ,
(, -
)- .
.. /
Run/ 2
(2 3
)3 4
;4 5
} 	
public 
static 
IWebHostBuilder % 
CreateWebHostBuilder& :
(: ;
string; A
[A B
]B C
argsD H
)H I
=>J L
WebHost 
.  
CreateDefaultBuilder (
(( )
args) -
)- .
. 

UseStartup 
< 
Startup #
># $
($ %
)% &
;& '
} 
} •
HC:\DEV\MAGVA\TransacoesFinanceiras\Simulator\CredNet.Payments\Startup.cs
	namespace 	
CredNet
 
. 
Payments 
{ 
public		 

class		 
Startup		 
{

 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
)A B
{ 	
services 
. 
AddMvc 
( 
) 
. #
SetCompatibilityVersion 5
(5 6 
CompatibilityVersion6 J
.J K
Version_2_2K V
)V W
;W X
} 	
public 
void 
	Configure 
( 
IApplicationBuilder 1
app2 5
,5 6
IHostingEnvironment7 J
envK N
)N O
{ 	
if 
( 
env 
. 
IsDevelopment !
(! "
)" #
)# $
{ 
app 
. %
UseDeveloperExceptionPage -
(- .
). /
;/ 0
} 
else 
{   
app"" 
."" 
UseHsts"" 
("" 
)"" 
;"" 
}## 
app%% 
.%% 
UseHttpsRedirection%% #
(%%# $
)%%$ %
;%%% &
app&& 
.&& 
UseMvc&& 
(&& 
)&& 
;&& 
}'' 	
}(( 
})) 