object Principal: TPrincipal
  Left = 0
  Top = 0
  ClientHeight = 542
  ClientWidth = 716
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 296
    Top = 408
    Width = 105
    Height = 13
    Caption = 'Filtrar por asignatura:'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 257
    Height = 185
    DataSource = DataSourceAlumno
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'nombre'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'curso'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'expediente'
        Width = 56
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 288
    Top = 8
    Width = 404
    Height = 385
    DataSource = DataSourceNotas
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid2DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'expediente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'curso'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nota'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fecha'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'asignatura'
        Width = 117
        Visible = True
      end>
  end
  object ComboBox1: TComboBox
    Left = 296
    Top = 427
    Width = 396
    Height = 21
    TabOrder = 2
    Text = 'Sin filtro'
    OnChange = ComboBox1Change
  end
  object ButtonNota: TButton
    Left = 296
    Top = 454
    Width = 186
    Height = 25
    Caption = 'Editar Nota'
    TabOrder = 3
    OnClick = ButtonNotaClick
  end
  object ButtonHist: TButton
    Left = 496
    Top = 454
    Width = 196
    Height = 25
    Caption = 'Hist'#243'rico'
    TabOrder = 4
    OnClick = ButtonHistClick
  end
  object Buttontodos: TButton
    Left = 8
    Top = 208
    Width = 257
    Height = 25
    Caption = 'TODOS LOS ALUMNOS'
    TabOrder = 5
    OnClick = ButtontodosClick
  end
  object ButtonAlta: TButton
    Left = 8
    Top = 239
    Width = 121
    Height = 25
    Caption = 'Alta'
    TabOrder = 6
    OnClick = ButtonAltaClick
  end
  object ButtonBaja: TButton
    Left = 135
    Top = 239
    Width = 130
    Height = 25
    Caption = 'Baja'
    TabOrder = 7
    OnClick = ButtonBajaClick
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=MySQL'
      'Database=colegio'
      'User_Name=root'
      'Password=admin')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 368
  end
  object DataSourceAlumno: TDataSource
    DataSet = FDTablealumno
    Left = 224
    Top = 368
  end
  object FDTablealumno: TFDTable
    IndexFieldNames = 'id'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'colegio.alumnos'
    TableName = 'colegio.alumnos'
    Left = 136
    Top = 368
    object FDTablealumnoid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDTablealumnonombre: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nombre'
      Origin = 'nombre'
      Size = 50
    end
    object FDTablealumnocurso: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'curso'
      Origin = 'curso'
      Size = 10
    end
    object FDTablealumnoexpediente: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'expediente'
      Origin = 'expediente'
    end
  end
  object FDTableNotas: TFDTable
    IndexFieldNames = 'id'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'colegio.notas'
    TableName = 'colegio.notas'
    Left = 48
    Top = 432
    object FDTableNotasid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDTableNotasexpediente: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'expediente'
      Origin = 'expediente'
    end
    object FDTableNotascurso: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'curso'
      Origin = 'curso'
      Size = 10
    end
    object FDTableNotasnota: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'nota'
      Origin = 'nota'
    end
    object FDTableNotasfecha: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'fecha'
      Origin = 'fecha'
    end
    object FDTableNotasasignatura: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'asignatura'
      Origin = 'asignatura'
      Size = 50
    end
  end
  object DataSourceNotas: TDataSource
    DataSet = FDTableNotas
    Left = 128
    Top = 432
  end
  object FDTableHistorico: TFDTable
    IndexFieldNames = 'id'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'colegio.historico'
    TableName = 'colegio.historico'
    Left = 40
    Top = 496
    object FDTableHistoricoid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDTableHistoriconombre: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nombre'
      Origin = 'nombre'
      Size = 50
    end
    object FDTableHistoricoexpediente: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'expediente'
      Origin = 'expediente'
    end
    object FDTableHistoricocurso: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'curso'
      Origin = 'curso'
      Size = 10
    end
    object FDTableHistoriconota: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'nota'
      Origin = 'nota'
    end
    object FDTableHistoricofecha: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'fecha'
      Origin = 'fecha'
    end
    object FDTableHistoricofechabaja: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'fechabaja'
      Origin = 'fechabaja'
    end
    object FDTableHistoricomotivobaja: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'motivobaja'
      Origin = 'motivobaja'
      Size = 50
    end
    object FDTableHistoricoasignatura: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'asignatura'
      Origin = 'asignatura'
      Size = 50
    end
  end
  object DataSourceHistorico: TDataSource
    DataSet = FDTableHistorico
    Left = 128
    Top = 496
  end
  object FDTableAlumnoClon: TFDTable
    IndexFieldNames = 'id'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'colegio.alumnos'
    TableName = 'colegio.alumnos'
    Left = 304
    Top = 496
    object FDAutoIncField1: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object StringField1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nombre'
      Origin = 'nombre'
      Size = 50
    end
    object StringField2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'curso'
      Origin = 'curso'
      Size = 10
    end
    object IntegerField1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'expediente'
      Origin = 'expediente'
    end
  end
  object DataSourceClon: TDataSource
    DataSet = FDTableAlumnoClon
    Left = 392
    Top = 496
  end
end
