unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TAlta = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSourceAlta: TDataSource;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;

    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Alta: TAlta;
  asignaturas : TStringList;
  evaluaciones: TStringList;
implementation

{$R *.dfm}

uses Unit2;



procedure TAlta.DBEdit1Exit(Sender: TObject);
begin
  if DBEdit1.Text = '' then
  begin
   DBEdit1.SetFocus;
   DBEdit1.Color := clWebLightCoral;
   showmessage('Debes introducir un nombre.');
  end
  else
  begin
   DBEdit1.Color := clWebGreenYellow;
  end;

end;

procedure TAlta.DBEdit3Exit(Sender: TObject);
begin
 if DBEdit3.Text = '' then
  begin
   DBEdit3.SetFocus;
   DBEdit3.Color := clWebLightCoral;
   showmessage('Debes introducir un n? de expediente.');
  end
  else
  begin
    if principal.FDTableAlumnoClon.Locate('expediente', DBEdit3.Text) then //si existe el expediente
      begin
         DBEdit3.SetFocus;
         DBEdit3.Color := clWebLightCoral;
         showmessage('Expediente duplicado, introduce otro por favor.');
      end
      else
      begin
         DBEdit3.Color := clWebGreenYellow;
      end;

  end;
end;

procedure TAlta.FormActivate(Sender: TObject);
begin
    DBRadioGroup1.ItemIndex:= 0;
  //seleccionamos un radio por defecto
    DBEdit1.SetFocus;
    DBEdit1.Color := clWhite;
    DBEdit3.Color := clWhite;
end;

procedure TAlta.FormClose(Sender: TObject; var Action: TCloseAction);
begin  //si pulsamos en la X y no tenemos esto, se insertan registros vac?os
   principal.fdtablealumno.cancel;
   principal.fdtablenotas.cancel;
end;

procedure TAlta.FormCreate(Sender: TObject);
begin
  asignaturas := TStringList.Create;
  evaluaciones := TStringList.Create;
  //cargamos los ficheros en StringList, funcionan como arrays.
  asignaturas.LoadFromFile('asignaturas.txt');
  evaluaciones.LoadFromFile('fechas.txt');
end;



 //aunque se llame speedbutton, es un bitbtn
procedure TAlta.SpeedButton1Click(Sender: TObject);
var
i: integer;
j: integer;
begin
if ((DBEdit1.GetTextLen = 0) or (DBEdit3.GetTextLen = 0) or (DBRadioGroup1.ItemIndex = -1)) then
  // si alg?n campo esta vac?o
  begin
     ShowMessage('Por favor, rellena todos los campos.');
  end
  else
  begin

    Try
      begin
      for i := 0 to asignaturas.Count-1 do
        begin
        for j := 0 to evaluaciones.Count-1 do
          begin  //a?adiendo los campos a la tabla notas
           principal.fdtablenotas.append;
           principal.fdtablenotas.FieldByName('expediente').AsString := DBEdit3.Text;
           principal.fdtablenotas.FieldByName('curso').AsString := DBRadioGroup1.Items[DBRadioGroup1.ItemIndex];
           principal.fdtablenotas.FieldByName('nota').AsString := '0';
           principal.fdtablenotas.FieldByName('fecha').AsString := evaluaciones[j];
           principal.fdtablenotas.FieldByName('asignatura').AsString := asignaturas[i];
           principal.fdtablenotas.post;
          end;

        end;

      principal.fdtablealumno.post;
      modalresult:=mrok;
      end;
    Except
     begin
      ShowMessage('Error al crear el nuevo alumno.');
     end;

    End;

  end;
end;

procedure TAlta.SpeedButton2Click(Sender: TObject);
begin
   principal.fdtablealumno.cancel;
   principal.fdtablenotas.cancel;
   modalresult:=mrok;
end;

end.
