unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg,filectrl,clipbrd, Menus, SUIForm,
  SUIEdit, SUIButton, SUIMemo, SUIListBox, SUIPopupMenu,inifiles,
  SUIImagePanel, SUIMgr, SUISideChannel, SUIDlg;

type
  TForm1 = class(TForm)
    Panel1: TsuiPanel;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    FontDialog1: TFontDialog;
    YoluKopyala1: TMenuItem;
    suiForm1: TsuiForm;
    PopupMenu1: TsuiPopupMenu;
    ListBox1: TsuiListBox;
    Memo1: TsuiMemo;
    SeiliDosyaySil1: TMenuItem;
    suiThemeManager1: TsuiThemeManager;
    Panel3: TsuiPanel;
    Button3: TsuiButton;
    Button1: TsuiButton;
    Button4: TsuiButton;
    Edit1: TsuiEdit;
    Button2: TsuiButton;
    Splitter2: TSplitter;
    Splitter1: TSplitter;
    suiButton1: TsuiButton;
    procedure suitempButton1Click(Sender: TObject);
    procedure suitempListBox1Click(Sender: TObject);
    procedure suitempListBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure suitempButton2Click(Sender: TObject);
    procedure suitempButton3Click(Sender: TObject);
    procedure suitempButton4Click(Sender: TObject);
    procedure YoluKopyala1Click(Sender: TObject);
    procedure ResmiHafzayaKopyala1Click(Sender: TObject);
    procedure SeiliDosyaySil1Click(Sender: TObject);
    procedure suiButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
  resim :TJPEGImage;
  ini:TIniFile;
procedure  FindFiles(StartDir, FileMask: string);
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses UnitHakkinda,suithemes, Unitslayt;

{$R *.dfm}

procedure TForm1.suitempButton1Click(Sender: TObject);
begin


{
Form1'in üzerindeki Memo1'e bulunan dosyalari ekler.
Not: Kod recursion kullanmakta. Cok fazla (Binlerce)
dosya bulundugunda Stack Overflow hatasi verebilir
}


ListBox1.Items.Clear;
if Edit1.Text[Length(Edit1.Text)] <>'\' then
  Edit1.Text := Edit1.Text + '\';

FindFiles(Edit1.Text, '*.jpg');

if ListBox1.Items.Count > 0 Then
Begin
  ListBox1.ItemIndex := 0;
  suitempListBox1Click(Self);
  ActiveControl := ListBox1;
  ListBox1.Perform(WM_KEYDOWN,VK_END,0);
end;

end;


procedure TForm1.FindFiles(StartDir, FileMask: string);
var
  SR: TSearchRec;
  DirList: TStringList;
  IsFound: Boolean;
  i: integer;
begin
  if StartDir[length(StartDir)] <> '\' then
    StartDir := StartDir + '\';


  IsFound :=
    FindFirst(StartDir+FileMask, faAnyFile-faDirectory, SR) = 0;
  while IsFound do begin
  ListBox1.Items.Add(StartDir + SR.Name);
//    Memo1.Lines.Add(StartDir + SR.Name);
    IsFound := FindNext(SR) = 0;
  end;
  FindClose(SR);

  DirList := TStringList.Create;
  IsFound := FindFirst(StartDir+'*.*', faAnyFile, SR) = 0;
  while IsFound do begin
    if ((SR.Attr and faDirectory) <> 0) and
         (SR.Name[1] <> '.') then
      DirList.Add(StartDir + SR.Name);
    IsFound := FindNext(SR) = 0;
  end;
  FindClose(SR);

  for i := 0 to DirList.Count-1 do
    FindFiles(DirList[i], FileMask);
  DirList.Free;
end;


procedure TForm1.suitempListBox1Click(Sender: TObject);
var
tmp:String;

begin

if ListBox1.ItemIndex = -1 then Exit;
  tmp := ListBox1.Items[ListBox1.ItemIndex];
if FileExists(tmp) Then
Begin
//  memo1.Lines.SaveToFile();
  Caption :='Ve Ýnsan Slayt View [' + tmp + ']';
  resim.Empty;
  resim.LoadFromFile(tmp);
  Image1.Picture.Assign(resim);
  ScrollBox1.VertScrollBar.Range := resim.Height;
  ScrollBox1.HorzScrollBar.Range := resim.Width;
  //Image1.Picture.Graphic.LoadFromFile(tmp);
  tmp :=StringReplace(tmp,'.jpg','.txt',[]);
  if FileExists(tmp) Then
    memo1.Lines.LoadFromFile(tmp)
  else
  Begin
    memo1.Lines.Clear;
    Memo1.Lines.Add(tmp +' dosyasý bulunamadý...');
  end;
end;

end;

