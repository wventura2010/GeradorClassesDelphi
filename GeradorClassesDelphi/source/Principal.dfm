object FPrincipal: TFPrincipal
  Left = 373
  Top = 186
  Caption = 'Gerador de Classes - DAO / VO / Delphi / SQL Server / ADO'
  ClientHeight = 541
  ClientWidth = 1056
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010002002020100000000000E80200002600000010101000000000002801
    00000E0300002800000020000000400000000100040000000000800200000000
    0000000000000000000000000000000000000000800000800000008080008000
    00008000800080800000C0C0C000808080000000FF0000FF000000FFFF00FF00
    0000FF00FF00FFFF0000FFFFFF00000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000002222222222222222222222222200000022
    222222222222222222222222000022AAAAAAAAAAAAAAAAAAAAAAAAAA220022AA
    AAAAAAAAAAAAAAAAAAAAAAAA220022AAAAAAAAAAAAAAAAAAAAAAAAAA220022AA
    AAAAAAAAAAAAAAAAAAAAAAAA220022AAAAAAAAAAAAAAAAAAAAAAAAAA220022AA
    AAAAAAAAAAAAAAAAAAAAAAAA220022AABBBBBBAAAA8888AA888888AA220022AA
    BBBBBBAAAA8888AA888888AA220022AABBBBBBAAAAAAAAAAAAAAAAAA220022AA
    BBBBBBAAAAAAAAAAAAAAAAAA220022AABBBBBBAAAA8888888888AAAA220022AA
    BBBBBBAAAA8888888888AAAA220022AAAAAAAAAAAAAAAAAAAAAAAAAA220022AA
    AAAAAAAAAAAAAAAAAAAAAAAA220022AAAAAAAAAAAAAAAAAAAAAAAAAA220022AA
    AAAAAAAAAAAAAAAAAAAAAAAA2200002222222222222222222222222200000022
    2222222222222222222222220000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000
    0003F0000003C0000000C0000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000300000003C000000FC000000FFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFF280000001000000020000000010004000000
    0000C00000000000000000000000000000000000000000000000000080000080
    000000808000800000008000800080800000C0C0C000808080000000FF0000FF
    000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000000000000000000000
    000000000000000000000000000002222222222222002AAAAAAAAAAAAA202AAA
    AAAAAAAAAA202AAAAAAAAAAAAA202ABBBAA88A888A202ABBBAAAAAAAAA202ABB
    BAA88888AA202AAAAAAAAAAAAA202AAAAAAAAAAAAA2002222222222222000000
    00000000000000000000000000000000000000000000FFFF0000FFFF0000C001
    0000800000000000000000000000000000000000000000000000000000000000
    00000001000080030000FFFF0000FFFF0000FFFF0000}
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1056
    Height = 161
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 6
      Top = 4
      Width = 280
      Height = 150
      Caption = '   Conex'#227'o ao Banco de Dados   '
      Color = clBtnFace
      ParentBackground = False
      ParentColor = False
      TabOrder = 0
      object Label3: TLabel
        Left = 6
        Top = 92
        Width = 39
        Height = 13
        Caption = 'Usu'#225'rio:'
      end
      object Label4: TLabel
        Left = 11
        Top = 116
        Width = 34
        Height = 13
        Caption = 'Senha:'
      end
      object Label5: TLabel
        Left = 3
        Top = 68
        Width = 42
        Height = 13
        Caption = 'Servidor:'
      end
      object edtUser: TEdit
        Left = 48
        Top = 88
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Text = 'sa'
      end
      object edtPass: TEdit
        Left = 48
        Top = 112
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 1
        Text = '30232800'
      end
      object RadioGroup1: TRadioGroup
        Left = 9
        Top = 14
        Width = 264
        Height = 37
        Caption = '   Servidor   '
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          '&Local'
          '&Remoto')
        TabOrder = 2
        OnClick = RadioGroup1Click
      end
      object edtServidor: TEdit
        Left = 48
        Top = 64
        Width = 177
        Height = 21
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        Text = '.'
      end
      object SpeedButton1: TBitBtn
        Left = 176
        Top = 112
        Width = 95
        Height = 25
        Caption = '&Conectar'
        DoubleBuffered = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
          333333333337FF3333333333330003333333333333777F333333333333080333
          3333333F33777FF33F3333B33B000B33B3333373F777773F7333333BBB0B0BBB
          33333337737F7F77F333333BBB0F0BBB33333337337373F73F3333BBB0F7F0BB
          B333337F3737F73F7F3333BB0FB7BF0BB3333F737F37F37F73FFBBBB0BF7FB0B
          BBB3773F7F37337F377333BB0FBFBF0BB333337F73F333737F3333BBB0FBF0BB
          B3333373F73FF7337333333BBB000BBB33333337FF777337F333333BBBBBBBBB
          3333333773FF3F773F3333B33BBBBB33B33333733773773373333333333B3333
          333333333337F33333333333333B333333333333333733333333}
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 4
        OnClick = SpeedButton1Click
      end
    end
    object GroupBox2: TGroupBox
      Left = 292
      Top = 4
      Width = 373
      Height = 150
      Caption = '   Tabelas Disponiveis   '
      Color = clBtnFace
      ParentBackground = False
      ParentColor = False
      TabOrder = 1
      object Label2: TLabel
        Left = 5
        Top = 22
        Width = 76
        Height = 13
        Caption = '&Base de Dados:'
      end
      object Label1: TLabel
        Left = 40
        Top = 48
        Width = 41
        Height = 13
        Caption = '&Tabelas:'
      end
      object RxDBLookupCombo1: TRxDBLookupCombo
        Left = 88
        Top = 18
        Width = 273
        Height = 21
        DropDownCount = 8
        LookupField = 'name'
        LookupDisplay = 'name'
        LookupSource = dsBases
        TabOrder = 0
        OnCloseUp = RxDBLookupCombo1CloseUp
      end
      object lkpNomeTabela: TRxDBLookupCombo
        Left = 88
        Top = 44
        Width = 273
        Height = 21
        DropDownCount = 8
        LookupField = 'name'
        LookupDisplay = 'name'
        LookupSource = dsTabelas
        TabOrder = 1
      end
      object BitBtn2: TBitBtn
        Left = 207
        Top = 113
        Width = 75
        Height = 25
        Caption = '&Gerar'
        DoubleBuffered = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000055
          555557777777775F55550FFFFFFFFF0555557F5555555F7FFF5F0FEEEEEE0000
          05007F555555777775770FFFFFF0BFBFB00E7F5F5557FFF557770F0EEEE000FB
          FB0E7F75FF57775555770FF00F0FBFBFBF0E7F57757FFFF555770FE0B00000FB
          FB0E7F575777775555770FFF0FBFBFBFBF0E7F5575FFFFFFF5770FEEE0000000
          FB0E7F555777777755770FFFFF0B00BFB0007F55557577FFF7770FEEEEE0B000
          05557F555557577775550FFFFFFF0B0555557FF5F5F57575F55500F0F0F0F0B0
          555577F7F7F7F7F75F5550707070700B055557F7F7F7F7757FF5507070707050
          9055575757575757775505050505055505557575757575557555}
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 2
        OnClick = BitBtn2Click
      end
      object BitBtn1: TBitBtn
        Left = 287
        Top = 113
        Width = 75
        Height = 25
        Cancel = True
        Caption = '&Fechar'
        DoubleBuffered = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
          03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
          0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
          0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
          0333337F777FFFFF7F3333000000000003333377777777777333}
        ModalResult = 7
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 3
        OnClick = BitBtn1Click
      end
    end
    object Memo1: TMemo
      Left = 671
      Top = 8
      Width = 378
      Height = 145
      Lines.Strings = (
        
          'Provider=SQLOLEDB.1;Password=<password>;Persist Security Info=Tr' +
          'ue;User ID=<user>;Initial Catalog=<catalog>;Data Source=<servido' +
          'r>\SQLEXPRESS;Use Procedure for Prepare=1;Auto Translate=True;Pa' +
          'cket Size=4096;Workstation ID=<Workstation>;Use Encryption for D' +
          'ata=False;Tag with column collation when possible=False')
      TabOrder = 2
      Visible = False
      WordWrap = False
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 161
    Width = 1056
    Height = 361
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = '&VO'
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 1048
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        object Label6: TLabel
          Left = 201
          Top = 8
          Width = 29
          Height = 13
          Caption = 'Local:'
        end
        object BitBtn3: TBitBtn
          Left = 8
          Top = 1
          Width = 190
          Height = 25
          Caption = '&Salvar Unit VO >>'
          DoubleBuffered = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
            00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
            00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
            00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
            00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
            00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
            00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
            0003737FFFFFFFFF7F7330099999999900333777777777777733}
          NumGlyphs = 2
          ParentDoubleBuffered = False
          TabOrder = 0
          OnClick = BitBtn3Click
        end
        object edtVo: TEdit
          Left = 236
          Top = 4
          Width = 424
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Text = 'C:\Desenvolvimento\fontes\projeto'
        end
      end
      object redtVo: TMemo
        Left = 0
        Top = 30
        Width = 1048
        Height = 303
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 1
        WordWrap = False
      end
    end
    object TabSheet2: TTabSheet
      Caption = '&DAO'
      ImageIndex = 1
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 1048
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        object Label7: TLabel
          Left = 201
          Top = 8
          Width = 29
          Height = 13
          Caption = 'Local:'
        end
        object BitBtn5: TBitBtn
          Left = 8
          Top = 1
          Width = 190
          Height = 25
          Caption = '&Salvar Unit DAO >>'
          DoubleBuffered = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
            00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
            00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
            00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
            00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
            00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
            00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
            0003737FFFFFFFFF7F7330099999999900333777777777777733}
          NumGlyphs = 2
          ParentDoubleBuffered = False
          TabOrder = 0
          OnClick = BitBtn5Click
        end
        object edtDao: TEdit
          Left = 236
          Top = 4
          Width = 424
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Text = 'C:\Desenvolvimento\fontes\projeto'
        end
      end
      object redtDao: TMemo
        Left = 0
        Top = 30
        Width = 1048
        Height = 303
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 1
        WordWrap = False
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 522
    Width = 1056
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=30232800;Persist Security Info=True' +
      ';User ID=sa;Initial Catalog=master;Data Source=.\SQLEXPRESS;Use ' +
      'Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Wor' +
      'kstation ID=WILSON-PC;Use Encryption for Data=False;Tag with col' +
      'umn collation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 272
    Top = 232
  end
  object qryTabelas: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select name from sysobjects where type = '#39'u'#39' order by name;')
    Left = 416
    Top = 64
  end
  object qryCampos: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'nometabela'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 128
        Value = Null
      end>
    SQL.Strings = (
      
        '       SELECT SYSCOLUMNS.NAME AS CAMPO,SYSTYPES.NAME AS TIPO,SYS' +
        'COLUMNS.LENGTH AS TAMANHO,'
      
        '        COLUMNPROPERTY(SYSOBJECTS.ID,SYSCOLUMNS.NAME,'#39'IsIdentity' +
        #39') ISIDENTITY'
      '       FROM SYSCOLUMNS'
      
        '       LEFT OUTER JOIN  SYSOBJECTS ON SYSOBJECTS.ID = SYSCOLUMNS' +
        '.ID '
      
        '       LEFT OUTER JOIN SYSTYPES ON SYSTYPES.XTYPE = SYSCOLUMNS.X' +
        'TYPE '
      '       WHERE SYSOBJECTS.XTYPE = '#39'U'#39
      '       AND SYSOBJECTS.NAME = :nometabela'
      '       ORDER BY SYSCOLUMNS.ID ;')
    Left = 496
    Top = 296
    object qryCamposcampo: TWideStringField
      FieldName = 'campo'
      Size = 128
    end
    object qryCampostipo: TWideStringField
      FieldName = 'tipo'
      Size = 128
    end
    object qryCampostamanho: TSmallintField
      FieldName = 'tamanho'
    end
    object qryCamposISIDENTITY: TIntegerField
      FieldName = 'ISIDENTITY'
      ReadOnly = True
    end
  end
  object dsTabelas: TDataSource
    DataSet = qryTabelas
    Left = 453
    Top = 66
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.pas'
    Filter = '*.pas'
    Left = 732
    Top = 297
  end
  object qryChaves: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'TABELA'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 128
        Value = Null
      end>
    SQL.Strings = (
      '    SELECT '
      '        COLUNAS.NAME AS COLUNA,'
      '        TIPOS.NAME AS TIPO,'
      '        COLUNAS.LENGTH AS TAMANHO,'
      '        COLUNAS.COLORDER AS ORDEM'
      '    FROM '
      '        SYSOBJECTS AS TABELAS,'
      '        SYSCOLUMNS AS COLUNAS,'
      '        SYSTYPES   AS TIPOS,'
      #9#9'INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS TIPO'
      '    WHERE '
      '        TABELAS.ID = COLUNAS.ID'
      '        AND COLUNAS.USERTYPE = TIPOS.USERTYPE'
      #9#9'AND TABELAS.NAME = TIPO.TABLE_NAME'
      #9#9'AND COLUNAS.NAME = TIPO.COLUMN_NAME'
      
        #9#9'AND OBJECTPROPERTY(OBJECT_ID(TIPO.CONSTRAINT_NAME), '#39'IsPrimary' +
        'Key'#39') = 1'
      '        AND TABELAS.NAME = :TABELA'
      #9#9'ORDER BY COLUNAS.COLORDER;')
    Left = 496
    Top = 344
  end
  object qryBases: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT name FROM sys.databases ORDER BY name;')
    Left = 280
    Top = 304
    object qryBasesname: TWideStringField
      FieldName = 'name'
      Size = 128
    end
  end
  object dsBases: TDataSource
    DataSet = qryBases
    Left = 349
    Top = 306
  end
  object qryIdent: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'NOME_TABELA'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 128
        Value = Null
      end>
    SQL.Strings = (
      
        '  SELECT SYSCOLUMNS.NAME AS CAMPO,SYSTYPES.NAME AS TIPO,SYSCOLUM' +
        'NS.LENGTH AS TAMANHO,'
      
        '      COLUMNPROPERTY(SYSOBJECTS.ID,SYSCOLUMNS.NAME,'#39'ISIDENTITY'#39')' +
        ' ISIDENTITY'
      '    FROM SYSCOLUMNS'
      
        '    LEFT OUTER JOIN  SYSOBJECTS ON SYSOBJECTS.ID = SYSCOLUMNS.ID' +
        ' '
      
        '    LEFT OUTER JOIN SYSTYPES ON SYSTYPES.XTYPE = SYSCOLUMNS.XTYP' +
        'E '
      '   WHERE SYSOBJECTS.XTYPE = '#39'U'#39
      '     AND SYSOBJECTS.NAME = :NOME_TABELA'
      
        '     AND COLUMNPROPERTY(SYSOBJECTS.ID,SYSCOLUMNS.NAME,'#39'ISIDENTIT' +
        'Y'#39') = 1')
    Left = 440
    Top = 232
  end
  object SaveSQL: TSaveDialog
    DefaultExt = '*.sql'
    Filter = '*.sql'
    Title = 'SALVAR TRIGGER - SQL'
    Left = 828
    Top = 273
  end
end
