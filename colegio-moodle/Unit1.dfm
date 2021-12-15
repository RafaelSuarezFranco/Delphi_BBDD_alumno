object Alta: TAlta
  Left = 0
  Top = 0
  Caption = 'Alta'
  ClientHeight = 420
  ClientWidth = 554
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 64
    Top = 40
    Width = 41
    Height = 13
    Caption = 'Nombre:'
    FocusControl = DBEdit1
  end
  object Label3: TLabel
    Left = 64
    Top = 112
    Width = 58
    Height = 13
    Caption = 'Expediente:'
    FocusControl = DBEdit3
  end
  object DBEdit1: TDBEdit
    Left = 64
    Top = 59
    Width = 342
    Height = 21
    DataField = 'nombre'
    DataSource = DataSourceAlta
    TabOrder = 0
    OnExit = DBEdit1Exit
  end
  object DBEdit3: TDBEdit
    Left = 64
    Top = 128
    Width = 134
    Height = 21
    DataField = 'expediente'
    DataSource = DataSourceAlta
    TabOrder = 1
    OnExit = DBEdit3Exit
  end
  object DBRadioGroup1: TDBRadioGroup
    Left = 277
    Top = 112
    Width = 129
    Height = 153
    Caption = 'Curso: '
    DataField = 'curso'
    DataSource = DataSourceAlta
    Items.Strings = (
      'PRIMERO'
      'SEGUNDO'
      'TERCERO'
      'CUARTO'
      'QUINTO'
      'SEXTO')
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 93
    Top = 330
    Width = 105
    Height = 47
    Caption = 'Guardar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Kind = bkOK
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 3
    OnClick = SpeedButton1Click
  end
  object BitBtn2: TBitBtn
    Left = 328
    Top = 330
    Width = 105
    Height = 47
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Kind = bkCancel
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 4
    OnClick = SpeedButton2Click
  end
  object DataSourceAlta: TDataSource
    DataSet = Principal.FDTablealumno
    Left = 472
    Top = 40
  end
end
