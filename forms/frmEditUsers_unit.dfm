inherited EditUsers: TEditUsers
  Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TAdvPanel
    FullHeight = 0
    object btnAddUser: TAdvSmoothButton
      Left = 327
      Top = 51
      Width = 107
      Height = 37
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWindowText
      Appearance.Font.Height = -11
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
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Color = 15195349
      ParentFont = False
      TabOrder = 3
      Version = '1.6.9.0'
      OnClick = btnAddUserClick
    end
  end
end
