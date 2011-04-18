inherited DevideForm: TDevideForm
  Caption = 'DevideForm'
  OldCreateOrder = True
  ExplicitWidth = 456
  ExplicitHeight = 534
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TAdvPanel
    FullHeight = 0
    inherited lblMain: TLabel
      Height = 33
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      Font.Name = 'Tahoma'
      Layout = tlCenter
      ExplicitWidth = 144
      ExplicitHeight = 33
    end
    inherited edtNumber: TEdit
      Alignment = taRightJustify
      Font.Name = 'Tahoma'
    end
    inherited TouchKeyBoard: TAdvSmoothTouchKeyBoard
      Width = 431
      KeyDistance = 2
      Keys = <
        item
          Caption = '7'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 4
          Y = 2
          Height = 79
          Width = 141
          SubKeys = <>
        end
        item
          Caption = '8'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 145
          Y = 2
          Height = 79
          Width = 141
          SubKeys = <>
        end
        item
          Caption = '9'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 286
          Y = 2
          Height = 79
          Width = 141
          SubKeys = <>
        end
        item
          Caption = '4'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 4
          Y = 81
          Height = 79
          Width = 141
          SubKeys = <>
        end
        item
          Caption = '5'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 145
          Y = 81
          Height = 79
          Width = 141
          SubKeys = <>
        end
        item
          Caption = '6'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 286
          Y = 81
          Height = 79
          Width = 141
          SubKeys = <>
        end
        item
          Caption = '1'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 4
          Y = 160
          Height = 79
          Width = 141
          SubKeys = <>
        end
        item
          Caption = '2'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 145
          Y = 160
          Height = 79
          Width = 141
          SubKeys = <>
        end
        item
          Caption = '3'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 286
          Y = 160
          Height = 79
          Width = 141
          SubKeys = <>
        end
        item
          Caption = ','
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 4
          Y = 240
          Height = 79
          Width = 141
          SubKeys = <>
        end
        item
          Caption = '0'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skNone
          X = 145
          Y = 240
          Height = 79
          Width = 141
          SubKeys = <>
        end
        item
          Caption = 'Back'
          KeyValue = 8
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          SpecialKey = skBackSpace
          Color = 10526880
          X = 286
          Y = 240
          Height = 79
          Width = 141
          SubKeys = <>
        end>
      SmallFont.Name = 'Tahoma'
      Font.Name = 'Tahoma'
      ExplicitWidth = 431
    end
    inherited btnOK: TAdvSmoothButton
      Height = 54
      Appearance.PictureAlignment = taCenter
      Appearance.Font.Height = -11
      Appearance.Font.Name = 'Tahoma'
      Appearance.Layout = blPictureTop
      ExplicitHeight = 54
    end
    inherited btnCancel: TAdvSmoothButton
      Height = 54
      Appearance.PictureAlignment = taCenter
      Appearance.Font.Height = -11
      Appearance.Font.Name = 'Tahoma'
      Appearance.Layout = blPictureTop
      ExplicitHeight = 54
    end
  end
end
