object RestMainForm: TRestMainForm
  Left = 286
  Top = 64
  BorderIcons = []
  Caption = #1056#1077#1089#1090#1086#1088#1072#1085
  ClientHeight = 740
  ClientWidth = 1016
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 1016
    Height = 740
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pcMain: TAdvPageControl
      Left = 82
      Top = 0
      Width = 934
      Height = 721
      ActivePage = tsMain
      ActiveFont.Charset = DEFAULT_CHARSET
      ActiveFont.Color = clWindowText
      ActiveFont.Height = -11
      ActiveFont.Name = 'Tahoma'
      ActiveFont.Style = []
      Align = alClient
      TabBackGroundColor = clBtnFace
      TabMargin.RightMargin = 0
      TabOverlap = 0
      Version = '1.6.2.1'
      TabOrder = 0
      object tsPassWord: TAdvTabSheet
        Caption = 'Password'
        Color = 16640730
        ColorTo = 14986888
        TabColor = clBtnFace
        TabColorTo = clNone
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object mainTouchKeyBoard: TAdvSmoothTouchKeyBoard
          Left = 0
          Top = 472
          Width = 934
          Height = 229
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
              X = 2
              Y = 1
              Height = 45
              Width = 62
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
              X = 64
              Y = 1
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = '2'
              ShiftCaption = '@'
              KeyValue = -1
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skNone
              X = 126
              Y = 1
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = '3'
              ShiftCaption = '#'
              KeyValue = -1
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skNone
              X = 188
              Y = 1
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = '4'
              ShiftCaption = '$'
              KeyValue = -1
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skNone
              X = 250
              Y = 1
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = '5'
              ShiftCaption = '%'
              KeyValue = -1
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skNone
              X = 312
              Y = 1
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = '6'
              ShiftCaption = '^'
              KeyValue = -1
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skNone
              X = 374
              Y = 1
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = '7'
              ShiftCaption = '&'
              KeyValue = -1
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skNone
              X = 436
              Y = 1
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = '8'
              ShiftCaption = '*'
              KeyValue = -1
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skNone
              X = 498
              Y = 1
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = '9'
              ShiftCaption = '('
              KeyValue = -1
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skNone
              X = 560
              Y = 1
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = '0'
              ShiftCaption = ')'
              KeyValue = -1
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skNone
              X = 622
              Y = 1
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = '-'
              ShiftCaption = '_'
              KeyValue = -1
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skNone
              X = 684
              Y = 1
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = '='
              ShiftCaption = '+'
              KeyValue = -1
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skNone
              X = 746
              Y = 1
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = '\'
              ShiftCaption = '|'
              KeyValue = -1
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skNone
              X = 808
              Y = 1
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = 'Back'
              KeyValue = 8
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skBackSpace
              Color = 10526880
              X = 870
              Y = 1
              Height = 45
              Width = 62
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
              X = 2
              Y = 46
              Height = 45
              Width = 93
              SubKeys = <>
            end
            item
              Caption = 'Q'
              KeyValue = -1
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skNone
              X = 95
              Y = 46
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = 'W'
              KeyValue = -1
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skNone
              X = 157
              Y = 46
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = 'E'
              KeyValue = -1
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skNone
              X = 219
              Y = 46
              Height = 45
              Width = 62
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
              X = 281
              Y = 46
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = 'T'
              KeyValue = -1
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skNone
              X = 343
              Y = 46
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = 'Y'
              KeyValue = -1
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skNone
              X = 405
              Y = 46
              Height = 45
              Width = 62
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
              X = 467
              Y = 46
              Height = 45
              Width = 62
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
              X = 529
              Y = 46
              Height = 45
              Width = 62
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
              X = 591
              Y = 46
              Height = 45
              Width = 62
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
              X = 653
              Y = 46
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = '['
              ShiftCaption = '{'
              KeyValue = -1
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skNone
              X = 715
              Y = 46
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = ']'
              ShiftCaption = '}'
              KeyValue = -1
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skNone
              X = 777
              Y = 46
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = 'Enter'
              KeyValue = 13
              ShiftKeyValue = 0
              AltGrKeyValue = 0
              SpecialKey = skReturn
              Color = 10526880
              X = 855
              Y = 46
              Height = 91
              Width = 78
              SubKeys = <>
            end
            item
              Caption = 'Caps Lock'
              KeyValue = 20
              ShiftKeyValue = 0
              AltGrKeyValue = 0
              SpecialKey = skCaps
              Color = 10526880
              X = 2
              Y = 92
              Height = 45
              Width = 109
              SubKeys = <>
            end
            item
              Caption = 'A'
              KeyValue = -1
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skNone
              X = 110
              Y = 92
              Height = 45
              Width = 62
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
              X = 172
              Y = 92
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = 'D'
              KeyValue = -1
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skNone
              X = 234
              Y = 92
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = 'F'
              KeyValue = -1
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skNone
              X = 296
              Y = 92
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = 'G'
              KeyValue = -1
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skNone
              X = 358
              Y = 92
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = 'H'
              KeyValue = -1
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skNone
              X = 420
              Y = 92
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = 'J'
              KeyValue = -1
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skNone
              X = 483
              Y = 92
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = 'K'
              KeyValue = -1
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skNone
              X = 545
              Y = 92
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = 'L'
              KeyValue = -1
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skNone
              X = 607
              Y = 92
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = ';'
              ShiftCaption = ':'
              KeyValue = -1
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skNone
              X = 669
              Y = 92
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = ','
              ShiftCaption = '"'
              KeyValue = -1
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skNone
              X = 731
              Y = 92
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = 'Shift'
              KeyValue = 160
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skShift
              Color = 10526880
              X = 2
              Y = 137
              Height = 45
              Width = 124
              SubKeys = <>
            end
            item
              Caption = 'Z'
              KeyValue = -1
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skNone
              X = 126
              Y = 137
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = 'X'
              KeyValue = -1
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skNone
              X = 188
              Y = 137
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = 'C'
              KeyValue = -1
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skNone
              X = 250
              Y = 137
              Height = 45
              Width = 62
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
              X = 312
              Y = 137
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = 'B'
              KeyValue = -1
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skNone
              X = 374
              Y = 137
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = 'N'
              KeyValue = -1
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skNone
              X = 436
              Y = 137
              Height = 45
              Width = 62
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
              X = 498
              Y = 137
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = ','
              ShiftCaption = '<'
              KeyValue = -1
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skNone
              X = 560
              Y = 137
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = '.'
              ShiftCaption = '>'
              KeyValue = -1
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skNone
              X = 622
              Y = 137
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = '/'
              ShiftCaption = '?'
              KeyValue = -1
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skNone
              X = 684
              Y = 137
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = 'Shift'
              KeyValue = 161
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skShift
              Color = 10526880
              X = 746
              Y = 137
              Height = 45
              Width = 171
              SubKeys = <>
            end
            item
              Caption = 'Ctrl'
              KeyValue = 162
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skCtrl
              Color = 10526880
              X = 2
              Y = 183
              Height = 45
              Width = 93
              SubKeys = <>
            end
            item
              Caption = 'Win'
              KeyValue = 91
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skWin
              Color = 10526880
              X = 95
              Y = 183
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = 'Alt'
              KeyValue = 18
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skAlt
              Color = 10526880
              X = 157
              Y = 183
              Height = 45
              Width = 93
              SubKeys = <>
            end
            item
              KeyValue = 32
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skSpaceBar
              X = 250
              Y = 183
              Height = 45
              Width = 372
              SubKeys = <>
            end
            item
              Caption = 'Alt Gr'
              KeyValue = 0
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skAltGr
              Color = 10526880
              X = 622
              Y = 183
              Height = 45
              Width = 93
              SubKeys = <>
            end
            item
              Caption = 'Win'
              KeyValue = 92
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skWin
              Color = 10526880
              X = 715
              Y = 183
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = 'Menu'
              KeyValue = 93
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skApp
              Color = 10526880
              X = 777
              Y = 183
              Height = 45
              Width = 62
              SubKeys = <>
            end
            item
              Caption = '->'
              KeyValue = 39
              ShiftKeyValue = -1
              AltGrKeyValue = -1
              SpecialKey = skRight
              Color = 10526880
              X = 839
              Y = 183
              Height = 45
              Width = 93
              SubKeys = <>
            end>
          SmallFont.Charset = DEFAULT_CHARSET
          SmallFont.Color = clWindowText
          SmallFont.Height = -9
          SmallFont.Name = 'Tahoma'
          SmallFont.Style = []
          Version = '1.5.0.0'
          Align = alBottom
          Visible = False
        end
        object pnlPassword: TGridPanel
          Left = 0
          Top = 0
          Width = 934
          Height = 472
          Align = alClient
          Color = 16640730
          ColumnCollection = <
            item
              Value = 50.000000000000000000
            end
            item
              SizeStyle = ssAbsolute
              Value = 300.000000000000000000
            end
            item
              SizeStyle = ssAbsolute
              Value = 75.000000000000000000
            end
            item
              Value = 50.000000000000000000
            end>
          ControlCollection = <
            item
              Column = 1
              Control = edPassword
              Row = 2
            end
            item
              Column = 2
              Control = btnOKPass
              Row = 1
              RowSpan = 3
            end
            item
              Column = 1
              Control = btnToggleInternalKeyboard
              Row = 4
            end>
          ParentBackground = False
          RowCollection = <
            item
              Value = 50.000000000000000000
            end
            item
              SizeStyle = ssAbsolute
              Value = 10.000000000000000000
            end
            item
              SizeStyle = ssAbsolute
              Value = 40.000000000000000000
            end
            item
              SizeStyle = ssAbsolute
              Value = 10.000000000000000000
            end
            item
              Value = 50.000000000000000000
            end>
          TabOrder = 1
          object edPassword: TEdit
            AlignWithMargins = True
            Left = 282
            Top = 219
            Width = 294
            Height = 34
            Align = alClient
            Constraints.MaxHeight = 37
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            PasswordChar = '*'
            TabOrder = 0
            OnKeyPress = edPasswordKeyPress
            ExplicitHeight = 31
          end
          object btnOKPass: TAdvSmoothButton
            Left = 579
            Top = 206
            Width = 75
            Height = 60
            Action = actPassEnter
            Align = alClient
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -11
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
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
            DisabledColor = clBlack
            ParentFont = False
            TabOrder = 1
            Version = '1.6.9.0'
          end
          object btnToggleInternalKeyboard: TAdvSmoothButton
            AlignWithMargins = True
            Left = 329
            Top = 414
            Width = 200
            Height = 54
            Margins.Left = 50
            Margins.Right = 50
            Align = alBottom
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -9
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
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
            Caption = #1050#1083#1072#1074#1080#1072#1090#1091#1088#1072
            Color = 14922381
            DisabledColor = clBlack
            ParentFont = False
            TabOrder = 2
            TabStop = False
            Version = '1.6.9.0'
            OnClick = btnToggleInternalKeyboardClick
          end
        end
      end
      object tsMain: TAdvTabSheet
        Caption = 'Main'
        Color = 16640730
        ColorTo = 14986888
        ImageIndex = 1
        TabColor = clBtnFace
        TabColorTo = clNone
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object pnlRight: TAdvPanel
          Left = 609
          Top = 0
          Width = 325
          Height = 701
          Align = alRight
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
          FullHeight = 694
          object pnlChoose: TPanel
            Left = 0
            Top = 0
            Width = 325
            Height = 701
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object pcMenu: TAdvPageControl
              Left = 0
              Top = 0
              Width = 325
              Height = 660
              ActivePage = tsGroup
              ActiveFont.Charset = DEFAULT_CHARSET
              ActiveFont.Color = clWindowText
              ActiveFont.Height = -11
              ActiveFont.Name = 'Tahoma'
              ActiveFont.Style = []
              Align = alClient
              TabBackGroundColor = clBtnFace
              TabMargin.RightMargin = 0
              TabOverlap = 0
              Version = '1.6.2.1'
              TabOrder = 0
              object tsMenu: TAdvTabSheet
                Caption = #1052#1077#1085#1102
                Color = clBtnFace
                ColorTo = clNone
                TabColor = clBtnFace
                TabColorTo = clNone
                object pnlMenu: TAdvPanel
                  Left = 0
                  Top = 0
                  Width = 325
                  Height = 345
                  Align = alClient
                  BevelOuter = bvNone
                  Color = 16640730
                  TabOrder = 0
                  UseDockManager = True
                  Version = '2.0.1.0'
                  BorderColor = clGray
                  Buffered = False
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
                  Touch.GestureManager = gmFront
                  FullHeight = 287
                end
                object pnlExtraGoodGroup: TAdvPanel
                  Left = 0
                  Top = 345
                  Width = 325
                  Height = 295
                  Align = alBottom
                  BevelOuter = bvNone
                  Color = 16640730
                  TabOrder = 1
                  UseDockManager = True
                  Version = '2.0.1.0'
                  BorderColor = clGray
                  Buffered = False
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
                  Touch.GestureManager = gmFront
                  FullHeight = 295
                end
              end
              object tsGroup: TAdvTabSheet
                Caption = #1043#1088#1091#1087#1087#1099
                Color = clBtnFace
                ColorTo = clNone
                ImageIndex = 1
                TabColor = clBtnFace
                TabColorTo = clNone
                object pnlGoodGroup: TAdvPanel
                  Left = 0
                  Top = 58
                  Width = 325
                  Height = 582
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
                  Touch.GestureManager = gmFront
                  FullHeight = 524
                end
                object Panel4: TAdvPanel
                  Left = 0
                  Top = 0
                  Width = 325
                  Height = 58
                  Align = alTop
                  BevelOuter = bvNone
                  Color = 16640730
                  TabOrder = 1
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
                  FullHeight = 58
                  object btnBackToMenu: TAdvSmoothButton
                    Left = 6
                    Top = 7
                    Width = 310
                    Height = 43
                    Action = actBackToMenu
                    Appearance.Font.Charset = DEFAULT_CHARSET
                    Appearance.Font.Color = clWindowText
                    Appearance.Font.Height = -13
                    Appearance.Font.Name = 'Tahoma'
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
                    DisabledColor = clBlack
                    ParentFont = False
                    TabOrder = 0
                    Version = '1.6.9.0'
                  end
                end
              end
              object tsHalls: TAdvTabSheet
                Caption = #1047#1072#1083#1099
                Color = clBtnFace
                ColorTo = clNone
                TabColor = clBtnFace
                TabColorTo = clNone
                object pnlHalls: TAdvPanel
                  Left = 0
                  Top = 0
                  Width = 325
                  Height = 640
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
                end
              end
              object tsTablesDesigner: TAdvTabSheet
                Caption = 'tsTablesDesigner'
                Color = clBtnFace
                ColorTo = clNone
                TabColor = clBtnFace
                TabColorTo = clNone
                object pnlDesignerTables: TAdvPanel
                  Left = 0
                  Top = 0
                  Width = 325
                  Height = 640
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
                end
              end
            end
            object Panel1: TAdvPanel
              Left = 0
              Top = 660
              Width = 325
              Height = 41
              Align = alBottom
              BevelOuter = bvNone
              Color = 16640730
              TabOrder = 1
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
              FullHeight = 41
              object btnScrollDown: TAdvSmoothButton
                Left = 7
                Top = 2
                Width = 155
                Height = 37
                Action = actScrollDown
                Appearance.PictureAlignment = taCenter
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
                DisabledColor = clBlack
                ParentFont = False
                TabOrder = 0
                Version = '1.6.9.0'
              end
              object btnScrollUp: TAdvSmoothButton
                Left = 167
                Top = 2
                Width = 155
                Height = 37
                Action = actScrollUp
                Appearance.PictureAlignment = taCenter
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
                DisabledColor = clBlack
                ParentFont = False
                TabOrder = 1
                Version = '1.6.9.0'
              end
            end
          end
        end
        object pnlLeft: TPanel
          Left = 0
          Top = 0
          Width = 609
          Height = 701
          Align = alClient
          BevelOuter = bvNone
          Color = 14986888
          TabOrder = 1
          object pcOrder: TAdvPageControl
            Left = 0
            Top = 0
            Width = 609
            Height = 701
            ActivePage = tsTablePage
            ActiveFont.Charset = DEFAULT_CHARSET
            ActiveFont.Color = clWindowText
            ActiveFont.Height = -11
            ActiveFont.Name = 'Tahoma'
            ActiveFont.Style = []
            Align = alClient
            TabSheetBorderColor = 14986888
            TabBackGroundColor = clBtnFace
            TabMargin.RightMargin = 0
            TabOverlap = 0
            LowerActive = 0
            Version = '1.6.2.1'
            TabOrder = 0
            object tsUserOrder: TAdvTabSheet
              Caption = 'tsUserOrder'
              Color = 16640730
              ColorTo = 14986888
              TabColor = clBtnFace
              TabColorTo = clNone
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object btnNewOrder: TAdvSmoothButton
                Left = 16
                Top = 1
                Width = 145
                Height = 54
                Appearance.PictureAlignment = taCenter
                Appearance.Font.Charset = DEFAULT_CHARSET
                Appearance.Font.Color = clWindowText
                Appearance.Font.Height = -11
                Appearance.Font.Name = 'Tahoma'
                Appearance.Font.Style = [fsBold]
                Appearance.Layout = blPictureTop
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
                Caption = #1053#1086#1074#1099#1081' '#1079#1072#1082#1072#1079
                Color = 15195349
                DisabledColor = clBlack
                ParentFont = False
                TabOrder = 0
                Version = '1.6.9.0'
                OnClick = btnNewOrderClick
              end
            end
            object tsOrderInfo: TAdvTabSheet
              Caption = #1047#1072#1082#1072#1079
              Color = 14986888
              ColorTo = 14986888
              ImageIndex = 1
              TabColor = clBtnFace
              TabColorTo = clNone
              object pnlOrderLeft: TPanel
                Left = 0
                Top = 0
                Width = 609
                Height = 681
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object DBGrMain: TDBGridEh
                  Left = 0
                  Top = 27
                  Width = 576
                  Height = 362
                  Align = alClient
                  AutoFitColWidths = True
                  BorderStyle = bsNone
                  DataSource = dsMain
                  DrawMemoText = True
                  EvenRowColor = clInfoBk
                  Flat = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  FooterColor = clInfoBk
                  FooterFont.Charset = DEFAULT_CHARSET
                  FooterFont.Color = clWindowText
                  FooterFont.Height = -13
                  FooterFont.Name = 'Tahoma'
                  FooterFont.Style = []
                  FooterRowCount = 1
                  OddRowColor = clGradientActiveCaption
                  Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                  ParentFont = False
                  ReadOnly = True
                  RowHeight = 2
                  RowLines = 2
                  SortLocal = True
                  SumList.Active = True
                  SumList.VirtualRecords = True
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -13
                  TitleFont.Name = 'Times New Roman'
                  TitleFont.Style = []
                  VertScrollBar.ExtScrollBar = grScrollBar
                  Columns = <
                    item
                      EditButtons = <>
                      FieldName = 'GOODNAME'
                      Footer.Alignment = taCenter
                      Footer.Font.Charset = DEFAULT_CHARSET
                      Footer.Font.Color = clWindowText
                      Footer.Font.Height = -21
                      Footer.Font.Name = 'Times New Roman'
                      Footer.Font.Style = []
                      Footer.Value = #1048#1090#1086#1075#1086
                      Footer.ValueType = fvtStaticText
                      Footer.WordWrap = True
                      Footers = <>
                      Title.Alignment = taCenter
                      Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
                      Width = 366
                      WordWrap = True
                      OnGetCellParams = DBGridEh2Columns0GetCellParams
                    end
                    item
                      DisplayFormat = ' #,###,##0.##'
                      EditButtons = <>
                      FieldName = 'USR$QUANTITY'
                      Footer.DisplayFormat = ' #,###,##0.##'
                      Footer.FieldName = 'USR$QUANTITY'
                      Footer.Font.Charset = DEFAULT_CHARSET
                      Footer.Font.Color = clWindowText
                      Footer.Font.Height = -21
                      Footer.Font.Name = 'Times New Roman'
                      Footer.Font.Style = []
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Alignment = taCenter
                      Title.Caption = #1050#1086#1083'-'#1074#1086
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clWindowText
                      Title.Font.Height = -15
                      Title.Font.Name = 'Times New Roman'
                      Title.Font.Style = []
                      Width = 51
                      OnGetCellParams = DBGrMainColumns1GetCellParams
                    end
                    item
                      DisplayFormat = '# ##0.##'
                      EditButtons = <>
                      FieldName = 'usr$costncuwithdiscount'
                      Footers = <>
                      Title.Alignment = taCenter
                      Title.Caption = #1062#1077#1085#1072
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clWindowText
                      Title.Font.Height = -15
                      Title.Font.Name = 'Times New Roman'
                      Title.Font.Style = []
                      Width = 76
                      WordWrap = True
                      OnGetCellParams = DBGrMainColumns2GetCellParams
                    end
                    item
                      DisplayFormat = ',#0'
                      EditButtons = <>
                      FieldName = 'usr$sumncuwithdiscount'
                      Footer.DisplayFormat = ',#0'
                      Footer.FieldName = 'usr$sumncuwithdiscount'
                      Footer.Font.Charset = DEFAULT_CHARSET
                      Footer.Font.Color = clWindowText
                      Footer.Font.Height = -21
                      Footer.Font.Name = 'Times New Roman'
                      Footer.Font.Style = []
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Alignment = taCenter
                      Title.Caption = #1057#1091#1084#1084#1072
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clWindowText
                      Title.Font.Height = -15
                      Title.Font.Name = 'Times New Roman'
                      Title.Font.Style = []
                      Width = 72
                      OnGetCellParams = DBGrMainColumns3GetCellParams
                    end>
                end
                object pnlMainGood: TPanel
                  Left = 0
                  Top = 389
                  Width = 609
                  Height = 292
                  Align = alBottom
                  BevelOuter = bvNone
                  Color = 14986888
                  TabOrder = 1
                  object Panel6: TAdvPanel
                    Left = 559
                    Top = 0
                    Width = 50
                    Height = 292
                    Align = alRight
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
                    DesignSize = (
                      50
                      292)
                    FullHeight = 271
                    object btnGoodUp: TAdvSmoothButton
                      Left = 3
                      Top = 6
                      Width = 43
                      Height = 129
                      Action = actGoodUp
                      Appearance.PictureAlignment = taCenter
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
                      DisabledColor = clBlack
                      ParentFont = False
                      TabOrder = 0
                      Version = '1.6.9.0'
                    end
                    object btnGoodDown: TAdvSmoothButton
                      Left = 3
                      Top = 155
                      Width = 43
                      Height = 129
                      Action = actGoodDown
                      Anchors = [akLeft, akBottom]
                      Appearance.PictureAlignment = taCenter
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
                      DisabledColor = clBlack
                      ParentFont = False
                      TabOrder = 1
                      Version = '1.6.9.0'
                    end
                  end
                  object pnlGood: TAdvPanel
                    Left = 0
                    Top = 0
                    Width = 559
                    Height = 292
                    Align = alClient
                    BevelOuter = bvNone
                    Color = 16640730
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 1
                    UseDockManager = True
                    Version = '2.0.1.0'
                    BorderColor = clGray
                    Buffered = False
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
                    Touch.GestureManager = gmFront
                    FullHeight = 0
                  end
                end
                object pnlOrderInfo: TAdvPanel
                  Left = 0
                  Top = 0
                  Width = 609
                  Height = 27
                  Align = alTop
                  BevelOuter = bvNone
                  Color = 16640730
                  TabOrder = 2
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
                  FullHeight = 40
                  object lblOrderInfoUserName: TLabel
                    AlignWithMargins = True
                    Left = 3
                    Top = 0
                    Width = 130
                    Height = 27
                    Margins.Top = 0
                    Margins.Bottom = 0
                    Align = alLeft
                    Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100':'
                    Color = clWindow
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -19
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentColor = False
                    ParentFont = False
                    Transparent = True
                    ExplicitHeight = 23
                  end
                  object lblOrderInfoTableNumberLabel: TLabel
                    AlignWithMargins = True
                    Left = 186
                    Top = 0
                    Width = 83
                    Height = 27
                    Margins.Left = 50
                    Margins.Top = 0
                    Margins.Bottom = 0
                    Align = alLeft
                    Caption = #1047#1072#1082#1072#1079' '#8470':'
                    Color = clWindow
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -19
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentColor = False
                    ParentFont = False
                    Transparent = True
                    ExplicitHeight = 23
                  end
                  object lblOrderInfoTableNumber: TLabel
                    AlignWithMargins = True
                    Left = 277
                    Top = 0
                    Width = 6
                    Height = 27
                    Margins.Left = 5
                    Margins.Top = 0
                    Margins.Bottom = 0
                    Align = alLeft
                    Color = clWindow
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -19
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentColor = False
                    ParentFont = False
                    Transparent = True
                    ExplicitHeight = 23
                  end
                end
                object grScrollBar: TScrollBar
                  Left = 576
                  Top = 27
                  Width = 33
                  Height = 362
                  Align = alRight
                  Kind = sbVertical
                  Max = 1
                  PageSize = 0
                  TabOrder = 3
                end
              end
            end
            object tsManagerPage: TAdvTabSheet
              Caption = 'tsManagerPage'
              Color = 14986888
              ColorTo = clNone
              ImageIndex = 2
              TabColor = clBtnFace
              TabColorTo = clNone
              object pnlManagerTop: TAdvPanel
                Left = 0
                Top = 0
                Width = 609
                Height = 65
                Align = alTop
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
                FullHeight = 65
                object lblResp: TLabel
                  AlignWithMargins = True
                  Left = 169
                  Top = 5
                  Width = 271
                  Height = 55
                  Margins.Left = 5
                  Margins.Top = 5
                  Margins.Right = 5
                  Margins.Bottom = 5
                  Align = alClient
                  AutoSize = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -19
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  Transparent = True
                  WordWrap = True
                  ExplicitLeft = 190
                  ExplicitTop = 7
                  ExplicitWidth = 6
                  ExplicitHeight = 48
                end
                object btnUsersDown: TAdvSmoothButton
                  AlignWithMargins = True
                  Left = 5
                  Top = 5
                  Width = 72
                  Height = 55
                  Margins.Left = 5
                  Margins.Top = 5
                  Margins.Right = 5
                  Margins.Bottom = 5
                  Action = actUsersDown
                  Align = alLeft
                  Appearance.PictureAlignment = taCenter
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
                  DisabledColor = clBlack
                  ParentFont = False
                  TabOrder = 0
                  Version = '1.6.9.0'
                end
                object btnUsersUp: TAdvSmoothButton
                  AlignWithMargins = True
                  Left = 87
                  Top = 5
                  Width = 72
                  Height = 55
                  Margins.Left = 5
                  Margins.Top = 5
                  Margins.Right = 5
                  Margins.Bottom = 5
                  Action = actUsersUp
                  Align = alLeft
                  Appearance.PictureAlignment = taCenter
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
                  DisabledColor = clBlack
                  ParentFont = False
                  TabOrder = 1
                  Version = '1.6.9.0'
                end
                object btnUserLeft: TAdvSmoothButton
                  AlignWithMargins = True
                  Left = 450
                  Top = 5
                  Width = 72
                  Height = 55
                  Margins.Left = 5
                  Margins.Top = 5
                  Margins.Right = 5
                  Margins.Bottom = 5
                  Action = actUsersLeft
                  Align = alRight
                  Appearance.PictureAlignment = taCenter
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
                  DisabledColor = clBlack
                  ParentFont = False
                  TabOrder = 2
                  Version = '1.6.9.0'
                end
                object btnUserRight: TAdvSmoothButton
                  AlignWithMargins = True
                  Left = 532
                  Top = 5
                  Width = 72
                  Height = 55
                  Margins.Left = 5
                  Margins.Top = 5
                  Margins.Right = 5
                  Margins.Bottom = 5
                  Action = actUsersRight
                  Align = alRight
                  Appearance.PictureAlignment = taCenter
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
                  DisabledColor = clBlack
                  ParentFont = False
                  TabOrder = 3
                  Version = '1.6.9.0'
                end
              end
              object pnlManagerMain: TAdvPanel
                Left = 0
                Top = 65
                Width = 609
                Height = 616
                Align = alClient
                TabOrder = 1
                UseDockManager = True
                Version = '2.0.1.0'
                Caption.Color = clHighlight
                Caption.ColorTo = clNone
                Caption.Font.Charset = DEFAULT_CHARSET
                Caption.Font.Color = clHighlightText
                Caption.Font.Height = -11
                Caption.Font.Name = 'MS Sans Serif'
                Caption.Font.Style = []
                StatusBar.Font.Charset = DEFAULT_CHARSET
                StatusBar.Font.Color = clWindowText
                StatusBar.Font.Height = -11
                StatusBar.Font.Name = 'Tahoma'
                StatusBar.Font.Style = []
                FullHeight = 597
                object pnlUsers: TAdvPanel
                  Left = 1
                  Top = 1
                  Width = 192
                  Height = 547
                  Align = alLeft
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
                  Touch.GestureManager = gmFront
                  FullHeight = 528
                end
                object pnlUserOrders: TAdvPanel
                  Left = 193
                  Top = 1
                  Width = 415
                  Height = 547
                  Align = alClient
                  BevelOuter = bvNone
                  Color = 16640730
                  TabOrder = 1
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
                  Touch.GestureManager = gmFront
                  FullHeight = 528
                end
                object pnlManagerBottom: TGridPanel
                  Left = 1
                  Top = 548
                  Width = 607
                  Height = 67
                  Align = alBottom
                  BevelOuter = bvNone
                  Color = 14986888
                  ColumnCollection = <
                    item
                      Value = 25.000000000000000000
                    end
                    item
                      Value = 25.000000000000000000
                    end
                    item
                      Value = 25.000000000000000000
                    end
                    item
                      Value = 25.000000000000000000
                    end>
                  ControlCollection = <
                    item
                      Column = 1
                      Control = btnPrecheckOrders
                      Row = 0
                    end
                    item
                      Column = 2
                      Control = btnWithOutPrecheckOrders
                      Row = 0
                    end>
                  ParentBackground = False
                  RowCollection = <
                    item
                      Value = 100.000000000000000000
                    end>
                  TabOrder = 2
                  object btnPrecheckOrders: TAdvSmoothToggleButton
                    AlignWithMargins = True
                    Left = 156
                    Top = 5
                    Width = 141
                    Height = 57
                    Margins.Left = 5
                    Margins.Top = 5
                    Margins.Right = 5
                    Margins.Bottom = 5
                    BorderColor = clGray
                    BevelWidth = 0
                    Appearance.Font.Charset = DEFAULT_CHARSET
                    Appearance.Font.Color = clWindowText
                    Appearance.Font.Height = -13
                    Appearance.Font.Name = 'Tahoma'
                    Appearance.Font.Style = [fsBold]
                    Caption = #1057' '#1087#1088#1077#1076#1095#1077#1082#1086#1084
                    Version = '1.1.8.0'
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
                    ParentFont = False
                    Align = alClient
                    TabOrder = 0
                    OnClick = btnPrecheckOrdersClick
                  end
                  object btnWithOutPrecheckOrders: TAdvSmoothToggleButton
                    AlignWithMargins = True
                    Left = 307
                    Top = 5
                    Width = 141
                    Height = 57
                    Margins.Left = 5
                    Margins.Top = 5
                    Margins.Right = 5
                    Margins.Bottom = 5
                    BorderColor = clGray
                    BevelWidth = 0
                    Appearance.Font.Charset = DEFAULT_CHARSET
                    Appearance.Font.Color = clWindowText
                    Appearance.Font.Height = -13
                    Appearance.Font.Name = 'Tahoma'
                    Appearance.Font.Style = [fsBold]
                    Caption = #1042#1089#1077' '#1079#1072#1082#1072#1079#1099
                    Version = '1.1.8.0'
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
                    GroupIndex = 1
                    ParentFont = False
                    Align = alClient
                    TabOrder = 1
                    OnClick = btnWithOutPrecheckOrdersClick
                  end
                end
              end
            end
            object tsTablePage: TAdvTabSheet
              Caption = 'tsTablePage'
              Color = 14986888
              ColorTo = clNone
              TabColor = clBtnFace
              TabColorTo = clNone
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object sbTable: TScrollBox
                Left = 0
                Top = 0
                Width = 609
                Height = 681
                Align = alClient
                BorderStyle = bsNone
                DoubleBuffered = False
                ParentDoubleBuffered = False
                TabOrder = 0
                OnGesture = sbTableGesture
                object imgHallBackground: TImage
                  Left = 0
                  Top = 0
                  Width = 609
                  Height = 681
                  Align = alClient
                  Stretch = True
                  ExplicitLeft = 128
                  ExplicitTop = 208
                  ExplicitWidth = 105
                  ExplicitHeight = 105
                end
              end
            end
          end
        end
      end
      object tsManagerInfo: TAdvTabSheet
        Caption = 'ManagerInfo'
        Color = clBtnFace
        ColorTo = clNone
        TabColor = clBtnFace
        TabColorTo = clNone
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object pnlManagerInfo: TPanel
          Left = 0
          Top = 0
          Width = 934
          Height = 701
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object spInfo: TSplitter
            Left = 0
            Top = 404
            Width = 934
            Height = 4
            Cursor = crVSplit
            Align = alBottom
            ExplicitTop = 405
          end
          object pnlInfoBottom: TPanel
            Left = 0
            Top = 408
            Width = 934
            Height = 293
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 0
            object DBGrInfoLine: TDBGridEh
              Left = 0
              Top = 0
              Width = 934
              Height = 293
              Align = alClient
              Flat = False
              FooterColor = clWindow
              FooterFont.Charset = DEFAULT_CHARSET
              FooterFont.Color = clWindowText
              FooterFont.Height = -11
              FooterFont.Name = 'MS Sans Serif'
              FooterFont.Style = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnAdvDrawDataCell = DBGrInfoLineAdvDrawDataCell
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'USR$MN_PRINTDATE'
                  Footers = <>
                  Title.Caption = #1044#1072#1090#1072' '#1087#1077#1095#1072#1090#1080
                  Width = 78
                end
                item
                  EditButtons = <>
                  FieldName = 'NUMBER'
                  Footers = <>
                  Title.Caption = #1053#1086#1084#1077#1088
                end
                item
                  EditButtons = <>
                  FieldName = 'DOCUMENTDATE'
                  Footers = <>
                  Title.Caption = #1044#1072#1090#1072
                end
                item
                  EditButtons = <>
                  FieldName = 'U_USR$GOODKEY_NAME'
                  Footers = <>
                  Title.Caption = #1041#1083#1102#1076#1086
                end
                item
                  EditButtons = <>
                  FieldName = 'CREATIONDATE'
                  Footers = <>
                  Title.Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103
                end
                item
                  EditButtons = <>
                  FieldName = 'USR$COSTNCU'
                  Footers = <>
                  Title.Caption = #1062#1077#1085#1072
                end
                item
                  EditButtons = <>
                  FieldName = 'USR$QUANTITY'
                  Footers = <>
                  Title.Caption = #1050#1086#1083'-'#1074#1086
                end
                item
                  EditButtons = <>
                  FieldName = 'USR$SUMNCU'
                  Footers = <>
                  Title.Caption = #1057#1091#1084#1084#1072
                end
                item
                  EditButtons = <>
                  FieldName = 'USR$PERSDISCOUNT'
                  Footers = <>
                  Title.Caption = '% '#1089#1082#1080#1076#1082#1080
                end
                item
                  EditButtons = <>
                  FieldName = 'USR$COSTNCUWITHDISCOUNT'
                  Footers = <>
                  Title.Caption = #1062#1077#1085#1072' '#1089#1086' '#1089#1082#1080#1076#1082#1086#1081
                end
                item
                  EditButtons = <>
                  FieldName = 'USR$SUMDISCOUNT'
                  Footers = <>
                  Title.Caption = #1057#1091#1084#1084#1072' '#1089#1082#1080#1076#1082#1080
                end
                item
                  EditButtons = <>
                  FieldName = 'USR$SUMNCUWITHDISCOUNT'
                  Footers = <>
                  Title.Caption = #1057#1091#1084#1084#1072' '#1089#1086' '#1089#1082#1080#1076#1082#1086#1081
                end
                item
                  EditButtons = <>
                  FieldName = 'USR$DELETEAMOUNT'
                  Footers = <>
                  Title.Caption = #1050#1086#1083'-'#1074#1086' '#1091#1076#1072#1083#1077#1085#1085#1086#1077
                end
                item
                  EditButtons = <>
                  FieldName = 'U_USR$CAUSEDELETEKEY_USR$NAME'
                  Footers = <>
                  Title.Caption = #1055#1088#1080#1095#1080#1085#1072' '#1091#1076#1072#1083#1077#1085#1080#1103
                end>
            end
          end
          object pnlInfoTop: TPanel
            Left = 0
            Top = 0
            Width = 934
            Height = 404
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object DBGrInfoHeader: TDBGridEh
              Left = 0
              Top = 0
              Width = 934
              Height = 404
              Align = alClient
              Flat = False
              FooterColor = clWindow
              FooterFont.Charset = DEFAULT_CHARSET
              FooterFont.Color = clWindowText
              FooterFont.Height = -11
              FooterFont.Name = 'MS Sans Serif'
              FooterFont.Style = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnAdvDrawDataCell = DBGrInfoHeaderAdvDrawDataCell
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'NUMBER'
                  Footers = <>
                  Title.Caption = #1053#1086#1084#1077#1088
                end
                item
                  EditButtons = <>
                  FieldName = 'U_USR$RESPKEY_NAME'
                  Footers = <>
                  Title.Caption = #1054#1092#1080#1094#1080#1072#1085#1090
                end
                item
                  EditButtons = <>
                  FieldName = 'USR$LOGICDATE'
                  Footers = <>
                  Title.Caption = #1051#1086#1075#1080#1095#1077#1089#1082#1072#1103' '#1076#1072#1090#1072
                end
                item
                  EditButtons = <>
                  FieldName = 'DOCUMENTDATE'
                  Footers = <>
                  Title.Caption = #1044#1072#1090#1072
                end
                item
                  EditButtons = <>
                  FieldName = 'USR$SUMNCUWITHDISCOUNT'
                  Footers = <>
                  Title.Caption = #1057#1091#1084#1084#1072' '#1089#1086' '#1089#1082#1080#1076#1082#1086#1081
                end
                item
                  EditButtons = <>
                  FieldName = 'USR$DISCOUNTNCU'
                  Footers = <>
                  Title.Caption = #1057#1091#1084#1084#1072' '#1089#1082#1080#1076#1082#1080
                end
                item
                  EditButtons = <>
                  FieldName = 'USR$GUESTCOUNT'
                  Footers = <>
                  Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1075#1086#1089#1090#1077#1081
                end
                item
                  EditButtons = <>
                  FieldName = 'USR$TIMEORDER'
                  Footers = <>
                  Title.Caption = #1042#1088#1077#1084#1103' '#1085#1072#1095#1072#1083#1072
                end
                item
                  EditButtons = <>
                  FieldName = 'USR$TIMECLOSEORDER'
                  Footers = <>
                  Title.Caption = #1042#1088#1077#1084#1103' '#1079#1072#1082#1088#1099#1090#1080#1103
                end
                item
                  EditButtons = <>
                  FieldName = 'CREATIONDATE'
                  Footers = <>
                  Title.Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103
                end
                item
                  EditButtons = <>
                  FieldName = 'USR$REGISTER'
                  Footers = <>
                  Title.Caption = #1050#1072#1089#1089#1072
                end
                item
                  EditButtons = <>
                  FieldName = 'EDITIONDATE'
                  Footers = <>
                  Title.Caption = #1044#1072#1090#1072' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
                end
                item
                  EditButtons = <>
                  FieldName = 'U_USR$WHOPAYOFFKEY_NAME'
                  Footers = <>
                  Title.Caption = #1050#1090#1086' '#1074#1085#1077#1089' '#1086#1087#1083#1072#1090#1091
                end
                item
                  EditButtons = <>
                  FieldName = 'USR$FIRSTNAME'
                  Footers = <>
                  Title.Caption = #1048#1084#1103
                end
                item
                  EditButtons = <>
                  FieldName = 'USR$MIDDLENAME'
                  Footers = <>
                  Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
                end
                item
                  EditButtons = <>
                  FieldName = 'USR$SURNAME'
                  Footers = <>
                  Title.Caption = #1060#1072#1084#1080#1083#1080#1103
                end>
            end
          end
        end
      end
    end
    object sbMain: TStatusBar
      Left = 0
      Top = 721
      Width = 1016
      Height = 19
      Panels = <>
      SimplePanel = True
    end
    object pnlExtra: TPanel
      Left = 0
      Top = 0
      Width = 82
      Height = 721
      Align = alLeft
      Color = 14986888
      TabOrder = 2
      object pcExtraButton: TAdvPageControl
        Left = 1
        Top = 1
        Width = 80
        Height = 719
        ActivePage = tsMainButton
        ActiveFont.Charset = DEFAULT_CHARSET
        ActiveFont.Color = clWindowText
        ActiveFont.Height = -11
        ActiveFont.Name = 'Tahoma'
        ActiveFont.Style = []
        Align = alClient
        TabBackGroundColor = clBtnFace
        TabMargin.RightMargin = 0
        TabOverlap = 0
        Version = '1.6.2.1'
        TabOrder = 0
        object tsMainButton: TAdvTabSheet
          Caption = 'tsMainButton'
          Color = 14986888
          ColorTo = clNone
          TabColor = clBtnFace
          TabColorTo = clNone
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object btnExitWindows: TAdvSmoothButton
            AlignWithMargins = True
            Left = 3
            Top = 1
            Width = 74
            Height = 54
            Margins.Top = 1
            Margins.Bottom = 1
            Action = actExitWindows
            Align = alTop
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -9
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
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
            Color = 14922381
            DisabledColor = clBlack
            ParentFont = False
            TabOrder = 0
            Version = '1.6.9.0'
          end
          object btnRestartRest: TAdvSmoothButton
            AlignWithMargins = True
            Left = 3
            Top = 57
            Width = 74
            Height = 54
            Margins.Top = 1
            Margins.Bottom = 1
            Action = actRestartRest
            Align = alTop
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -9
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
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
            Color = 14922381
            DisabledColor = clBlack
            ParentFont = False
            TabOrder = 1
            Version = '1.6.9.0'
          end
          object btnShowKeyBoard: TAdvSmoothButton
            AlignWithMargins = True
            Left = 3
            Top = 113
            Width = 74
            Height = 54
            Margins.Top = 1
            Margins.Bottom = 1
            Action = actKeyBoard
            Align = alTop
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -9
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
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
            Color = 14922381
            DisabledColor = clBlack
            ParentFont = False
            TabOrder = 2
            TabStop = False
            Version = '1.6.9.0'
          end
          object btnAdminOptions: TAdvSmoothButton
            AlignWithMargins = True
            Left = 3
            Top = 169
            Width = 74
            Height = 54
            Margins.Top = 1
            Margins.Bottom = 1
            Action = actAdminOptions
            Align = alTop
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -9
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
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
            Color = 14922381
            DisabledColor = clBlack
            ParentFont = False
            TabOrder = 3
            Version = '1.6.9.0'
          end
        end
        object tsFunctionButton: TAdvTabSheet
          Caption = 'tsFunctionButton'
          Color = 14986888
          ColorTo = clNone
          ImageIndex = 1
          TabColor = clBtnFace
          TabColorTo = clNone
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object btnAddQuantity: TAdvSmoothButton
            AlignWithMargins = True
            Left = 3
            Top = 1
            Width = 74
            Height = 54
            Margins.Top = 1
            Margins.Bottom = 1
            Action = actAddQuantity
            Align = alTop
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -9
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
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
            Caption = #1059#1074#1077#1083#1080#1095#1080#1090#1100
            Color = 15195349
            DisabledColor = clBlack
            ParentFont = False
            TabOrder = 0
            Version = '1.6.9.0'
          end
          object btnRemoveQuantity: TAdvSmoothButton
            AlignWithMargins = True
            Left = 3
            Top = 57
            Width = 74
            Height = 54
            Margins.Top = 1
            Margins.Bottom = 1
            Action = actRemoveQuantity
            Align = alTop
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -9
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
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
            Caption = #1059#1084#1077#1085#1100#1096#1080#1090#1100
            Color = 15195349
            DisabledColor = clBlack
            ParentFont = False
            TabOrder = 1
            Version = '1.6.9.0'
          end
          object btnDeletePosition: TAdvSmoothButton
            AlignWithMargins = True
            Left = 3
            Top = 113
            Width = 74
            Height = 54
            Margins.Top = 1
            Margins.Bottom = 1
            Action = actDeletePosition
            Align = alTop
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -9
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
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
            DisabledColor = clBlack
            ParentFont = False
            TabOrder = 2
            Version = '1.6.9.0'
          end
          object btnCutCheck: TAdvSmoothButton
            AlignWithMargins = True
            Left = 3
            Top = 169
            Width = 74
            Height = 54
            Margins.Top = 1
            Margins.Bottom = 1
            Action = actCutCheck
            Align = alTop
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -9
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
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
            DisabledColor = clBlack
            ParentFont = False
            TabOrder = 3
            Version = '1.6.9.0'
          end
          object btnPreCheck: TAdvSmoothButton
            AlignWithMargins = True
            Left = 3
            Top = 225
            Width = 74
            Height = 54
            Margins.Top = 1
            Margins.Bottom = 1
            Action = actPreCheck
            Align = alTop
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -9
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
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
            DisabledColor = clBlack
            ParentFont = False
            TabOrder = 4
            Version = '1.6.9.0'
          end
          object btnModification: TAdvSmoothButton
            AlignWithMargins = True
            Left = 3
            Top = 281
            Width = 74
            Height = 54
            Margins.Top = 1
            Margins.Bottom = 1
            Action = actModification
            Align = alTop
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -8
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
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
            DisabledColor = clBlack
            ParentFont = False
            TabOrder = 5
            Version = '1.6.9.0'
          end
          object btnEditGuestCount: TAdvSmoothButton
            AlignWithMargins = True
            Left = 3
            Top = 337
            Width = 74
            Height = 54
            Margins.Top = 1
            Margins.Bottom = 1
            Action = actEditGuestCount
            Align = alTop
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -9
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
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
            DisabledColor = clBlack
            ParentFont = False
            TabOrder = 6
            TabStop = False
            Version = '1.6.9.0'
          end
          object btnDiscount: TAdvSmoothButton
            AlignWithMargins = True
            Left = 3
            Top = 393
            Width = 74
            Height = 54
            Margins.Top = 1
            Margins.Bottom = 1
            Action = actDiscount
            Align = alTop
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -9
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
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
            DisabledColor = clBlack
            ParentFont = False
            TabOrder = 7
            Version = '1.6.9.0'
          end
          object btnPay: TAdvSmoothButton
            AlignWithMargins = True
            Left = 3
            Top = 449
            Width = 74
            Height = 54
            Margins.Top = 1
            Margins.Bottom = 1
            Action = actPay
            Align = alTop
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -9
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
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
            Caption = #1054#1087#1083#1072#1090#1072
            Color = 15195349
            DisabledColor = clBlack
            ParentFont = False
            TabOrder = 8
            Version = '1.6.9.0'
          end
          object btnDevide: TAdvSmoothButton
            AlignWithMargins = True
            Left = 3
            Top = 505
            Width = 74
            Height = 54
            Margins.Top = 1
            Margins.Bottom = 1
            Action = actDevide
            Align = alTop
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -9
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
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
            DisabledColor = clBlack
            ParentFont = False
            TabOrder = 9
            Version = '1.6.9.0'
          end
          object btnOK: TAdvSmoothButton
            AlignWithMargins = True
            Left = 3
            Top = 588
            Width = 74
            Height = 54
            Margins.Top = 1
            Margins.Bottom = 1
            Action = actOK
            Align = alBottom
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -9
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
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
            Color = 16575452
            DisabledColor = clBlack
            ParentFont = False
            TabOrder = 10
            Version = '1.6.9.0'
          end
          object btnCancel3: TAdvSmoothButton
            AlignWithMargins = True
            Left = 3
            Top = 644
            Width = 74
            Height = 54
            Margins.Top = 1
            Margins.Bottom = 1
            Action = actCancel
            Align = alBottom
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -9
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
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
            Color = 16575452
            DisabledColor = clBlack
            ParentFont = False
            TabOrder = 11
            Version = '1.6.9.0'
          end
        end
        object tsOrderButton: TAdvTabSheet
          Caption = 'tsOrderButton'
          Color = 14986888
          ColorTo = clNone
          ImageIndex = 2
          TabColor = clBtnFace
          TabColorTo = clNone
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object btnCashForm: TAdvSmoothButton
            AlignWithMargins = True
            Left = 3
            Top = 1
            Width = 74
            Height = 54
            Margins.Top = 1
            Margins.Bottom = 1
            Action = actCashForm
            Align = alTop
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -9
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
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
            DisabledColor = clBlack
            ParentFont = False
            TabOrder = 0
            Version = '1.6.9.0'
          end
          object btnAllChecks: TAdvSmoothButton
            AlignWithMargins = True
            Left = 3
            Top = 57
            Width = 74
            Height = 54
            Margins.Top = 1
            Margins.Bottom = 1
            Action = actAllChecks
            Align = alTop
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -9
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
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
            DisabledColor = clBlack
            ParentFont = False
            TabOrder = 1
            Version = '1.6.9.0'
          end
          object btnManagerInfo: TAdvSmoothButton
            AlignWithMargins = True
            Left = 3
            Top = 113
            Width = 74
            Height = 54
            Margins.Top = 1
            Margins.Bottom = 1
            Action = actManagerInfo
            Align = alTop
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -9
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
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
            DisabledColor = clBlack
            ParentFont = False
            TabOrder = 2
            Version = '1.6.9.0'
          end
          object btnCancel2: TAdvSmoothButton
            AlignWithMargins = True
            Left = 3
            Top = 644
            Width = 74
            Height = 54
            Margins.Top = 1
            Margins.Bottom = 1
            Action = actCancel
            Align = alBottom
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -9
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
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
            Caption = #1042#1099#1093#1086#1076
            Color = 16575452
            DisabledColor = clBlack
            ParentFont = False
            TabOrder = 3
            Version = '1.6.9.0'
          end
          object btnKassa: TAdvSmoothButton
            AlignWithMargins = True
            Left = 3
            Top = 169
            Width = 74
            Height = 54
            Margins.Top = 1
            Margins.Bottom = 1
            Action = actKassirInfo
            Align = alTop
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -9
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
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
            DisabledColor = clBlack
            ParentFont = False
            TabOrder = 4
            Version = '1.6.9.0'
          end
          object btnUnblockTable: TAdvSmoothToggleButton
            AlignWithMargins = True
            Left = 3
            Top = 442
            Width = 74
            Height = 54
            Margins.Top = 1
            Margins.Bottom = 1
            BorderColor = clGray
            BevelWidth = 0
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -8
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
            Appearance.Spacing = 0
            HorizontalSpacing = 0
            Version = '1.1.8.0'
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
            ParentFont = False
            Action = actUnblockTable
            Align = alTop
            TabOrder = 5
          end
          object btnSwapWaiter: TAdvSmoothButton
            AlignWithMargins = True
            Left = 3
            Top = 386
            Width = 74
            Height = 54
            Margins.Top = 1
            Margins.Bottom = 1
            Action = actSwapWaiter
            Align = alTop
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -9
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
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
            DisabledColor = clBlack
            ParentFont = False
            TabOrder = 6
            Version = '1.6.9.0'
          end
          object btnSwapTable: TAdvSmoothToggleButton
            AlignWithMargins = True
            Left = 3
            Top = 330
            Width = 74
            Height = 54
            Margins.Top = 1
            Margins.Bottom = 1
            BorderColor = clGray
            BevelWidth = 0
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -8
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
            Appearance.Spacing = 0
            HorizontalSpacing = 0
            Version = '1.1.8.0'
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
            ParentFont = False
            Action = actSwapTable
            Align = alTop
            TabOrder = 7
          end
          object btnEditMenu: TAdvSmoothButton
            AlignWithMargins = True
            Left = 3
            Top = 225
            Width = 74
            Height = 54
            Margins.Top = 1
            Margins.Bottom = 50
            Action = actEditMenu
            Align = alTop
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -9
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
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
            DisabledColor = clBlack
            ParentFont = False
            TabOrder = 8
            Version = '1.6.9.0'
          end
        end
        object tsManagerInfoButton: TAdvTabSheet
          Caption = 'tsManagerInfoButton'
          Color = 14986888
          ColorTo = clNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabColor = clBtnFace
          TabColorTo = clNone
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object xDateBegin: TDateTimePicker
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 74
            Height = 33
            Align = alTop
            Date = 40569.698956435180000000
            Time = 40569.698956435180000000
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object xDateEnd: TDateTimePicker
            AlignWithMargins = True
            Left = 3
            Top = 42
            Width = 74
            Height = 33
            Align = alTop
            Date = 40569.698956435180000000
            Time = 40569.698956435180000000
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object btnExitManagerInfo: TAdvSmoothButton
            AlignWithMargins = True
            Left = 3
            Top = 644
            Width = 74
            Height = 54
            Margins.Top = 1
            Margins.Bottom = 1
            Align = alBottom
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -9
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
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
            Caption = #1042#1099#1093#1086#1076
            Color = 14922381
            DisabledColor = clBlack
            ParentFont = False
            TabOrder = 2
            Version = '1.6.9.0'
            OnClick = btnExitManagerInfoClick
          end
          object btnWithPrecheck: TAdvSmoothButton
            AlignWithMargins = True
            Left = 3
            Top = 144
            Width = 74
            Height = 54
            Margins.Top = 1
            Margins.Bottom = 1
            Align = alTop
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -9
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
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
            Caption = #1057'  '#1087#1088#1077#1095#1077#1082#1072#1084#1080
            Color = 14922381
            DisabledColor = clBlack
            ParentFont = False
            TabOrder = 3
            Version = '1.6.9.0'
            OnClick = btnWithPrecheckClick
          end
          object btnWithoutPrecheck: TAdvSmoothButton
            AlignWithMargins = True
            Left = 3
            Top = 200
            Width = 74
            Height = 54
            Margins.Top = 1
            Margins.Bottom = 1
            Align = alTop
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -9
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
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
            Caption = #1041#1077#1079' '#1087#1088#1077#1095#1077#1082#1086#1074
            Color = 14922381
            DisabledColor = clBlack
            ParentFont = False
            TabOrder = 4
            Version = '1.6.9.0'
            OnClick = btnWithoutPrecheckClick
          end
          object btnPayed: TAdvSmoothButton
            AlignWithMargins = True
            Left = 3
            Top = 256
            Width = 74
            Height = 54
            Margins.Top = 1
            Margins.Bottom = 1
            Align = alTop
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -9
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
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
            Caption = #1054#1087#1083#1072#1095#1077#1085#1085#1099#1077
            Color = 14922381
            DisabledColor = clBlack
            ParentFont = False
            TabOrder = 5
            Version = '1.6.9.0'
            OnClick = btnPayedClick
          end
          object btnNotPayed: TAdvSmoothButton
            AlignWithMargins = True
            Left = 3
            Top = 312
            Width = 74
            Height = 54
            Margins.Top = 1
            Margins.Bottom = 1
            Align = alTop
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -9
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
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
            Caption = #1053#1077#1086#1087#1083#1072#1095#1077#1085#1085#1099#1077
            Color = 14922381
            DisabledColor = clBlack
            ParentFont = False
            TabOrder = 6
            Version = '1.6.9.0'
            OnClick = btnNotPayedClick
          end
          object btnAllChec: TAdvSmoothButton
            AlignWithMargins = True
            Left = 3
            Top = 88
            Width = 74
            Height = 54
            Margins.Top = 10
            Margins.Bottom = 1
            Align = alTop
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -9
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
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
            Caption = #1042#1089#1077' '#1095#1077#1082#1080
            Color = 14922381
            DisabledColor = clBlack
            ParentFont = False
            TabOrder = 7
            Version = '1.6.9.0'
            OnClick = btnAllChecClick
          end
          object btnViewReports: TAdvSmoothButton
            AlignWithMargins = True
            Left = 3
            Top = 377
            Width = 74
            Height = 54
            Margins.Top = 10
            Margins.Bottom = 1
            Align = alTop
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -9
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
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
            Caption = #1054#1090#1095#1077#1090#1099
            Color = 14922381
            DisabledColor = clBlack
            ParentFont = False
            TabOrder = 8
            Version = '1.6.9.0'
            OnClick = btnViewReportsClick
          end
          object btnPrintCopyCheck: TAdvSmoothButton
            AlignWithMargins = True
            Left = 3
            Top = 433
            Width = 74
            Height = 54
            Margins.Top = 1
            Margins.Bottom = 1
            Align = alTop
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -9
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
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
            Caption = #1055#1088#1077#1095#1077#1082
            Color = 14922381
            DisabledColor = clBlack
            ParentFont = False
            TabOrder = 9
            Version = '1.6.9.0'
            OnClick = btnPrintCopyCheckClick
          end
          object btnReturnCheck: TAdvSmoothButton
            AlignWithMargins = True
            Left = 3
            Top = 498
            Width = 74
            Height = 54
            Margins.Top = 10
            Margins.Bottom = 1
            Action = actReturnCheck
            Align = alTop
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -9
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
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
            Color = 14922381
            DisabledColor = clBlack
            ParentFont = False
            TabOrder = 10
            Version = '1.6.9.0'
          end
        end
        object tsEmpty: TAdvTabSheet
          Caption = 'tsEmpty'
          Color = 14986888
          ColorTo = clNone
          TabColor = clBtnFace
          TabColorTo = clNone
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object btnShowKeyboard2: TAdvSmoothButton
            AlignWithMargins = True
            Left = 3
            Top = 1
            Width = 74
            Height = 54
            Margins.Top = 1
            Margins.Bottom = 1
            Action = actKeyBoard
            Align = alTop
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -9
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
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
            Color = 16575452
            DisabledColor = clBlack
            ParentFont = False
            TabOrder = 0
            TabStop = False
            Version = '1.6.9.0'
          end
          object btnCancel1: TAdvSmoothButton
            AlignWithMargins = True
            Left = 3
            Top = 644
            Width = 74
            Height = 54
            Margins.Top = 1
            Margins.Bottom = 1
            Action = actCancel
            Align = alBottom
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -9
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
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
            Caption = #1042#1099#1093#1086#1076
            Color = 16575452
            DisabledColor = clBlack
            ParentFont = False
            TabOrder = 1
            Version = '1.6.9.0'
          end
          object btnOK2: TAdvSmoothButton
            AlignWithMargins = True
            Left = 3
            Top = 588
            Width = 74
            Height = 54
            Margins.Top = 1
            Margins.Bottom = 1
            Action = actOK
            Align = alBottom
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -9
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
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
            Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
            Color = 16575452
            DisabledColor = clBlack
            ParentFont = False
            TabOrder = 2
            Visible = False
            Version = '1.6.9.0'
          end
          object btnReturnGoodSum: TAdvSmoothButton
            AlignWithMargins = True
            Left = 3
            Top = 57
            Width = 74
            Height = 54
            Margins.Top = 1
            Margins.Bottom = 1
            Action = actReturnGoodSum
            Align = alTop
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -9
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
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
            Color = 16575452
            DisabledColor = clBlack
            ParentFont = False
            TabOrder = 3
            TabStop = False
            Version = '1.6.9.0'
          end
          object btnDeleteTable: TAdvSmoothToggleButton
            AlignWithMargins = True
            Left = 3
            Top = 152
            Width = 74
            Height = 54
            Margins.Top = 40
            Margins.Bottom = 1
            BorderColor = clGray
            BevelWidth = 0
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -9
            Appearance.Font.Name = 'Tahoma'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blPictureTop
            Appearance.Spacing = 0
            HorizontalSpacing = 0
            Caption = #1059#1076#1072#1083#1077#1085#1080#1077' '#1089#1090#1086#1083#1072
            Version = '1.1.8.0'
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
            ParentFont = False
            Align = alTop
            TabOrder = 4
            OnClick = btnDeleteTableClick
          end
        end
      end
    end
  end
  object actList: TActionList
    Left = 424
    Top = 128
    object actPassEnter: TAction
      Category = 'PassWord'
      Caption = 'OK'
      OnExecute = actPassEnterExecute
    end
    object actBackToMenu: TAction
      Category = 'menu'
      Caption = #1053#1072#1079#1072#1076' '#1074' '#1084#1077#1085#1102
      OnExecute = actBackToMenuExecute
    end
    object actScrollUp: TAction
      Category = 'menu'
      OnExecute = actScrollUpExecute
      OnUpdate = actScrollUpUpdate
    end
    object actScrollDown: TAction
      Category = 'menu'
      OnExecute = actScrollDownExecute
      OnUpdate = actScrollDownUpdate
    end
    object actGoodUp: TAction
      Category = 'menu'
      OnExecute = actGoodUpExecute
      OnUpdate = actGoodUpUpdate
    end
    object actGoodDown: TAction
      Category = 'menu'
      OnExecute = actGoodDownExecute
      OnUpdate = actGoodDownUpdate
    end
    object actOK: TAction
      Category = 'menu'
      Caption = 'OK'
      OnExecute = actOKExecute
    end
    object actCancel: TAction
      Category = 'menu'
      Caption = #1054#1090#1084#1077#1085#1072
      OnExecute = actCancelExecute
    end
    object actAddQuantity: TAction
      Category = 'menu'
      OnExecute = actAddQuantityExecute
      OnUpdate = actAddQuantityUpdate
    end
    object actRemoveQuantity: TAction
      Category = 'menu'
      OnExecute = actRemoveQuantityExecute
      OnUpdate = actRemoveQuantityUpdate
    end
    object actDeletePosition: TAction
      Category = 'menu'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnExecute = actDeletePositionExecute
      OnUpdate = actDeletePositionUpdate
    end
    object actModification: TAction
      Category = 'menu'
      Caption = #1052#1086#1076#1080#1092#1080#1082#1072#1090#1086#1088
      OnExecute = actModificationExecute
      OnUpdate = actModificationUpdate
    end
    object actKeyBoard: TAction
      Category = 'menu'
      Caption = #1050#1083#1072#1074#1080#1072#1090#1091#1088#1072
      OnExecute = actKeyBoardExecute
    end
    object actCutCheck: TAction
      Category = 'menu'
      Caption = #1056#1072#1079#1076#1077#1083#1080#1090#1100
      OnExecute = actCutCheckExecute
      OnUpdate = actCutCheckUpdate
    end
    object actPreCheck: TAction
      Category = 'menu'
      Caption = #1057#1095#1077#1090
      OnExecute = actPreCheckExecute
      OnUpdate = actPreCheckUpdate
    end
    object actCancelPreCheck: TAction
      Category = 'menu'
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1089#1095#1077#1090
      OnExecute = actCancelPreCheckExecute
    end
    object actDiscount: TAction
      Category = 'menu'
      Caption = #1057#1082#1080#1076#1082#1072
      OnExecute = actDiscountExecute
      OnUpdate = actDiscountUpdate
    end
    object actPay: TAction
      Category = 'menu'
      OnExecute = actPayExecute
      OnUpdate = actPayUpdate
    end
    object actUsersUp: TAction
      Category = 'menu'
      OnExecute = actUsersUpExecute
    end
    object actUsersDown: TAction
      Category = 'menu'
      OnExecute = actUsersDownExecute
    end
    object actDevide: TAction
      Category = 'menu'
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      OnExecute = actDevideExecute
      OnUpdate = actDevideUpdate
    end
    object actUsersLeft: TAction
      Category = 'menu'
      OnExecute = actUsersLeftExecute
    end
    object actUsersRight: TAction
      Category = 'menu'
      OnExecute = actUsersRightExecute
    end
    object actExitWindows: TAction
      Category = 'menu'
      Caption = #1042#1099#1093#1086#1076
      OnExecute = actExitWindowsExecute
    end
    object actRestartRest: TAction
      Category = 'menu'
      Caption = #1056#1077#1089#1090#1072#1088#1090
      OnExecute = actRestartRestExecute
    end
    object actCashForm: TAction
      Category = 'menu'
      Caption = #1050#1072#1089#1089#1072
      OnExecute = actCashFormExecute
      OnUpdate = actCashFormUpdate
    end
    object actAdminOptions: TAction
      Category = 'menu'
      Caption = #1040#1076#1084#1080#1085'.'
      Hint = #1040#1076#1084#1080#1085'.'
      OnExecute = actAdminOptionsExecute
    end
    object actAllChecks: TAction
      Category = 'menu'
      Caption = #1042#1089#1077' '#1079#1072#1082#1072#1079#1099
      Hint = #1042#1089#1077' '#1079#1072#1082#1072#1079#1099
      OnExecute = actAllChecksExecute
      OnUpdate = actAllChecksUpdate
    end
    object actManagerInfo: TAction
      Category = 'menu'
      Caption = #1042#1099#1088#1091#1095#1082#1072
      OnExecute = actManagerInfoExecute
      OnUpdate = actManagerInfoUpdate
    end
    object actKassirInfo: TAction
      Category = 'menu'
      Caption = #1054#1087#1083#1072#1090#1072
      Hint = #1054#1087#1083#1072#1090#1072
      OnExecute = actKassirInfoExecute
      OnUpdate = actKassirInfoUpdate
    end
    object actReturnGoodSum: TAction
      Category = 'menu'
      Caption = #1042#1086#1079#1074#1088#1072#1090' '#1079#1072' '#1090#1086#1074#1072#1088
      Hint = #1042#1086#1079#1074#1088#1072#1090' '#1079#1072' '#1090#1086#1074#1072#1088
      OnExecute = actReturnGoodSumExecute
    end
    object actSwapWaiter: TAction
      Category = 'Hall'
      Caption = #1057#1084#1077#1085#1072' '#1086#1092#1080#1094#1080#1072#1085#1090#1072
      OnExecute = actSwapWaiterExecute
      OnUpdate = actSwapWaiterUpdate
    end
    object actSwapTable: TAction
      Category = 'Hall'
      Caption = #1057#1084#1077#1085#1072' '#1089#1090#1086#1083#1072
      OnExecute = actSwapTableExecute
      OnUpdate = actSwapTableUpdate
    end
    object actUnblockTable: TAction
      Category = 'Hall'
      Caption = #1056#1072#1079#1073#1083#1086#1082#1080#1088#1086#1074'. '#1089#1090#1086#1083
      OnUpdate = actUnblockTableUpdate
    end
    object actEditMenu: TAction
      Category = 'menu'
      Caption = #1052#1077#1085#1102
      Hint = #1052#1077#1085#1102
      OnExecute = actEditMenuExecute
      OnUpdate = actEditMenuUpdate
    end
    object actEditGuestCount: TAction
      Category = 'menu'
      Caption = #1043#1086#1089#1090#1080
      OnExecute = actEditGuestCountExecute
      OnUpdate = actEditGuestCountUpdate
    end
    object actReturnCheck: TAction
      Category = 'menu'
      Caption = #1042#1086#1079#1074#1088#1072#1090' '#1095#1077#1082#1072
      OnExecute = actReturnCheckExecute
      OnUpdate = actReturnCheckUpdate
    end
  end
  object dsMain: TDataSource
    Left = 480
    Top = 128
  end
  object TouchKeyBoard: TAdvSmoothPopupTouchKeyBoard
    KeyboardType = ktQWERTY
    Left = 352
    Top = 128
  end
  object dsHeaderInfo: TDataSource
    Left = 352
    Top = 176
  end
  object dsLineInfo: TDataSource
    Left = 424
    Top = 176
  end
  object tmrClose: TTimer
    Tag = 1
    Interval = 4000
    OnTimer = tmrCloseTimer
    Left = 272
    Top = 128
  end
  object dxfDesigner: TdxfDesigner
    StepToGrid = 5
    Active = False
    Left = 272
    Top = 176
  end
  object gmFront: TGestureManager
    Left = 488
    Top = 184
    GestureData = <
      item
        Control = pnlMenu
        Collection = <
          item
            Action = actScrollUp
            GestureID = sgiUp
          end
          item
            Action = actScrollDown
            GestureID = sgiDown
          end>
      end
      item
        Control = pnlExtraGoodGroup
        Collection = <
          item
            Action = actScrollDown
            GestureID = sgiDown
          end
          item
            Action = actScrollUp
            GestureID = sgiUp
          end>
      end
      item
        Control = pnlGoodGroup
        Collection = <
          item
            Action = actScrollUp
            GestureID = sgiUp
          end
          item
            Action = actScrollDown
            GestureID = sgiDown
          end>
      end
      item
        Control = pnlGood
        Collection = <>
      end
      item
        Control = pnlUsers
        Collection = <
          item
            Action = actUsersUp
            GestureID = sgiUp
          end
          item
            Action = actUsersDown
            GestureID = sgiDown
          end>
      end
      item
        Control = pnlUserOrders
        Collection = <
          item
            Action = actUsersLeft
            GestureID = sgiLeft
          end
          item
            Action = actUsersRight
            GestureID = sgiRight
          end
          item
            Action = actUsersUp
            GestureID = sgiUp
          end
          item
            Action = actUsersDown
            GestureID = sgiDown
          end>
      end>
  end
  object tablePopupMenu: TAdvPopupMenu
    OnPopup = tablePopupMenuPopup
    MenuStyler = MenuOfficeStyler
    Version = '2.5.3.1'
    Left = 424
    Top = 328
  end
  object MenuOfficeStyler: TAdvMenuOfficeStyler
    AntiAlias = aaNone
    AutoThemeAdapt = False
    Style = osOffice2003Blue
    Background.Position = bpCenter
    Background.Color = 16185078
    Background.ColorTo = 16185078
    ButtonAppearance.DownColor = 5149182
    ButtonAppearance.DownColorTo = 9556991
    ButtonAppearance.HoverColor = 13432063
    ButtonAppearance.HoverColorTo = 9556223
    ButtonAppearance.DownBorderColor = clNavy
    ButtonAppearance.HoverBorderColor = clNavy
    ButtonAppearance.CaptionFont.Charset = DEFAULT_CHARSET
    ButtonAppearance.CaptionFont.Color = clWindowText
    ButtonAppearance.CaptionFont.Height = -11
    ButtonAppearance.CaptionFont.Name = 'Segoe UI'
    ButtonAppearance.CaptionFont.Style = []
    IconBar.Color = 16773091
    IconBar.ColorTo = 14986631
    IconBar.CheckBorder = clNavy
    IconBar.RadioBorder = clNavy
    SelectedItem.BorderColor = clNavy
    SelectedItem.Font.Charset = DEFAULT_CHARSET
    SelectedItem.Font.Color = clWindowText
    SelectedItem.Font.Height = -19
    SelectedItem.Font.Name = 'Tahoma'
    SelectedItem.Font.Style = []
    SelectedItem.NotesFont.Charset = DEFAULT_CHARSET
    SelectedItem.NotesFont.Color = clWindowText
    SelectedItem.NotesFont.Height = -8
    SelectedItem.NotesFont.Name = 'Tahoma'
    SelectedItem.NotesFont.Style = []
    SelectedItem.UseSystemFont = False
    SelectedItem.CheckBorder = clNavy
    SelectedItem.RadioBorder = clNavy
    RootItem.Color = 16105118
    RootItem.ColorTo = 16240050
    RootItem.Font.Charset = DEFAULT_CHARSET
    RootItem.Font.Color = clMenuText
    RootItem.Font.Height = -11
    RootItem.Font.Name = 'Tahoma'
    RootItem.Font.Style = []
    RootItem.SelectedColor = 16773091
    RootItem.SelectedColorTo = 15185299
    RootItem.SelectedBorderColor = 9841920
    RootItem.HoverColor = 13432063
    RootItem.HoverColorTo = 10147583
    Glyphs.SubMenu.Data = {
      5A000000424D5A000000000000003E0000002800000004000000070000000100
      0100000000001C0000000000000000000000020000000200000000000000FFFF
      FF0070000000300000001000000000000000100000003000000070000000}
    Glyphs.Check.Data = {
      7E000000424D7E000000000000003E0000002800000010000000100000000100
      010000000000400000000000000000000000020000000200000000000000FFFF
      FF00FFFF0000FFFF0000FFFF0000FFFF0000FDFF0000F8FF0000F07F0000F23F
      0000F71F0000FF8F0000FFCF0000FFEF0000FFFF0000FFFF0000FFFF0000FFFF
      0000}
    Glyphs.Radio.Data = {
      7E000000424D7E000000000000003E0000002800000010000000100000000100
      010000000000400000000000000000000000020000000200000000000000FFFF
      FF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FC3F0000F81F0000F81F
      0000F81F0000F81F0000FC3F0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000}
    SideBar.Font.Charset = DEFAULT_CHARSET
    SideBar.Font.Color = clWhite
    SideBar.Font.Height = -19
    SideBar.Font.Name = 'Tahoma'
    SideBar.Font.Style = [fsBold, fsItalic]
    SideBar.Image.Position = bpCenter
    SideBar.Background.Position = bpCenter
    SideBar.SplitterColorTo = clBlack
    Separator.Color = 13339754
    Separator.GradientType = gtBoth
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMenuText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    NotesFont.Charset = DEFAULT_CHARSET
    NotesFont.Color = clGray
    NotesFont.Height = -8
    NotesFont.Name = 'Tahoma'
    NotesFont.Style = []
    UseSystemFont = False
    MenuBorderColor = 9841920
    Left = 520
    Top = 328
  end
  object tmrTables: TTimer
    Enabled = False
    Interval = 30000
    OnTimer = tmrTablesTimer
    Left = 424
    Top = 232
  end
  object tmrTime: TTimer
    OnTimer = tmrTimeTimer
    Left = 272
    Top = 272
  end
end
