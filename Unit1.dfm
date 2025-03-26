object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Vehicle Demo - is and as Operators'
  ClientHeight = 250
  ClientWidth = 400
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
  object LabelResult: TLabel
    Left = 40
    Top = 200
    Width = 300
    Height = 13
    Caption = 'Result: vehicle is not created'
  end
  object LabelExtra: TLabel
    Left = 40
    Top = 80
    Width = 150
    Height = 13
    Caption = 'Additionaly (doors/break):'
  end
  object EditName: TEdit
    Left = 40
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Enter name'
  end
  object EditExtra: TEdit
    Left = 200
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '4'
  end
  object ButtonCar: TButton
    Left = 200
    Top = 120
    Width = 100
    Height = 25
    Caption = 'Create car'
    TabOrder = 2
    OnClick = ButtonCarClick
  end
  object ButtonBicycle: TButton
    Left = 200
    Top = 160
    Width = 100
    Height = 25
    Caption = 'Create bicycle'
    TabOrder = 3
    OnClick = ButtonBicycleClick
  end
end