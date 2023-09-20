object Form5: TForm5
  Left = 0
  Top = 0
  Caption = 'Form5'
  ClientHeight = 234
  ClientWidth = 452
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 209
    Height = 145
    Caption = 'Data'
    TabOrder = 0
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
      Width = 104
      Height = 15
      Caption = 'Data de Pagamento'
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
  object Button1: TButton
    Left = 8
    Top = 167
    Width = 432
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 198
    Width = 432
    Height = 25
    Caption = 'Pagar'
    TabOrder = 2
    OnClick = Button2Click
  end
  object GroupBox2: TGroupBox
    Left = 223
    Top = 8
    Width = 217
    Height = 145
    Caption = 'Pagamento'
    TabOrder = 3
    object Label1: TLabel
      Left = 16
      Top = 25
      Width = 67
      Height = 15
      Caption = 'Mensalidade'
    end
    object Label2: TLabel
      Left = 16
      Top = 83
      Width = 56
      Height = 15
      Caption = 'Valor Pago'
    end
    object Edit1: TEdit
      Left = 16
      Top = 104
      Width = 185
      Height = 23
      TabOrder = 0
      Text = 'Edit1'
    end
    object Edit2: TEdit
      Left = 16
      Top = 48
      Width = 185
      Height = 23
      TabOrder = 1
      Text = 'Edit1'
    end
  end
end
