unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCGrids, Data.DB, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls;

type
  THistorico = class(TForm)
    DataSource1: TDataSource;
    DBCtrlGrid1: TDBCtrlGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Historico: THistorico;

implementation

{$R *.dfm}


end.
