#Instruções para Executar o projeto pelo Delphi
1. Fazer backup da base na pasta "bd" na raiz do projeto
2. Restaurar backup no sql management studio (precisa ter uma configuração local do sql server)
3. Abrir o projeto "TesteDelphi.dproj"
4. No fonte "udmControl" > componente "conexao" > properties "ConectionString" > adicionar em password:senha da base local, User ID= seu usuario local, Data Source= servidor local do sqlServer, Workstation ID= servidor local do sqlServer *sem o \SQLEXPRESS*;
exemplo da string como deve ficar:
Provider=SQLOLEDB.1;Password=senhaLocal;Persist Security Info=True;User ID=sa;Initial Catalog=TesteDelphi;Data Source=BNU-NT005742\SQLEXPRESS;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=BNU-NT005742;Use Encryption for Data=False;Tag with column collation when possible=False

5. properties provider: SQLOLEDB.1

6. Verificar se a propertie "connected" está True, caso não, setar para true, vai pedir usuario e senha (seu usuario e senha do sqlServer)

Obs: Caso não funcione o passo 4
1. Dois cliques no componente "conexao"
2. marcar Use Connection String > build...
3. Provedor Microsoft OLE DB Provider for SQL Server > avançar
4. Selecione o nome do seu servidor sqlServer
5. Marcar "Usar nome de usuário e senha específico" (caso tenha configurado seu sql server dessa forma) ou a primeira opção caso use o usuário padrão do windows
6. Marcar a flag "permitir salvamento de senha
7. No item 3, selecione a base de dados que foi realizado o backup
8. teste a conexão > caso bem sucedida clique em OK

Qualquer dúvida: geovanealu@gmail.com


#Sobre o cálculo da comissão, fiz da forma simplificada de 10% para todos. Até fiz a rotina nos fontes para calcular a comissão da forma
normal, porém tive dificuldades de fazer a integração dessas rotinas com meu .fr3 (não conheço muito a ferramenta que usei).