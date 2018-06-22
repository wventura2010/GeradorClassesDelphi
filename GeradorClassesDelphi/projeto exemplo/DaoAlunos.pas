unit DaoAlunos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ActnMan, StdCtrls, ComCtrls, ExtCtrls, ADODB, DB,
  VoAlunos, DaoBase;

type
  TDaoAlunos = class(TDaoBase)
  private
  public
    procedure Incluir(pVoAlunos: TVoAlunos);
    function Incluir_LerCodigo(pVoAlunos: TVoAlunos): integer;
    function Selecionar(pCodigo: integer): TVoAlunos;
    procedure Alterar(pVoAlunos: TVoAlunos);
    procedure Excluir(pVoAlunos: TVoAlunos);
  end;

implementation


{ TDaoAlunos }

procedure TDaoAlunos.Incluir(pVoAlunos: TVoAlunos);
begin
  try
    FQuery.Close;
    FQuery.SQL.Clear;
    FQuery.SQL.Add('INSERT INTO ALUNOS(');
    FQuery.SQL.Add('  nome, endereço, bairro, ');
    FQuery.SQL.Add('  cep, telefone');
    FQuery.SQL.Add(')' );
    FQuery.SQL.Add('VALUES ( ' );
    FQuery.SQL.Add('  :nome, :endereço, :bairro, ');
    FQuery.SQL.Add('  :cep, :telefone');
    FQuery.SQL.Add(');' );
    FQuery.Parameters.ParamByName('Nome').Value := pVoAlunos.Nome;
    FQuery.Parameters.ParamByName('Endereço').Value := pVoAlunos.Endereço;
    FQuery.Parameters.ParamByName('Bairro').Value := pVoAlunos.Bairro;
    FQuery.Parameters.ParamByName('Cep').Value := pVoAlunos.Cep;
    FQuery.Parameters.ParamByName('Telefone').Value := pVoAlunos.Telefone;

    FQuery.ExecSQL;
  except
    on E: Exception do
      Raise exception.Create('ERRO AO INCLUIR Alunos' + chr(10) + chr(10) + 'Erro:' + E.Message);
  end;
end;

function TDaoAlunos.Incluir_LerCodigo(pVoAlunos: TVoAlunos): integer;
var 
  iCod: integer; 
begin 
  iCod := 0; 
  try 
    Incluir(pVoAlunos); 
    FQuery.Close; 
    FQuery.SQL.Clear; 
    FQuery.SQL.Add(' SELECT COALESCE(IDENT_CURRENT(''Alunos''), 0) AS CODIGO_ATUAL'); 
    FQuery.Open; 
    iCod := FQuery.FieldByName('CODIGO_ATUAL').AsInteger; 
  except 
    on E: Exception do 
      Raise exception.Create('ERRO AO INCLUIR/LER CODIGO Alunos' + chr(10) + chr(10) + 'Erro:' + E.Message);
  end; 
  result := iCod; 
end; 

function TDaoAlunos.Selecionar(pCodigo: integer):TVoAlunos;
var 
  vo: TVoAlunos;
begin 
  vo := TVoAlunos.Create;
  try 
    FQuery.Close; 
    FQuery.SQL.Clear; 
    FQuery.SQL.Add('SELECT * FROM Alunos WHERE codigo = :codigo  ');
    FQuery.Parameters.ParamByName('Codigo').Value := pCodigo;
    FQuery.Open; 
    if not FQuery.IsEmpty then 
    begin 
      vo.Codigo := pCodigo; 
      if not FQuery.FieldByName('Nome').IsNull then 
        vo.Nome := FQuery.FieldByName('Nome').Value;
      if not FQuery.FieldByName('Endereço').IsNull then 
        vo.Endereço := FQuery.FieldByName('Endereço').Value;
      if not FQuery.FieldByName('Bairro').IsNull then 
        vo.Bairro := FQuery.FieldByName('Bairro').Value;
      if not FQuery.FieldByName('Cep').IsNull then 
        vo.Cep := FQuery.FieldByName('Cep').Value;
      if not FQuery.FieldByName('Telefone').IsNull then 
        vo.Telefone := FQuery.FieldByName('Telefone').Value;

    end 
  except 
    on E: Exception do 
      Raise exception.Create('ERRO AO SELECIONAR Alunos' + chr(10) + chr(10) + 'Erro:' + E.Message);
  end; 
  result := vo; 
end; 

procedure TDaoAlunos.Excluir(pVoAlunos: TVoAlunos);
begin
  try
    FQuery.Close;
    FQuery.SQL.Clear;
    FQuery.SQL.Add('DELETE FROM Alunos WHERE codigo = :codigo  ');
    FQuery.Parameters.ParamByName('Codigo').Value := pVoAlunos.Codigo;

    FQuery.ExecSQL;
  except
    on E: Exception do
      Raise exception.Create('ERRO AO EXCLUIR - Alunos' + chr(10) + chr(10) + 'Erro:' + E.Message);
  end;
end;

procedure TDaoAlunos.Alterar(pVoAlunos: TVoAlunos);
begin
  try
    FQuery.Close;
    FQuery.SQL.Clear;
    FQuery.SQL.Add('UPDATE ALUNOS SET ');
    FQuery.SQL.Add('  nome = :nome, endereço = :endereço, bairro = :bairro, ');
    FQuery.SQL.Add('  cep = :cep, telefone = :telefone');
    FQuery.SQL.Add(' WHERE codigo = :codigo  ');
    FQuery.Parameters.ParamByName('Nome').Value := pVoAlunos.Nome;
    FQuery.Parameters.ParamByName('Endereço').Value := pVoAlunos.Endereço;
    FQuery.Parameters.ParamByName('Bairro').Value := pVoAlunos.Bairro;
    FQuery.Parameters.ParamByName('Cep').Value := pVoAlunos.Cep;
    FQuery.Parameters.ParamByName('Telefone').Value := pVoAlunos.Telefone;

    FQuery.Parameters.ParamByName('Codigo').Value := pVoAlunos.Codigo;

    FQuery.ExecSQL;
  except
    on E: Exception do
      Raise exception.Create('ERRO AO INCLUIR Alunos' + chr(10) + chr(10) + 'Erro:' + E.Message);
  end;
end;


end.
