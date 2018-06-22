unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  Buttons, ExtCtrls, ComCtrls, DBCtrls, DB, ADODB, RxLookup, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox;

type
  TFPrincipal = class(TForm)
    Panel1: TPanel;
    ADOConnection1: TADOConnection;
    qryTabelas: TADOQuery;
    qryCampos: TADOQuery;
    dsTabelas: TDataSource;
    qryCamposcampo: TWideStringField;
    qryCampostipo: TWideStringField;
    qryCampostamanho: TSmallintField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    SaveDialog: TSaveDialog;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    qryChaves: TADOQuery;
    qryBases: TADOQuery;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    edtUser: TEdit;
    Label4: TLabel;
    edtPass: TEdit;
    RadioGroup1: TRadioGroup;
    Label5: TLabel;
    edtServidor: TEdit;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label1: TLabel;
    lkpNomeTabela: TRxDBLookupCombo;
    Memo1: TMemo;
    dsBases: TDataSource;
    qryCamposISIDENTITY: TIntegerField;
    qryBasesname: TWideStringField;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    qryIdent: TADOQuery;
    SaveSQL: TSaveDialog;
    SpeedButton1: TBitBtn;
    Label6: TLabel;
    edtVo: TEdit;
    Label7: TLabel;
    edtDao: TEdit;
    redtVo: TMemo;
    redtDao: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure RxDBLookupCombo1CloseUp(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
  private
    procedure GeraCampos(spNomeTabela: string);
    procedure GeraIncluir(pNomeClasse, pNomeTabela: string);
    procedure GeraIncluirLerCodigo(pNomeClasse, pNomeTabela: string);
    procedure GeraExcluir(pNomeClasse, pNomeTabela: string);
    procedure GeraAlteracao(pNomeClasse, pNomeTabela: string);
    procedure GeraCamposChaves(spNomeTabela: string);

    function GeraSelecionar(pNomeClasse, pNomeTabela, pCampoIdentidade: string): TStringList;
    function ListarCampos(pNomeTabela: string): string;
    function QuantidadeCampos(pNomeTabela: string): integer;
    { Private declarations }
  public
    { Public declarations }
    ListaCampos: TStringList;
    ListaPropriedades: TStringList;
    ListaParametros: TStringList;
    ListaParametrosUpdate: TStringList;
    ListaCampoAlteracao: TStringList;
    ListaCamposInsercao: TStringList;
    ListaCamposInsercaoParam: TStringList;
    ListaParametrosSel: TStringList;
    ListaGeral: TStringList;
    ListaChaves: TStringList;
    ListaChavesParam: TStringList;
    strCamposChavePrimaria: string;
    strConexaoPadrao: widestring;
  end;

var
  FPrincipal: TFPrincipal;

implementation

uses
  Funcoes, StrUtils;

{$R *.dfm}

procedure TFPrincipal.FormCreate(Sender: TObject);
begin
  strConexaoPadrao := Copy(Memo1.Lines.Text, 1, Length(Memo1.Lines.Text)-2);
  ListaCampos := TStringList.Create;
  ListaPropriedades := TStringList.Create;
  ListaParametros := TStringList.Create;
  ListaParametrosUpdate := TStringList.Create;
  ListaCamposInsercao := TStringList.Create;
  ListaCamposInsercaoParam := TStringList.Create;
  ListaGeral := TStringList.Create;
  ListaChaves := TStringList.Create;
  ListaChavesParam := TStringList.Create;
  ListaCampoAlteracao := TStringList.Create;
  ListaParametrosSel := TStringList.Create;

end;

procedure TFPrincipal.BitBtn2Click(Sender: TObject);
var
  strNomeClasse: string;
  strNomeTabela: string;
  strCampoIdentidade: string;

  strlistSelecionar: TStringList;
begin
  strNomeTabela := lkpNomeTabela.Text;
  strNomeClasse := CamelCase(lkpNomeTabela.Text);

  redtVo.Lines.Clear;
  redtDao.Lines.Clear;

  ListaCampos.Clear;
  ListaPropriedades.Clear;
  GeraCampos(strNomeTabela);
  GeraCamposChaves(strNomeTabela);

  qryIdent.Close;
  qryIdent.Parameters.ParamByName('NOME_TABELA').Value := lkpNomeTabela.Text;
  qryIdent.Open;
  if not qryIdent.IsEmpty then
  begin
    strCampoIdentidade := qryIdent.FieldByName('CAMPO').AsString
  end
  else
  begin
    qryChaves.Close;
    qryChaves.Parameters.ParamByName('TABELA').Value := strNomeTabela;
    qryChaves.Open;
    qryChaves.First;
    strCampoIdentidade := qryChaves.FieldByName('COLUNA').AsString;
  end;

  redtVo.Lines.Add('unit Vo' + strNomeClasse + ';');
  redtVo.Lines.Add('');
  redtVo.Lines.Add('interface');
  redtVo.Lines.Add('');
  redtVo.Lines.Add('uses ');
  redtVo.Lines.Add('  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, ');
  redtVo.Lines.Add('  Dialogs, ActnList, ActnMan, StdCtrls, ComCtrls, ExtCtrls, ADODB, ');
  redtVo.Lines.Add('  StrUtils, VoBase, DaoBase; ');
  redtVo.Lines.Add('');
  redtVo.Lines.Add('type');
  redtVo.Lines.Add('  TVo' + strNomeClasse + ' = class(TVoBase)');
  redtVo.Lines.Add('  private');
  redtVo.Lines.Add(ListaCampos.GetText);
  redtVo.Lines.Add('  public');
  redtVo.Lines.Add(ListaPropriedades.GetText);
  redtVo.Lines.Add('  end;');
  redtVo.Lines.Add('');
  redtVo.Lines.Add('implementation');
  redtVo.Lines.Add('');
  redtVo.Lines.Add('{ TVo' + strNomeClasse + ' }');
  redtVo.Lines.Add('');
  redtVo.Lines.Add('end.');

  //D.A.O.
  redtDao.Lines.Add('unit Dao' + strNomeClasse + ';');
  redtDao.Lines.Add('');
  redtDao.Lines.Add('interface');
  redtDao.Lines.Add('');
  redtDao.Lines.Add('uses');
  redtDao.Lines.Add('  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,');
  redtDao.Lines.Add('  Dialogs, ActnList, ActnMan, StdCtrls, ComCtrls, ExtCtrls, ADODB, DB,');
  redtDao.Lines.Add('  Vo' + strNomeClasse + ', DaoBase;');
  redtDao.Lines.Add('');
  redtDao.Lines.Add('type');
  redtDao.Lines.Add('  TDao' + strNomeClasse + ' = class(TDaoBase)');
  redtDao.Lines.Add('  private');
  redtDao.Lines.Add('  public');
  redtDao.Lines.Add('    procedure Incluir(pVo' + strNomeClasse + ': TVo' + strNomeClasse + ');');
  redtDao.Lines.Add('    function Incluir_LerCodigo(pVo' + strNomeClasse + ': TVo' + strNomeClasse + '): integer;');
  redtDao.Lines.Add('    function Selecionar(pCodigo: integer): TVo' + strNomeClasse + ';');
  redtDao.Lines.Add('    procedure Alterar(pVo' + strNomeClasse + ': TVo' + strNomeClasse + ');');
  redtDao.Lines.Add('    procedure Excluir(pVo' + strNomeClasse + ': TVo' + strNomeClasse + ');');
  redtDao.Lines.Add('  end;');
  redtDao.Lines.Add('');
  redtDao.Lines.Add('implementation');
  redtDao.Lines.Add('');
  redtDao.Lines.Add('');
  redtDao.Lines.Add('{ TDao' + strNomeClasse + ' }');
  redtDao.Lines.Add('');

  //INCLUIR
  GeraIncluir(strNomeClasse, strNomeTabela);
  redtDao.Lines.Add(ListaGeral.GetText);

  //INCLUIR LER CODIGO
  GeraIncluirLerCodigo(strNomeClasse, strNomeTabela);
  redtDao.Lines.Add(ListaGeral.GetText);

  //strlistSelecionar := ;
  redtDao.Lines.Add(GeraSelecionar(strNomeClasse, strNomeTabela, strCampoIdentidade).GetText);

  //EXCLUIR
  GeraExcluir(strNomeClasse, strNomeTabela);
  redtDao.Lines.Add(ListaGeral.GetText);

  //ALTERACAO
  GeraAlteracao(strNomeClasse, strNomeTabela);
  redtDao.Lines.Add(ListaGeral.GetText);

  redtDao.Lines.Add('');
  redtDao.Lines.Add('end.');


end;

procedure TFPrincipal.GeraIncluir(pNomeClasse, pNomeTabela: string);
var
  i: integer;
begin
  ListaGeral.Clear;
  ListaGeral.Add('procedure TDao' + pNomeClasse + '.Incluir(pVo' + pNomeClasse + ': TVo' + pNomeClasse + ');');
  ListaGeral.Add('begin');
  ListaGeral.Add('  try');
  ListaGeral.Add('    FQuery.Close;');
  ListaGeral.Add('    FQuery.SQL.Clear;');

  ListaGeral.Add('    FQuery.SQL.Add(''INSERT INTO ' + AnsiUpperCase(pNomeTabela) + '('');');
  for i := 0 to ListaCamposInsercao.Count -1 do
    ListaGeral.Add('    FQuery.SQL.Add(' + QuotedStr(ListaCamposInsercao[i]) + ');');
  ListaGeral.Add('    FQuery.SQL.Add('')'' );' );

  ListaGeral.Add('    FQuery.SQL.Add(''VALUES ( '' );' );
  for i := 0 to ListaCamposInsercaoParam.Count -1 do
    ListaGeral.Add('    FQuery.SQL.Add(' + QuotedStr(ListaCamposInsercaoParam[i]) + ');');
  ListaGeral.Add('    FQuery.SQL.Add('');'' );' );
  ListaGeral.Add(ListaParametros.GetText);
  ListaGeral.Add('    FQuery.ExecSQL;');
  ListaGeral.Add('  except');
  ListaGeral.Add('    on E: Exception do');
  ListaGeral.Add('      Raise exception.Create(''ERRO AO INCLUIR ' + pNomeTabela + ''' + chr(10) + chr(10) + ''Erro:'' + E.Message);');
  ListaGeral.Add('  end;');
  ListaGeral.Add('end;');
end;

procedure TFPrincipal.GeraIncluirLerCodigo(pNomeClasse, pNomeTabela: string);
var
  i: integer;
begin
  ListaGeral.Clear;
  ListaGeral.Add('function TDao' + pNomeClasse + '.Incluir_LerCodigo(pVo' + pNomeClasse + ': TVo' + pNomeClasse + '): integer;');
  ListaGeral.Add('var ');
  ListaGeral.Add('  iCod: integer; ');
  ListaGeral.Add('begin ');
  ListaGeral.Add('  iCod := 0; ');
  ListaGeral.Add('  try ');
  ListaGeral.Add('    Incluir(pVo' + pNomeClasse + '); ');
  ListaGeral.Add('    FQuery.Close; ');
  ListaGeral.Add('    FQuery.SQL.Clear; ');
  ListaGeral.Add('    FQuery.SQL.Add('' SELECT COALESCE(IDENT_CURRENT('+ chr(39) +
    QuotedStr(pNomeTabela) + chr(39) +'), 0) AS CODIGO_ATUAL''); ');
  ListaGeral.Add('    FQuery.Open; ');
  ListaGeral.Add('    iCod := FQuery.FieldByName(''CODIGO_ATUAL'').AsInteger; ');
  ListaGeral.Add('  except ');
  ListaGeral.Add('    on E: Exception do ');
  ListaGeral.Add('      Raise exception.Create(''ERRO AO INCLUIR/LER CODIGO ' +
    pNomeTabela + ''' + chr(10) + chr(10) + ''Erro:'' + E.Message);');
  ListaGeral.Add('  end; ');
  ListaGeral.Add('  result := iCod; ');
  ListaGeral.Add('end; ');
end;

procedure TFPrincipal.GeraExcluir(pNomeClasse, pNomeTabela: string);
var
  i: integer;
begin
  ListaGeral.Clear;
  ListaGeral.Add('procedure TDao' + pNomeClasse + '.Excluir(pVo' + pNomeClasse + ': TVo' + pNomeClasse + ');');
  ListaGeral.Add('begin');
  ListaGeral.Add('  try');
  ListaGeral.Add('    FQuery.Close;');
  ListaGeral.Add('    FQuery.SQL.Clear;');
  ListaGeral.Add('    FQuery.SQL.Add(''DELETE FROM ' + pNomeTabela+ ' WHERE ' + strCamposChavePrimaria + '  '');');
  ListaGeral.Add(ListaChavesParam.GetText);
  ListaGeral.Add('    FQuery.ExecSQL;');
  ListaGeral.Add('  except');
  ListaGeral.Add('    on E: Exception do');
  ListaGeral.Add('      Raise exception.Create(''ERRO AO EXCLUIR - ' + pNomeTabela + ''' + chr(10) + chr(10) + ''Erro:'' + E.Message);');
  ListaGeral.Add('  end;');
  ListaGeral.Add('end;');
end;

procedure TFPrincipal.GeraAlteracao(pNomeClasse, pNomeTabela: string);
var
  i: integer;
begin
  ListaGeral.Clear;
  ListaGeral.Add('procedure TDao' + pNomeClasse + '.Alterar(pVo' + pNomeClasse + ': TVo' + pNomeClasse + ');');
  ListaGeral.Add('begin');
  ListaGeral.Add('  try');
  ListaGeral.Add('    FQuery.Close;');
  ListaGeral.Add('    FQuery.SQL.Clear;');

  ListaGeral.Add('    FQuery.SQL.Add(''UPDATE ' + AnsiUpperCase(pNomeTabela) + ' SET '');');
  for i := 0 to ListaCampoAlteracao.Count -1 do
    ListaGeral.Add('    FQuery.SQL.Add(' + QuotedStr(ListaCampoAlteracao[i]) + ');');
  ListaGeral.Add('    FQuery.SQL.Add('' WHERE ' + strCamposChavePrimaria + '  '');');
  ListaGeral.Add(ListaParametros.GetText);
  ListaGeral.Add(ListaChavesParam.GetText);
  ListaGeral.Add('    FQuery.ExecSQL;');
  ListaGeral.Add('  except');
  ListaGeral.Add('    on E: Exception do');
  ListaGeral.Add('      Raise exception.Create(''ERRO AO INCLUIR ' + pNomeTabela + ''' + chr(10) + chr(10) + ''Erro:'' + E.Message);');
  ListaGeral.Add('  end;');
  ListaGeral.Add('end;');
end;

function TFPrincipal.GeraSelecionar(pNomeClasse, pNomeTabela, pCampoIdentidade: string): TStringList;
var
  i: integer;
  sel: TStringList;
begin
  sel := TStringList.Create;
  sel.Add('function TDao' + pNomeClasse + '.Selecionar(pCodigo: integer):TVo' + pNomeClasse + ';');
  sel.Add('var ');
  sel.Add('  vo: TVo' + pNomeClasse + ';');
  sel.Add('begin ');
  sel.Add('  vo := TVo' + pNomeClasse + '.Create;');
  sel.Add('  try ');
  sel.Add('    FQuery.Close; ');
  sel.Add('    FQuery.SQL.Clear; ');
  sel.Add('    FQuery.SQL.Add(''SELECT * FROM ' + pNomeTabela+ ' WHERE ' + strCamposChavePrimaria + '  '');');
  sel.Add('    FQuery.Parameters.ParamByName(' + QuotedStr(pCampoIdentidade) + ').Value := pCodigo;');
  //sel.Add(ListaChavesParam.GetText);
  sel.Add('    FQuery.Open; ');
  sel.Add('    if not FQuery.IsEmpty then ');
  sel.Add('    begin ');
  sel.Add('      vo.' + pCampoIdentidade + ' := pCodigo; ');
  sel.Add(ListaParametrosSel.GetText);
  sel.Add('    end ');
  sel.Add('  except ');
  sel.Add('    on E: Exception do ');
  sel.Add('      Raise exception.Create(''ERRO AO SELECIONAR ' +
    pNomeTabela + ''' + chr(10) + chr(10) + ''Erro:'' + E.Message);');
  sel.Add('  end; ');
  sel.Add('  result := vo; ');
  sel.Add('end; ');

  Result := sel;
end;

procedure TFPrincipal.GeraCampos(spNomeTabela: string);
var
  strCampo, strTipo, strField: string;
  strDataType: string;
  strParam : string;
  strNomeClasse: string;
  i, a, contParam: integer;
  strCamposInserir, strCamposInserirParam: string;
  strCamposAlterar, strIndent: string;
begin
  strNomeClasse := CamelCase(spNomeTabela);
  ListaCampos.Clear;
  ListaPropriedades.Clear;
  ListaParametros.Clear;
  ListaParametrosSel.Clear;
  ListaCamposInsercao.Clear;
  ListaCamposInsercaoParam.Clear;
  ListaCampoAlteracao.Clear;

  qryCampos.Close;
  qryCampos.Parameters.ParamByName('nometabela').Value := spNomeTabela;
  qryCampos.Open;
  qryCampos.First;
  i := 0;
  a := 0;
  contParam := 0;
  while not qryCampos.Eof do
  begin
    strParam := IntToStr(contParam);
    strCampo := CamelCase(qryCampos.FieldByname('campo').Value);
    strField := AnsiLowerCase(qryCampos.FieldByname('campo').Value);
    strTipo := TipoSqlToDelphi(qryCampos.FieldByname('tipo').Value);
    strDataType := TipoSqlToDelphiField(qryCampos.FieldByname('tipo').Value);
    ListaCampos.Add('    F' + strCampo + ': ' + strTipo + ';');
    ListaPropriedades.Add('    property ' + strCampo + ': ' + strTipo + ' read F' + strCampo + ' write F' + strCampo + ';');

    if qryCampos.FieldByName('ISIDENTITY').Value = 0 then
    begin
      Inc(a, 1);
      strIndent := '    ';
      if strDataType = 'ftDateTime' then
      begin
        ListaParametros.Add('    if pVo' + strNomeClasse + '.' + strCampo + ' <> StrToDate(''30/12/1899'') then ' );
        strIndent := '      ';
      end;
      ListaParametros.Add(strIndent + 'FQuery.Parameters.ParamByName(' + QuotedStr(strCampo) +
        ').Value := pVo' + strNomeClasse + '.' + strCampo + ';');

      //Parametros do metodo selecionar
      ListaParametrosSel.Add('      if not FQuery.FieldByName(' + QuotedStr(strCampo) +').IsNull then ');
      ListaParametrosSel.Add('        vo.' + strCampo + ' := FQuery.FieldByName(' + QuotedStr(strCampo) + ').Value;');

      //ESTE TRECHO ALIMENTA OS PARAMETROS USADOS NOS INSERT//
      strCamposInserir := strCamposInserir + (strField);
      strCamposInserirParam := strCamposInserirParam + ':' + (strField);
      strCamposAlterar := strCamposAlterar + strField + ' = :' + strField;
      //strCamposSelecionar := strCamposSelecionar +

      if ((i + 1) < qryCampos.RecordCount) then
      begin
        strCamposInserir := strCamposInserir + ', ';
        strCamposInserirParam := strCamposInserirParam + ', ';
        strCamposAlterar := strCamposAlterar + ', ';
      end;

      if a = 3 then
      begin
        a := 0;
        ListaCamposInsercao.Add('  ' + strCamposInserir);
        ListaCamposInsercaoParam.Add('  ' + strCamposInserirParam);
        ListaCampoAlteracao.Add('  ' + strCamposAlterar);

        strCamposInserir := '';
        strCamposInserirParam := '';
        strCamposAlterar := '';
      end;
      Inc(contParam, 1);
    end;
    Inc(i, 1);
    qryCampos.Next;
  end;

  if a > 0 then
  begin
    ListaCamposInsercao.Add('  ' + strCamposInserir);
    ListaCamposInsercaoParam.Add('  ' + strCamposInserirParam);
    ListaCampoAlteracao.Add('  ' + strCamposAlterar);
  end;

end;

procedure TFPrincipal.GeraCamposChaves(spNomeTabela: string);
var
  strCampo, strTipo, strField: string;
  strI : string;
  strNomeClasse: string;
  i, a: integer;
  strCamposParam: string;
  strLinha: string;
begin
  strCamposChavePrimaria := '';
  strNomeClasse := CamelCase(spNomeTabela);
  ListaChaves.Clear;
  ListaChavesParam.Clear;

  qryChaves.Close;
  qryChaves.Parameters.ParamByName('TABELA').Value := spNomeTabela;
  qryChaves.Open;
  qryChaves.First;

  i := 0;
  while not qryChaves.Eof do
  begin
    strI := IntToStr(i);
    strCampo := CamelCase(qryChaves.FieldByname('coluna').Value);
    strField := AnsiLowerCase(qryChaves.FieldByname('coluna').Value);
    strTipo := TipoSqlToDelphi(qryChaves.FieldByname('tipo').Value);
    strCamposChavePrimaria := strCamposChavePrimaria + (strField + ' = :' + strField);

    if (i + 1) < qryChaves.RecordCount then
      strCamposChavePrimaria := strCamposChavePrimaria + ' AND ';

    strLinha := 'FQuery.Parameters.ParamByName(' + QuotedStr(strCampo) + ').Value := pVo' + strNomeClasse + '.' + strCampo;
    ListaChavesParam.Add('    ' + strLinha + ';');

    i := i + 1;
    qryChaves.Next;
  end;

end;

procedure TFPrincipal.FormShow(Sender: TObject);
var
  d: TDate;
  dh: TDateTime;
  t: TTime;
begin
  WindowState := wsMaximized;
  TabSheet1.Show;
end;

procedure TFPrincipal.BitBtn9Click(Sender: TObject);
var
  strNomeClasse: string;
begin
  strNomeClasse := CamelCase(lkpNomeTabela.Text);
  SaveSQL.FileName := strNomeClasse + '.sql';

end;

procedure TFPrincipal.BitBtn3Click(Sender: TObject);
var
  strNomeClasse: string;
begin
  if Trim(redtVo.Lines[0]) = EmptyStr then
    Exit;

  strNomeClasse := CamelCase(lkpNomeTabela.Text);
  redtVo.Lines.SaveToFile(edtVo.Text + '\Vo' + strNomeClasse + '.pas');
end;

procedure TFPrincipal.BitBtn5Click(Sender: TObject);
var
  strNomeClasse: string;
begin
  if Trim(redtDao.Lines[0]) = EmptyStr then
    Exit;

  strNomeClasse := CamelCase(lkpNomeTabela.Text);
  redtDao.Lines.SaveToFile(edtDao.Text + '\Dao' + strNomeClasse + '.pas');
end;

procedure TFPrincipal.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFPrincipal.SpeedButton1Click(Sender: TObject);
var
  strServidor: string;
  strConexao: string;
begin
  strServidor := '.';
  if RadioGroup1.ItemIndex = 1 then
    strServidor := Trim(edtServidor.Text);

  if Trim(edtServidor.Text) = '' then
  begin
    ShowMessage('Informe o Servidor');
    Exit;
  end;

  if Trim(edtUser.Text) = '' then
  begin
    ShowMessage('Informe o Usuário');
    Exit;
  end;

  if Trim(edtPass.Text) = '' then
  begin
    ShowMessage('Informe o ');
    Exit;
  end;

  strConexao := AnsiReplaceStr(strConexaoPadrao, '<password>', edtPass.Text);
  strConexao := AnsiReplaceStr(strConexao, '<user>', edtUser.Text);
  strConexao := AnsiReplaceStr(strConexao, '<servidor>', strServidor);
  strConexao := AnsiReplaceStr(strConexao, '<Workstation>', GetNomeComputador);

  if not ADOConnection1.Connected then
    strConexao := AnsiReplaceStr(strConexao, '<catalog>', 'master')
  else
    strConexao := AnsiReplaceStr(strConexao, '<catalog>', qryBASES.FieldByName('name').AsString);

  qryTabelas.Close;
  ADOConnection1.Close;
  ADOConnection1.ConnectionString := strConexao;
  try
    ADOConnection1.Open;

    qryTabelas.Open;
    qryTabelas.First;
    qryBases.Open;

    StatusBar1.Panels[0].Text := 'CONECTADO';
  except
      on e:exception do
      begin
        StatusBar1.Panels[0].Text := 'DESCONECTADO';
        ShowMessage('Erro ao conectar. ' + e.Message);
      end;
  end;
end;

procedure TFPrincipal.RadioGroup1Click(Sender: TObject);
begin
  if radiogroup1.itemindex = 0 then
    edtServidor.Text := '.';
  edtServidor.Enabled := radiogroup1.ItemIndex = 1;
  if radiogroup1.ItemIndex = 1 then
    edtServidor.setfocus;
end;

procedure TFPrincipal.RxDBLookupCombo1CloseUp(Sender: TObject);
begin
  SpeedButton1Click(Sender);
end;

function TFPrincipal.ListarCampos(pNomeTabela: string): string;
var
  sql, campo: string;
  qry: TADOQuery;
  lista: TStringList;
  i, qtd_campo: integer;
begin
  sql := 'select TS.NAME as TABLENAME,' +
         '       C.NAME as COLUMN_NAME,' +
         '       T.NAME as DATATYPENAME' +
         ' from SYS.COLUMNS as C' +
         ' inner join SYS.TYPES as T on C.USER_TYPE_ID = T.USER_TYPE_ID' +
         ' inner join SYS.TABLES TS on TS.OBJECT_ID = C.OBJECT_ID' +
         ' where TS.NAME = ' + QuotedStr(pNomeTabela) + ' and' +
         '       T.NAME <> ''varbinary''';

  qtd_campo := QuantidadeCampos(pNomeTabela) - 1;
  qry := TADOQuery.Create(nil);
  lista := TStringList.Create;
  try
    qry.Connection := ADOConnection1;
    qry.SQL.Text := sql;
    qry.Open;
    qry.First;

    i := 0;
    while not qry.Eof do
    begin
      campo := qry.FieldByName('COLUMN_NAME').AsString;

      if i <> qtd_campo then
        campo := campo + ', '
      else
        campo := campo;

      lista.Add(campo);

      qry.Next;
      Inc(i);
    end;

    Result := lista.Text;

  finally
    FreeAndNil(lista);
    FreeAndNil(qry);
  end;
end;

function TFPrincipal.QuantidadeCampos(pNomeTabela: string): integer;
var
  sql: string;
  qry: TADOQuery;
begin
  sql := 'select count(*) QTD_COLUNAS' +
         ' from INFORMATION_SCHEMA.COLUMNS' +
         ' where TABLE_NAME = ' + QuotedStr(pNomeTabela) + '' +
         '   and INFORMATION_SCHEMA.COLUMNS.DATA_TYPE <> ''varbinary''';
  qry := TADOQuery.Create(nil);
  try
    qry.Connection := ADOConnection1;
    qry.SQL.Text := sql;
    qry.Open;

    result := qry.FieldByName('QTD_COLUNAS').AsInteger;

  finally
    FreeAndNil(qry);
  end;

end;

end.
