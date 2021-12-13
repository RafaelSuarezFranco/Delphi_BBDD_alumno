unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Comp.Client, Vcl.StdCtrls;

type
  TPrincipal = class(TForm)
    FDConnection1: TFDConnection;
    DataSourceAlumno: TDataSource;
    FDTablealumno: TFDTable;
    DBGrid1: TDBGrid;
    FDTablealumnoid: TFDAutoIncField;
    FDTablealumnonombre: TStringField;
    FDTablealumnocurso: TStringField;
    FDTablealumnoexpediente: TIntegerField;
    FDTableNotas: TFDTable;
    DataSourceNotas: TDataSource;
    DBGrid2: TDBGrid;
    FDTableNotasexpediente: TIntegerField;
    FDTableNotascurso: TStringField;
    FDTableNotasnota: TSingleField;
    FDTableNotasfecha: TDateField;
    FDTableNotasasignatura: TStringField;
    FDTableNotasid: TFDAutoIncField;
    Label1: TLabel;
    ComboBox1: TComboBox;
    ButtonNota: TButton;
    ButtonHist: TButton;
    Buttontodos: TButton;
    ButtonAlta: TButton;
    ButtonBaja: TButton;
    FDTableHistorico: TFDTable;
    DataSourceHistorico: TDataSource;
    FDTableHistoricoid: TFDAutoIncField;
    FDTableHistoriconombre: TStringField;
    FDTableHistoricoexpediente: TIntegerField;
    FDTableHistoricocurso: TStringField;
    FDTableHistoriconota: TSingleField;
    FDTableHistoricofecha: TDateField;
    FDTableHistoricofechabaja: TDateField;
    FDTableHistoricomotivobaja: TStringField;
    FDTableHistoricoasignatura: TStringField;
    FDTableAlumnoClon: TFDTable;
    FDAutoIncField1: TFDAutoIncField;
    StringField1: TStringField;
    StringField2: TStringField;
    IntegerField1: TIntegerField;
    DataSourceClon: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ButtontodosClick(Sender: TObject);
    procedure ButtonAltaClick(Sender: TObject);
    procedure ButtonBajaClick(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ButtonNotaClick(Sender: TObject);
    procedure ButtonHistClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Principal: TPrincipal;

implementation

{$R *.dfm}

uses Unit1, Unit5;

procedure TPrincipal.ButtonAltaClick(Sender: TObject);
begin
 fdtablealumno.append;
 fdtablenotas.append;
 Alta.showmodal;
end;

procedure TPrincipal.ButtonBajaClick(Sender: TObject);
var
  i: integer;
  j: integer;
  buttonSelected : Integer;
  motivo: String;
begin
  buttonSelected := messagedlg('¿Desea borrar el alumno seleccionado y sus notas?', mtConfirmation, mbOKCancel, 1);

  if (buttonSelected = mrOK) then
  begin
     motivo:= InputBox('¿Motivo de la baja?', 'Motivo:', 'FIN DE CURSO');

      //borramos los campos de notas que tengan el expediente del alumno seleccionado
      //filtramos por expediente y borramos todo
     fdtablenotas.Filtered:= true;
     fdtablenotas.Filter := 'expediente='+inttostr(fdtablealumnoexpediente.Value);

     fdtablenotas.First;
     while not fdtablenotas.eof do
     //aprovechando este filtro, por cada línea añadimos una línea a histórico
        begin
        //volcado de datos a histórico
           principal.fdtablehistorico.append;
           principal.fdtablehistorico.FieldByName('nombre').AsString := fdtablealumnonombre.Value;
           principal.fdtablehistorico.FieldByName('expediente').AsInteger := fdtablealumnoexpediente.Value;
           principal.fdtablehistorico.FieldByName('curso').AsString := fdtablenotascurso.Value;
           principal.fdtablehistorico.FieldByName('nota').AsSingle := fdtablenotasnota.Value;
           principal.fdtablehistorico.FieldByName('fecha').AsString := DateToStr(fdtablenotasfecha.Value);
           principal.fdtablehistorico.FieldByName('fechabaja').AsString := DateToStr(Now);
           principal.fdtablehistorico.FieldByName('asignatura').AsString := fdtablenotasasignatura.Value;
           principal.fdtablehistorico.FieldByName('motivobaja').AsString := motivo;
           principal.fdtablehistorico.post;


           //borrar notas del alumno
          fdtablenotas.Delete;
        end;


     fdtablealumno.delete; //borrar el alumno

     fdtablenotas.Filtered:= false;
     fdtablealumno.Refresh;
     fdtablenotas.Refresh;
  end;


  if buttonSelected = mrCancel then ShowMessage('No se ha borrado el alumno');
end;


procedure TPrincipal.ButtonHistClick(Sender: TObject);
begin
   Historico.showmodal;
end;

procedure TPrincipal.ButtonNotaClick(Sender: TObject);
var
nuevanota: Double;
begin
  fdtablenotas.Edit;
  repeat
    nuevanota := -1;
    
   Try  //hacemos un try por si metemos letras o algo inválido
   
    nuevanota := StrtoFloat(InputBox('Editar Nota', 'Nota:', floatToStr(fdtablenotasnota.Value)));

    
    if nuevanota = -1 then //significa que hemos cancelado, dejamos el valor que estaba antes.
    nuevanota := fdtablenotasnota.Value;

    if (nuevanota < 0) or (nuevanota > 10) then
    ShowMessage('Introduce una nota válida (0-10)');
         
        
    Except  //si metemos algo que no sea float
      ShowMessage('Introduce sólo números y coma para separar decimales.');
    End;


  until (nuevanota >= 0) and (nuevanota <= 10);
  fdtablenotasnota.Value := nuevanota;
  fdtablenotas.Post;
end;

procedure TPrincipal.ButtontodosClick(Sender: TObject);
begin
  fdtablenotas.Filtered := false;
end;

procedure TPrincipal.ComboBox1Change(Sender: TObject);
begin
if ComboBox1.Text <> 'Sin filtro' then
  begin
   fdtablenotas.Filtered:=true;
   fdtablenotas.Filter:='asignatura ='+quotedstr(ComboBox1.Text);
  end
  else
  begin
  fdtablenotas.Filtered:=false;
  end;

end;




procedure TPrincipal.DBGrid1DblClick(Sender: TObject);
begin
  fdtablenotas.Filtered := false;
  fdtablenotas.Filtered := true;
  fdtablenotas.Filter := 'expediente='+inttostr(fdtablealumnoexpediente.Value);
end;

procedure TPrincipal.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Field: TField;
begin
  Field := Column.Field;

  if Assigned(Field) and SameText(Field.FieldName, 'nota') then
  begin
  DBGrid2.Canvas.Font.Style := [TFontStyle.fsBold];

    if Field.AsFloat >= 5 then  //si el campo nota es mayor o igual a 5
      DBGrid2.Canvas.Font.Color := clGreen
    else
      DBGrid2.Canvas.Font.Color := clRed;
  end;
  DBGrid2.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TPrincipal.FormActivate(Sender: TObject);
begin
fdtablealumno.open;
fdtablenotas.open;
fdtablehistorico.open;
fdtablealumnoclon.open;

ComboBox1.Items.LoadFromFile('asignaturas.txt');
ComboBox1.Items.Add('Sin filtro');

end;

procedure TPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   fdtablealumno.close;
   fdtablenotas.close;
   fdtablehistorico.close;
   fdtablealumnoclon.close;
end;


end.