procedure TForm1.suitempListBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//case Key of
//vk_up:
//vk_down:
//end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
resim :=TJPEGImage.Create;
Application.Title := 'Ve Insan Slayt Görüntüleyici';
ini := TIniFile.Create('VeInsan.ini');
Edit1.Text := ini.ReadString('Ayarlar','path','c:\veinsan\');

Memo1.Font.Name := ini.ReadString('Ayarlar','FontName','Verdana');
Memo1.Font.Size := ini.ReadInteger('Ayarlar','FontSize',9);
Memo1.Font.Style:= tfontstyles(  TFontStyle(ini.ReadInteger('Ayarlar','FontStyle',1)));
Memo1.Font.Color:=  StringToColor(ini.ReadString('Ayarlar','FontColor','clBlack'));
Memo1.Font.Charset := 162;


//  ini.WriteString('Ayarlar','FontStyle',IntToStr( Integer(TFontStyle(FontDialog1.Font.Style))));

end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
resim.Free;
ini.WriteString('Ayarlar','Path',Edit1.Text);
ini.Free;

end;

procedure TForm1.suitempButton2Click(Sender: TObject);
begin
//ShowMessage('Ve Ýnsan Slayt View 1.0' +#13+ 'sadettin polat' + #13 + 'sadettinpolat@yahoo.com' + #13 + 'Yardýmlarýndan dolayý Ali Sarý''ya teþekkürler' + #13+ 'alisari@softhome.net' + #13 + 'http://www.turkiyeweb.com/VeInsan/');
frmHakkinda.ShowModal;
end;

procedure TForm1.suitempButton3Click(Sender: TObject);
begin

FontDialog1.Font := Memo1.Font;


if FontDialog1.Execute Then
Begin
//ShowMessage( IntToStr( Integer(TFontStyle(FontDialog1.Font.Style))));

 Memo1.Font  := FontDialog1.Font;


  ini.WriteString('Ayarlar','FontName',FontDialog1.Font.Name);
  ini.WriteString('Ayarlar','FontSize',IntToStr(FontDialog1.Font.Size));
  ini.WriteString('Ayarlar','FontStyle',IntToStr( Integer(TFontStyle(FontDialog1.Font.Style))));
  ini.WriteString('Ayarlar','FontColor',ColorToString(FontDialog1.Font.Color));
  ini.UpdateFile;

end;



end;

procedure TForm1.suitempButton4Click(Sender: TObject);
var
path:string;
begin
SelectDirectory('Dizin belirtin','',path);
if path <> '' Then
  Edit1.Text := path
end;

procedure TForm1.YoluKopyala1Click(Sender: TObject);
var
a:TClipboard;
begin
if ListBox1.ItemIndex = -1 then
begin
  ShowMessage('Liste boþ!');
  Exit;
end;
a:= TClipboard.Create;
a.AsText := ListBox1.Items[ListBox1.itemindex];
FreeAndNil(a);
end;

procedure TForm1.ResmiHafzayaKopyala1Click(Sender: TObject);
var
a:TClipboard;
begin
if ListBox1.ItemIndex = -1 then
begin
  ShowMessage('Liste boþ!');
  Exit;
end;

a:= TClipboard.Create;

a.Assign(Image1.Picture.Graphic);
FreeAndNil(a);

end;

procedure TForm1.SeiliDosyaySil1Click(Sender: TObject);
var
eleman:Integer;
begin
if ListBox1.ItemIndex <0 Then
Begin
  ShowMessage('Seçili resim yok.');
  Exit;
end;
eleman := ListBox1.ItemIndex;
if ListBox1.Items.Count = 1 Then
  eleman := -1;


if SUIMsgDlg(ListBox1.Items[ListBox1.itemindex]+ ' dosyasýný silmek istediðinize emin misiniz?',mtconfirmation,[mbyes,mbno],suiThemeManager1.uistyle) = mryes Then
Begin
  if DeleteFile(ListBox1.Items[ListBox1.itemindex]) Then
  Begin
    DeleteFile(ChangeFileExt(ListBox1.Items[ListBox1.ItemIndex],'txt'));
    ListBox1.Items.Delete(ListBox1.ItemIndex);
    ListBox1.ItemIndex := eleman;
    suitempListBox1Click(self);
  end
  else
    ShowMessage('silinirken hata oluþtu');
end;
  
end;

procedure TForm1.suiButton1Click(Sender: TObject);
begin

if ListBox1.Items.Count <1 Then
begin
  ShowMessage('Gösterilecek Resim Yok!');
  Exit;
end;

if ListBox1.ItemIndex = -1 Then
  frmSlayt.intIndex2 :=0
else
  frmSlayt.intIndex2 := ListBox1.ItemIndex;
frmSlayt.suiMemo1.Font := Memo1.Font;
frmSlayt.suiMemo1.Lines := Memo1.Lines;
frmSlayt.ResimGoster(ListBox1.ItemIndex);
frmSlayt.ShowModal;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = vk_escape then Close;
end;

end.
