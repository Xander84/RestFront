object DBGridEhFindDlg: TDBGridEhFindDlg
  Left = 236
  Top = 110
  BorderStyle = bsDialog
  Caption = '�����'
  ClientHeight = 141
  ClientWidth = 467
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 9
    Top = 11
    Width = 54
    Height = 12
    Caption = '&�������:'
  end
  object Label2: TLabel
    Left = 9
    Top = 32
    Width = 49
    Height = 12
    Caption = '&����� �:'
  end
  object cbMatchType: TLabel
    Left = 9
    Top = 53
    Width = 74
    Height = 12
    Caption = '&����������:'
  end
  object Label3: TLabel
    Left = 9
    Top = 76
    Width = 58
    Height = 12
    Caption = '����&����:'
  end
  object Label4: TLabel
    Left = 8
    Top = 119
    Width = 97
    Height = 12
    Caption = '������ � ������:'
  end
  object cbText: TDBComboBoxEh
    Left = 81
    Top = 8
    Width = 292
    Height = 20
    DropDownBox.Rows = 17
    DropDownBox.Sizable = True
    EditButtons = <>
    TabOrder = 0
    Text = 'cbText'
    Visible = True
    OnChange = cbTextChange
  end
  object bFind: TButton
    Left = 380
    Top = 8
    Width = 80
    Height = 22
    Caption = '��&��� �����'
    TabOrder = 6
    OnClick = bFindClick
  end
  object bCancel: TButton
    Left = 380
    Top = 35
    Width = 80
    Height = 22
    Cancel = True
    Caption = '�������'
    ModalResult = 2
    TabOrder = 7
    OnClick = bCancelClick
  end
  object cbFindIn: TDBComboBoxEh
    Left = 81
    Top = 29
    Width = 178
    Height = 20
    DropDownBox.Rows = 17
    DropDownBox.Sizable = True
    EditButtons = <>
    TabOrder = 1
    Text = 'cbFindIn'
    Visible = True
    OnChange = cbFindInChange
  end
  object cbMatchinType: TDBComboBoxEh
    Left = 81
    Top = 51
    Width = 134
    Height = 20
    EditButtons = <>
    Items.Strings = (
      '� ����� ����� ����'
      '���� �������'
      '� ������ ����')
    KeyItems.Strings = (
      '� ����� ����� ����'
      '���� �������'
      '� ������ ����')
    TabOrder = 2
    Text = '� ����� ����� ����'
    Visible = True
  end
  object cbFindDirection: TDBComboBoxEh
    Left = 81
    Top = 73
    Width = 134
    Height = 20
    EditButtons = <>
    Items.Strings = (
      '�����'
      '����'
      '���')
    KeyItems.Strings = (
      '�����'
      '����'
      '���')
    TabOrder = 3
    Text = '���'
    Visible = True
    OnChange = cbTextChange
  end
  object cbCharCase: TDBCheckBoxEh
    Left = 81
    Top = 97
    Width = 134
    Height = 13
    Caption = '� ������ ��&������'
    TabOrder = 4
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object cbUseFormat: TDBCheckBoxEh
    Left = 240
    Top = 97
    Width = 133
    Height = 13
    Caption = '� �&����� �������'
    Checked = True
    State = cbChecked
    TabOrder = 5
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object dbcTreeFindRange: TDBComboBoxEh
    Left = 112
    Top = 115
    Width = 140
    Height = 20
    EditButtons = <>
    Items.Strings = (
      '�� ���� ������'
      '� ��������� ������'
      '� ������� ������'
      '� ������� �����')
    KeyItems.Strings = (
      '�� ���� ������'
      '� ��������� ������'
      '� ������� ������'
      '� ������� �����')
    TabOrder = 8
    Text = '�� ���� ������'
    Visible = True
    OnChange = cbTextChange
  end
end
