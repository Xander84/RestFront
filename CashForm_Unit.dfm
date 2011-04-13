object CashForm: TCashForm
  Left = 394
  Top = 113
  BorderStyle = bsDialog
  Caption = #1050#1072#1089#1089#1072
  ClientHeight = 499
  ClientWidth = 324
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TAdvPanel
    Left = 0
    Top = 0
    Width = 324
    Height = 499
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
    object btnStartDay: TAdvSmoothButton
      Left = 14
      Top = 8
      Width = 296
      Height = 40
      Action = actStartDay
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWindowText
      Appearance.Font.Height = -19
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
    object btnStartSession: TAdvSmoothButton
      Left = 14
      Top = 54
      Width = 296
      Height = 40
      Action = actStartSession
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWindowText
      Appearance.Font.Height = -19
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
      TabOrder = 1
      Version = '1.6.9.0'
    end
    object btnReportWithoutCleaning: TAdvSmoothButton
      Left = 14
      Top = 100
      Width = 296
      Height = 40
      Action = actReportWithoutCleaning
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWindowText
      Appearance.Font.Height = -19
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
      TabOrder = 2
      Version = '1.6.9.0'
    end
    object btnReportWithCleaning: TAdvSmoothButton
      Left = 14
      Top = 146
      Width = 296
      Height = 40
      Action = actReportWithCleaning
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWindowText
      Appearance.Font.Height = -19
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
      TabOrder = 3
      Version = '1.6.9.0'
    end
    object btnEndSession: TAdvSmoothButton
      Left = 14
      Top = 376
      Width = 296
      Height = 40
      Action = actEndSession
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWindowText
      Appearance.Font.Height = -19
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
      TabOrder = 4
      Visible = False
      Version = '1.6.9.0'
    end
    object btnEndDay: TAdvSmoothButton
      Left = 14
      Top = 192
      Width = 296
      Height = 40
      Action = actEndDay
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWindowText
      Appearance.Font.Height = -19
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
      TabOrder = 5
      Version = '1.6.9.0'
    end
    object btnMoneyIN: TAdvSmoothButton
      Left = 14
      Top = 238
      Width = 296
      Height = 40
      Action = actMoneyIN
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWindowText
      Appearance.Font.Height = -19
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
      TabOrder = 6
      Version = '1.6.9.0'
    end
    object btnMoneyOUT: TAdvSmoothButton
      Left = 14
      Top = 284
      Width = 296
      Height = 40
      Action = actMoneyOUT
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWindowText
      Appearance.Font.Height = -19
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
      TabOrder = 7
      Version = '1.6.9.0'
    end
    object btnOpenMoney: TAdvSmoothButton
      Left = 14
      Top = 330
      Width = 296
      Height = 40
      Action = actOpenMoney
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWindowText
      Appearance.Font.Height = -19
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
      TabOrder = 8
      Version = '1.6.9.0'
    end
    object btnExit: TAdvSmoothButton
      Left = 14
      Top = 440
      Width = 296
      Height = 40
      Hint = #1042#1099#1093#1086#1076
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWindowText
      Appearance.Font.Height = -19
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
      Caption = #1042#1099#1093#1086#1076
      Color = 15195349
      ParentFont = False
      TabOrder = 9
      Version = '1.6.9.0'
      ModalResult = 1
    end
  end
  object alMain: TActionList
    Left = 96
    Top = 80
    object actStartDay: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1076#1077#1085#1100
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1076#1077#1085#1100
      OnExecute = actStartDayExecute
      OnUpdate = actStartDayUpdate
    end
    object actStartSession: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1089#1084#1077#1085#1091
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1089#1084#1077#1085#1091
      OnExecute = actStartSessionExecute
      OnUpdate = actStartSessionUpdate
    end
    object actReportWithoutCleaning: TAction
      Caption = 'X1 '#1086#1090#1095#1077#1090
      Hint = 'X1 '#1086#1090#1095#1077#1090
      OnExecute = actReportWithoutCleaningExecute
    end
    object actReportWithCleaning: TAction
      Caption = 'Z1 '#1086#1090#1095#1077#1090
      Hint = 'Z1 '#1086#1090#1095#1077#1090
      OnExecute = actReportWithCleaningExecute
    end
    object actEndSession: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1089#1084#1077#1085#1091
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1089#1084#1077#1085#1091
      OnExecute = actEndSessionExecute
      OnUpdate = actEndSessionUpdate
    end
    object actEndDay: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1076#1077#1085#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1076#1077#1085#1100
      OnExecute = actEndDayExecute
      OnUpdate = actEndDayUpdate
    end
    object actMoneyIN: TAction
      Caption = #1042#1085#1077#1089#1077#1085#1080#1077' '#1076#1077#1085#1077#1075
      Hint = #1042#1085#1077#1089#1077#1085#1080#1077' '#1076#1077#1085#1077#1075
      OnExecute = actMoneyINExecute
    end
    object actMoneyOUT: TAction
      Caption = #1048#1079#1098#1103#1090#1080#1077' '#1076#1077#1085#1077#1075
      Hint = #1048#1079#1098#1103#1090#1080#1077' '#1076#1077#1085#1077#1075
      OnExecute = actMoneyOUTExecute
    end
    object actOpenMoney: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1076#1077#1085#1077#1078#1085#1099#1081' '#1103#1097#1080#1082
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1076#1077#1085#1077#1078#1085#1099#1081' '#1103#1097#1080#1082
      OnExecute = actOpenMoneyExecute
    end
  end
end
