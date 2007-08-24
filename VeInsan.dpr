program VeInsan;

uses
  Forms,
  UnitAna in 'UnitAna.pas' {Form1},
  Unitayarlar in 'Unitayarlar.pas' {frmAyarlar},
  UnitHakkinda in 'UnitHakkinda.pas' {frmHakkinda},
  UnitSecenekler in 'UnitSecenekler.pas' {Form2},
  Tkanal in 'Tkanal.pas',
  SchemaPhotoGalleryXML in 'SchemaPhotoGalleryXML.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmAyarlar, frmAyarlar);
  Application.CreateForm(TfrmHakkinda, frmHakkinda);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
