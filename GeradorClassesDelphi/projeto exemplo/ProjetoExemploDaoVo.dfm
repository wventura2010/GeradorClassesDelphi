object frmCadastroAlunos: TfrmCadastroAlunos
  Left = 0
  Top = 0
  Caption = 'Cadastrar Novo Aluno'
  ClientHeight = 308
  ClientWidth = 462
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 41
    Height = 13
    Caption = 'C'#211'DIGO'
  end
  object Label2: TLabel
    Left = 16
    Top = 48
    Width = 29
    Height = 13
    Caption = 'NOME'
  end
  object Label3: TLabel
    Left = 16
    Top = 88
    Width = 54
    Height = 13
    Caption = 'ENDERE'#199'O'
  end
  object Label4: TLabel
    Left = 16
    Top = 128
    Width = 39
    Height = 13
    Caption = 'BAIRRO'
  end
  object Label5: TLabel
    Left = 16
    Top = 216
    Width = 50
    Height = 13
    Caption = 'TELEFONE'
  end
  object Label6: TLabel
    Left = 16
    Top = 176
    Width = 19
    Height = 13
    Caption = 'CEP'
  end
  object Panel2: TPanel
    Left = 0
    Top = 269
    Width = 462
    Height = 39
    Align = alBottom
    TabOrder = 5
    object btnFechar: TButton
      Left = 376
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Fechar'
      TabOrder = 0
      OnClick = btnFecharClick
    end
    object btnGravar: TButton
      Left = 176
      Top = 8
      Width = 195
      Height = 25
      Caption = '&Gravar Aluno'
      TabOrder = 1
      OnClick = btnGravarClick
    end
  end
  object edtCodigo: TEdit
    Left = 16
    Top = 24
    Width = 73
    Height = 21
    Color = clBtnFace
    Enabled = False
    TabOrder = 6
  end
  object edtNome: TEdit
    Left = 16
    Top = 64
    Width = 313
    Height = 21
    TabOrder = 0
  end
  object edtEndereco: TEdit
    Left = 16
    Top = 104
    Width = 425
    Height = 21
    TabOrder = 1
  end
  object edtBairro: TEdit
    Left = 16
    Top = 144
    Width = 313
    Height = 21
    TabOrder = 2
  end
  object edtTelefone: TEdit
    Left = 16
    Top = 232
    Width = 105
    Height = 21
    TabOrder = 4
  end
  object edtCEP: TEdit
    Left = 16
    Top = 192
    Width = 105
    Height = 21
    TabOrder = 3
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLNCLI10.1;Integrated Security="";Persist Security Inf' +
      'o=False;User ID=sa;Initial Catalog=ESTUDO;Data Source=DESENVOLVI' +
      'MENTO\SQLEXPRESS;Initial File Name="";Server SPN="";'
    Provider = 'SQLNCLI10.1'
    Left = 160
    Top = 184
  end
end
