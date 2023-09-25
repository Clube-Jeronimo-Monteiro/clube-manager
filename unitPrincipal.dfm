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
      object Label1: TLabel
        Left = 336
        Top = 3
        Width = 89
        Height = 15
        Caption = 'Intervalo de Data'
      end
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
        OnTitleClick = DBGrid1TitleClick
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
            Width = 173
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'valor'
            Title.Alignment = taCenter
            Title.Caption = 'Valor Mensalidade'
            Width = 157
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'valorpago'
            Title.Alignment = taCenter
            Title.Caption = 'Valor Pago'
            Width = 138
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'datavencimento'
            Title.Alignment = taCenter
            Title.Caption = 'Data de Vencimento'
            Width = 119
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'status'
            Title.Alignment = taCenter
            Title.Caption = 'Pagamento'
            Width = 201
            Visible = True
          end>
      end
      object Button1: TButton
        Left = 16
        Top = 24
        Width = 297
        Height = 33
        Caption = 'Gerar Mensalidades'
        TabOrder = 1
        OnClick = Button1Click
      end
      object dateInterval: TDateTimePicker
        Left = 336
        Top = 24
        Width = 209
        Height = 33
        Date = 45192.000000000000000000
        Time = 0.391853078705025800
        ImeName = 'Portuguese (Brazilian ABNT)'
        TabOrder = 2
        OnCloseUp = dateIntervalCloseUp
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
    Left = 744
    Top = 32
  end
  object FDTableMensalidade: TFDTable
    IndexFieldNames = 'id'
    Connection = dbConnection
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    CatalogName = 'clube-dev'
    TableName = 'mensalidade'
    Left = 604
    Top = 34
  end
  object DSMensalidade: TDataSource
    DataSet = FDQuery1
    Left = 848
    Top = 32
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = dbConnection
    SQL.Strings = (
      
        'SELECT * FROM `socio` JOIN `mensalidade` ON `socioid` =  `codSoc' +
        'io`')
    Left = 756
    Top = 82
  end
  object FDQuery2: TFDQuery
    Active = True
    MasterSource = DSMensalidade
    Connection = dbConnection
    SQL.Strings = (
      
        'SELECT * FROM `socio` JOIN `mensalidade` ON `socioid` =  socio.i' +
        'd')
    Left = 700
    Top = 74
  end
  object FDTable1: TFDTable
    Connection = dbConnection
    TableName = 'mensalidade'
    Left = 668
    Top = 74
  end
  object DSTabelaMensalidade: TDataSource
    DataSet = FDQuery2
    Left = 880
    Top = 32
  end
  object GerarMensalidade: TFDQuery
    Connection = dbConnection
    SQL.Strings = (
      'INSERT INTO mensalidade (socioid, datavencimento, valor, status)'
      'SELECT s.id, '
      
        '       DATE_ADD(DATE_ADD(LAST_DAY(CURRENT_DATE), INTERVAL 1 DAY)' +
        ', INTERVAL -1 MONTH) AS datavencimento,'
      '       80, '
      '       '#39'pendente'#39
      'FROM socio AS s'
      'WHERE NOT EXISTS ('
      '    SELECT 1'
      '    FROM mensalidade AS m'
      '    WHERE m.socioid = s.id'
      
        '    AND EXTRACT(YEAR_MONTH FROM m.datavencimento) = EXTRACT(YEAR' +
        '_MONTH FROM CURRENT_DATE)'
      ');'
      '')
    Left = 612
    Top = 82
  end
end
