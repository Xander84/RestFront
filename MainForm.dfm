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
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
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
        DesignSize = (
          934
          701)
        object edPassword: TEdit
          Left = 265
          Top = 299
          Width = 257
          Height = 31
          Anchors = []
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          PasswordChar = '*'
          TabOrder = 0
          OnKeyPress = edPasswordKeyPress
        end
        object btnOKPass: TAdvSmoothButton
          Left = 531
          Top = 290
          Width = 72
          Height = 50
          Action = actPassEnter
          Anchors = []
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
          TabOrder = 1
          Version = '1.6.9.0'
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
          Left = 692
          Top = 0
          Width = 242
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
            Width = 242
            Height = 701
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object pcMenu: TAdvPageControl
              Left = 0
              Top = 0
              Width = 242
              Height = 660
              ActivePage = tsMenu
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
                  Width = 242
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
                  Width = 242
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
                  Width = 242
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
                  Width = 242
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
                    Left = 14
                    Top = 7
                    Width = 212
                    Height = 43
                    Action = actBackToMenu
                    Appearance.Font.Charset = DEFAULT_CHARSET
                    Appearance.Font.Color = clWindowText
                    Appearance.Font.Height = -21
                    Appearance.Font.Name = 'Times New Roman'
                    Appearance.Font.Style = []
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
                  Width = 242
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
              Width = 242
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
                Width = 110
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
                ParentFont = False
                TabOrder = 0
                Version = '1.6.9.0'
              end
              object btnScrollUp: TAdvSmoothButton
                Left = 126
                Top = 2
                Width = 110
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
          Width = 692
          Height = 701
          Align = alClient
          Color = 14986888
          TabOrder = 1
          object pcOrder: TAdvPageControl
            Left = 1
            Top = 1
            Width = 690
            Height = 699
            ActivePage = tsManagerPage
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
                Top = 8
                Width = 145
                Height = 50
                Appearance.Font.Charset = DEFAULT_CHARSET
                Appearance.Font.Color = clWindowText
                Appearance.Font.Height = -21
                Appearance.Font.Name = 'Times New Roman'
                Appearance.Font.Style = []
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
              object pnlMainGood: TPanel
                Left = 0
                Top = 408
                Width = 690
                Height = 271
                Align = alBottom
                BevelOuter = bvNone
                Color = 14986888
                TabOrder = 0
                object Panel6: TAdvPanel
                  Left = 640
                  Top = 0
                  Width = 50
                  Height = 271
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
                  FullHeight = 271
                  object btnGoodUp: TAdvSmoothButton
                    Left = 3
                    Top = 5
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
                    ParentFont = False
                    TabOrder = 0
                    Version = '1.6.9.0'
                  end
                  object btnGoodDown: TAdvSmoothButton
                    Left = 3
                    Top = 138
                    Width = 43
                    Height = 129
                    Action = actGoodDown
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
                    ParentFont = False
                    TabOrder = 1
                    Version = '1.6.9.0'
                  end
                end
                object pnlGood: TAdvPanel
                  Left = 0
                  Top = 0
                  Width = 640
                  Height = 271
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
              object DBGrMain: TDBGridEh
                Left = 0
                Top = 0
                Width = 690
                Height = 408
                Align = alClient
                AutoFitColWidths = True
                BorderStyle = bsNone
                DataSource = dsMain
                DrawMemoText = True
                EvenRowColor = clInfoBk
                Flat = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -21
                Font.Name = 'Times New Roman'
                Font.Style = []
                FooterColor = clInfoBk
                FooterFont.Charset = DEFAULT_CHARSET
                FooterFont.Color = clWindowText
                FooterFont.Height = -27
                FooterFont.Name = 'Times New Roman'
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
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -13
                TitleFont.Name = 'Times New Roman'
                TitleFont.Style = []
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
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -15
                    Title.Font.Name = 'Times New Roman'
                    Title.Font.Style = []
                    Width = 203
                    WordWrap = True
                    OnGetCellParams = DBGridEh2Columns0GetCellParams
                  end
                  item
                    DisplayFormat = ' #,###,##0.00'
                    EditButtons = <>
                    FieldName = 'USR$QUANTITY'
                    Footer.DisplayFormat = '# ##0'
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
                    Width = 55
                  end
                  item
                    DisplayFormat = '# ##0'
                    EditButtons = <>
                    FieldName = 'usr$costncuwithdiscount'
                    Footers = <>
                    Title.Alignment = taCenter
                    Title.Caption = #1062#1077#1085#1072' '#1089#1086' '#1089#1082#1080#1076#1082#1086#1081
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -15
                    Title.Font.Name = 'Times New Roman'
                    Title.Font.Style = []
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
                    Title.Caption = #1057#1091#1084#1084#1072' '#1089#1086' '#1089#1082#1080#1076#1082#1086#1081
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -15
                    Title.Font.Name = 'Times New Roman'
                    Title.Font.Style = []
                  end>
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
                Width = 690
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
                DesignSize = (
                  690
                  65)
                FullHeight = 65
                object lblResp: TLabel
                  Left = 190
                  Top = 7
                  Width = 5
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -19
                  Font.Name = 'Times New Roman'
                  Font.Style = []
                  ParentFont = False
                  Transparent = True
                  WordWrap = True
                end
                object btnUsersDown: TAdvSmoothButton
                  Left = 17
                  Top = 7
                  Width = 72
                  Height = 50
                  Action = actUsersDown
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
                  ParentFont = False
                  TabOrder = 0
                  Version = '1.6.9.0'
                end
                object btnUsersUp: TAdvSmoothButton
                  Left = 112
                  Top = 7
                  Width = 72
                  Height = 50
                  Action = actUsersUp
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
                  ParentFont = False
                  TabOrder = 1
                  Version = '1.6.9.0'
                end
                object btnUserLeft: TAdvSmoothButton
                  Left = 497
                  Top = 7
                  Width = 72
                  Height = 50
                  Action = actUsersLeft
                  Anchors = [akTop, akRight]
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
                  ParentFont = False
                  TabOrder = 2
                  Version = '1.6.9.0'
                end
                object btnUserRight: TAdvSmoothButton
                  Left = 589
                  Top = 7
                  Width = 72
                  Height = 50
                  Action = actUsersRight
                  Anchors = [akTop, akRight]
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
                  ParentFont = False
                  TabOrder = 3
                  Version = '1.6.9.0'
                end
              end
              object pnlManagerMain: TAdvPanel
                Left = 0
                Top = 65
                Width = 690
                Height = 614
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
                  Height = 545
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
                  Width = 496
                  Height = 545
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
                object pnlManagerBottom: TAdvPanel
                  Left = 1
                  Top = 546
                  Width = 688
                  Height = 67
                  Align = alBottom
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
                  FullHeight = 67
                  object btnPredCheck: TAdvSmoothButton
                    Left = 200
                    Top = 8
                    Width = 145
                    Height = 50
                    Appearance.Font.Charset = DEFAULT_CHARSET
                    Appearance.Font.Color = clWindowText
                    Appearance.Font.Height = -21
                    Appearance.Font.Name = 'Times New Roman'
                    Appearance.Font.Style = []
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
                    Caption = #1055#1088#1077#1076#1095#1077#1082
                    Color = 15195349
                    ParentFont = False
                    TabOrder = 0
                    Version = '1.6.9.0'
                    OnClick = btnPredCheckClick
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
                Width = 690
                Height = 679
                Align = alClient
                BorderStyle = bsNone
                TabOrder = 0
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
        ActivePage = tsFunctionButton
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
            Left = 4
            Top = 1
            Width = 72
            Height = 50
            Action = actExitWindows
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
          object btnRestartRest: TAdvSmoothButton
            Left = 4
            Top = 55
            Width = 72
            Height = 50
            Action = actRestartRest
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
            TabOrder = 1
            Version = '1.6.9.0'
          end
          object btnShowKeyBoard: TAdvSmoothButton
            Left = 4
            Top = 112
            Width = 72
            Height = 50
            Action = actKeyBoard
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
            TabOrder = 2
            TabStop = False
            Version = '1.6.9.0'
          end
          object btnAdminOptions: TAdvSmoothButton
            Left = 4
            Top = 168
            Width = 72
            Height = 50
            Action = actAdminOptions
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
          DesignSize = (
            80
            699)
          object btnAddQuantity: TAdvSmoothButton
            Left = 4
            Top = 1
            Width = 72
            Height = 50
            Action = actAddQuantity
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -21
            Appearance.Font.Name = 'Times New Roman'
            Appearance.Font.Style = [fsBold]
            Appearance.Layout = blNone
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
          object btnRemoveQuantity: TAdvSmoothButton
            Left = 4
            Top = 56
            Width = 72
            Height = 50
            Action = actRemoveQuantity
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -21
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
          object btnDeletePosition: TAdvSmoothButton
            Left = 4
            Top = 112
            Width = 72
            Height = 50
            Action = actDeletePosition
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
            TabOrder = 2
            Version = '1.6.9.0'
          end
          object btnCutCheck: TAdvSmoothButton
            Left = 4
            Top = 168
            Width = 72
            Height = 50
            Action = actCutCheck
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
            TabOrder = 3
            Version = '1.6.9.0'
          end
          object btnPreCheck: TAdvSmoothButton
            Left = 4
            Top = 224
            Width = 72
            Height = 50
            Action = actPreCheck
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
            TabOrder = 4
            Version = '1.6.9.0'
          end
          object btnModification: TAdvSmoothButton
            Left = 4
            Top = 280
            Width = 72
            Height = 50
            Action = actModification
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
            TabOrder = 5
            Version = '1.6.9.0'
          end
          object btnKeyBoard: TAdvSmoothButton
            Left = 4
            Top = 336
            Width = 72
            Height = 50
            Action = actKeyBoard
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
            TabOrder = 6
            TabStop = False
            Version = '1.6.9.0'
          end
          object btnDiscount: TAdvSmoothButton
            Left = 4
            Top = 392
            Width = 72
            Height = 50
            Action = actDiscount
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
            TabOrder = 7
            Version = '1.6.9.0'
          end
          object btnPay: TAdvSmoothButton
            Left = 4
            Top = 448
            Width = 72
            Height = 50
            Action = actPay
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
            TabOrder = 8
            Version = '1.6.9.0'
          end
          object btnDevide: TAdvSmoothButton
            Left = 4
            Top = 504
            Width = 72
            Height = 50
            Action = actDevide
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
            TabOrder = 9
            Version = '1.6.9.0'
          end
          object btnOK3: TAdvSmoothButton
            Left = 4
            Top = 588
            Width = 72
            Height = 50
            Action = actOK
            Anchors = [akLeft, akBottom]
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -12
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
            Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
            Color = 16575452
            ParentFont = False
            TabOrder = 10
            Version = '1.6.9.0'
          end
          object btnCancel3: TAdvSmoothButton
            Left = 4
            Top = 644
            Width = 72
            Height = 50
            Action = actCancel
            Anchors = [akLeft, akBottom]
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -12
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
            Caption = #1054#1090#1084#1077#1085#1080#1090#1100
            Color = 16575452
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
          DesignSize = (
            80
            699)
          object btnCashForm: TAdvSmoothButton
            Left = 4
            Top = 1
            Width = 72
            Height = 50
            Action = actCashForm
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
          object btnAllChecks: TAdvSmoothButton
            Left = 4
            Top = 57
            Width = 72
            Height = 50
            Action = actAllChecks
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
            TabOrder = 1
            Version = '1.6.9.0'
          end
          object btnManagerInfo: TAdvSmoothButton
            Left = 4
            Top = 113
            Width = 72
            Height = 50
            Action = actManagerInfo
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
            TabOrder = 2
            Version = '1.6.9.0'
          end
          object btnKassa: TAdvSmoothButton
            Left = 4
            Top = 169
            Width = 72
            Height = 50
            Action = actKassirInfo
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
            TabOrder = 3
            Version = '1.6.9.0'
          end
          object btnCancel2: TAdvSmoothButton
            Left = 4
            Top = 644
            Width = 72
            Height = 50
            Action = actCancel
            Anchors = [akLeft, akBottom]
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
            Caption = #1042#1099#1093#1086#1076
            Color = 16575452
            ParentFont = False
            TabOrder = 4
            Version = '1.6.9.0'
          end
          object AdvSmoothButton1: TAdvSmoothButton
            Left = 3
            Top = 225
            Width = 72
            Height = 50
            Hint = #1054#1087#1083#1072#1090#1072
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
            Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
            Color = 15195349
            ParentFont = False
            TabOrder = 5
            Version = '1.6.9.0'
            OnClick = AdvSmoothButton1Click
          end
          object AdvSmoothButton2: TAdvSmoothButton
            Left = 3
            Top = 281
            Width = 72
            Height = 50
            Hint = #1054#1087#1083#1072#1090#1072
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
            Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
            Color = 15195349
            ParentFont = False
            TabOrder = 6
            Version = '1.6.9.0'
            OnClick = AdvSmoothButton2Click
          end
        end
        object tsManagerInfoButton: TAdvTabSheet
          Caption = 'tsManagerInfoButton'
          Color = 14986888
          ColorTo = clNone
          TabColor = clBtnFace
          TabColorTo = clNone
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          DesignSize = (
            80
            699)
          object xDateBegin: TDateTimePicker
            Left = 2
            Top = 8
            Width = 73
            Height = 22
            Date = 40569.698956435180000000
            Time = 40569.698956435180000000
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object xDateEnd: TDateTimePicker
            Left = 3
            Top = 47
            Width = 73
            Height = 22
            Date = 40569.698956435180000000
            Time = 40569.698956435180000000
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object btnExitManagerInfo: TAdvSmoothButton
            Left = 4
            Top = 644
            Width = 72
            Height = 50
            Anchors = [akLeft, akBottom]
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
            Caption = #1042#1099#1093#1086#1076
            Color = 14922381
            ParentFont = False
            TabOrder = 2
            Version = '1.6.9.0'
            OnClick = btnExitManagerInfoClick
          end
          object btnWithPrecheck: TAdvSmoothButton
            Left = 3
            Top = 142
            Width = 72
            Height = 50
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
            Caption = #1057' '#1087#1088#1077#1095#1077#1082#1072#1084#1080
            Color = 14922381
            ParentFont = False
            TabOrder = 3
            Version = '1.6.9.0'
            OnClick = btnWithPrecheckClick
          end
          object btnWithoutPrecheck: TAdvSmoothButton
            Left = 3
            Top = 198
            Width = 72
            Height = 50
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
            Caption = #1041#1077#1079' '#1087#1088#1077#1095#1077#1082#1086#1074
            Color = 14922381
            ParentFont = False
            TabOrder = 4
            Version = '1.6.9.0'
            OnClick = btnWithoutPrecheckClick
          end
          object btnPayed: TAdvSmoothButton
            Left = 3
            Top = 254
            Width = 72
            Height = 50
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
            Caption = #1054#1087#1083#1072#1095#1077#1085#1085#1099#1077
            Color = 14922381
            ParentFont = False
            TabOrder = 5
            Version = '1.6.9.0'
            OnClick = btnPayedClick
          end
          object btnNotPayed: TAdvSmoothButton
            Left = 3
            Top = 310
            Width = 72
            Height = 50
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
            Caption = #1053#1077#1086#1087#1083#1072#1095#1077#1085#1085#1099#1077
            Color = 14922381
            ParentFont = False
            TabOrder = 6
            Version = '1.6.9.0'
            OnClick = btnNotPayedClick
          end
          object btnAllChec: TAdvSmoothButton
            Left = 3
            Top = 86
            Width = 72
            Height = 50
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
            Caption = #1042#1089#1077' '#1095#1077#1082#1080
            Color = 14922381
            ParentFont = False
            TabOrder = 7
            Version = '1.6.9.0'
            OnClick = btnAllChecClick
          end
          object btnPrintIncomeReport: TAdvSmoothButton
            Left = 3
            Top = 381
            Width = 72
            Height = 50
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
            Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1074#1099#1088#1091#1095#1082#1077
            Color = 14922381
            ParentFont = False
            TabOrder = 8
            Version = '1.6.9.0'
            OnClick = btnPrintIncomeReportClick
          end
          object btnCheckRegister: TAdvSmoothButton
            Left = 3
            Top = 437
            Width = 72
            Height = 50
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
            Caption = #1056#1077#1077#1089#1090#1088' '#1089#1095#1077#1090#1086#1074
            Color = 14922381
            ParentFont = False
            TabOrder = 9
            Version = '1.6.9.0'
            OnClick = btnCheckRegisterClick
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
          DesignSize = (
            80
            699)
          object btnShowKeyboard2: TAdvSmoothButton
            Left = 4
            Top = 1
            Width = 72
            Height = 50
            Action = actKeyBoard
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
            Color = 16575452
            ParentFont = False
            TabOrder = 0
            TabStop = False
            Version = '1.6.9.0'
          end
          object btnCancel1: TAdvSmoothButton
            Left = 4
            Top = 644
            Width = 72
            Height = 50
            Action = actCancel
            Anchors = [akLeft, akBottom]
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
            Caption = #1042#1099#1093#1086#1076
            Color = 16575452
            ParentFont = False
            TabOrder = 1
            Version = '1.6.9.0'
          end
        end
      end
    end
  end
  object actList: TActionList
    Left = 504
    Top = 64
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
      Caption = #1052#1054#1044
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
      Caption = #1056#1072#1079#1076
      OnExecute = actCutCheckExecute
      OnUpdate = actCutCheckUpdate
    end
    object actPreCheck: TAction
      Category = 'menu'
      Caption = #1055#1088#1077#1095#1077#1082
      OnExecute = actPreCheckExecute
      OnUpdate = actPreCheckUpdate
    end
    object actCancelPreCheck: TAction
      Category = 'menu'
      Caption = #1054#1090#1084'.'#1087#1088#1077#1095#1077#1082#1072
      OnExecute = actCancelPreCheckExecute
    end
    object actDiscount: TAction
      Category = 'menu'
      Caption = '%'
      OnExecute = actDiscountExecute
      OnUpdate = actDiscountUpdate
    end
    object actPay: TAction
      Category = 'menu'
      Caption = '$'
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
      Caption = '0,000'
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
  end
  object dsMain: TDataSource
    Left = 568
    Top = 64
  end
  object TouchKeyBoard: TAdvSmoothPopupTouchKeyBoard
    KeyboardType = ktQWERTY
    Left = 440
    Top = 64
  end
  object dsHeaderInfo: TDataSource
    Left = 440
    Top = 144
  end
  object dsLineInfo: TDataSource
    Left = 512
    Top = 144
  end
  object tmrClose: TTimer
    Tag = 1
    OnTimer = tmrCloseTimer
    Left = 368
    Top = 64
  end
  object dxfDesigner: TdxfDesigner
    StepToGrid = 1
    Active = False
    Left = 368
    Top = 144
  end
  object gmFront: TGestureManager
    Left = 568
    Top = 144
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
        Collection = <
          item
            Action = actGoodUp
            GestureID = sgiUp
          end
          item
            Action = actGoodDown
            GestureID = sgiDown
          end>
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
end
