object DM: TDM
  Height = 480
  Width = 640
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=clube-dev'
      'User_Name=academia-api'
      'Password=6414'
      'Server=127.0.0.1'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 184
    Top = 40
  end
  object tbSocio: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = Conexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    CatalogName = 'clube-dev'
    TableName = '`clube-dev`.socio'
    Left = 184
    Top = 120
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
    Left = 184
    Top = 240
  end
  object FDQuery1: TFDQuery
    Connection = Conexao
    Left = 408
    Top = 280
  end
end
