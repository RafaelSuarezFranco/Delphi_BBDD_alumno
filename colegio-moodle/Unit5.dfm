object Historico: THistorico
  Left = 0
  Top = 0
  Caption = 'Historico'
  ClientHeight = 495
  ClientWidth = 764
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBCtrlGrid1: TDBCtrlGrid
    Left = 24
    Top = 8
    Width = 713
    Height = 457
    DataSource = DataSource1
    PanelHeight = 152
    PanelWidth = 696
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 36
      Height = 13
      Caption = 'nombre'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 144
      Top = 19
      Width = 54
      Height = 13
      Caption = 'expediente'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 296
      Top = 19
      Width = 26
      Height = 13
      Caption = 'curso'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 424
      Top = 19
      Width = 22
      Height = 13
      Caption = 'nota'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 552
      Top = 19
      Width = 27
      Height = 13
      Caption = 'fecha'
      FocusControl = DBEdit5
    end
    object Label6: TLabel
      Left = 552
      Top = 72
      Width = 48
      Height = 13
      Caption = 'fechabaja'
      FocusControl = DBEdit6
    end
    object Label7: TLabel
      Left = 288
      Top = 72
      Width = 53
      Height = 13
      Caption = 'motivobaja'
      FocusControl = DBEdit7
    end
    object Label8: TLabel
      Left = 8
      Top = 69
      Width = 51
      Height = 13
      Caption = 'asignatura'
      FocusControl = DBEdit8
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 35
      Width = 121
      Height = 21
      DataField = 'nombre'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 144
      Top = 35
      Width = 134
      Height = 21
      DataField = 'expediente'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 296
      Top = 35
      Width = 113
      Height = 21
      DataField = 'curso'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 424
      Top = 35
      Width = 105
      Height = 21
      DataField = 'nota'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 552
      Top = 35
      Width = 121
      Height = 21
      DataField = 'fecha'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 552
      Top = 88
      Width = 121
      Height = 21
      DataField = 'fechabaja'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 5
    end
    object DBEdit7: TDBEdit
      Left = 288
      Top = 88
      Width = 241
      Height = 21
      DataField = 'motivobaja'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 6
    end
    object DBEdit8: TDBEdit
      Left = 8
      Top = 88
      Width = 238
      Height = 21
      DataField = 'asignatura'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 7
    end
  end
  object DataSource1: TDataSource
    DataSet = Principal.FDTableHistorico
    Left = 712
    Top = 448
  end
end
