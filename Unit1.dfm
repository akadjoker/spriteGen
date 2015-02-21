object Form1: TForm1
  Left = 71
  Top = 52
  Width = 1123
  Height = 630
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnMouseWheel = FormMouseWheel
  PixelsPerInch = 96
  TextHeight = 13
  object Label21: TLabel
    Left = 32
    Top = 32
    Width = 37
    Height = 13
    Caption = 'Label21'
  end
  object Panel2: TPanel
    Left = 922
    Top = 0
    Width = 185
    Height = 572
    Align = alRight
    Caption = 'Panel2'
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 183
      Height = 570
      ActivePage = TabSheet4
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Camera'
        object Label5: TLabel
          Left = 8
          Top = 184
          Width = 31
          Height = 13
          Caption = 'Label5'
        end
        object Label19: TLabel
          Left = 64
          Top = 184
          Width = 37
          Height = 13
          Caption = 'Label19'
        end
        object Label20: TLabel
          Left = 120
          Top = 184
          Width = 37
          Height = 13
          Caption = 'Label20'
        end
        object TrackBar3: TTrackBar
          Left = 8
          Top = 24
          Width = 33
          Height = 150
          Max = 255
          Orientation = trVertical
          Position = 255
          TabOrder = 0
          OnChange = TrackBar3Change
        end
        object TrackBar9: TTrackBar
          Left = 63
          Top = 24
          Width = 33
          Height = 150
          Max = 255
          Orientation = trVertical
          TabOrder = 1
          OnChange = TrackBar9Change
        end
        object TrackBar10: TTrackBar
          Left = 112
          Top = 24
          Width = 33
          Height = 150
          Max = 255
          Orientation = trVertical
          Position = 255
          TabOrder = 2
          OnChange = TrackBar10Change
        end
        object CheckBox3: TCheckBox
          Left = 16
          Top = 264
          Width = 97
          Height = 17
          Caption = 'Show Box'
          Checked = True
          State = cbChecked
          TabOrder = 3
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Animation'
        ImageIndex = 1
        object Label10: TLabel
          Left = 16
          Top = 312
          Width = 37
          Height = 13
          Caption = 'Label10'
        end
        object Label11: TLabel
          Left = 96
          Top = 312
          Width = 37
          Height = 13
          Caption = 'Label11'
        end
        object Label13: TLabel
          Left = 64
          Top = 152
          Width = 53
          Height = 13
          Caption = 'Max Frame'
        end
        object Label14: TLabel
          Left = 64
          Top = 112
          Width = 49
          Height = 13
          Caption = 'Min Frame'
        end
        object Label15: TLabel
          Left = 59
          Top = 194
          Width = 63
          Height = 13
          Caption = 'Frame Speed'
        end
        object Label1: TLabel
          Left = 15
          Top = 344
          Width = 31
          Height = 13
          Caption = 'Label1'
        end
        object Label2: TLabel
          Left = 16
          Top = 368
          Width = 31
          Height = 13
          Caption = 'Label2'
        end
        object TrackBar4: TTrackBar
          Left = 8
          Top = 56
          Width = 41
          Height = 249
          Max = 1000
          Orientation = trVertical
          TabOrder = 0
          TickMarks = tmBoth
        end
        object Button4: TButton
          Left = 112
          Top = 436
          Width = 49
          Height = 25
          Caption = 'Set'
          TabOrder = 1
          OnClick = Button4Click
        end
        object edit1: TEdit
          Left = 8
          Top = 440
          Width = 89
          Height = 21
          TabOrder = 2
          Text = 'stand'
        end
        object Edit2: TEdit
          Left = 64
          Top = 168
          Width = 65
          Height = 21
          TabOrder = 3
          Text = '100'
        end
        object Button5: TButton
          Left = 136
          Top = 160
          Width = 35
          Height = 25
          Caption = 'OK'
          TabOrder = 4
          OnClick = Button5Click
        end
        object CheckBox1: TCheckBox
          Left = 48
          Top = 24
          Width = 97
          Height = 17
          Caption = 'Manual'
          TabOrder = 5
        end
        object Edit3: TEdit
          Left = 64
          Top = 128
          Width = 65
          Height = 21
          TabOrder = 6
          Text = '0'
        end
        object Button6: TButton
          Left = 137
          Top = 128
          Width = 32
          Height = 25
          Caption = 'OK'
          TabOrder = 7
          OnClick = Button6Click
        end
        object Button7: TButton
          Left = 96
          Top = 240
          Width = 35
          Height = 25
          Caption = 'Ok'
          TabOrder = 8
          OnClick = Button7Click
        end
        object TrackBar8: TTrackBar
          Left = 56
          Top = 208
          Width = 113
          Height = 25
          Max = 50
          Position = 20
          TabOrder = 9
          OnChange = TrackBar8Change
        end
        object ComboBox: TComboBox
          Left = 8
          Top = 400
          Width = 161
          Height = 21
          ItemHeight = 13
          TabOrder = 10
          Text = 'Animation'
          OnChange = ComboBoxChange
          Items.Strings = (
            'STAND'
            'RUN'
            'ATTACK'
            'PAIN_A'
            'PAIN_B'
            'PAIN_C'
            'JUMP'
            'FLIP'
            'SALUTE'
            'TAUNT'
            'WAVE'
            'POINT'
            'CROUCH_STAND'
            'CROUCH_WALK'
            'CROUCH_ATTACK'
            'CROUCH_PAIN'
            'CROUCH_DEATH A'
            'CROUCH_DEATH B'
            'CROUCH_DEATH C')
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Transform'
        ImageIndex = 2
        object Label6: TLabel
          Left = 40
          Top = 8
          Width = 64
          Height = 13
          Caption = 'Rotate Model'
        end
        object Label7: TLabel
          Left = 12
          Top = 182
          Width = 6
          Height = 13
          Caption = 'x'
        end
        object Label8: TLabel
          Left = 64
          Top = 181
          Width = 6
          Height = 13
          Caption = 'y'
        end
        object Label9: TLabel
          Left = 122
          Top = 183
          Width = 5
          Height = 13
          Caption = 'z'
        end
        object Label18: TLabel
          Left = 19
          Top = 272
          Width = 3
          Height = 13
        end
        object Label12: TLabel
          Left = 52
          Top = 248
          Width = 56
          Height = 13
          Caption = 'Scale Model'
        end
        object Label22: TLabel
          Left = 28
          Top = 270
          Width = 6
          Height = 13
          Caption = 'x'
        end
        object Label23: TLabel
          Left = 128
          Top = 269
          Width = 6
          Height = 13
          Caption = 'y'
        end
        object Label30: TLabel
          Left = 72
          Top = 271
          Width = 5
          Height = 13
          Caption = 'z'
        end
        object lbl1: TLabel
          Left = 56
          Top = 504
          Width = 64
          Height = 13
          Caption = 'Scale Multiple'
        end
        object TrackBar5: TTrackBar
          Left = 8
          Top = 32
          Width = 25
          Height = 150
          Max = 360
          Orientation = trVertical
          TabOrder = 0
          OnChange = TrackBar5Change
        end
        object TrackBar6: TTrackBar
          Left = 60
          Top = 32
          Width = 45
          Height = 150
          Max = 360
          Orientation = trVertical
          TabOrder = 1
          OnChange = TrackBar6Change
        end
        object TrackBar7: TTrackBar
          Left = 120
          Top = 32
          Width = 45
          Height = 150
          Max = 360
          Orientation = trVertical
          TabOrder = 2
          OnChange = TrackBar7Change
        end
        object Button12: TButton
          Left = 6
          Top = 216
          Width = 75
          Height = 25
          Caption = 'Reset'
          TabOrder = 3
          OnClick = Button12Click
        end
        object TrackBar13: TTrackBar
          Left = 16
          Top = 288
          Width = 25
          Height = 184
          Max = 1000
          Orientation = trVertical
          TabOrder = 4
          OnChange = TrackBar13Change
        end
        object TrackBar14: TTrackBar
          Left = 68
          Top = 288
          Width = 45
          Height = 184
          Max = 1000
          Orientation = trVertical
          TabOrder = 5
          OnChange = TrackBar14Change
        end
        object TrackBar15: TTrackBar
          Left = 128
          Top = 288
          Width = 45
          Height = 184
          Max = 1000
          Orientation = trVertical
          TabOrder = 6
          OnChange = TrackBar15Change
        end
        object chk1: TCheckBox
          Left = 16
          Top = 480
          Width = 97
          Height = 17
          Caption = 'Lock Scale'
          Checked = True
          State = cbChecked
          TabOrder = 7
        end
        object scrlbr1: TScrollBar
          Left = 24
          Top = 520
          Width = 137
          Height = 17
          Min = 1
          PageSize = 0
          Position = 1
          TabOrder = 8
          OnChange = scrlbr1Change
        end
        object btn1: TButton
          Left = 96
          Top = 216
          Width = 75
          Height = 25
          Caption = 'Center'
          TabOrder = 9
          OnClick = btn1Click
        end
      end
      object TabSheet4: TTabSheet
        Caption = 'SaveScreen'
        ImageIndex = 3
        object Label25: TLabel
          Left = 13
          Top = 222
          Width = 37
          Height = 13
          Caption = 'Label10'
        end
        object Label26: TLabel
          Left = 93
          Top = 222
          Width = 37
          Height = 13
          Caption = 'Label11'
        end
        object Label27: TLabel
          Left = 41
          Top = 245
          Width = 67
          Height = 13
          Caption = 'Select Frames'
        end
        object Label28: TLabel
          Left = 12
          Top = 501
          Width = 31
          Height = 13
          Caption = 'Label1'
        end
        object Label29: TLabel
          Left = 13
          Top = 521
          Width = 31
          Height = 12
          Caption = 'Label2'
        end
        object Label24: TLabel
          Left = 8
          Top = 342
          Width = 161
          Height = 13
          Caption = 'Red      Green          Blue    Alpha  '
        end
        object RadioGroup1: TRadioGroup
          Left = 10
          Top = 7
          Width = 143
          Height = 91
          Caption = 'Image Power Of 2'
          Columns = 2
          ItemIndex = 2
          Items.Strings = (
            '32'
            '64'
            '128'
            '256'
            '512')
          TabOrder = 0
          OnClick = RadioGroup1Click
        end
        object RadioGroup2: TRadioGroup
          Left = 16
          Top = 102
          Width = 129
          Height = 35
          Caption = 'Save Power oF 2'
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            'YES'
            'NO')
          TabOrder = 1
        end
        object RadioGroup3: TRadioGroup
          Left = 8
          Top = 142
          Width = 155
          Height = 51
          Caption = 'Save Type'
          Columns = 3
          ItemIndex = 0
          Items.Strings = (
            'PNG'
            'TGA'
            'BMP')
          TabOrder = 2
        end
        object Edit7: TEdit
          Left = 13
          Top = 269
          Width = 52
          Height = 21
          TabOrder = 3
          Text = '0'
        end
        object Edit8: TEdit
          Left = 77
          Top = 269
          Width = 57
          Height = 21
          TabOrder = 4
          Text = '100'
        end
        object Edit9: TEdit
          Left = 13
          Top = 301
          Width = 68
          Height = 21
          TabOrder = 5
          Text = 'sprite'
        end
        object Button3: TButton
          Left = 24
          Top = 446
          Width = 121
          Height = 24
          Caption = 'Process..'
          TabOrder = 6
          OnClick = Button3Click
        end
        object ProgressBar2: TProgressBar
          Left = 5
          Top = 476
          Width = 150
          Height = 17
          TabOrder = 7
        end
        object CheckBox2: TCheckBox
          Left = 16
          Top = 203
          Width = 97
          Height = 17
          Caption = 'Save Singles'
          Checked = True
          State = cbChecked
          TabOrder = 8
        end
        object TrackBar1: TTrackBar
          Left = 0
          Top = 360
          Width = 45
          Height = 87
          Max = 255
          Orientation = trVertical
          TabOrder = 9
          TickMarks = tmBoth
          OnChange = TrackBar1Change
        end
        object TrackBar2: TTrackBar
          Left = 39
          Top = 360
          Width = 45
          Height = 86
          Max = 255
          Orientation = trVertical
          TabOrder = 10
          TickMarks = tmBoth
        end
        object TrackBar11: TTrackBar
          Left = 81
          Top = 360
          Width = 45
          Height = 87
          Max = 255
          Orientation = trVertical
          TabOrder = 11
          TickMarks = tmBoth
        end
        object TrackBar12: TTrackBar
          Left = 130
          Top = 361
          Width = 45
          Height = 86
          Max = 255
          Orientation = trVertical
          Position = 255
          TabOrder = 12
          TickMarks = tmBoth
        end
      end
      object TabSheet5: TTabSheet
        Caption = 'Model'
        ImageIndex = 4
        object Label3: TLabel
          Left = 8
          Top = 80
          Width = 85
          Height = 13
          Caption = 'Total Of Materials'
        end
        object Label4: TLabel
          Left = 8
          Top = 128
          Width = 68
          Height = 13
          Caption = 'Texture Layer'
        end
        object Label16: TLabel
          Left = 8
          Top = 168
          Width = 70
          Height = 13
          Caption = 'Total Of Joints'
        end
        object Label17: TLabel
          Left = 40
          Top = 192
          Width = 55
          Height = 13
          Caption = 'Select Joint'
        end
        object Button8: TButton
          Left = 8
          Top = 96
          Width = 75
          Height = 25
          Caption = 'New Texture'
          TabOrder = 0
          OnClick = Button8Click
        end
        object Button1: TButton
          Left = 24
          Top = 24
          Width = 105
          Height = 25
          Caption = 'Load Model'
          TabOrder = 1
          OnClick = Button1Click
        end
        object ScrollBar1: TScrollBar
          Left = 8
          Top = 144
          Width = 121
          Height = 17
          PageSize = 0
          TabOrder = 2
          OnChange = ScrollBar1Change
        end
        object ScrollBar2: TScrollBar
          Left = 8
          Top = 208
          Width = 129
          Height = 17
          PageSize = 0
          TabOrder = 3
        end
        object Button2: TButton
          Left = 8
          Top = 440
          Width = 137
          Height = 25
          Caption = 'Load MD2 Gun'
          TabOrder = 4
          OnClick = Button2Click
        end
        object Button9: TButton
          Left = 8
          Top = 472
          Width = 137
          Height = 25
          Caption = 'Load MD2 GunTexture'
          TabOrder = 5
          OnClick = Button9Click
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 922
    Height = 572
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 1
    OnClick = Panel1Click
    OnMouseDown = Panel1MouseDown
    OnMouseMove = Panel1MouseMove
    OnMouseUp = Panel1MouseUp
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer1Timer
    Left = 176
    Top = 8
  end
  object XPManifest1: TXPManifest
    Left = 688
    Top = 40
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Filter = 
      'All (*.pcx;*.jpg;*.jpeg;*.bmp;*.tga;*.png)|*.pcx;*.jpg;*.jpeg;*.' +
      'bmp;*.tga;*.png;|PCX Image (*.pcx)|*.pcx|JPEG Image File (*.jpg)' +
      '|*.jpg|JPEG Image File (*.jpeg)|*.jpeg|Bitmaps (*.bmp)|*.bmp|Tar' +
      'ga(*.tga)|*.tga|Portable (*.png)|*.png'
    Left = 739
    Top = 41
  end
  object OpenDialog1: TOpenDialog
    Filter = 'All Models|*.*'
    Left = 752
    Top = 96
  end
  object OpenDialog2: TOpenDialog
    Filter = 'MD2 Model|*.md2'
    Left = 752
    Top = 144
  end
  object mm1: TMainMenu
    Left = 72
    Top = 104
    object Fil1: TMenuItem
      Caption = 'Project'
      object Open1: TMenuItem
        Caption = 'Open'
        OnClick = Open1Click
      end
      object SaveAS1: TMenuItem
        Caption = 'Save AS'
        OnClick = SaveAS1Click
      end
      object Save1: TMenuItem
        Caption = 'Save'
        OnClick = Save1Click
      end
    end
  end
  object dlgOpen1: TOpenDialog
    DefaultExt = '*.gen'
    Filter = 'Sprite Gen|*.gen'
    Left = 696
    Top = 240
  end
  object dlgSave1: TSaveDialog
    DefaultExt = '*.gen'
    Filter = 'Sprite Gen|*.gen'
    Left = 744
    Top = 240
  end
end
