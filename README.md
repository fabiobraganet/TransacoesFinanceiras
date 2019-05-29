# Desafio MAGVA - Transa��es Financeiras
![enter image description here](https://ci.appveyor.com/api/projects/status/github/fabiobraganet/TransacoesFinanceiras?branch=master&svg=true) ![enter image description here](https://travis-ci.org/fabiobraganet/TransacoesFinanceiras.svg?branch=master)

> Uma documenta��o mais rica ser� fornecida no final do desafio. Os
> teste ainda ser�o montados, contudo seu escopo ser� limitado as
> especifica��es do desafio e incluir�o testes unit�rios e testes de
> interface.

No meu desafio decidi implementar com a arquitetura de microservi�os e mantendo as recomenda��es da Microsoft, documentada e com um projeto de exemplo nos links abaixo.

A decis�o pela recomenda��o da Microsoft � a ampla documenta��o e abrang�ncia de solu��es integradas.
	
	https://dotnet.microsoft.com/learn/web/microservices-architecture

	Documenta��o: 
		https://dotnet.microsoft.com/learn/web/aspnet-microservice-tutorial/intro
		https://docs.microsoft.com/pt-br/dotnet/standard/microservices-architecture/

	Video
		https://myignite.techcommunity.microsoft.com/sessions/65003?source=sessions#ignite-html-anchor

	Projeto Modelo: 
		https://github.com/dotnet-architecture/eShopOnContainers

	Leituras recomendadas (fontes usadas no aqui)
		http://cqrs.nu/Faq
		https://docs.spine3.org/motivation/immutability.html 
		http://blog.gauffin.org/2012/06/griffin-container-introducing-command-support/
		https://msdn.microsoft.com/en-us/library/bb383979.aspx
		http://docs.autofac.org/en/latest/integration/aspnetcore.html#controllers-as-services
	

> Para atender o design da solu��o, decidi por um ecossistema mais
> complexo, contudo a abrang�ncia permitir� ter o controle sobre a
> infraestrutura e as atividades dos servi�os.

	
**Requisitos m�nimos**

	- Visual Studio 2019 (recomendado)
	- Docker (se no windows, m�nimo de 4GB de mem�ria na VM do Docker-Linux no Hyper-V)
	- Mem�ria 8GB ou mais
	- Disco para Docker igual ou superior a 10GB
	- Recomendo 4 n�cleos de processamento m�nimos para melhor desempenho de trabalho

![alt text](https://github.com/fabiobraganet/TransacoesFinanceiras/blob/master/docs/img/consumodeinfraestrutura.png)

**Primeiros passos (preparando a depura��o inicial do projeto)**

1) Configure seu arquivo hosts para novos nomes de apelido para seu localhost. Isso � necess�rio para o desenvolvimento at� a implementa��o do NGINX.
 
	Copie e cole
	
		127.0.0.1	magvasqlserver2017
		127.0.0.1	magvaredis
		127.0.0.1	magvarabbitmq
		127.0.0.1	magvaelasticsearch
		127.0.0.1	magvalogstash
		127.0.0.1	magvakibana
		127.0.0.1	magvabacktransacoesfinanceiras
		127.0.0.1	magvabackwatchdog
		127.0.0.1	magvamiddlesecurityadmin
		127.0.0.1	magvamiddlesecurityaspnetidentity
	
	*Estou pensando em incluir o WebMin ao Stack.

2) Agora clone o projeto

	Git Clone ...

	Abra o Visual Studio e a solu��o MAGVA e execute o debug com o Docker Compose	
	Verifique os Containers ativos conforme a lista abaixo:
		
	| Container | Image | Ports |
	|--|--|--|
	| magvabacktransacoesfinanceiras | magvabacktransacoesfinanceiras:dev | 15001:15001 15002:15002 |
	| magvabackwatchdog | magvabackwatchdog:dev | 15098:15098 15099:15099 |
	| magvamiddlesecurityadmin | magvamiddlesecurityadmin:dev | 14001:14001 |
	| magvamiddlesecurityaspnetidentity | magvamiddlesecurityaspnetidentity:dev | 14000:14000 |
	| magvaelasticsearch | dockercompose*_elasticsearch | 9200:9200 9300:9300 |
	| magvakibana | dockercompose*_kibana | 5601:5601 | 	
	| magvalogstash | dockercompose*_logstash | 5044:5044 | 	
	| magvarabbitmq | rabbitmq:3-management-alpine | 15672:15672 5671:5671 5672:5672 |
	| magvasqlserver2017 | microsoft/mssql-server-linux:2017-latest | 1433:1433 |
	| magvaredis | redis:alpine | 6379:6379 |


	Caso esteja usando o Mozilla Firefox e ele trave alguma porta. Execute os comandos abaixo:

	> 	netstat -a -n -o | findstr <porta>
	> tasklist | findstr <porta>
	> taskkill /PID <pid> /F

3) Ao carregar toda a solu��o e montar corretamente os Containers, execute no Browser o seguinte URL:

	3.1) Acesse: http://magvamiddlesecurityadmin:14001/home/seed

	Caso o retorno seja (true). Verifique se ele criou em magvasqlserver2017 (SQL Server 2017 for Linux) a base de dados (IdentityServer4Admin)
	As demais migra��es dos contextos de dados ser�o realizados na inicializa��o do programa.

	![alt text](https://github.com/fabiobraganet/TransacoesFinanceiras/blob/master/docs/img/processodeiniciacao.png)

	Para acessar o SQL Server, use o SSMS 2016 ou superior com a seguinte conta:

	> 	Servidor: magvasqlserver2017 	
	> Usu�rio: SA 	
	> Senha: 1Pass@word

	
	Este processo � importante para habilitar o IdentityServer4 e o Web Admin UI.
	Mais informa��es em: https://github.com/skoruba/IdentityServer4.Admin

	Agora v� para http://magvamiddlesecurityadmin:14001
	
	Fa�a o login com a conta de usu�rio administrador:

	> 	Usu�rio: admin 	
	> Senha: Pa$$word123

	Ap�s efetuar o login, poder� haver um problema de correla��o referente ao redirect uri. 
	Se ocorrer, ignore e v� para http://magvamiddlesecurityadmin:14001. 
	Trata-se de um bug no projeto e n�o tratei de corrigir.
	
4) Verificar a sa�de dos servi�os, acesse: 
	
	http://magvabackwatchdog:15098/healthcheckui
	
	Verifique se todos os servi�os e recursos listados est�o ativos.

5) Verificar os EndPoints do servi�o da API de Transa��es Financeiras

	Verifique os metodos via Swagger em:
	http://magvabacktransacoesfinanceiras:15001/swagger/index.html

	Mais informa��es em:
	https://docs.microsoft.com/pt-br/aspnet/core/tutorials/getting-started-with-swashbuckle?view=aspnetcore-2.2&tabs=visual-studio

6) Verificar as atividades do sistema via Kibana

	http://magvakibana:5601/app/kibana#/home?_g=()

	> Filtro requirido [ logstash-* ]

7) Acesse 