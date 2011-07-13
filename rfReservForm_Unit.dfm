object ReservForm: TReservForm
  Left = 0
  Top = 0
  Caption = #1041#1088#1086#1085#1080#1088#1086#1074#1072#1085#1080#1077
  ClientHeight = 456
  ClientWidth = 759
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TAdvPanel
    Left = 0
    Top = 0
    Width = 759
    Height = 456
    Align = alClient
    BevelOuter = bvNone
    Color = 16640730
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    UseDockManager = True
    Version = '2.0.1.0'
    BorderColor = clGray
    Caption.Color = 14059353
    Caption.ColorTo = 9648131
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWhite
    Caption.Font.Height = -11
    Caption.Font.Name = 'MS Sans Serif'
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    Caption.Indent = 2
    Caption.ShadeLight = 255
    CollapsColor = clNone
    CollapsDelay = 0
    ColorTo = 14986888
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = clNone
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWhite
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Color = 14716773
    StatusBar.ColorTo = 16374724
    StatusBar.GradientDirection = gdVertical
    Styler = FrontData.FrontPanelStyler
    ExplicitLeft = 136
    ExplicitTop = 80
    ExplicitWidth = 185
    ExplicitHeight = 41
    FullHeight = 0
    object Label1: TLabel
      Left = 16
      Top = 5
      Width = 67
      Height = 24
      Caption = #1053#1086#1084#1077#1088':'
      Color = clNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 16
      Top = 77
      Width = 189
      Height = 24
      Caption = #1044#1072#1090#1072' '#1073#1088#1086#1085#1080#1088#1086#1074#1072#1085#1080#1103':'
      Color = clNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object btnOK: TAdvSmoothButton
      Left = 645
      Top = 10
      Width = 107
      Height = 37
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWindowText
      Appearance.Font.Height = -13
      Appearance.Font.Name = 'Times New Roman'
      Appearance.Font.Style = [fsBold]
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 0
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      Bevel = False
      Color = 15195349
      ParentFont = False
      TabOrder = 0
      Version = '1.6.9.0'
    end
    object btnCancel: TAdvSmoothButton
      Left = 645
      Top = 59
      Width = 107
      Height = 37
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWindowText
      Appearance.Font.Height = -13
      Appearance.Font.Name = 'Times New Roman'
      Appearance.Font.Style = [fsBold]
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 0
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      Bevel = False
      Caption = #1054#1090#1084#1077#1085#1072
      Color = 15195349
      ParentFont = False
      TabOrder = 1
      Version = '1.6.9.0'
      ModalResult = 2
    end
    object dbeNumber: TDBEdit
      Left = 16
      Top = 35
      Width = 160
      Height = 31
      DataField = 'USR$DOCUMENTNUMBER'
      DataSource = dsMain
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Times New Roman'
      Font.Style = []
      MaxLength = 20
      ParentFont = False
      TabOrder = 2
    end
    object AdvTouchKeyBoard: TAdvSmoothTouchKeyBoard
      Left = 16
      Top = 246
      Width = 602
      Height = 202
      AutoCompletion.Font.Charset = DEFAULT_CHARSET
      AutoCompletion.Font.Color = clWhite
      AutoCompletion.Font.Height = -19
      AutoCompletion.Font.Name = 'Tahoma'
      AutoCompletion.Font.Style = []
      AutoCompletion.Color = clBlack
      Fill.ColorMirror = clNone
      Fill.ColorMirrorTo = clNone
      Fill.BorderColor = clNone
      Fill.Rounding = 0
      Fill.ShadowOffset = 0
      KeyboardType = ktRUSSIAN
      Keys = <
        item
          Caption = 'ESC'
          ShiftCaption = '~'
          KeyValue = 27
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 1
          Y = 1
          SubKeys = <>
        end
        item
          Caption = '1'
          ShiftCaption = '!'
          AltGrCaption = '|'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 41
          Y = 1
          SubKeys = <>
        end
        item
          Caption = '2'
          ShiftCaption = '@'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 81
          Y = 1
          SubKeys = <>
        end
        item
          Caption = '3'
          ShiftCaption = '#'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 121
          Y = 1
          SubKeys = <>
        end
        item
          Caption = '4'
          ShiftCaption = '$'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 161
          Y = 1
          SubKeys = <>
        end
        item
          Caption = '5'
          ShiftCaption = '%'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 201
          Y = 1
          SubKeys = <>
        end
        item
          Caption = '6'
          ShiftCaption = '^'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 241
          Y = 1
          SubKeys = <>
        end
        item
          Caption = '7'
          ShiftCaption = '&'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 281
          Y = 1
          SubKeys = <>
        end
        item
          Caption = '8'
          ShiftCaption = '*'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 321
          Y = 1
          SubKeys = <>
        end
        item
          Caption = '9'
          ShiftCaption = '('
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 361
          Y = 1
          SubKeys = <>
        end
        item
          Caption = '0'
          ShiftCaption = ')'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 401
          Y = 1
          SubKeys = <>
        end
        item
          Caption = '-'
          ShiftCaption = '_'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 441
          Y = 1
          SubKeys = <>
        end
        item
          Caption = '='
          ShiftCaption = '+'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 481
          Y = 1
          SubKeys = <>
        end
        item
          Caption = '\'
          ShiftCaption = '|'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 521
          Y = 1
          SubKeys = <>
        end
        item
          Caption = 'Back'
          KeyValue = 8
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skBackSpace
          Color = 10526880
          X = 561
          Y = 1
          SubKeys = <>
        end
        item
          Caption = '->'
          ShiftCaption = '<-'
          KeyValue = 9
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skTab
          Color = 10526880
          X = 1
          Y = 41
          Width = 60
          SubKeys = <>
        end
        item
          Caption = #1049
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 61
          Y = 41
          SubKeys = <>
        end
        item
          Caption = #1062
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 101
          Y = 41
          SubKeys = <>
        end
        item
          Caption = #1059
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 141
          Y = 41
          SubKeys = <>
        end
        item
          Caption = #1050
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 181
          Y = 41
          SubKeys = <>
        end
        item
          Caption = #1045
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 221
          Y = 41
          SubKeys = <>
        end
        item
          Caption = #1053
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 261
          Y = 41
          SubKeys = <>
        end
        item
          Caption = #1043
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 301
          Y = 41
          SubKeys = <>
        end
        item
          Caption = #1064
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 341
          Y = 41
          SubKeys = <>
        end
        item
          Caption = #1065
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 381
          Y = 41
          SubKeys = <>
        end
        item
          Caption = #1047
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 421
          Y = 41
          SubKeys = <>
        end
        item
          Caption = #1061
          ShiftCaption = '{'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 461
          Y = 41
          SubKeys = <>
        end
        item
          Caption = #1066
          ShiftCaption = '}'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 501
          Y = 41
          SubKeys = <>
        end
        item
          Caption = 'Enter'
          KeyValue = 13
          ShiftKeyValue = 0
          AltGrKeyValue = 0
          SpecialKey = skReturn
          Color = 10526880
          X = 551
          Y = 41
          Height = 80
          Width = 50
          SubKeys = <>
        end
        item
          Caption = 'Caps Lock'
          KeyValue = 20
          ShiftKeyValue = 0
          AltGrKeyValue = 0
          SpecialKey = skCaps
          Color = 10526880
          X = 1
          Y = 81
          Width = 70
          SubKeys = <>
        end
        item
          Caption = #1060
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 71
          Y = 81
          SubKeys = <>
        end
        item
          Caption = #1067
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 111
          Y = 81
          SubKeys = <>
        end
        item
          Caption = #1042
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 151
          Y = 81
          SubKeys = <>
        end
        item
          Caption = #1040
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 191
          Y = 81
          SubKeys = <>
        end
        item
          Caption = #1055
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 231
          Y = 81
          SubKeys = <>
        end
        item
          Caption = #1056
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 271
          Y = 81
          SubKeys = <>
        end
        item
          Caption = #1054
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 311
          Y = 81
          SubKeys = <>
        end
        item
          Caption = #1051
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 351
          Y = 81
          SubKeys = <>
        end
        item
          Caption = #1044
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 391
          Y = 81
          SubKeys = <>
        end
        item
          Caption = #1046
          ShiftCaption = ':'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 431
          Y = 81
          SubKeys = <>
        end
        item
          Caption = #1069
          ShiftCaption = '"'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 471
          Y = 81
          SubKeys = <>
        end
        item
          Caption = 'Shift'
          KeyValue = 160
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skShift
          Color = 10526880
          X = 1
          Y = 121
          Width = 80
          SubKeys = <>
        end
        item
          Caption = #1071
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 81
          Y = 121
          SubKeys = <>
        end
        item
          Caption = #1063
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 121
          Y = 121
          SubKeys = <>
        end
        item
          Caption = #1057
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 161
          Y = 121
          SubKeys = <>
        end
        item
          Caption = #1052
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 201
          Y = 121
          SubKeys = <>
        end
        item
          Caption = #1048
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 241
          Y = 121
          SubKeys = <>
        end
        item
          Caption = #1058
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 281
          Y = 121
          SubKeys = <>
        end
        item
          Caption = #1068
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 321
          Y = 121
          SubKeys = <>
        end
        item
          Caption = #1041
          ShiftCaption = '<'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 361
          Y = 121
          SubKeys = <>
        end
        item
          Caption = #1070
          ShiftCaption = '>'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 401
          Y = 121
          SubKeys = <>
        end
        item
          Caption = '/'
          ShiftCaption = '?'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 441
          Y = 121
          SubKeys = <>
        end
        item
          Caption = 'Shift'
          KeyValue = 161
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skShift
          Color = 10526880
          X = 481
          Y = 121
          Width = 110
          SubKeys = <>
        end
        item
          Caption = 'Ctrl'
          KeyValue = 162
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skCtrl
          Color = 10526880
          X = 1
          Y = 161
          Width = 60
          SubKeys = <>
        end
        item
          Caption = 'Win'
          KeyValue = 91
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skWin
          Color = 10526880
          X = 61
          Y = 161
          SubKeys = <>
        end
        item
          Caption = 'Alt'
          KeyValue = 18
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skAlt
          Color = 10526880
          X = 101
          Y = 161
          Width = 60
          SubKeys = <>
        end
        item
          KeyValue = 32
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skSpaceBar
          X = 161
          Y = 161
          Width = 240
          SubKeys = <>
        end
        item
          Caption = 'Alt Gr'
          KeyValue = 0
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skAltGr
          Color = 10526880
          X = 401
          Y = 161
          Width = 60
          SubKeys = <>
        end
        item
          Caption = 'Win'
          KeyValue = 92
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skWin
          Color = 10526880
          X = 461
          Y = 161
          SubKeys = <>
        end
        item
          Caption = 'Menu'
          KeyValue = 93
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skApp
          Color = 10526880
          X = 501
          Y = 161
          SubKeys = <>
        end
        item
          Caption = '->'
          KeyValue = 39
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skRight
          Color = 10526880
          X = 541
          Y = 161
          Width = 60
          SubKeys = <>
        end>
      SmallFont.Charset = DEFAULT_CHARSET
      SmallFont.Color = clWindowText
      SmallFont.Height = -9
      SmallFont.Name = 'Tahoma'
      SmallFont.Style = []
      Version = '1.5.0.0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 107
      Width = 160
      Height = 31
      DataField = 'USR$DOCUMENTDATE'
      DataSource = dsMain
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Times New Roman'
      Font.Style = []
      MaxLength = 20
      ParentFont = False
      TabOrder = 4
    end
  end
  object MainTable: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    Version = '6.30'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 424
    Top = 168
  end
  object dsMain: TDataSource
    DataSet = MainTable
    Left = 480
    Top = 168
  end
end
