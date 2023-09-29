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
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
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
        Value = 20.000000000000000000
      end
      item
        Value = 20.000000000000000000
      end
      item
        Value = 20.000000000000000000
      end
      item
        Value = 20.000000000000000000
      end
      item
        Value = 20.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 3
        Control = btnAdd
        Row = 1
      end
      item
        Column = 3
        Control = btnDelete
        Row = 2
      end
      item
        Column = 3
        Control = btnList
        Row = 3
      end
      item
        Column = 3
        Control = btnCapacity
        Row = 6
      end
      item
        Column = 4
        Control = btnCount
        Row = 4
      end
      item
        Column = 4
        Control = btnOnNotify
        Row = 5
      end
      item
        Column = 0
        ColumnSpan = 3
        Control = Memo1
        Row = 1
        RowSpan = 6
      end
      item
        Column = 0
        Control = SpinEdit1
        Row = 0
      end
      item
        Column = 4
        Control = btnExtract
        Row = 2
      end
      item
        Column = 4
        Control = btnInsert
        Row = 1
      end
      item
        Column = 4
        Control = btnSort
        Row = 3
      end
      item
        Column = 3
        Control = btnReverse
        Row = 4
      end
      item
        Column = 4
        Control = btnTrimExcess
        Row = 6
      end
      item
        Column = 3
        Control = btnClear
        Row = 5
      end>
    RowCollection = <
      item
        Value = 14.285714285714290000
      end
      item
        Value = 14.285714285714290000
      end
      item
        Value = 14.285714285714290000
      end
      item
        Value = 14.285714285714290000
      end
      item
        Value = 14.285714285714290000
      end
      item
        Value = 14.285714285714290000
      end
      item
        Value = 14.285714285714270000
      end>
    TabOrder = 0
    ExplicitWidth = 604
    ExplicitHeight = 421
    DesignSize = (
      608
      422)
    object btnAdd: TSpeedButton
      Left = 371
      Top = 73
      Width = 108
      Height = 35
      Margins.Left = 10
      Margins.Top = 15
      Margins.Right = 5
      Margins.Bottom = 15
      Anchors = []
      Caption = 'Add'
      OnClick = btnAddClick
      ExplicitTop = 12
    end
    object btnDelete: TSpeedButton
      Left = 371
      Top = 133
      Width = 108
      Height = 35
      Margins.Left = 10
      Margins.Top = 15
      Margins.Right = 5
      Margins.Bottom = 15
      Anchors = []
      Caption = 'Delete'
      OnClick = btnDeleteClick
      ExplicitTop = 83
    end
    object btnList: TSpeedButton
      Left = 371
      Top = 193
      Width = 108
      Height = 35
      Margins.Left = 10
      Margins.Top = 15
      Margins.Right = 5
      Margins.Bottom = 15
      Anchors = []
      Caption = 'List'
      OnClick = btnListClick
      ExplicitLeft = 370
      ExplicitTop = 138
    end
    object btnCapacity: TSpeedButton
      Left = 371
      Top = 374
      Width = 108
      Height = 35
      Margins.Left = 10
      Margins.Top = 15
      Margins.Right = 5
      Margins.Bottom = 15
      Anchors = []
      Caption = 'Capacity'
      OnClick = btnCapacityClick
      ExplicitTop = 364
    end
    object btnCount: TSpeedButton
      Left = 493
      Top = 253
      Width = 108
      Height = 35
      Margins.Left = 10
      Margins.Top = 15
      Margins.Right = 5
      Margins.Bottom = 15
      Anchors = []
      Caption = 'Count'
      OnClick = btnCountClick
      ExplicitTop = 223
    end
    object btnOnNotify: TSpeedButton
      Left = 493
      Top = 314
      Width = 108
      Height = 35
      Margins.Left = 10
      Margins.Top = 15
      Margins.Right = 5
      Margins.Bottom = 15
      Anchors = []
      Caption = 'OnNotify'
      OnClick = btnOnNotifyClick
      ExplicitTop = 294
    end
    object Memo1: TMemo
      AlignWithMargins = True
      Left = 5
      Top = 65
      Width = 355
      Height = 352
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      TabStop = False
      Align = alClient
      ReadOnly = True
      TabOrder = 1
      ExplicitLeft = 247
      ExplicitTop = 366
      ExplicitWidth = 352
      ExplicitHeight = 50
    end
    object SpinEdit1: TSpinEdit
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 111
      Height = 24
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Anchors = []
      MaxValue = 1000
      MinValue = 1
      TabOrder = 0
      Value = 1
    end
    object btnExtract: TSpeedButton
      Left = 493
      Top = 133
      Width = 108
      Height = 35
      Margins.Left = 10
      Margins.Top = 15
      Margins.Right = 5
      Margins.Bottom = 15
      Anchors = []
      Caption = 'Extract'
      OnClick = btnExtractClick
      ExplicitTop = 83
    end
    object btnInsert: TSpeedButton
      Left = 493
      Top = 73
      Width = 108
      Height = 35
      Margins.Left = 10
      Margins.Top = 15
      Margins.Right = 5
      Margins.Bottom = 15
      Anchors = []
      Caption = 'Insert #2'
      OnClick = btnInsertClick
      ExplicitTop = 12
    end
    object btnSort: TSpeedButton
      Left = 493
      Top = 193
      Width = 108
      Height = 35
      Margins.Left = 10
      Margins.Top = 15
      Margins.Right = 5
      Margins.Bottom = 15
      Anchors = []
      Caption = 'Sort'
      OnClick = btnSortClick
      ExplicitTop = 153
    end
    object btnReverse: TSpeedButton
      Left = 371
      Top = 253
      Width = 108
      Height = 35
      Margins.Left = 10
      Margins.Top = 15
      Margins.Right = 5
      Margins.Bottom = 15
      Anchors = []
      Caption = 'Reverse'
      OnClick = btnReverseClick
      ExplicitTop = 223
    end
    object btnTrimExcess: TSpeedButton
      Left = 493
      Top = 374
      Width = 108
      Height = 35
      Margins.Left = 10
      Margins.Top = 15
      Margins.Right = 5
      Margins.Bottom = 15
      Anchors = []
      Caption = 'TrimExcess'
      OnClick = btnTrimExcessClick
      ExplicitTop = 364
    end
    object btnClear: TSpeedButton
      Left = 371
      Top = 314
      Width = 108
      Height = 35
      Margins.Left = 10
      Margins.Top = 15
      Margins.Right = 5
      Margins.Bottom = 15
      Anchors = []
      Caption = 'Clear'
      OnClick = btnClearClick
      ExplicitTop = 294
    end
  end
end
