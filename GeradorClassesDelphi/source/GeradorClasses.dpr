{*
  Projeto: Gerador de Classes, DAO, VO, SQL Server with ADO;
  Autor: Wilson Ventura da Silva
  Site: https://wilsonventurablog.wordpress.com/
*}

program GeradorClasses;

uses
  Forms,
  Funcoes in 'Funcoes.pas',
  Principal in 'Principal.pas' {FPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.Run;
end.
