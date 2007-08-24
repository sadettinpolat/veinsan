unit UnitSecenekler;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SUIMgr, ExtCtrls, SUIForm, StdCtrls, SUIButton, SUIEdit,
  SUIURLLabel;

type
  TForm2 = class(TForm)
    suiForm1: TsuiForm;
    suiThemeManager1: TsuiThemeManager;
    suiEdit1: TsuiEdit;
    suiButton1: TsuiButton;
    StaticText3: TLabel;
    suiButton2: TsuiButton;
    suiButton3: TsuiButton;
    OpenDialog1: TOpenDialog;
    Bevel1: TBevel;
    suiURLLabel1: TsuiURLLabel;
    procedure suiButton1Click(Sender: TObject);
    procedure suiButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure suiButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses UnitAna;

{$R *.dfm}

procedure TForm2.suiButton1Click(Sender: TObject);
var
path:string;
begin

if OpenDialog1.Execute then
//  Edit1.Text := 'C:\VeInsan\'
//else
  suiEdit1.Text := OpenDialog1.FileName;
end;

procedure TForm2.suiButton2Click(Sender: TObject);
begin
Form1.ini.WriteString('Ayarlar','VISGA',suiEdit1.Text);
form1.VISGA := suiEdit1.Text;
ModalResult := mrOk;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
suiEdit1.Text :=Form1.VISGA;
end;

procedure TForm2.suiButton3Click(Sender: TObject);
begin
ModalResult := mrCancel;
end;

end.
