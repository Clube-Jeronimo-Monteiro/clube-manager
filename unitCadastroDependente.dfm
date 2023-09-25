object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Cadastro de Dependente'
  ClientHeight = 433
  ClientWidth = 338
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 15
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 322
    Height = 417
    TabOrder = 0
    object Label3: TLabel
      Left = 16
      Top = 327
      Width = 206
      Height = 15
      Caption = 'Ser'#225' cadastrado como dependente do: '
    end
    object NomeSocio: TLabel
      Left = 16
      Top = 356
      Width = 3
      Height = 15
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 8
      Width = 281
      Height = 89
      Caption = 'Dados Dependente'
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 26
        Width = 89
        Height = 15
        Caption = 'Nome Completo'
      end
      object EDNameDependente: TEdit
        Left = 16
        Top = 47
        Width = 249
        Height = 23
        ImeName = 'Portuguese (Brazilian ABNT)'
        TabOrder = 0
      end
    end
    object Button1: TButton
      Left = 16
      Top = 377
      Width = 281
      Height = 33
      Caption = 'Cadastrar'
      TabOrder = 1
      OnClick = Button1Click
    end
    object GroupBox2: TGroupBox
      Left = 16
      Top = 103
      Width = 281
      Height = 218
      Caption = 'Selecione um S'#243'cio'
      TabOrder = 2
      object Label2: TLabel
        Left = 16
        Top = 26
        Width = 33
        Height = 15
        Caption = 'Nome'
      end
      object EDNome: TEdit
        Left = 16
        Top = 47
        Width = 185
        Height = 23
        ImeName = 'Portuguese (Brazilian ABNT)'
        TabOrder = 0
      end
      object Button2: TButton
        Left = 207
        Top = 47
        Width = 70
        Height = 23
        Caption = 'Pesquisar'
        TabOrder = 1
        OnClick = Button2Click
      end
    end
    object DBGrid1: TDBGrid
      Left = 32
      Top = 179
      Width = 257
      Height = 120
      DataSource = REQuery
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'id'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Visible = True
        end>
    end
  end
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=clube-dev'
      'User_Name=academia-api'
      'Password=6414'
      'Server=127.0.0.1'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 304
    Top = 232
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=clube-dev'
      'User_Name=academia-api'
      'Password=6414'
      'Server=127.0.0.1'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 304
    Top = 40
  end
  object dsSocio: TDataSource
    DataSet = tbSocio
    Left = 304
    Top = 328
  end
  object tbSocio: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    CatalogName = 'clube-dev'
    TableName = '`clube-dev`.socio'
    Left = 304
    Top = 280
    object tbSocioid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tbSocionome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 255
    end
    object tbSociocodSocio: TIntegerField
      FieldName = 'codSocio'
      Origin = 'codSocio'
      Required = True
    end
    object tbSociotelefone: TStringField
      FieldName = 'telefone'
      Origin = 'telefone'
      Required = True
      Size = 255
    end
    object tbSociobairro: TStringField
      FieldName = 'bairro'
      Origin = 'bairro'
      Required = True
      Size = 255
    end
    object tbSociorua: TStringField
      FieldName = 'rua'
      Origin = 'rua'
      Required = True
      Size = 255
    end
    object tbSocionumero: TStringField
      FieldName = 'numero'
      Origin = 'numero'
      Required = True
      Size = 255
    end
  end
  object REQuery: TDataSource
    DataSet = tbSocio
    Left = 304
    Top = 184
  end
  object FDQuery1: TFDQuery
    Connection = Conexao
    Left = 288
    Top = 88
  end
  object FDQuery2: TFDQuery
    Connection = Conexao
    Left = 296
    Top = 144
  end
end
