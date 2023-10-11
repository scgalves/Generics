object ViewPrincipal: TViewPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'TDictionary'
  ClientHeight = 442
  ClientWidth = 788
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
    Width = 768
    Height = 422
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alClient
    BevelOuter = bvNone
    ColumnCollection = <
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
    ControlCollection = <
      item
        Column = 3
        ColumnSpan = 4
        Control = Memo1
        Row = 1
        RowSpan = 7
      end
      item
        Column = 0
        ColumnSpan = 3
        Control = RadioGroup1
        Row = 0
        RowSpan = 7
      end
      item
        Column = 1
        Control = btnOk
        Row = 7
      end
      item
        Column = 3
        ColumnSpan = 4
        Control = grdCpfNome
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
    ExplicitWidth = 764
    ExplicitHeight = 421
    DesignSize = (
      768
      422)
    object Memo1: TMemo
      AlignWithMargins = True
      Left = 339
      Top = 63
      Width = 419
      Height = 349
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      TabStop = False
      Align = alClient
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 2
      ExplicitLeft = 337
      ExplicitWidth = 417
      ExplicitHeight = 348
    end
    object RadioGroup1: TRadioGroup
      AlignWithMargins = True
      Left = 10
      Top = 10
      Width = 309
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
        'AddOrSetValue'
        'Remove (A)'
        'Keys'
        'Values'
        'TryGetValue (A)'
        'ContainsKey (A)'
        'ContainsValue (A e B)'
        'ExtractPair (A)'
        'Count'
        'Clear'
        'OnKeyNotify'
        'OnValueNotify'
        'Capacity'
        'TrimExcess')
      TabOrder = 0
      OnClick = RadioGroup1Click
      ExplicitWidth = 307
      ExplicitHeight = 348
    end
    object btnOk: TSpeedButton
      Left = 124
      Top = 384
      Width = 80
      Height = 22
      Anchors = []
      Caption = 'OK (F2)'
      OnClick = btnOkClick
      ExplicitLeft = 76
      ExplicitTop = 376
    end
    object grdCpfNome: TGridPanel
      Left = 329
      Top = 0
      Width = 439
      Height = 53
      Align = alClient
      BevelOuter = bvNone
      ColumnCollection = <
        item
          Value = 25.000000000000000000
        end
        item
          Value = 25.000000000000000000
        end
        item
          Value = 25.000000000000000000
        end
        item
          Value = 25.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          Control = edtCpf
          Row = 1
        end
        item
          Column = 0
          Control = lblCpf
          Row = 0
        end
        item
          Column = 1
          Control = lblNome
          Row = 0
        end
        item
          Column = 1
          ColumnSpan = 3
          Control = edtNome
          Row = 1
        end>
      RowCollection = <
        item
          Value = 50.000000000000000000
        end
        item
          Value = 50.000000000000000000
        end>
      TabOrder = 1
      ExplicitLeft = 327
      ExplicitWidth = 437
      object edtCpf: TEdit
        AlignWithMargins = True
        Left = 10
        Top = 29
        Width = 100
        Height = 23
        Margins.Left = 10
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        TabOrder = 0
        ExplicitWidth = 99
      end
      object lblCpf: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 10
        Width = 90
        Height = 15
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 0
        Align = alTop
        Caption = 'CPF (A)'
        ExplicitWidth = 40
      end
      object lblNome: TLabel
        AlignWithMargins = True
        Left = 120
        Top = 10
        Width = 90
        Height = 15
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 0
        Align = alTop
        Caption = 'Nome (B)'
        ExplicitWidth = 51
      end
      object edtNome: TEdit
        AlignWithMargins = True
        Left = 120
        Top = 29
        Width = 309
        Height = 23
        Margins.Left = 10
        Margins.Right = 10
        Margins.Bottom = 0
        Align = alTop
        TabOrder = 1
        ExplicitLeft = 119
        ExplicitWidth = 308
      end
    end
  end
end
