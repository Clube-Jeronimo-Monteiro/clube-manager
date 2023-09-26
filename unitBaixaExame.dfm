object Form6: TForm6
  Left = 0
  Top = 0
  Caption = 'Controle de Exame'
  ClientHeight = 227
  ClientWidth = 225
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Button1: TButton
    Left = 8
    Top = 167
    Width = 209
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 0
  end
  object Button2: TButton
    Left = 8
    Top = 198
    Width = 209
    Height = 25
    Caption = 'Entregar'
    TabOrder = 1
    OnClick = Button2Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 209
    Height = 145
    Caption = 'Data'
    TabOrder = 2
    object TLabel
      Left = 13
      Top = 25
      Width = 106
      Height = 15
      Caption = 'Data de Vencimento'
    end
    object Label4: TLabel
      Left = 13
      Top = 83
      Width = 83
      Height = 15
      Caption = 'Data de Entrega'
    end
    object DateTimePicker1: TDateTimePicker
      Left = 13
      Top = 46
      Width = 185
      Height = 23
      Date = 45188.000000000000000000
      Time = 0.919980231483350500
      TabOrder = 0
    end
    object DateTimePicker2: TDateTimePicker
      Left = 13
      Top = 104
      Width = 185
      Height = 23
      Date = 45188.000000000000000000
      Time = 0.919980231483350500
      TabOrder = 1
    end
  end
end
