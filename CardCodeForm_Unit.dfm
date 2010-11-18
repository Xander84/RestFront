object CardCode: TCardCode
  Left = 471
  Top = 278
  BorderStyle = bsSingle
  Caption = #1042#1074#1086#1076' '#1087#1072#1088#1086#1083#1103
  ClientHeight = 280
  ClientWidth = 602
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object AdvPanel1: TAdvPanel
    Left = 0
    Top = 0
    Width = 602
    Height = 280
    Align = alClient
    BevelOuter = bvNone
    Color = 16640730
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
    FullHeight = 0
    object edPass: TEdit
      Left = 16
      Top = 19
      Width = 217
      Height = 32
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 0
      OnKeyPress = edPassKeyPress
    end
    object btnOK: TAdvSmoothButton
      Left = 245
      Top = 7
      Width = 76
      Height = 57
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
      Caption = #1054#1050
      Color = 15195349
      ParentFont = False
      TabOrder = 1
      Version = '1.6.9.0'
      OnClick = btnOKClick
    end
    object AdvSmoothTouchKeyBoard1: TAdvSmoothTouchKeyBoard
      Left = 16
      Top = 72
      Width = 577
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
      KeyboardType = ktQWERTY
      Keys = <
        item
          Caption = '`'
          ShiftCaption = '~'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 1
          Y = 1
          Width = 38
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
          X = 39
          Y = 1
          Width = 38
          SubKeys = <>
        end
        item
          Caption = '2'
          ShiftCaption = '@'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 78
          Y = 1
          Width = 38
          SubKeys = <>
        end
        item
          Caption = '3'
          ShiftCaption = '#'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 116
          Y = 1
          Width = 38
          SubKeys = <>
        end
        item
          Caption = '4'
          ShiftCaption = '$'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 154
          Y = 1
          Width = 38
          SubKeys = <>
        end
        item
          Caption = '5'
          ShiftCaption = '%'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 193
          Y = 1
          Width = 38
          SubKeys = <>
        end
        item
          Caption = '6'
          ShiftCaption = '^'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 231
          Y = 1
          Width = 38
          SubKeys = <>
        end
        item
          Caption = '7'
          ShiftCaption = '&'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 269
          Y = 1
          Width = 38
          SubKeys = <>
        end
        item
          Caption = '8'
          ShiftCaption = '*'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 308
          Y = 1
          Width = 38
          SubKeys = <>
        end
        item
          Caption = '9'
          ShiftCaption = '('
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 346
          Y = 1
          Width = 38
          SubKeys = <>
        end
        item
          Caption = '0'
          ShiftCaption = ')'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 384
          Y = 1
          Width = 38
          SubKeys = <>
        end
        item
          Caption = '-'
          ShiftCaption = '_'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 423
          Y = 1
          Width = 38
          SubKeys = <>
        end
        item
          Caption = '='
          ShiftCaption = '+'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 461
          Y = 1
          Width = 38
          SubKeys = <>
        end
        item
          Caption = '\'
          ShiftCaption = '|'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 499
          Y = 1
          Width = 38
          SubKeys = <>
        end
        item
          Caption = 'Back'
          KeyValue = 8
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skBackSpace
          Color = 10526880
          X = 538
          Y = 1
          Width = 38
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
          Width = 58
          SubKeys = <>
        end
        item
          Caption = 'Q'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 58
          Y = 41
          Width = 38
          SubKeys = <>
        end
        item
          Caption = 'W'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 97
          Y = 41
          Width = 38
          SubKeys = <>
        end
        item
          Caption = 'E'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 135
          Y = 41
          Width = 38
          SubKeys = <
            item
              Caption = #1051
            end
            item
              Caption = #1050
            end
            item
              Caption = #1049
            end
            item
              Caption = #1048
            end
            item
              Caption = #1083
            end
            item
              Caption = #1082
            end
            item
              Caption = #1081
            end
            item
              Caption = #1080
            end>
        end
        item
          Caption = 'R'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 173
          Y = 41
          Width = 38
          SubKeys = <>
        end
        item
          Caption = 'T'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 212
          Y = 41
          Width = 38
          SubKeys = <>
        end
        item
          Caption = 'Y'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 250
          Y = 41
          Width = 38
          SubKeys = <
            item
              Caption = #1103
            end
            item
              Caption = #1069
            end
            item
              Caption = #1101
            end>
        end
        item
          Caption = 'U'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 289
          Y = 41
          Width = 38
          SubKeys = <
            item
              Caption = #1068
            end
            item
              Caption = #1067
            end
            item
              Caption = #1066
            end
            item
              Caption = #1065
            end
            item
              Caption = #1100
            end
            item
              Caption = #1099
            end
            item
              Caption = #1098
            end
            item
              Caption = #1097
            end>
        end
        item
          Caption = 'I'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 327
          Y = 41
          Width = 38
          SubKeys = <
            item
              Caption = #1055
            end
            item
              Caption = #1054
            end
            item
              Caption = #1053
            end
            item
              Caption = #1052
            end
            item
              Caption = #1087
            end
            item
              Caption = #1086
            end
            item
              Caption = #1085
            end
            item
              Caption = #1084
            end>
        end
        item
          Caption = 'O'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 365
          Y = 41
          Width = 38
          SubKeys = <
            item
              Caption = #1062
            end
            item
              Caption = #1060
            end
            item
              Caption = #1059
            end
            item
              Caption = #1058
            end
            item
              Caption = #1094
            end
            item
              Caption = #1092
            end
            item
              Caption = #1091
            end
            item
              Caption = #1090
            end>
        end
        item
          Caption = 'P'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 404
          Y = 41
          Width = 38
          SubKeys = <>
        end
        item
          Caption = '['
          ShiftCaption = '{'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 442
          Y = 41
          Width = 38
          SubKeys = <>
        end
        item
          Caption = ']'
          ShiftCaption = '}'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 480
          Y = 41
          Width = 38
          SubKeys = <>
        end
        item
          Caption = 'Enter'
          KeyValue = 13
          ShiftKeyValue = 0
          AltGrKeyValue = 0
          SpecialKey = skReturn
          Color = 10526880
          X = 528
          Y = 41
          Height = 80
          Width = 48
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
          Width = 67
          SubKeys = <>
        end
        item
          Caption = 'A'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 68
          Y = 81
          Width = 38
          SubKeys = <
            item
              Caption = #1044
            end
            item
              Caption = #1042
            end
            item
              Caption = #1041
            end
            item
              Caption = #1040
            end
            item
              Caption = #1076
            end
            item
              Caption = #1074
            end
            item
              Caption = #1073
            end
            item
              Caption = #1072
            end>
        end
        item
          Caption = 'S'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 106
          Y = 81
          Width = 38
          SubKeys = <>
        end
        item
          Caption = 'D'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 145
          Y = 81
          Width = 38
          SubKeys = <>
        end
        item
          Caption = 'F'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 183
          Y = 81
          Width = 38
          SubKeys = <>
        end
        item
          Caption = 'G'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 221
          Y = 81
          Width = 38
          SubKeys = <>
        end
        item
          Caption = 'H'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 260
          Y = 81
          Width = 38
          SubKeys = <>
        end
        item
          Caption = 'J'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 298
          Y = 81
          Width = 38
          SubKeys = <>
        end
        item
          Caption = 'K'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 336
          Y = 81
          Width = 38
          SubKeys = <>
        end
        item
          Caption = 'L'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 375
          Y = 81
          Width = 38
          SubKeys = <>
        end
        item
          Caption = ';'
          ShiftCaption = ':'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 413
          Y = 81
          Width = 38
          SubKeys = <>
        end
        item
          Caption = ','
          ShiftCaption = '"'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 451
          Y = 81
          Width = 38
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
          Width = 77
          SubKeys = <>
        end
        item
          Caption = 'Z'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 78
          Y = 121
          Width = 38
          SubKeys = <>
        end
        item
          Caption = 'X'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 116
          Y = 121
          Width = 38
          SubKeys = <>
        end
        item
          Caption = 'C'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 154
          Y = 121
          Width = 38
          SubKeys = <
            item
              Caption = #1079
            end>
        end
        item
          Caption = 'V'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 193
          Y = 121
          Width = 38
          SubKeys = <>
        end
        item
          Caption = 'B'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 231
          Y = 121
          Width = 38
          SubKeys = <>
        end
        item
          Caption = 'N'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 269
          Y = 121
          Width = 38
          SubKeys = <
            item
              Caption = #1057
            end
            item
              Caption = #1089
            end>
        end
        item
          Caption = 'M'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 308
          Y = 121
          Width = 38
          SubKeys = <>
        end
        item
          Caption = ','
          ShiftCaption = '<'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 346
          Y = 121
          Width = 38
          SubKeys = <>
        end
        item
          Caption = '.'
          ShiftCaption = '>'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 384
          Y = 121
          Width = 38
          SubKeys = <>
        end
        item
          Caption = '/'
          ShiftCaption = '?'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 423
          Y = 121
          Width = 38
          SubKeys = <>
        end
        item
          Caption = 'Shift'
          KeyValue = 161
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skShift
          Color = 10526880
          X = 461
          Y = 121
          Width = 105
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
          Width = 58
          SubKeys = <>
        end
        item
          Caption = 'Win'
          KeyValue = 91
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skWin
          Color = 10526880
          X = 58
          Y = 161
          Width = 38
          SubKeys = <>
        end
        item
          Caption = 'Alt'
          KeyValue = 18
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skAlt
          Color = 10526880
          X = 97
          Y = 161
          Width = 58
          SubKeys = <>
        end
        item
          KeyValue = 32
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skSpaceBar
          X = 154
          Y = 161
          Width = 230
          SubKeys = <>
        end
        item
          Caption = 'Alt Gr'
          KeyValue = 0
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skAltGr
          Color = 10526880
          X = 384
          Y = 161
          Width = 58
          SubKeys = <>
        end
        item
          Caption = 'Win'
          KeyValue = 92
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skWin
          Color = 10526880
          X = 442
          Y = 161
          Width = 38
          SubKeys = <>
        end
        item
          Caption = 'Menu'
          KeyValue = 93
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skApp
          Color = 10526880
          X = 480
          Y = 161
          Width = 38
          SubKeys = <>
        end
        item
          Caption = '->'
          KeyValue = 39
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skRight
          Color = 10526880
          X = 519
          Y = 161
          Width = 58
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
  end
end
