object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 550
  ClientWidth = 901
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Terminal: TMemo
    Left = 256
    Top = 0
    Width = 645
    Height = 550
    Align = alRight
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object btnEntrandoNoEscopo: TButton
    Left = 24
    Top = 16
    Width = 129
    Height = 25
    Caption = 'Entrando no Escopo'
    TabOrder = 1
    OnClick = btnEntrandoNoEscopoClick
  end
  object btnTestarSoma: TButton
    Left = 24
    Top = 47
    Width = 129
    Height = 25
    Caption = 'Testar soma'
    TabOrder = 2
    OnClick = btnTestarSomaClick
  end
  object Button1: TButton
    Left = 24
    Top = 78
    Width = 129
    Height = 25
    Caption = 'Testar soma (com create)'
    TabOrder = 3
    OnClick = Button1Click
  end
  object btnPassarObjParametro: TButton
    Left = 24
    Top = 109
    Width = 129
    Height = 25
    Caption = 'Passando obj param'
    TabOrder = 4
    OnClick = btnPassarObjParametroClick
  end
  object Button2: TButton
    Left = 24
    Top = 280
    Width = 193
    Height = 25
    Caption = 'Nullable as Object'
    TabOrder = 5
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 24
    Top = 311
    Width = 193
    Height = 25
    Caption = 'Copia mem'#243'ria?'
    TabOrder = 6
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 24
    Top = 342
    Width = 193
    Height = 25
    Caption = 'Copiar string'
    TabOrder = 7
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 24
    Top = 140
    Width = 129
    Height = 25
    Caption = 'Objeto x Record'
    TabOrder = 8
    OnClick = Button5Click
  end
end
