program prjExemploDaoVo;

uses
  Forms,
  DaoAlunos in 'DaoAlunos.pas',
  DaoBase in 'DaoBase.pas',
  ProjetoExemploDaoVo in 'ProjetoExemploDaoVo.pas' {frmCadastroAlunos},
  VoAlunos in 'VoAlunos.pas',
  VoBase in 'VoBase.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCadastroAlunos, frmCadastroAlunos);
  Application.Run;
end.
