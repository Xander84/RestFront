object FindGood: TFindGood
  Left = 0
  Top = 0
  ActiveControl = edGoodName
  Caption = #1055#1086#1080#1089#1082
  ClientHeight = 459
  ClientWidth = 642
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TAdvPanel
    Left = 0
    Top = 0
    Width = 642
    Height = 459
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
    FullHeight = 0
    object lblGoodName: TLabel
      Left = 21
      Top = 16
      Width = 108
      Height = 20
      Caption = #1055#1086#1080#1089#1082' '#1090#1086#1074#1072#1088#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object TouchKeyBoard: TAdvSmoothTouchKeyBoard
      Left = 21
      Top = 241
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
      OnKeyClick = TouchKeyBoardKeyClick
    end
    object edGoodName: TEdit
      Left = 152
      Top = 13
      Width = 313
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnChange = edGoodNameChange
    end
    object DBGrLeft: TDBAdvGrid
      Left = 21
      Top = 55
      Width = 444
      Height = 177
      Cursor = crDefault
      ColCount = 2
      RowCount = 2
      FixedRows = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 2
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
      ColumnSize.Stretch = True
      ControlLook.FixedGradientHoverFrom = clGray
      ControlLook.FixedGradientHoverTo = clWhite
      ControlLook.FixedGradientDownFrom = clGray
      ControlLook.FixedGradientDownTo = clSilver
      ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
      ControlLook.DropDownHeader.Font.Color = clWindowText
      ControlLook.DropDownHeader.Font.Height = -11
      ControlLook.DropDownHeader.Font.Name = 'Tahoma'
      ControlLook.DropDownHeader.Font.Style = []
      ControlLook.DropDownHeader.Visible = True
      ControlLook.DropDownHeader.Buttons = <>
      ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
      ControlLook.DropDownFooter.Font.Color = clWindowText
      ControlLook.DropDownFooter.Font.Height = -11
      ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
      ControlLook.DropDownFooter.Font.Style = []
      ControlLook.DropDownFooter.Visible = True
      ControlLook.DropDownFooter.Buttons = <>
      Filter = <>
      FilterDropDown.Font.Charset = DEFAULT_CHARSET
      FilterDropDown.Font.Color = clWindowText
      FilterDropDown.Font.Height = -11
      FilterDropDown.Font.Name = 'MS Sans Serif'
      FilterDropDown.Font.Style = []
      FilterDropDownClear = '(All)'
      FixedColWidth = 20
      FixedRowHeight = 22
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clWindowText
      FixedFont.Height = -11
      FixedFont.Name = 'Tahoma'
      FixedFont.Style = [fsBold]
      FloatFormat = '%.2f'
      PrintSettings.DateFormat = 'dd/mm/yyyy'
      PrintSettings.Font.Charset = DEFAULT_CHARSET
      PrintSettings.Font.Color = clWindowText
      PrintSettings.Font.Height = -11
      PrintSettings.Font.Name = 'MS Sans Serif'
      PrintSettings.Font.Style = []
      PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
      PrintSettings.FixedFont.Color = clWindowText
      PrintSettings.FixedFont.Height = -11
      PrintSettings.FixedFont.Name = 'MS Sans Serif'
      PrintSettings.FixedFont.Style = []
      PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
      PrintSettings.HeaderFont.Color = clWindowText
      PrintSettings.HeaderFont.Height = -11
      PrintSettings.HeaderFont.Name = 'MS Sans Serif'
      PrintSettings.HeaderFont.Style = []
      PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
      PrintSettings.FooterFont.Color = clWindowText
      PrintSettings.FooterFont.Height = -11
      PrintSettings.FooterFont.Name = 'MS Sans Serif'
      PrintSettings.FooterFont.Style = []
      PrintSettings.PageNumSep = '/'
      ScrollWidth = 16
      SearchFooter.FindNextCaption = 'Find &next'
      SearchFooter.FindPrevCaption = 'Find &previous'
      SearchFooter.Font.Charset = DEFAULT_CHARSET
      SearchFooter.Font.Color = clWindowText
      SearchFooter.Font.Height = -11
      SearchFooter.Font.Name = 'MS Sans Serif'
      SearchFooter.Font.Style = []
      SearchFooter.HighLightCaption = 'Highlight'
      SearchFooter.HintClose = 'Close'
      SearchFooter.HintFindNext = 'Find next occurence'
      SearchFooter.HintFindPrev = 'Find previous occurence'
      SearchFooter.HintHighlight = 'Highlight occurences'
      SearchFooter.MatchCaseCaption = 'Match case'
      Version = '2.1.14.2'
      AutoCreateColumns = True
      AutoRemoveColumns = True
      Columns = <
        item
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'MS Sans Serif'
          HeaderFont.Style = []
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'MS Sans Serif'
          PrintFont.Style = []
          Width = 20
        end
        item
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'NAME'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Header = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'MS Sans Serif'
          HeaderFont.Style = []
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'MS Sans Serif'
          PrintFont.Style = []
          Width = 419
        end>
      DataSource = dsMain
      InvalidPicture.Data = {
        055449636F6E0000010001002020040000000000E80200001600000028000000
        2000000040000000010004000000000000020000000000000000000000000000
        0000000000000000000080000080000000808000800000008000800080800000
        80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
        FFFFFF000000000000777777777777000000000000000000777788FFFF887777
        000000000000007778F8887117788F877700000000000778F87111111111178F
        877000000000778871111111111999178877000000077F811111111111199999
        18F7700000778811111111111119999991887700007881111111111111119199
        99188700077F711111811111111198719997F7700788111118FF111111118FF7
        1991887077F71111888FF1111118FFFF19997F77778111118888FF1111888FF8
        911918777881111118888FF1188888811111188778811111118888FF88888811
        111117877F7111111118888888888111111117F77F7999111111888888881111
        111111F77F7999991111788888F71111111111F77F7999999917888888FF7111
        111117F778879999917FFF88888FF111111117877887999997FFFFF88888FF11
        11111887778799997FFFFFF798888FF11111187777F87997FFFFFF71178F88FF
        71117F7707887997FFFFF7999978F88871118870077F87997FFF799999978F87
        1117F77000788879978799999999787111188700007788879999999999999999
        1188770000077F88799999999999999778F77000000077888879999999999778
        8877000000000778F88877799777788F877000000000007778F8888878888F87
        7700000000000000777788FFFF88777700000000000000000077777777777700
        00000000FFC003FFFF0000FFFC00003FF800001FF000000FE0000007C0000003
        C000000380000001800000010000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000080000001
        80000001C0000003C0000003E0000007F000000FF800001FFC00003FFF0000FF
        FFC003FF}
      ShowUnicode = False
      ColWidths = (
        20
        419)
    end
    object btnOK: TAdvSmoothButton
      Left = 516
      Top = 13
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
      Caption = #1054#1050
      Color = 15195349
      ParentFont = False
      TabOrder = 3
      Version = '1.6.9.0'
      ModalResult = 1
    end
    object btnCancel: TAdvSmoothButton
      Left = 516
      Top = 62
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
      TabOrder = 4
      Version = '1.6.9.0'
      ModalResult = 2
    end
  end
  object MemTable: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    Filtered = True
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
    OnFilterRecord = MemTableFilterRecord
    Left = 480
    Top = 55
  end
  object dsMain: TDataSource
    DataSet = MemTable
    Left = 480
    Top = 112
  end
end
