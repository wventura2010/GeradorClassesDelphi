unit ProjetoExemploDaoVo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ADODB;

type
  TfrmCadastroAlunos = class(TForm)
    Panel2: TPanel;
    btnFechar: TButton;
    btnGravar: TButton;
    Label1: TLabel;
    edtCodigo: TEdit;
    Label2: TLabel;
    edtNome: TEdit;
    Label3: TLabel;
    edtEndereco: TEdit;
    Label4: TLabel;
    edtBairro: TEdit;
    edtTelefone: TEdit;
    Label5: TLabel;
    edtCEP: TEdit;
    Label6: TLabel;
    ADOConnection1: TADOConnection;
    procedure btnFecharClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroAlunos: TfrmCadastroAlunos;

implementation

uses
  VoAlunos, DaoAlunos;

{$R *.dfm}

procedure TfrmCadastroAlunos.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastroAlunos.btnGravarClick(Sender: TObject);
var
  objAluno: TVoAlunos;
  daoAluno: TDaoAlunos;

  Codigo: integer;
begin

  daoAluno := TDaoAlunos.Create(ADOConnection1);
  objAluno := TVoAlunos.Create;

  try
    objAluno.Nome := edtNome.Text;
    objAluno.Endereço := edtEndereco.Text;
    objAluno.Bairro := edtBairro.Text;
    objAluno.cep := edtCep.Text;
    objAluno.telefone := edtTelefone.Text;

    //Inclui o novo registro de Aluno e Retorno o Código (Identity) usado.
    codigo := daoAluno.Incluir_LerCodigo(objAluno);
    edtCodigo.Text := inttostr(codigo);

    ShowMessage('Aluno cadastrado com sucesso.');

  finally
    FreeAndNil(objAluno);
    FreeAndNil(daoAluno);
  end;

end;

end.
