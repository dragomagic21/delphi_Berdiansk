object fTxt: TfTxt
  Left = 192
  Top = 103
  Width = 463
  Height = 164
  AutoSize = True
  BorderIcons = []
  Caption = #1053#1072#1087#1086#1084#1080#1085#1072#1085#1080#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 0
    Width = 52
    Height = 13
    Caption = #1053#1072#1079#1085#1072#1095#1080#1083':'
  end
  object LDirec: TLabel
    Left = 72
    Top = 0
    Width = 31
    Height = 13
    Caption = 'LDirec'
  end
  object Bevel1: TBevel
    Left = 260
    Top = 0
    Width = 15
    Height = 137
    Shape = bsLeftLine
  end
  object Label2: TLabel
    Left = 20
    Top = 16
    Width = 39
    Height = 13
    Caption = #1050#1083#1080#1077#1085#1090':'
  end
  object LClient: TLabel
    Left = 72
    Top = 16
    Width = 32
    Height = 13
    Caption = 'LClient'
  end
  object eMsg: TMemo
    Left = 0
    Top = 32
    Width = 250
    Height = 74
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object bOk: TBitBtn
    Left = 0
    Top = 112
    Width = 90
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1077#1085#1086
    TabOrder = 1
    OnClick = bOkClick
    Kind = bkOK
  end
  object bCancel: TBitBtn
    Left = 158
    Top = 112
    Width = 90
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100
    TabOrder = 2
    OnClick = bCancelClick
    Kind = bkCancel
  end
  object bIgnore: TBitBtn
    Left = 270
    Top = 112
    Width = 185
    Height = 25
    Caption = #1054#1090#1083#1086#1078#1080#1090#1100
    TabOrder = 3
    OnClick = bIgnoreClick
    Kind = bkIgnore
  end
  object rgRep: TRadioGroup
    Left = 270
    Top = 2
    Width = 185
    Height = 105
    Caption = #1054#1090#1083#1086#1078#1080#1090#1100' '#1085#1072
    ItemIndex = 0
    Items.Strings = (
      ' '
      ' '
      ' ')
    TabOrder = 4
  end
  object eData: TDateTimePicker
    Left = 295
    Top = 72
    Width = 81
    Height = 21
    CalAlignment = dtaLeft
    Date = 39777.6681790625
    Time = 39777.6681790625
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 5
  end
  object cbM: TComboBox
    Left = 295
    Top = 20
    Width = 150
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 6
    Text = '5 '#1084#1080#1085
    Items.Strings = (
      '5 '#1084#1080#1085
      '10 '#1084#1080#1085
      '15 '#1084#1080#1085
      '20 '#1084#1080#1085
      '30 '#1084#1080#1085
      '1 '#1095#1072#1089
      '2 '#1095#1072#1089#1072
      '3 '#1095#1072#1089#1072
      '5 '#1095#1072#1089#1086#1074)
  end
  object cbD: TComboBox
    Left = 295
    Top = 45
    Width = 150
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 7
    Text = '1 '#1076#1077#1085#1100
    Items.Strings = (
      '1 '#1076#1077#1085#1100
      '2 '#1076#1085#1103
      '3 '#1076#1085#1103
      '5 '#1076#1085#1077#1081
      '1 '#1085#1077#1076#1077#1083#1102
      '2 '#1085#1077#1076#1077#1083#1080
      '3 '#1085#1077#1076#1077#1083#1080
      '1 '#1084#1077#1089#1103#1094
      '2 '#1084#1077#1089#1103#1094#1072)
  end
  object eTime: TMaskEdit
    Left = 384
    Top = 72
    Width = 56
    Height = 21
    EditMask = '!90:00;1;_'
    MaxLength = 5
    TabOrder = 8
    Text = '  :  '
  end
  object Timer1: TTimer
    Interval = 30000
    OnTimer = Timer1Timer
    Left = 224
  end
end
