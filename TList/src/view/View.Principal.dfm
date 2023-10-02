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
        Value = 12.500000000000000000
      end
      item
        Value = 12.500000000000000000
      end
      item
        Value = 12.500000000000000000
      end
      item
        Value = 12.500000000000000000
      end
      item
        Value = 12.500000000000000000
      end
      item
        Value = 12.500000000000000000
      end
      item
        Value = 12.500000000000000000
      end
      item
        Value = 12.500000000000000000
      end>
    ControlCollection = <
      item
        Column = 4
        ColumnSpan = 4
        Control = Memo1
        Row = 1
        RowSpan = 7
      end
      item
        Column = 0
        ColumnSpan = 4
        Control = RadioGroup1
        Row = 0
        RowSpan = 7
      end
      item
        Column = 1
        ColumnSpan = 2
        Control = btnOk
        Row = 7
      end
      item
        Column = 4
        ColumnSpan = 2
        Control = Panel1
        Row = 0
      end>
    RowCollection = <
      item
        Value = 12.500000000000000000
      end
      item
        Value = 12.500000000000000000
      end
      item
        Value = 12.500000000000000000
      end
      item
        Value = 12.500000000000000000
      end
      item
        Value = 12.500000000000000000
      end
      item
        Value = 12.500000000000000000
      end
      item
        Value = 12.500000000000000000
      end
      item
        Value = 12.500000000000000000
      end>
    TabOrder = 0
    ExplicitWidth = 604
    ExplicitHeight = 421
    DesignSize = (
      608
      422)
    object Memo1: TMemo
      AlignWithMargins = True
      Left = 314
      Top = 63
      Width = 284
      Height = 349
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      TabStop = False
      Align = alClient
      ReadOnly = True
      TabOrder = 0
      ExplicitLeft = 211
      ExplicitTop = 80
      ExplicitWidth = 383
      ExplicitHeight = 331
    end
    object RadioGroup1: TRadioGroup
      AlignWithMargins = True
      Left = 10
      Top = 10
      Width = 284
      Height = 349
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alClient
      Caption = 'Op'#231#245'es'
      Columns = 2
      Items.Strings = (
        'Add'
        'Insert #1'
        'Delete'
        'Extract'
        'List'
        'Sort'
        'Reverse'
        'IndexOf'
        'LastIndexOf'
        'Contains'
        'Last'
        'Exchange #1 -> #0'
        'Count'
        'Clear'
        'OnNotify'
        'Capacity'
        'TrimExcess')
      TabOrder = 1
      OnClick = RadioGroup1Click
      ExplicitWidth = 181
      ExplicitHeight = 331
    end
    object btnOk: TSpeedButton
      Left = 112
      Top = 384
      Width = 80
      Height = 22
      Anchors = []
      Caption = 'OK (F2)'
      OnClick = btnOkClick
      ExplicitLeft = 76
      ExplicitTop = 376
    end
    object Panel1: TPanel
      Left = 304
      Top = 0
      Width = 152
      Height = 53
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      ExplicitLeft = 264
      ExplicitTop = -3
      ExplicitWidth = 173
      object Label1: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 10
        Width = 132
        Height = 15
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 0
        Align = alTop
        Caption = 'Selecione um n'#250'mero'
        ExplicitWidth = 116
      end
      object SpinEdit1: TSpinEdit
        AlignWithMargins = True
        Left = 10
        Top = 28
        Width = 132
        Height = 24
        Margins.Left = 10
        Margins.Right = 10
        Margins.Bottom = 0
        Align = alTop
        MaxValue = 1000
        MinValue = 1
        TabOrder = 0
        Value = 1
        ExplicitTop = 35
        ExplicitWidth = 182
      end
    end
  end
end
