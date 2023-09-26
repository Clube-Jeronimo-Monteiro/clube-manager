object Form2: TForm2
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cadastro de Socio'
  ClientHeight = 409
  ClientWidth = 339
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
    Width = 323
    Height = 393
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 16
      Top = 8
      Width = 281
      Height = 132
      Caption = 'Dados Socio'
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 26
        Width = 89
        Height = 15
        Caption = 'Nome Completo'
      end
      object Label5: TLabel
        Left = 16
        Top = 76
        Width = 76
        Height = 15
        Caption = 'Numero Socio'
      end
      object Label6: TLabel
        Left = 143
        Top = 26
        Width = 44
        Height = 15
        Caption = 'Telefone'
      end
      object EDName: TEdit
        Left = 16
        Top = 47
        Width = 121
        Height = 23
        ImeName = 'US'
        TabOrder = 0
        OnKeyPress = EDNameKeyPress
      end
      object EDCodSocio: TEdit
        Left = 16
        Top = 97
        Width = 121
        Height = 23
        NumbersOnly = True
        TabOrder = 1
      end
      object EDTelefone: TEdit
        Left = 143
        Top = 47
        Width = 121
        Height = 23
        ImeName = 'US'
        NumbersOnly = True
        TabOrder = 2
      end
    end
    object Button1: TButton
      Left = 16
      Top = 337
      Width = 281
      Height = 33
      Caption = 'Cadastrar'
      TabOrder = 1
      OnClick = Button1Click
    end
    object GroupBox2: TGroupBox
      Left = 16
      Top = 146
      Width = 281
      Height = 175
      Caption = 'Endere'#231'o'
      TabOrder = 2
      object Label2: TLabel
        Left = 16
        Top = 18
        Width = 31
        Height = 15
        Caption = 'Bairro'
      end
      object Label3: TLabel
        Left = 16
        Top = 66
        Width = 20
        Height = 15
        Caption = 'Rua'
      end
      object Label4: TLabel
        Left = 16
        Top = 114
        Width = 44
        Height = 15
        Caption = 'Numero'
      end
      object EDBairro: TEdit
        Left = 16
        Top = 37
        Width = 249
        Height = 23
        TabOrder = 0
      end
      object EDRua: TEdit
        Left = 16
        Top = 85
        Width = 249
        Height = 23
        ImeName = 'Portuguese (Brazilian ABNT)'
        TabOrder = 1
      end
      object EDNumero: TEdit
        Left = 16
        Top = 135
        Width = 249
        Height = 23
        ImeName = 'Portuguese (Brazilian ABNT)'
        TabOrder = 2
      end
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
    Left = 312
    Top = 288
  end
  object tbSocio: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = Conexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    CatalogName = 'clube-dev'
    TableName = '`clube-dev`.socio'
    Left = 304
    Top = 384
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
  object dsSocio: TDataSource
    DataSet = tbSocio
    Left = 312
    Top = 320
  end
  object FDQuery1: TFDQuery
    Connection = Conexao
    Left = 311
    Top = 352
  end
  object GerarExame: TFDQuery
    Active = True
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM socio')
    Left = 272
    Top = 384
  end
  object FDMensalidade: TFDQuery
    ChangeAlertName = 'FDMensalidade'
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM socio')
    Left = 239
    Top = 384
  end
end
