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
    ActivePage = TabSheet2
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Mensalidades'
    end
    object TabSheet2: TTabSheet
      Caption = 'Exames de Pele'
      ImageIndex = 1
    end
  end
  object MainMenu1: TMainMenu
    Left = 116
    Top = 122
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
  end
end
