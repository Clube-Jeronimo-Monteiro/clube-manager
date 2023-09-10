object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Da'
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
    Top = 128
    Width = 612
    Height = 306
    DataSource = dsSocio
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
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
    Height = 114
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
      Top = 64
      Width = 39
      Height = 15
      Caption = 'Codigo'
    end
    object Edit2: TEdit
      Left = 16
      Top = 80
      Width = 153
      Height = 23
      TabOrder = 0
      Text = 'Edit1'
    end
    object Edit1: TEdit
      Left = 16
      Top = 35
      Width = 153
      Height = 23
      TabOrder = 1
      Text = 'Edit1'
    end
  end
  object GroupBox3: TGroupBox
    Left = 211
    Top = 8
    Width = 390
    Height = 81
    Caption = 'Dados de Endere'#231'o'
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 22
      Width = 20
      Height = 15
      Caption = 'Rua'
    end
    object Label2: TLabel
      Left = 135
      Top = 22
      Width = 31
      Height = 15
      Caption = 'Bairro'
    end
    object Label3: TLabel
      Left = 262
      Top = 22
      Width = 44
      Height = 15
      Caption = 'Numero'
    end
    object Edit5: TEdit
      Left = 8
      Top = 43
      Width = 121
      Height = 23
      TabOrder = 0
      Text = 'Edit1'
    end
    object Edit6: TEdit
      Left = 135
      Top = 43
      Width = 121
      Height = 23
      TabOrder = 1
      Text = 'Edit1'
    end
  end
  object Edit3: TEdit
    Left = 473
    Top = 51
    Width = 121
    Height = 23
    TabOrder = 3
    Text = 'Edit1'
  end
  object Button3: TButton
    Left = 408
    Top = 95
    Width = 193
    Height = 25
    Caption = 'Salvar'
    TabOrder = 4
  end
  object Button1: TButton
    Left = 211
    Top = 95
    Width = 182
    Height = 25
    Caption = 'Remover'
    TabOrder = 5
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
end
