object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Clube Campestre Manager'
  ClientHeight = 788
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
        DataSource = DSTabelaMensalidade
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid1DrawColumnCell
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'nome'
            ImeName = 'Portuguese (Brazilian ABNT)'
            Title.Alignment = taCenter
            Title.Caption = 'Socio'
            Width = 300
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'telefone'
            Title.Alignment = taCenter
            Title.Caption = 'Telefone'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'id_1'
            Visible = False
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'datapagamento'
            Title.Alignment = taCenter
            Title.Caption = 'Data de Pagamento'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'valor'
            Title.Alignment = taCenter
            Title.Caption = 'Valor Mensalidade'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'valorpago'
            Title.Alignment = taCenter
            Title.Caption = 'Valor Pago'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'datavencimento'
            Title.Alignment = taCenter
            Title.Caption = 'Data de Vencimento'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'status'
            Title.Alignment = taCenter
            Title.Caption = 'Pagamento'
            Width = 100
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
    Left = 36
    Top = 58
    object Cadastrar1: TMenuItem
      Caption = 'Cadastrar'
      object Socio1: TMenuItem
        Caption = 'Socio'
      end
      object Socio2: TMenuItem
        Caption = 'Dependente'
      end
    end
    object Editar1: TMenuItem
      Caption = 'Editar'
      object Socio3: TMenuItem
        Caption = 'Socio'
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
    Left = 616
    Top = 232
  end
  object FDTableMensalidade: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = dbConnection
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    CatalogName = 'clube-dev'
    TableName = 'mensalidade'
    Left = 508
    Top = 242
  end
  object DSMensalidade: TDataSource
    DataSet = FDQuery1
    Left = 712
    Top = 232
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = dbConnection
    SQL.Strings = (
      
        'SELECT * FROM `socio` JOIN `mensalidade` ON `socioid` =  `codSoc' +
        'io`')
    Left = 172
    Top = 242
  end
  object FDQuery2: TFDQuery
    Active = True
    MasterSource = DSMensalidade
    Connection = dbConnection
    SQL.Strings = (
      
        'SELECT * FROM `socio` JOIN `mensalidade` ON `socioid` =  `codSoc' +
        'io`')
    Left = 108
    Top = 242
  end
  object FDTable1: TFDTable
    Connection = dbConnection
    TableName = 'mensalidade'
    Left = 332
    Top = 202
  end
  object DSTabelaMensalidade: TDataSource
    DataSet = FDQuery2
    Left = 712
    Top = 288
  end
end
