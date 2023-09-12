object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Clube Campestre Manager'
  ClientHeight = 808
  ClientWidth = 1280
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  TextHeight = 15
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 1264
    Height = 752
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Mensalidades'
      object DBGrid1: TDBGrid
        Left = 3
        Top = 80
        Width = 1250
        Height = 639
        DataSource = DSMensalidade
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'socioid'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'datapagamento'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valorpago'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'datavencimento'
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Exames de Pele'
      ImageIndex = 1
    end
  end
  object MainMenu1: TMainMenu
    Left = 324
    Top = 66
    object Cadastrar1: TMenuItem
      Caption = 'Cadastrar'
      object Socio1: TMenuItem
        Caption = 'Socio'
        OnClick = Socio1Click
      end
      object Socio2: TMenuItem
        Caption = 'Dependente'
        OnClick = Socio2Click
      end
    end
    object Editar1: TMenuItem
      Caption = 'Editar'
      object Socio3: TMenuItem
        Caption = 'Socio'
        OnClick = Socio3Click
      end
      object Dependente1: TMenuItem
        Caption = 'Dependente'
      end
    end
  end
  object dbConnection: TFDConnection
    Params.Strings = (
      'Database=clube-dev'
      'User_Name=academia-api'
      'Password=6414'
      'Server=127.0.0.1'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 480
    Top = 32
  end
  object FDTableMensalidade: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = dbConnection
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    CatalogName = 'clube-dev'
    TableName = 'mensalidade'
    Left = 580
    Top = 34
  end
  object DSMensalidade: TDataSource
    DataSet = FDTableMensalidade
    Left = 704
    Top = 48
  end
end
