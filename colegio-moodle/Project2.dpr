program Project2;

uses
  Vcl.Forms,
  Unit2 in 'Unit2.pas' {Principal},
  Unit1 in 'Unit1.pas' {Alta},
  Unit3 in 'Unit3.pas' {Historico},
  Unit4 in 'Unit4.pas' {ElementoHistorico};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPrincipal, Principal);
  Application.CreateForm(TAlta, Alta);
  Application.CreateForm(THistorico, Historico);
  Application.CreateForm(TElementoHistorico, ElementoHistorico);
  Application.Run;
end.
