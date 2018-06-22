unit Funcoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, DBCtrls, DB, ADODB;

function TipoSqlToDelphi(pTipo: string): string;
function TipoSqlToDelphiField(pTipo: string): string;
function CamelCase(const s: string): string;
function GetNomeComputador: string;

Const
  _Apost = chr(39);

implementation

function TipoSqlToDelphi(pTipo: string): string;
begin
  if pTipo = 'varchar' then
    Result := 'string'
  else if pTipo = 'char' then
    Result := 'string'
  else if pTipo = 'text' then
    Result := 'widestring'
  else if pTipo = 'time' then
    Result := 'TTime'
  else if pTipo = 'date' then
    Result := 'TDateTime'
  else if (pTipo = 'datetime') or (pTipo = 'datetime2') then
    Result := 'TDateTime'
  else if pTipo = 'smalldatetime' then
    Result := 'TDateTime'
  else if pTipo = 'decimal' then
    Result := 'Double'
  else if (pTipo = 'float') or (pTipo = 'real')  then
    Result := 'Double'
  else if (pTipo = 'int') or (pTipo = 'bit') or (pTipo = 'smallint') or (pTipo = 'tinyint')then
    Result := 'Integer'
  else if pTipo = 'bigint' then
    Result := 'LongInt'
  else if (pTipo = 'money') or (pTipo = 'smallmoney') then
    Result := 'Currency'
  else if pTipo = 'numeric' then
    Result := 'Currency'
  else if pTipo = 'nvarchar' then
    Result := 'WideString'
  else if pTipo = 'varbinary' then
    Result := 'TMemoryStream'
  else if pTipo = 'binary' then
    Result := 'TMemoryStream'
  else if pTipo = 'image' then
    Result := 'TMemoryStream'
  else
    Result := 'string';
end;

function TipoSqlToDelphiField(pTipo: string): string;
begin
  pTipo := Trim(AnsiLowerCase(pTipo));

  if pTipo = 'varchar' then
    Result := 'ftString'
  else if pTipo = 'numeric' then
    Result := 'ftBCD'
  else if pTipo = 'bit' then
    Result := 'ftWord'
  else if pTipo = 'smallint' then
    Result := 'ftInteger'
  else if pTipo = 'decimal' then
    Result := 'ftBCD'
  else if pTipo = 'smallmoney' then
    Result := 'ftBCD'
  else if pTipo = 'int' then
    Result := 'ftInteger'
  else if pTipo = 'tinyint' then
    Result := 'ftWord'
  else if pTipo = 'money' then
    Result := 'ftBCD'
  else if pTipo = 'float' then
    Result := 'ftFloat'
  else if pTipo = 'real' then
    Result := 'ftBCD'
  else if pTipo = 'date' then
    Result := 'ftDateTime'
  else if pTipo = 'datetimeoffset' then
    Result := 'ftDateTime'
  else if pTipo = 'datetime2' then
    Result := 'ftDateTime'
  else if pTipo = 'smalldatetime' then
    Result := 'ftDateTime'
  else if pTipo = 'datetime' then
    Result := 'ftDateTime'
  else if pTipo = 'time' then
    Result := 'ftTime'
  else if pTipo = 'char' then
    Result := 'ftString'
  else if pTipo = 'varchar' then
    Result := 'ftString'
  else if pTipo = 'text' then
    Result := 'ftWideString'
  else if pTipo = 'nchar' then
    Result := 'ftWideString'
  else if pTipo = 'nvarchar' then
    Result := 'ftWideString'
  else if pTipo = 'ntext' then
    Result := 'ftWideString'
  else if pTipo = 'binary' then
    Result := 'ftVarBytes'
  else if pTipo = 'varbinary' then
    Result := 'ftVarBytes'
  else if pTipo = 'image' then
    Result := 'ftVarBytes'
  else if pTipo = 'timestamp' then
    Result := 'ftDateTime'
  else if pTipo = 'hierarchyid' then
    Result := 'ftUnknow'
  else if pTipo = 'uniqueidentifier' then
    Result := 'ftUnknow'
  else if pTipo = 'sql_variant' then
    Result := 'ftUnknow'
  else if pTipo = 'xml' then
    Result := 'ftUnknow'
  else
    Result := 'ftUnknow';
end;

function CamelCase(const s: string): string;
var
  t1: integer;
  first: boolean;
begin
  result := LowerCase(s);
  first := true;

  for t1 := 1 to length(result) do
  begin
    if result[t1] in [' ', '_'] then
    begin
      first := true;
    end
    else if first then
    begin
      result[t1] := UpCase(result[t1]);
      first := false;
    end;
  end;
end;

function GetNomeComputador: string;
var
  NameBuffer: array [0 .. 255] of char;
  NameString: String;
  size: dword;
begin
  Result := '';

  try
    size := 256;
    if GetComputerName(NameBuffer, size) then
    begin
      NameString := NameBuffer;
      Result := Trim(NameString);
    end;
  except
    raise ;
  end;
end;

end.

