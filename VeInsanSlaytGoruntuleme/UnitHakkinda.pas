unit UnitHakkinda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SUIMgr, ExtCtrls, SUIForm, StdCtrls, SUIURLLabel, SUIMemo,
  SUIEdit, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP;

type
  TfrmHakkinda = class(TForm)
    suiForm1: TsuiForm;
    suiThemeManager1: TsuiThemeManager;
    Image1: TImage;
    StaticText1: TLabel;
    suiURLLabel1: TsuiURLLabel;
    StaticText2: TLabel;
    StaticText3: TLabel;
    suiURLLabel2: TsuiURLLabel;
    StaticText4: TLabel;
    suiURLLabel3: TsuiURLLabel;
    StaticText5: TLabel;
    suiURLLabel4: TsuiURLLabel;
    StaticText6: TLabel;
    StaticText7: TLabel;
    suiURLLabel5: TsuiURLLabel;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TsuiEdit;
    Label3: TLabel;
    suiMemo1: TsuiMemo;
    IdHTTP1: TIdHTTP;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHakkinda: TfrmHakkinda;

implementation

uses Tkanal;

{$R *.dfm}

procedure TfrmHakkinda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = vk_escape then Close;
end;

procedure TfrmHakkinda.FormActivate(Sender: TObject);
var
Kanal:TKanal2;
begin
Kanal :=TKanal2.Create(false);
kanal.FreeOnTerminate := true;

end;

procedure TfrmHakkinda.FormShow(Sender: TObject);
begin
suiMemo1.Lines.Clear;
suiMemo1.Lines.Add('Bilgiler alýnýyor. Lütfen bekleyin...');

end;

end.
