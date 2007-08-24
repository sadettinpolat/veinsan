object frmSlayt: TfrmSlayt
  Left = 186
  Top = 197
  BorderStyle = bsNone
  Caption = 'frmSlayt'
  ClientHeight = 453
  ClientWidth = 688
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object suiSideChannel1: TsuiSideChannel
    Left = 0
    Top = 0
    Width = 185
    Height = 453
    Cursor = crHandPoint
    UIStyle = MacOS
    BorderColor = 8355711
    CaptionFontColor = clBlack
    ShowButton = True
    SideBarColor = 15198183
    Caption = 'Slayt Ayarlar'#305
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Align = suiLeft
    StayOn = True
    Color = clWhite
    ParentFont = False
    PopupMode = suiMouseClick
    QuickMove = False
    SideBarWidth = 10
    object suiPanel1: TsuiPanel
      Left = 13
      Top = 24
      Width = 169
      Height = 57
      UIStyle = MacOS
      BorderColor = 8355711
      Caption = 'Zaman Ayar'#305
      ShowButton = True
      CaptionFontColor = clBlack
      Align = alTop
      TabOrder = 0
      Color = clWhite
      object Label2: TLabel
        Left = 5
        Top = 29
        Width = 76
        Height = 13
        Caption = 'Aral'#305'k (Saniye) :'
      end
      object suiSpinEdit1: TsuiSpinEdit
        Left = 85
        Top = 26
        Width = 73
        Height = 19
        UIStyle = MacOS
        BorderColor = 8355711
        TabOrder = 0
        Text = '5'
        OnChange = suiSpinEdit1Change
        Increment = 1
        MaxValue = 0
        MinValue = 0
        Value = 5
      end
    end
    object suiPanel2: TsuiPanel
      Left = 13
      Top = 81
      Width = 169
      Height = 168
      UIStyle = MacOS
      BorderColor = 8355711
      Caption = #304#351'lemler ['#304'leri, Geri, Durdur]'
      ShowButton = True
      CaptionFontColor = clBlack
      Align = alTop
      TabOrder = 1
      Color = clWhite
      object suiButton1: TsuiButton
        Left = 8
        Top = 32
        Width = 153
        Height = 27
        Cursor = crHandPoint
        Caption = '&Durdur'
        AutoSize = False
        UIStyle = MacOS
        TabOrder = 0
        Transparent = True
        ModalResult = 0
        FocusedRectMargin = 2
        Layout = blGlyphLeft
        Spacing = 4
        MouseContinuouslyDownInterval = 100
        OnClick = suiButton1Click
        ResHandle = 0
      end
      object suiButton2: TsuiButton
        Left = 8
        Top = 64
        Width = 153
        Height = 27
        Cursor = crHandPoint
        Caption = #304'l&eri >>'
        AutoSize = False
        UIStyle = MacOS
        TabOrder = 1
        Transparent = True
        ModalResult = 0
        FocusedRectMargin = 2
        Layout = blGlyphLeft
        Spacing = 4
        MouseContinuouslyDownInterval = 100
        OnClick = suiButton2Click
        ResHandle = 0
      end
      object suiButton3: TsuiButton
        Left = 8
        Top = 96
        Width = 153
        Height = 27
        Cursor = crHandPoint
        Caption = '<< &Geri'
        AutoSize = False
        UIStyle = MacOS
        TabOrder = 2
        Transparent = True
        ModalResult = 0
        FocusedRectMargin = 2
        Layout = blGlyphLeft
        Spacing = 4
        MouseContinuouslyDownInterval = 100
        OnClick = suiButton3Click
        ResHandle = 0
      end
      object suiButton4: TsuiButton
        Left = 8
        Top = 128
        Width = 153
        Height = 27
        Cursor = crHandPoint
        Caption = #199#305'&k'#305#351
        AutoSize = False
        UIStyle = MacOS
        TabOrder = 3
        Transparent = True
        ModalResult = 0
        FocusedRectMargin = 2
        Layout = blGlyphLeft
        Spacing = 4
        MouseContinuouslyDownInterval = 100
        OnClick = suiButton4Click
        ResHandle = 0
      end
    end
    object suiPanel3: TsuiPanel
      Left = 13
      Top = 249
      Width = 169
      Height = 146
      UIStyle = MacOS
      BorderColor = 8355711
      Caption = 'Bilgi [Dosya Ad'#305', Boyutu]'
      ShowButton = True
      CaptionFontColor = clBlack
      Align = alTop
      TabOrder = 2
      Color = clWhite
      object Label3: TLabel
        Left = 4
        Top = 25
        Width = 161
        Height = 13
        Cursor = crHandPoint
        Align = alTop
        Caption = 'Label3'
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentColor = False
        ParentFont = False
        Transparent = True
        Layout = tlCenter
        WordWrap = True
        OnClick = Label3Click
        OnMouseEnter = Label3MouseEnter
        OnMouseLeave = Label3MouseLeave
      end
      object Label4: TLabel
        Left = 4
        Top = 38
        Width = 161
        Height = 13
        Cursor = crHandPoint
        Align = alTop
        Caption = 'Boyut 25 KB'
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        Layout = tlCenter
      end
      object Label5: TLabel
        Left = 4
        Top = 51
        Width = 161
        Height = 13
        Cursor = crHandPoint
        Align = alTop
        Caption = 'Resim No:0'
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        Layout = tlCenter
      end
    end
    object suiPanel4: TsuiPanel
      Left = 13
      Top = 395
      Width = 169
      Height = 100
      UIStyle = MacOS
      BorderColor = 8355711
      Caption = 'K'#305'sayollar'
      ShowButton = True
      CaptionFontColor = clBlack
      Align = alTop
      TabOrder = 3
      Color = clWhite
      object Label6: TLabel
        Left = 4
        Top = 38
        Width = 161
        Height = 13
        Align = alTop
        Caption = 'Geri = Page Up'
      end
      object Label7: TLabel
        Left = 4
        Top = 25
        Width = 161
        Height = 13
        Align = alTop
        Caption = #304'leri = Page Down'
      end
      object Label8: TLabel
        Left = 4
        Top = 64
        Width = 161
        Height = 13
        Align = alTop
        Caption = #199#305'k'#305#351' = ESC'
      end
      object Label9: TLabel
        Left = 4
        Top = 51
        Width = 161
        Height = 13
        Align = alTop
        Caption = 'Durdur / Devam Et = Pause'
      end
    end
  end
  object Panel1: TPanel
    Left = 185
    Top = 0
    Width = 503
    Height = 453
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 1
    object Label1: TLabel
      Left = 0
      Top = 19
      Width = 503
      Height = 25
      Align = alTop
      Alignment = taCenter
      Caption = 'Label1'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      Layout = tlCenter
    end
    object suiMemo1: TMemo
      Left = 0
      Top = 313
      Width = 503
      Height = 140
      Align = alBottom
      Alignment = taCenter
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clWhite
      Lines.Strings = (
        'suiMemo1')
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object ScrollBox1: TScrollBox
      Left = 0
      Top = 44
      Width = 503
      Height = 269
      VertScrollBar.Range = 200
      VertScrollBar.Smooth = True
      VertScrollBar.Tracking = True
      Align = alClient
      AutoScroll = False
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clWhite
      ParentColor = False
      TabOrder = 1
      object Image1: TImage
        Left = 0
        Top = 0
        Width = 503
        Height = 269
        Align = alClient
        AutoSize = True
        Center = True
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 503
      Height = 19
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 2
    end
  end
  object suiThemeManager1: TsuiThemeManager
    UIStyle = MacOS
    CompList.Strings = (
      'suiSideChannel1'
      'suiPanel1'
      'suiSpinEdit1'
      'suiPanel2'
      'suiButton1'
      'suiButton2'
      'suiButton3'
      'suiPanel3'
      'suiPanel4'
      'suiButton4')
    Left = 192
    Top = 416
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 224
    Top = 417
  end
end
