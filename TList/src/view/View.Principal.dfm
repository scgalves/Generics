object ViewPrincipal: TViewPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'TList'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  TextHeight = 15
  object GridPanel1: TGridPanel
    AlignWithMargins = True
    Left = 10
    Top = 10
    Width = 608
    Height = 422
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alClient
    BevelOuter = bvNone
    ColumnCollection = <
      item
        Value = 33.333333333333340000
      end
      item
        Value = 33.333333333333340000
      end
      item
        Value = 33.333333333333340000
      end>
    ControlCollection = <
      item
        Column = 1
        ColumnSpan = 2
        Control = Memo1
        Row = 1
        RowSpan = 5
      end
      item
        Column = 0
        Control = RadioGroup1
        Row = 0
        RowSpan = 5
      end
      item
        Column = 0
        Control = btnOk
        Row = 5
      end
      item
        Column = 1
        Control = Panel1
        Row = 0
      end>
    RowCollection = <
      item
        Value = 16.666666666666670000
      end
      item
        Value = 16.666666666666670000
      end
      item
        Value = 16.666666666666670000
      end
      item
        Value = 16.666666666666670000
      end
      item
        Value = 16.666666666666670000
      end
      item
        Value = 16.666666666666670000
      end>
    TabOrder = 0
    ExplicitWidth = 604
    ExplicitHeight = 421
    DesignSize = (
      608
      422)
    object Memo1: TMemo
      AlignWithMargins = True
      Left = 213
      Top = 80
      Width = 385
      Height = 332
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      TabStop = False
      Align = alClient
      ReadOnly = True
      TabOrder = 0
    end
    object RadioGroup1: TRadioGroup
      AlignWithMargins = True
      Left = 10
      Top = 10
      Width = 183
      Height = 332
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alClient
      Caption = 'Op'#231#245'es'
      Items.Strings = (
        'Add'
        'Insert #2'
        'Delete'
        'Extract'
        'List'
        'Sort'
        'Reverse'
        'Count'
        'Clear'
        'OnNotify'
        'Capacity'
        'TrimExcess')
      TabOrder = 1
      OnClick = RadioGroup1Click
    end
    object btnOk: TSpeedButton
      Left = 61
      Top = 376
      Width = 80
      Height = 22
      Anchors = []
      Caption = 'OK (F2)'
      OnClick = btnOkClick
      ExplicitLeft = 76
    end
    object Panel1: TPanel
      Left = 203
      Top = 0
      Width = 202
      Height = 70
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object Label1: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 10
        Width = 182
        Height = 15
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 0
        Align = alTop
        Caption = 'Selecione um valor'
        ExplicitWidth = 100
      end
      object SpinEdit1: TSpinEdit
        AlignWithMargins = True
        Left = 10
        Top = 35
        Width = 182
        Height = 24
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 0
        Align = alTop
        MaxValue = 1000
        MinValue = 1
        TabOrder = 0
        Value = 1
      end
    end
  end
end
