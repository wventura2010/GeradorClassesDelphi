unit DaoBase;

interface

uses
  Classes, Controls, Dialogs, ActnList, ActnMan, StdCtrls, ComCtrls, ExtCtrls,
  Forms, ADODB;

type
  TDaoBase = class
    FConexao: TAdoConnection;
    FQuery: TAdoQuery;
    constructor Create(pConexao: TAdoConnection);
  end;


implementation

{ TDaoBase }

constructor TDaoBase.Create(pConexao: TAdoConnection);
begin
  FQuery := TAdoQuery.Create(Application);
  FConexao := pConexao;
  FQuery.Connection := FConexao;
end;

end.
