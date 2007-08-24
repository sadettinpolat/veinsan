program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  UnitHakkinda in 'UnitHakkinda.pas' {frmHakkinda},
  Unitslayt in 'Unitslayt.pas' {frmSlayt},
  Tkanal in 'Tkanal.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Ve Ýnsan Slayt Görüntüleme Aracý 2.0';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmHakkinda, frmHakkinda);
  Application.CreateForm(TfrmSlayt, frmSlayt);
  Application.Run;
end.
