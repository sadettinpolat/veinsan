unit Unitslayt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, SUISideChannel, SUIMgr, SUIImagePanel, StdCtrls,
  SUIMemo, SUIButton, SUIEdit, SUIURLLabel;

type
  TfrmSlayt = class(TForm)
    suiSideChannel1: TsuiSideChannel;
    suiPanel1: TsuiPanel;
    suiPanel2: TsuiPanel;
    suiThemeManager1: TsuiThemeManager;
    Timer1: TTimer;
    suiSpinEdit1: TsuiSpinEdit;
    Label2: TLabel;
    Panel1: TPanel;
    suiMemo1: TMemo;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    Panel2: TPanel;
    Label1: TLabel;
    suiPanel3: TsuiPanel;
    Label3: TLabel;
    suiButton1: TsuiButton;
    suiButton2: TsuiButton;
    suiButton3: TsuiButton;
    Label4: TLabel;
    Label5: TLabel;
    suiPanel4: TsuiPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    suiButton4: TsuiButton;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure suiButton1Click(Sender: TObject);
    procedure suiSpinEdit1Change(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Label3MouseLeave(Sender: TObject);
    procedure Label3MouseEnter(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure suiButton3Click(Sender: TObject);
    procedure suiButton2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure suiButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
  intIndex2:Integer;
  procedure ResimGoster(intIndex:Integer);
  function DosyaAdiniDuzgunYaz(tmp:String):string;
  function spGetFileSize(const FileName: string): Longint;
    { Public declarations }
  end;

var
  frmSlayt: TfrmSlayt;

implementation

uses Unit1, SUIListBox;

{$R *.dfm}

procedure TfrmSlayt.Button1Click(Sender: TObject);
var
tmp:String;
begin

if Form1.ListBox1.ItemIndex = -1 then Exit;
  tmp := Form1.ListBox1.Items[Form1.ListBox1.ItemIndex];
if FileExists(tmp) Then
Begin
  Caption :='Ve Ýnsan Slayt View [' + tmp + ']';
  Form1.resim.Empty;
  Form1.resim.LoadFromFile(tmp);
  Image1.Picture.Assign(Form1.resim);
//   Image1.Picture.Assign(resim);
  ScrollBox1.VertScrollBar.Range := Form1.resim.Height;
  ScrollBox1.HorzScrollBar.Range := Form1.resim.Width;
  //Image1.Picture.Graphic.LoadFromFile(tmp);
  tmp :=StringReplace(tmp,'.jpg','.txt',[]);
  if FileExists(tmp) Then
    suiMemo1.Lines.LoadFromFile(tmp)
  else
  Begin
    suiMemo1.Lines.Clear;
    suiMemo1.Lines.Add(tmp +' dosyasý bulunamadý...');
  end;
end;

end;

procedure TfrmSlayt.ResimGoster(intIndex: Integer);
var
tmp:String;
begin
//if intIndex < 0 then
//Begin
// intIndex := 0;
// Exit;
//end;

if intIndex+1 > Form1.ListBox1.Items.Count then
  Exit;

tmp := Form1.ListBox1.Items[intIndex];
Label5.Caption := 'Resim No: ' + IntToStr(intIndex+1);

Label4.Caption := 'Boyut: '+IntToStr(spGetFileSize(tmp) div 1024)+ ' KB';
if FileExists(tmp) Then
Begin
  Caption :='Ve Ýnsan Slayt View [' + tmp + ']';
  Form1.resim.Empty;
  Form1.resim.LoadFromFile(tmp);
  Image1.Picture.Assign(Form1.resim);
//   Image1.Picture.Assign(resim);
  ScrollBox1.VertScrollBar.Range := Form1.resim.Height;
  ScrollBox1.HorzScrollBar.Range := Form1.resim.Width;
  //Image1.Picture.Graphic.LoadFromFile(tmp);
  Label3.Caption :=DosyaAdiniDuzgunYaz(tmp);
  tmp :=StringReplace(tmp,'.jpg','.txt',[]);
  if FileExists(tmp) Then
  Begin
    suiMemo1.Lines.LoadFromFile(tmp);
    Label1.Caption :=suiMemo1.Lines[0];
    suiMemo1.Lines.Delete(0);
    suiMemo1.Lines.Delete(0);
    suiMemo1.Lines.Delete(0);

  end
  else
  Begin
    suiMemo1.Lines.Clear;
    suiMemo1.Lines.Add(tmp +' dosyasý bulunamadý...');
  end;
end;
end;

procedure TfrmSlayt.Timer1Timer(Sender: TObject);
begin
//  Inc(intIndex);
///  if intIndex >= Form1.ListBox1.Items.Count-1 Then
 //     Timer1.Enabled := False;
 // ResimGoster(intIndex);
 suiButton2.Click;
end;

procedure TfrmSlayt.FormShow(Sender: TObject);
begin

Timer1.Enabled := True;
end;

procedure TfrmSlayt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Timer1.Enabled := False;
Form1.ListBox1.ItemIndex := intIndex2;
Form1.suitempListBox1Click(self);
end;

procedure TfrmSlayt.suiButton1Click(Sender: TObject);
begin
if suiButton1.Caption = '&Durdur' Then
Begin
  suiButton1.Caption := '&Devam Et';
  Timer1.Enabled := False;
End
Else
Begin
  suiButton1.Caption := '&Durdur';
  Timer1.Enabled := True;

end;
end;

procedure TfrmSlayt.suiSpinEdit1Change(Sender: TObject);
begin
try
  StrToInt(suiSpinEdit1.Text);
except
    suiSpinEdit1.Text :='5';
    Exit;
end;
  Timer1.Interval :=suiSpinEdit1.Value * 1000;
end;

procedure TfrmSlayt.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case Key of
vk_escape :Close;
VK_PRIOR : suiButton3.Click;
VK_NEXT : suiButton2.Click;
VK_PAUSE : suiButton1.Click;
end;
end;

procedure TfrmSlayt.Label3MouseLeave(Sender: TObject);
begin
label3.Font.Color := clBlue;
end;

procedure TfrmSlayt.Label3MouseEnter(Sender: TObject);
begin
Label3.Font.Color := clRed;
end;

function TfrmSlayt.DosyaAdiniDuzgunYaz(tmp: String): string;
var
ParcaSayisi :Byte;
i:Byte;
begin
Result := '';
ParcaSayisi := Length(tmp) div 27;

for i:=1 to ParcaSayisi do
Begin
  Result := Copy(tmp,1,27)+#13;
  Delete(tmp,1,27);
end;

Result := Result + tmp + #13;

end;

procedure TfrmSlayt.Label3Click(Sender: TObject);
//var
//tmp:string;
begin
//tmp :=Label3.Caption;
//tmp:= StringReplace(tmp,#13,'',[rfReplaceAll, rfIgnoreCase]);
//suimemo1.Lines.Add(tmp)
end;

procedure TfrmSlayt.suiButton3Click(Sender: TObject);
begin
if intIndex2 = 0 Then
Begin
   intIndex2 := Form1.ListBox1.Items.Count;
end;

  Dec(intIndex2);
  ResimGoster(intIndex2);
  Timer1.Enabled := False;
  if suiButton1.Caption = '&Devam Et' Then
    Timer1.Enabled := False
  else
    Timer1.Enabled := True
end;

procedure TfrmSlayt.suiButton2Click(Sender: TObject);
begin
if intIndex2+1 >Form1.ListBox1.Items.Count-1 Then
Begin
   intIndex2 := -1;
end;

  Inc(intIndex2);
  ResimGoster(intIndex2);
  Timer1.Enabled := False;
  if suiButton1.Caption = '&Devam Et' Then
    Timer1.Enabled := False
  else
    Timer1.Enabled := True

end;

procedure TfrmSlayt.FormDestroy(Sender: TObject);
begin


Form1.ini.WriteString('Ayarlar','Interval',IntToStr(Timer1.Interval));

if suiSideChannel1.StayOn Then
  Form1.ini.WriteString('Ayarlar','SideChannel','0')
else
  Form1.ini.WriteString('Ayarlar','SideChannel','1');

if suiPanel1.Pushed Then
  Form1.ini.WriteString('Ayarlar','Panel1','0')
else
  Form1.ini.WriteString('Ayarlar','Panel1','1');


if suiPanel2.Pushed Then
  Form1.ini.WriteString('Ayarlar','Panel2','0')
else
  Form1.ini.WriteString('Ayarlar','Panel2','1');

if suiPanel3.Pushed Then
  Form1.ini.WriteString('Ayarlar','Panel3','0')
else
  Form1.ini.WriteString('Ayarlar','Panel3','1');

if suiPanel4.Pushed Then
  Form1.ini.WriteString('Ayarlar','Panel4','0')
else
  Form1.ini.WriteString('Ayarlar','Panel4','1');

end;

procedure TfrmSlayt.FormCreate(Sender: TObject);
begin
Timer1.Interval :=form1.ini.readinteger('Ayarlar','Interval',5000);
suiSpinEdit1.Value := Timer1.Interval div 1000;


if Form1.ini.ReadString('Ayarlar','SideChannel','0') = '0' Then
   suiSideChannel1.StayOn := True
else
   suiSideChannel1.StayOn := False;

if Form1.ini.ReadString('Ayarlar','Panel1','0') = '0' Then
   suiPanel1.Push
else
   suiPanel1.Pop;

if Form1.ini.ReadString('Ayarlar','Panel2','0') = '0' Then
   suiPanel2.Push
else
   suiPanel2.Pop;

if Form1.ini.ReadString('Ayarlar','Panel3','0') = '0' Then
   suiPanel3.Push
else
   suiPanel3.Pop;

if Form1.ini.ReadString('Ayarlar','Panel4','0') = '0' Then
   suiPanel4.Push
else
   suiPanel4.Pop;

end;

function TfrmSlayt.spGetFileSize(const FileName: string): Longint;
Var
  SearchRec: TSearchRec;
  sgPath   : String;
  inRetval : Integer;
begin
  sgPath   := ExpandFileName(FileName);
  Try
    inRetval := FindFirst(ExpandFileName(FileName), faAnyFile, SearchRec);
    If inRetval = 0 Then
      Result := SearchRec.Size
    Else Result := -1;
  Finally
    SysUtils.FindClose(SearchRec);
  End;
end;
procedure TfrmSlayt.suiButton4Click(Sender: TObject);
begin
close;
end;

end.

