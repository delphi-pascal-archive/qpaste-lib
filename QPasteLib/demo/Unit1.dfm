object Form1: TForm1
  Left = 212
  Top = 126
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'QPasteLib'
  ClientHeight = 602
  ClientWidth = 809
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object SpeedButton1: TSpeedButton
    Left = 160
    Top = 8
    Width = 73
    Height = 25
    Caption = #1053#1072#1081#1090#1080
    OnClick = SpeedButton1Click
  end
  object lib_context: TListBox
    Left = 8
    Top = 240
    Width = 225
    Height = 353
    ItemHeight = 16
    TabOrder = 0
    OnClick = lib_contextClick
  end
  object lib_list: TListBox
    Left = 8
    Top = 40
    Width = 225
    Height = 193
    ItemHeight = 16
    TabOrder = 1
    OnClick = lib_listClick
  end
  object editor: TMemo
    Left = 240
    Top = 8
    Width = 561
    Height = 585
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object path: TEdit
    Left = 8
    Top = 8
    Width = 145
    Height = 25
    TabOrder = 3
    Text = 'libs\'
  end
end
