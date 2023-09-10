object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Edi'#231#227'o de S'#243'cio'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object DBGrid1: TDBGrid
    Left = 8
    Top = 168
    Width = 612
    Height = 266
    DataSource = dsSocio
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Width = 220
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'codSocio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'telefone'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bairro'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rua'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'numero'
        Width = 50
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 185
    Height = 154
    Caption = 'Dados B'#225'sicos'
    TabOrder = 1
    object Label4: TLabel
      Left = 16
      Top = 18
      Width = 33
      Height = 15
      Caption = 'Nome'
    end
    object Label5: TLabel
      Left = 16
      Top = 103
      Width = 44
      Height = 15
      Caption = 'Telefone'
    end
    object Label6: TLabel
      Left = 16
      Top = 62
      Width = 39
      Height = 15
      Caption = 'Codigo'
    end
    object EDCode: TEdit
      Left = 16
      Top = 80
      Width = 153
      Height = 23
      ImeName = 'Portuguese (Brazilian ABNT)'
      TabOrder = 0
    end
    object EDName: TEdit
      Left = 16
      Top = 35
      Width = 153
      Height = 23
      ImeName = 'Portuguese (Brazilian ABNT)'
      TabOrder = 1
    end
    object EDTelefone: TEdit
      Left = 16
      Top = 120
      Width = 153
      Height = 23
      ImeName = 'US'
      TabOrder = 2
    end
  end
  object GroupBox3: TGroupBox
    Left = 211
    Top = 8
    Width = 270
    Height = 115
    Caption = 'Dados de Endere'#231'o'
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 18
      Width = 20
      Height = 15
      Caption = 'Rua'
    end
    object Label2: TLabel
      Left = 8
      Top = 64
      Width = 31
      Height = 15
      Caption = 'Bairro'
    end
    object Label3: TLabel
      Left = 142
      Top = 65
      Width = 44
      Height = 15
      Caption = 'Numero'
    end
    object EDRua: TEdit
      Left = 8
      Top = 39
      Width = 121
      Height = 23
      ImeName = 'Portuguese (Brazilian ABNT)'
      TabOrder = 0
    end
    object EDBairro: TEdit
      Left = 8
      Top = 85
      Width = 121
      Height = 23
      ImeName = 'Portuguese (Brazilian ABNT)'
      TabOrder = 1
    end
    object EDNumero: TEdit
      Left = 142
      Top = 85
      Width = 121
      Height = 23
      ImeName = 'EDNumero'
      TabOrder = 2
    end
  end
  object Button3: TButton
    Left = 487
    Top = 72
    Width = 133
    Height = 51
    Caption = 'Salvar'
    TabOrder = 3
  end
  object Button1: TButton
    Left = 488
    Top = 15
    Width = 133
    Height = 51
    Caption = 'Remover'
    TabOrder = 4
    OnClick = Button1Click
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=clube-dev'
      'User_Name=academia-api'
      'Password=6414'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 400
    Top = 240
  end
  object FDTable1: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    CatalogName = 'clube-dev'
    TableName = 'socio'
    Left = 448
    Top = 320
  end
  object dsSocio: TDataSource
    AutoEdit = False
    DataSet = FDTable1
    Left = 488
    Top = 264
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 496
    Top = 184
  end
end
