program MoodleColegioRSF;

uses
  Vcl.Forms,
  Unit2 in 'Unit2.pas' {Principal},
  Unit1 in 'Unit1.pas' {Alta},
  Unit5 in 'Unit5.pas' {Historico};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPrincipal, Principal);
  Application.CreateForm(TAlta, Alta);
  Application.CreateForm(THistorico, Historico);
  Application.Run;
end.
