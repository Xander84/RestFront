object RestMainForm: TRestMainForm
  Left = 146
  Top = 25
  Width = 1024
  Height = 732
  Caption = 'RestMainForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 1016
    Height = 704
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pcMain: TAdvPageControl
      Left = 82
      Top = 0
      Width = 934
      Height = 685
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
        DesignSize = (
          926
          657)
        object edPassword: TEdit
          Left = 265
          Top = 283
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
          Left = 536
          Top = 274
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
        object pnlRight: TAdvPanel
          Left = 684
          Top = 0
          Width = 242
          Height = 657
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
            Height = 616
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object pcMenu: TPageControl
              Left = 0
              Top = 0
              Width = 242
              Height = 575
              ActivePage = tsMenu
              Align = alClient
              TabOrder = 0
              object tsMenu: TTabSheet
                Caption = #1052#1077#1085#1102
                object pnlMenu: TAdvPanel
                  Left = 0
                  Top = 0
                  Width = 234
                  Height = 252
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
                  FullHeight = 287
                end
                object pnlExtraGoodGroup: TAdvPanel
                  Left = 0
                  Top = 252
                  Width = 234
                  Height = 295
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
                  FullHeight = 295
                end
              end
              object tsGroup: TTabSheet
                Caption = #1043#1088#1091#1087#1087#1099
                ImageIndex = 1
                object pnlGoodGroup: TAdvPanel
                  Left = 0
                  Top = 58
                  Width = 234
                  Height = 489
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
                  FullHeight = 524
                end
                object Panel4: TAdvPanel
                  Left = 0
                  Top = 0
                  Width = 234
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
                    Left = 10
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
            end
            object Panel1: TAdvPanel
              Left = 0
              Top = 575
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
          object Panel3: TAdvPanel
            Left = 0
            Top = 616
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
            object btnOK: TAdvSmoothButton
              Left = 7
              Top = 3
              Width = 110
              Height = 37
              Action = actOK
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
              Left = 126
              Top = 3
              Width = 110
              Height = 37
              Action = actCancel
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
        object pnlLeft: TPanel
          Left = 0
          Top = 0
          Width = 684
          Height = 657
          Align = alClient
          Color = 14986888
          TabOrder = 1
          object pcOrder: TAdvPageControl
            Left = 1
            Top = 1
            Width = 682
            Height = 655
            ActivePage = tsOrderInfo
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
            object tsUserOrder: TAdvTabSheet
              Caption = 'tsUserOrder'
              Color = 16640730
              ColorTo = 14986888
              TabColor = clBtnFace
              TabColorTo = clNone
              object btnNewOrder: TAdvSmoothButton
                Left = 8
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
                Top = 356
                Width = 674
                Height = 271
                Align = alBottom
                BevelOuter = bvNone
                Color = 14986888
                TabOrder = 0
                object Panel6: TAdvPanel
                  Left = 634
                  Top = 0
                  Width = 40
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
                    Width = 33
                    Height = 129
                    Action = actGoodUp
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
                    Width = 33
                    Height = 129
                    Action = actGoodDown
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
                  Width = 634
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
              object DBAdvGrMain: TDBAdvGrid
                Left = 0
                Top = 0
                Width = 674
                Height = 356
                Cursor = crDefault
                Align = alClient
                ColCount = 5
                RowCount = 2
                FixedRows = 1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ScrollBars = ssBoth
                TabOrder = 1
                OnFooterCalc = DBAdvGrMainFooterCalc
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
                    FieldName = 'GOODNAME'
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
                    Width = 312
                  end
                  item
                    Borders = []
                    BorderPen.Color = clSilver
                    CheckFalse = 'N'
                    CheckTrue = 'Y'
                    Color = clWindow
                    FieldName = 'USR$QUANTITY'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    Header = #1050#1086#1083'-'#1074#1086
                    HeaderFont.Charset = DEFAULT_CHARSET
                    HeaderFont.Color = clWindowText
                    HeaderFont.Height = -11
                    HeaderFont.Name = 'Tahoma'
                    HeaderFont.Style = []
                    PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                    PrintFont.Charset = DEFAULT_CHARSET
                    PrintFont.Color = clWindowText
                    PrintFont.Height = -11
                    PrintFont.Name = 'Tahoma'
                    PrintFont.Style = []
                    Width = 73
                  end
                  item
                    Borders = []
                    BorderPen.Color = clSilver
                    CheckFalse = 'N'
                    CheckTrue = 'Y'
                    Color = clWindow
                    FieldName = 'usr$costncuwithdiscount'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    Header = #1062#1077#1085#1072' '#1089#1086' '#1089#1082#1080#1076#1082#1086#1081
                    HeaderFont.Charset = DEFAULT_CHARSET
                    HeaderFont.Color = clWindowText
                    HeaderFont.Height = -11
                    HeaderFont.Name = 'Tahoma'
                    HeaderFont.Style = []
                    PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                    PrintFont.Charset = DEFAULT_CHARSET
                    PrintFont.Color = clWindowText
                    PrintFont.Height = -11
                    PrintFont.Name = 'Tahoma'
                    PrintFont.Style = []
                    Width = 130
                  end
                  item
                    Borders = []
                    BorderPen.Color = clSilver
                    CheckFalse = 'N'
                    CheckTrue = 'Y'
                    Color = clWindow
                    FieldName = 'usr$sumncuwithdiscount'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    Header = #1057#1091#1084#1084#1072' '#1089#1086' '#1089#1082#1080#1076#1082#1086#1081
                    HeaderFont.Charset = DEFAULT_CHARSET
                    HeaderFont.Color = clWindowText
                    HeaderFont.Height = -11
                    HeaderFont.Name = 'Tahoma'
                    HeaderFont.Style = []
                    PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
                    PrintFont.Charset = DEFAULT_CHARSET
                    PrintFont.Color = clWindowText
                    PrintFont.Height = -11
                    PrintFont.Name = 'Tahoma'
                    PrintFont.Style = []
                    Width = 134
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
                  312
                  73
                  130
                  134)
              end
            end
            object tsManagerPage: TAdvTabSheet
              Caption = 'tsManagerPage'
              Color = 14986888
              ColorTo = clNone
              ImageIndex = 2
              TabColor = clBtnFace
              TabColorTo = clNone
              object pnlManagerTop: TPanel
                Left = 0
                Top = 0
                Width = 674
                Height = 65
                Align = alTop
                TabOrder = 0
                DesignSize = (
                  674
                  65)
                object btnUsersUp: TButton
                  Left = 23
                  Top = 6
                  Width = 90
                  Height = 53
                  Action = actUsersDown
                  Anchors = [akRight, akBottom]
                  TabOrder = 0
                end
                object btnUsersDown: TButton
                  Left = 120
                  Top = 6
                  Width = 89
                  Height = 53
                  Action = actUsersUp
                  Anchors = [akRight, akBottom]
                  TabOrder = 1
                end
                object btnUserLeft: TButton
                  Left = 495
                  Top = 6
                  Width = 90
                  Height = 53
                  Action = actUserLeft
                  Anchors = [akRight, akBottom]
                  TabOrder = 2
                end
                object btnUserRight: TButton
                  Left = 592
                  Top = 6
                  Width = 89
                  Height = 53
                  Action = actUserRight
                  Anchors = [akRight, akBottom]
                  TabOrder = 3
                end
              end
              object pnlManagerMain: TPanel
                Left = 0
                Top = 65
                Width = 674
                Height = 562
                Align = alClient
                TabOrder = 1
                object pnlUsers: TPanel
                  Left = 1
                  Top = 1
                  Width = 192
                  Height = 493
                  Align = alLeft
                  TabOrder = 0
                end
                object pnlUserOrders: TPanel
                  Left = 193
                  Top = 1
                  Width = 480
                  Height = 493
                  Align = alClient
                  TabOrder = 1
                end
                object pnlManagerBottom: TPanel
                  Left = 1
                  Top = 494
                  Width = 672
                  Height = 67
                  Align = alBottom
                  TabOrder = 2
                  object btnPredCheck: TButton
                    Left = 200
                    Top = 8
                    Width = 201
                    Height = 49
                    Caption = 'btnPredCheck'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -19
                    Font.Name = 'Times New Roman'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                    OnClick = btnPredCheckClick
                  end
                end
              end
            end
          end
        end
      end
    end
    object sbMain: TStatusBar
      Left = 0
      Top = 685
      Width = 1016
      Height = 19
      Panels = <>
    end
    object pnlExtra: TPanel
      Left = 0
      Top = 0
      Width = 82
      Height = 685
      Align = alLeft
      Color = 14986888
      TabOrder = 2
      object pcExtraButton: TPageControl
        Left = 1
        Top = 1
        Width = 80
        Height = 683
        ActivePage = tsFunctionButton
        Align = alClient
        TabOrder = 0
        object tsMainButton: TTabSheet
          Caption = 'tsMainButton'
          object Button18: TButton
            Left = 0
            Top = 164
            Width = 72
            Height = 50
            TabOrder = 0
            Visible = False
          end
          object Button19: TButton
            Left = 0
            Top = 218
            Width = 72
            Height = 50
            TabOrder = 1
            Visible = False
          end
          object btnExitWindows: TAdvSmoothButton
            Left = 0
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
            TabOrder = 2
            Version = '1.6.9.0'
          end
          object btnRestartRest: TAdvSmoothButton
            Left = 0
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
            TabOrder = 3
            Version = '1.6.9.0'
          end
          object btnEditReport: TAdvSmoothButton
            Left = 0
            Top = 109
            Width = 72
            Height = 50
            Action = actEditReport
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
        end
        object tsFunctionButton: TTabSheet
          Caption = 'tsFunctionButton'
          ImageIndex = 1
          object Button14: TButton
            Left = 0
            Top = 620
            Width = 72
            Height = 50
            Caption = '1'
            TabOrder = 0
            Visible = False
            OnClick = Button14Click
          end
          object btnAddQuantity: TAdvSmoothButton
            Left = 0
            Top = 1
            Width = 72
            Height = 50
            Action = actAddQuantity
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
          object btnRemoveQuantity: TAdvSmoothButton
            Left = 0
            Top = 56
            Width = 72
            Height = 50
            Action = actRemoveQuantity
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
            TabOrder = 2
            Version = '1.6.9.0'
          end
          object btnDeletePosition: TAdvSmoothButton
            Left = 0
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
            TabOrder = 3
            Version = '1.6.9.0'
          end
          object btnCutCheck: TAdvSmoothButton
            Left = 0
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
            TabOrder = 4
            Version = '1.6.9.0'
          end
          object btnPreCheck: TAdvSmoothButton
            Left = 0
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
            TabOrder = 5
            Version = '1.6.9.0'
          end
          object btnCancelPreCheck: TAdvSmoothButton
            Left = 0
            Top = 280
            Width = 72
            Height = 50
            Action = actCancelPreCheck
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
            Version = '1.6.9.0'
          end
          object btnModification: TAdvSmoothButton
            Left = 0
            Top = 336
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
            TabOrder = 7
            Version = '1.6.9.0'
          end
          object btnKeyBoard: TAdvSmoothButton
            Left = 0
            Top = 392
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
            TabOrder = 8
            Version = '1.6.9.0'
          end
          object btnDiscount: TAdvSmoothButton
            Left = 0
            Top = 448
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
            TabOrder = 9
            Version = '1.6.9.0'
          end
          object btnPay: TAdvSmoothButton
            Left = 0
            Top = 504
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
            TabOrder = 10
            Version = '1.6.9.0'
          end
          object btnDevide: TAdvSmoothButton
            Left = 0
            Top = 560
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
            TabOrder = 11
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
    end
    object actScrollDown: TAction
      Category = 'menu'
      OnExecute = actScrollDownExecute
    end
    object actGoodUp: TAction
      Category = 'menu'
      OnExecute = actGoodUpExecute
    end
    object actGoodDown: TAction
      Category = 'menu'
      OnExecute = actGoodDownExecute
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
    end
    object actUsersUp: TAction
      Category = 'menu'
      Caption = #1042#1074#1077#1088#1093
      OnExecute = actUsersUpExecute
    end
    object actUsersDown: TAction
      Category = 'menu'
      Caption = #1042#1085#1080#1079
      OnExecute = actUsersDownExecute
    end
    object actDevide: TAction
      Category = 'menu'
      Caption = '0,000'
      OnExecute = actDevideExecute
      OnUpdate = actDevideUpdate
    end
    object actUserLeft: TAction
      Category = 'menu'
      Caption = '<'
      OnExecute = actUserLeftExecute
    end
    object actUserRight: TAction
      Category = 'menu'
      Caption = '>'
      OnExecute = actUserRightExecute
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
    object actEditReport: TAction
      Category = 'menu'
      Caption = #1064#1072#1073#1083#1086#1085#1099
      OnExecute = actEditReportExecute
    end
  end
  object dsMain: TDataSource
    Left = 536
    Top = 64
  end
  object TouchKeyBoard: TAdvSmoothPopupTouchKeyBoard
    KeyboardType = ktQWERTY
    Left = 424
    Top = 64
  end
  object FrontTimer: TTimer
    Enabled = False
    Interval = 30000
    OnTimer = FrontTimerTimer
    Left = 496
    Top = 352
  end
end
