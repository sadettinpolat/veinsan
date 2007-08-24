unit UnitAna;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, StdCtrls,urlmon, clDC, clDownLoader, ExtCtrls,shellapi, ComCtrls,filectrl,
  SUIEdit, SUIMgr, SUIForm, SUIURLLabel,
  SUIComboBox, SUIButton, SUIProgressBar, SUIDlg,inifiles, Menus,
  SUIMainMenu, SUITabControl, SUIStatusBar, SUIPageControl,SchemaPhotoGalleryXML;

//ayn� anda en fazla 1500 tane slayt� indirebilir.....
const cntMaxProgramSayisi  = 1500;

type

  //slaytlar� tespit eden ve indiren thread nesnesi
  TGetlist = class(TThread)
  private
  procedure indir(Memo:TMemo;http:TIdHTTP;Edit:TEdit);
    { Private declarations }
  protected
    procedure Execute; override;
  end;


  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    IdHTTP1: TIdHTTP;
    Button2: TButton;
    Button4: TButton;
    Label1: TLabel;
    Memo2: TMemo;
    Button5: TButton;
    clDownLoader1: TclDownLoader;
    Timer1: TTimer;
    Edit3: TEdit;
    suiForm1: TsuiForm;
    suiThemeManager1: TsuiThemeManager;
    suiMainMenu1: TsuiMainMenu;
    lemler1: TMenuItem;
    Listeyial1: TMenuItem;
    Listelenen1: TMenuItem;
    Ayarlar1: TMenuItem;
    zelletir1: TMenuItem;
    BlueGlass1: TMenuItem;
    DeepBlue1: TMenuItem;
    MacOS1: TMenuItem;
    Protein1: TMenuItem;
    WinXP1: TMenuItem;
    yARDIM1: TMenuItem;
    Yardm1: TMenuItem;
    Hakknda1: TMenuItem;
    N1: TMenuItem;
    k1: TMenuItem;
    suiStatusBar1: TsuiStatusBar;
    StaticText1: TLabel;
    Edit2: TsuiEdit;
    StaticText2: TLabel;
    StaticText3: TLabel;
    Edit1: TsuiEdit;
    ComboBox1: TsuiComboBox;
    dxButton1: TsuiButton;
    dxButton2: TsuiButton;
    dxButton3: TsuiButton;
    dxButton6: TsuiButton;
    Gzat1: TMenuItem;
    Dzenle1: TMenuItem;
    suiURLLabel1: TsuiURLLabel;
    suiProgressBar1: TsuiProgressBar;
    VISGA1: TMenuItem;
    N2: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button7Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit2Enter(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure ComboBox1Enter(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure dxButton4Click(Sender: TObject);
    procedure suiComboBox1Change(Sender: TObject);
    procedure BlueGlass1Click(Sender: TObject);
    procedure DeepBlue1Click(Sender: TObject);
    procedure MacOS1Click(Sender: TObject);
    procedure Protein1Click(Sender: TObject);
    procedure WinXP1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Hakknda1Click(Sender: TObject);
    procedure k1Click(Sender: TObject);
    procedure kabukdegistir(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Yardm1Click(Sender: TObject);
    procedure Listeyial1Click(Sender: TObject);
    procedure Listelenen1Click(Sender: TObject);
    procedure Gzat1Click(Sender: TObject);
    procedure Dzenle1Click(Sender: TObject);
    procedure VISGA1Click(Sender: TObject);
//    procedure PDJXPButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
  ini:TIniFile;
  IslemDevamEdiyor:Boolean;
  PointerVeInsan:Integer;
  strPathSlaytView:string;
  KabukDeger:Byte;
  VISGA:String;
  function GetOptionValue(Lines:Integer):string;
  function GetCaptionValue(Lines:Integer):string;
  function GetImageCount(tmp:String):Byte;
  procedure SetMenuChecked(Value:Boolean);
    { Public declarations }
  end;

  type TVeInsan = Class
    fValue:string;
    fCaption:string;
    end;

var
  Form1: TForm1;
  VeInsan : array [0..cntMaxProgramSayisi] of tveinsan;

implementation

uses SUIThemes,Unitayarlar, UnitHakkinda, UnitSecenekler;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
list :TGetlist;
begin
IslemDevamEdiyor := True;
Edit3.Text :=Edit2.Text;
list := TGetlist.Create(False);
//list.Execute;

//try
//memo1.Lines.Text := IdHTTP1.Get(Edit2.Text);
//except
//  Exit;
//end;
   while list.Suspended = False do
   Begin
    Application.ProcessMessages;
    //  if
   end;
IslemDevamEdiyor := False;
//Animate1.Active := False;
//Animate1.Visible := False;
end;

procedure TForm1.FormDestroy(Sender: TObject);
var
i:Integer;
begin
ini.WriteString('Ayarlar','Path',Edit1.Text);
ini.WriteString('Ayarlar','PathSlaytView',strPathSlaytView);
ini.WriteString('Ayarlar','PathListe',Edit2.Text);
ini.WriteInteger('Ayarlar','KabukDeger',KabukDeger);
ini.UpdateFile;
FreeAndNil(ini);
for i:=0 to cntMaxProgramSayisi do
  VeInsan[i].Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
i:Integer;
begin
ini :=TIniFile.Create('VeInsan.ini');
Edit1.Text := ini.ReadString('Ayarlar','Path','c:\VeInsan\');
strPathSlaytView :=ini.ReadString('Ayarlar','PathSlaytView','c:\VeInsan\');
Edit2.Text := ini.ReadString('Ayarlar','PathListe','http://www.ntvmsnbc.com/modules/slideshow/VeInsan20040419/slideshow.asp');
KabukDeger := ini.ReadInteger('Ayarlar','KabukDeger',2);
Application.Title :='Ve �nsan v.2.2';
VISGA :=ini.ReadString('Ayarlar','VISGA','');

suiProgressBar1.Parent := suiStatusBar1;
  {
case KabukDeger of
0:
1:
2:
3:
4:
else}





//Animate1.Top := 3;
//A/nimate1.Left := 494;
//Animate1.Parent := Shape3;
IslemDevamEdiyor := False;
PointerVeInsan := 0;
for i:=0 to cntMaxProgramSayisi do
  VeInsan[i] := TVeInsan.Create;
end;


procedure TForm1.Button2Click(Sender: TObject);
var
FormBaslangic,FormBitis,i:Integer;
ilkGelenFormTagiMi:Boolean;
IkisinideBuldum:Byte;
begin
//Button5.Click;
ComboBox1.Items.Clear;
ilkGelenFormTagiMi := True;
FormBaslangic := Memo1.Lines.Count +1;
FormBitis := -2;
IkisinideBuldum := 0;

for i:=0 to Memo1.Lines.Count - 1 do
Begin
if IkisinideBuldum = 2 then Break;
// if ((Pos('<form name="menuBuilder">',Memo1.Lines[i])>0) or (Pos('<FORM name="menuBuilder">',Memo1.Lines[i])>0))  then
 if Pos('<form name="menuBuilder">',Memo1.Lines[i])>0  then
 Begin
   FormBaslangic := i;
   IkisinideBuldum := 1;
 end;

 if Pos('</form>',Memo1.Lines[i])>0  then
    if ((ilkGelenFormTagiMi) and (i > FormBaslangic)) then
    Begin
       FormBitis := i;
       ilkGelenFormTagiMi := False;
       IkisinideBuldum := 2;
    end;
end;
//try
PointerVeInsan :=0;
for i:=FormBaslangic to FormBitis do
Begin
 if Pos('<option',Memo1.Lines[i])>0  then
 begin //ilk baslik ise alma devam et
      ComboBox1.Items.Add(GetOptionValue(i) +' ['+GetCaptionValue(i)+']');
      VeInsan[PointerVeInsan].fValue := GetOptionValue(i);
      VeInsan[PointerVeInsan].fCaption := GetCaptionValue(i);
      Inc(PointerVeInsan);
 end;
end;
//except
//end;
ComboBox1.Items.Delete(0);
ComboBox1.ItemIndex := 0;

end;
function TForm1.GetCaptionValue(Lines: Integer): string;
var
tmp:string;
i:Byte;
ValueStart:integer;
begin
tmp :=Memo1.Lines[Lines];
if Pos('</option>',tmp) < Pos('<option',tmp) Then
   tmp := StringReplace(tmp,'</option>','',[]);

i:=1;
while Pos('</option>',tmp) <= 0 Do
Begin
  tmp := tmp + Memo1.Lines[Lines+i];
  Inc(i);
end;
ValueStart :=Pos('>',tmp);
Delete(tmp,1,ValueStart);
ValueStart :=Pos('</option>',tmp);
Delete(tmp,ValueStart,Length(tmp));
Result := tmp;
end;

function TForm1.GetOptionValue(Lines: Integer): string;
var
tmp:string;
i:Byte;
ValueStart:integer;
begin
tmp :=Memo1.Lines[Lines];
if Pos('</option>',tmp) < Pos('<option',tmp) Then
   tmp := StringReplace(tmp,'</option>','',[]);

i:=1;
while Pos('</option>',tmp) <= 0 Do
Begin
  tmp := tmp + Memo1.Lines[Lines+i];
  Inc(i);
end;
ValueStart :=Pos('value=',tmp);
Delete(tmp,1,ValueStart+6); //--> 5 ti 6 oldu
ValueStart :=Pos('>',tmp);
Delete(tmp,ValueStart-1,Length(tmp));
Result := tmp;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
if ComboBox1.ItemIndex = -1 then Exit;


end;

procedure TForm1.Button4Click(Sender: TObject);
var
ResimSayisi,i,Konum,tmpKonum:Integer;
tmp:string;
tmpDownloadPath,tmpSavePath,ProjectName:String;
Metinler,Basliklar,Resimler:array [1..20] of string;
//Metinler : array [1..20] of   AnsiString;
a:Integer;

begin
Button5.Click;
tmpKonum := 0;
Konum :=tmpKonum;
//Var ProjectName = "VeInsan20040419";
for i:=Konum to Memo1.Lines.Count -1 do
Begin
  tmpKonum := i;
  if Pos('var ProjectName',Memo1.Lines[i]) >0 Then
  Begin
      tmp :=Memo1.Lines[i];
      Break;
  end;
end;
Delete(tmp,1,Pos('var ProjectName',tmp)-1);
Delete(tmp,Pos('var ProjectName',tmp),19);
Delete(tmp,Length(tmp)-1,2);
ProjectName := tmp;
//Label5.Caption :='Proje ismi =' + tmp;
suiStatusBar1.SimpleText := 'Proje ismi =' + tmp;
Application.ProcessMessages;
//StatusBar1.Refresh;
//	var PhotoName = new Array("1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg");
Konum := tmpKonum;
for i:=Konum to Memo1.Lines.Count -1 do
Begin
  tmpKonum := i;
  if Pos('var PhotoName',Memo1.Lines[i]) >0 Then
  Begin
      tmp :=Memo1.Lines[i];
      Break;
  end;
end;
Delete(tmp,1,Pos('var PhotoName',tmp)-1);
Delete(tmp,Pos('var PhotoName',tmp),26);
Delete(tmp,Length(tmp)-1,2);

ResimSayisi :=GetImageCount(tmp);
if ResimSayisi = 0 Then
  ShowMessage('Resimler al�namad�...');

//Label5.Caption := ProjectName + ' Resim Say�s� =' + IntToStr(ResimSayisi);
suiStatusBar1.SimpleText :=ProjectName + ' Resim Say�s� =' + IntToStr(ResimSayisi);
Application.ProcessMessages;
//StatusBar1.Refresh;
FillChar(Resimler,SizeOf(Resimler),0);
FillChar(Resimler,SizeOf(Basliklar),0);
FillChar(Resimler,SizeOf(Metinler),0);
if Edit1.Text[Length(Edit1.Text)] <> '\' Then
   Edit1.Text := Edit1.Text + '\';

ForceDirectories(Edit1.Text+ProjectName);


for i:=1 to ResimSayisi do
Begin
  Delete(tmp,1,1);
  Resimler[i] :=Copy(tmp,1,Pos('"',tmp)-1);
  Delete(tmp,1,Length(Resimler[i])+2);
  tmpDownloadPath := 'http://www.ntvmsnbc.com/modules/slideshow/'+ProjectName +'/images/'+Resimler[i];
  tmpSavePath :=Edit1.Text+ProjectName +'\'+Resimler[i];
  clDownLoader1.URL := tmpDownloadPath;
  clDownLoader1.SaveToFile := tmpSavePath;
  clDownLoader1.DownLoad;
//  Label5.Caption := ProjectName + ' ' +Resimler[i] + ' download ediliyor...';
  suiStatusBar1.SimpleText :=ProjectName + ' ' +Resimler[i] + ' download ediliyor...';
Application.ProcessMessages;
//StatusBar1.Refresh;
  while clDownLoader1.IsBusy do
  Begin
    Application.ProcessMessages;
  end;
  //Label5.Caption := ProjectName +  ' ' + Resimler[i] + ' download edildi.';
  suiStatusBar1.SimpleText :=ProjectName +  ' ' + Resimler[i] + ' download edildi.';

Application.ProcessMessages;
//StatusBar1.Refresh;
//  URLDownloadToFile(nil, PChar(tmpDownloadPath), PChar(tmpSavePath), 0, nil);
end;



Konum := tmpKonum;

//var Headline = new Array("Ortado�u�dan bir kay�p daha","Foto�raftaki farkl�l�k","Masumiyetin ���klar�","Bir matador ve bir bo�a ba�ba�a","Papa'n�n nefes veri�i","Roma�n�n do�umg�n� kutlamas�","�Sezer�in yeni imaj��");
for i:=Konum to Memo1.Lines.Count -1 do
Begin
//  Label5.Caption := Resimler[i] + ' ba�l�klar al�n�yor...';
  suiStatusBar1.SimpleText := Resimler[i] + ' ba�l�klar al�n�yor...';
  Application.ProcessMessages;
//  StatusBar1.Refresh;

  tmpKonum := i;
//  if Pos('var Headline',Memo1.Lines[i]) >0 Then
//  Begin
//      tmp :=Memo1.Lines[i];
//      Break;
//  end;

a:=1;
  if Pos('var Headline',Memo1.Lines[i]) >0 Then
  Begin
      tmp :=Memo1.Lines[i];
      while (Pos(');',Memo1.Lines[i+a])) <=  0 Do
      Begin
        tmp := tmp + Memo1.Lines[i+a];
        Inc(a);
      end;
        tmp := tmp + Memo1.Lines[i+a];
      Break;
  end;
end;

Delete(tmp,1,Pos('var Headline',tmp)-1);
Delete(tmp,Pos('var Headline',tmp),25);
Delete(tmp,Length(tmp)-1,2);
//Label5.Caption := Resimler[i] + ' ba�l�klar al�nd�.';
suiStatusBar1.SimpleText :=Resimler[i] + ' ba�l�klar al�nd�.';
Application.ProcessMessages;
//StatusBar1.Refresh;
tmp := StringReplace(tmp,'\"','�',[rfReplaceAll, rfIgnoreCase]);

for i:=1 to ResimSayisi do
Begin
  Delete(tmp,1,1);
  Basliklar[i] :=Copy(tmp,1,Pos('"',tmp)-1);
  Delete(tmp,1,Length(Basliklar[i])+2);
end;


{
var PhotoCaption = new Array("Foto�raf Ortado�u'dan... Filistinli H�seyin Awad Shueni Ramallah'ta �srail askerlerine ta� atarken ba��ndan vuruldu ve �ld�. Cenazesi Bat� �eria'daki k�y�nde kald�r�ld�. T�ren s�ras�nda H�seyin'in cans�z bedeni cenazeye kat�lanlara g�sterildi. Foto muhabiri objektifini kalabal�k �zerinde dola�t�r�rken H�seyin Awad Shueni'nin bir yak�n�na odakland� ve bu �o� an ortaya ��kt�. H�seyin Awad Shueni 17 ya��ndayd�.","Hindistan'dan bir �o� an. Bir ay boyunca Ujian B�lgesi�nde s�ren Nehirde Y�kanma Festivali�nde �ekilmi� bu foto�raf. Binlerce Hindu rahip nehre girip g�nahlar�ndan ar�nmak i�in toplanm��. ��lerinden biri, sakal�yla, sar���yla, g�ne� g�zl���yle, asas�yla ve parlak giysisiyle g�ze �arp�yor. Ayaktaki hari� di�erlerini, kaz�nm�� kafalar� ve ��plakl�klar�yla birbirlerinden ay�rt etmek �ok zor. �stelik g�r�n��leri gibi �o� anda duygular� da ortak. ��nk� t�ren tamamlan�nca rahipli�e kabul edilecekler.","Ad� Malena ve 5 ya��nda.
na ��k�p geri d�nd�. Birle�mi� Milletler M�lteciler Y�ksek Komiserli�i'nin g�zetiminde bir m�lteci kamp�na yerle�tirildiler. Onlar�n baht�na bir �amur ev d��t�. Malena da o evin penceresinden d��ar� bakt�. AP foto�raf��s� Emillio Morenatti deklan��re bast�. Sonu�ta yeni hayata, umudun ve masumiyetin ���klar�yla y�kl� bak��lar� yakalay�verdi.","�spanya'dan, Seville'den bir foto�raf. �nl� Maestrantza Arenas��nda binlerce seyirci nefesini tutmu� bo�a g�re�lerinin ba�lamas�n� bekliyor. Ve arenan�n tam ortas�nda matador El Juli bo�ayla kar�� kar��ya duruyor. Matador hen�z hamlesini yapmam�� ya da bo�a yapmam��. Binlerce insan�n aras�nda iki ki�ilik ba�ba�a bir yaln�zl�k asl�nda bu �o� an...","Foto�raf Roma'dan, Papa 2. Jean Paul��n bir �o� an�. Roma Kolesyumu�ndaki ''�sa'n�n �arm�ha gerili� s�recini'' simgeleyen geleneksel bir ayin s�ras�nda �ekilmi�. Ayine Papa ba�kanl�k ediyor. Olduk�a yorgun g�r�n�yor, ama yine de y�z�nden g�l�msemesini eksik etmemeye �al��m�
yorgun, hareket etmekte bile g��l�k �eken Papa'daki hayat belirtisini b�yle yakalam��.","Milattan �nce 753'lere g�t�ren bir �o� an. Roma'n�n do�u�unun y�ld�n�m� sadece Romal�lar taraf�ndan de�il, Avrupa'n�n bir�ok �lkesinden gelen y�zlerce insan taraf�ndan her y�l 18 Nisan'da kutlan�yor. Roma askerlerinin kost�mlerini giymek ko�uluyla kutlamalar s�ras�ndaki y�r�y��e, her ya�tan, herkes kat�labiliyor. Ama yana��k d�zen gere�i ya�� k���k olanlar en arkaya konuluyor.","Zaman Gazetesi'nden Ali �nal, Cumhurba�kan� Ahmet Necdet Sezer ve e�i Semra Sezer bir t�ren s�ras�nda yanyanayken, uygun a��y� yakalad� ve deklan��re bast�. Sonu�ta bu �o� an ortaya ��kt�. Ve bu foto�rafla, Foto Muhabirleri Dernegi'nin d�zenledi�i ''Fotograflarla T�rk Bas�n� 2003 Yar��mas�''nda  serbest katagoride birincilik �d�l�n�  kazand�. Foto�rafa bir isim de verildi: ''Sezer'in yeni imaj�''...");
}
a:=1;
Konum := tmpKonum;
for i:=Konum to Memo1.Lines.Count -1 do
begin
//  tmpKonum := i;
//  Label5.Caption := Resimler[i] + ' a��klamalar al�n�yor...';
  suiStatusBar1.SimpleText :=Resimler[i] + ' a��klamalar al�n�yor...';
  Application.ProcessMessages;
//  StatusBar1.Refresh;

  if Pos('var PhotoCaption',Memo1.Lines[i]) >0 Then
  Begin
      tmp :=Memo1.Lines[i];
      while (Pos('");',Memo1.Lines[i+a])) <=  0 Do
      Begin
        tmp := tmp + Memo1.Lines[i+a];
        Inc(a);
      end;
        tmp := tmp + Memo1.Lines[i+a];
      Break;
  end;
end;
//Label5.Caption := Resimler[i] + ' a��klamalar al�nd�.';
suiStatusBar1.SimpleText :=Resimler[i] + ' a��klamalar al�nd�.';
Application.ProcessMessages;
//StatusBar1.Refresh;
Delete(tmp,1,Pos('var PhotoCaption',tmp)-1);
Delete(tmp,Pos('var PhotoCaption',tmp),29);
Delete(tmp,Length(tmp)-1,2);
tmp := StringReplace(tmp,'\"','�',[rfReplaceAll, rfIgnoreCase]);

for i:=1 to ResimSayisi do
Begin
//  Label5.Caption := Resimler[i] + ' dosyas�n�n a��klamalar� diske kaydediliyor...';
  suiStatusBar1.SimpleText :=Resimler[i] + ' dosyas�n�n a��klamalar� diske kaydediliyor...';
Application.ProcessMessages;
//StatusBar1.Refresh;
  Delete(tmp,1,1);
  Metinler[i] :=Copy(tmp,1,Pos('"',tmp)-1);
  Delete(tmp,1,Length(Metinler[i])+2);

  Memo2.Lines.Clear;
  Memo2.Lines.Add(Basliklar[i]);
  Memo2.Lines.Add('');
  Memo2.Lines.Add('');
  memo2.Lines.Add(Metinler[i]);

//  memo2.Lines.SaveToFile(Edit1.Text  + projectName + '\'+IntToStr(i) + '.txt');
  memo2.Lines.SaveToFile(Edit1.Text  + projectName + '\'+ChangeFileExt(Resimler[i],'') + '.txt');
//  Label5.Caption := Resimler[i] + ' dosyas�n�n a��klamalar� diske kaydedildi.';
  suiStatusBar1.SimpleText :=Resimler[i] + ' dosyas�n�n a��klamalar� diske kaydedildi.';
Application.ProcessMessages;

end;

suiStatusBar1.SimpleText :='Slayt indirme i�lemi ba�ar�l� bir �ekilde tamamland�...';


end;

function TForm1.GetImageCount(tmp:String): Byte;
var
sayac,i:Integer;
begin
sayac:=0;
for i:=1 to Length(tmp) do
begin
  if tmp[i] ='.' Then
       Inc(Sayac);
end;

Result := sayac;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
//Animate1.Visible := True;
//Animate1.Active := True;
//Label5.Caption :='http://www.ntvmsnbc.com adresinden liste al�n�yor. L�tfen bekleyin...';

suiStatusBar1.SimpleText :='http://www.ntvmsnbc.com adresinden liste al�n�yor. L�tfen bekleyin...';
Application.ProcessMessages;
dxbutton2.Enabled := false;
Dzenle1.Enabled :=False;
dxButton3.Enabled := False;
Gzat1.Enabled :=False;
dxbutton6.Enabled := False;
Listelenen1.Enabled := False;
dxbutton1.Enabled := False;
Listeyial1.Enabled := False;
Edit1.Enabled := False;
Edit2.Enabled := False;
button1.Click;
Button2.Click;
dxButton6.Enabled := ComboBox1.Items.Count > 0;
Listelenen1.Enabled :=ComboBox1.Items.Count > 0;
if ComboBox1.Items.Count > 0 Then
Begin
//  Label5.Caption :='http://www.ntvmsnbc.com adresinden liste al�nd�."listelenen mod�lleri kaydet" d��mesine t�klay�n...';
  suiStatusBar1.SimpleText :='http://www.ntvmsnbc.com adresinden liste al�nd�."listelenen mod�lleri kaydet" d��mesine t�klay�n...';
  Application.ProcessMessages;

end
else
Begin
//  Label5.Caption :='http://www.ntvmsnbc.com adresinden liste al�namad�. Tekrar deneyin...';
  suiStatusBar1.SimpleText :='http://www.ntvmsnbc.com adresinden liste al�namad�. Tekrar deneyin...';
  Application.ProcessMessages;

end;

dxbutton2.Enabled := True;
Dzenle1.Enabled :=True;

dxButton3.Enabled := True;
Gzat1.Enabled :=True;

dxbutton6.Enabled := ComboBox1.Items.Count>0;
Listelenen1.Enabled := ComboBox1.Items.Count>0;
dxbutton1.Enabled := True;
Listeyial1.Enabled := True;
Edit1.Enabled := True;
Edit2.Enabled := true;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
i,k:Integer;
tmp:string;
baseAdres,xmlAdres,SlaytName:String;
list :TGetlist;
galery:IXMLGalleryType;
begin


if ComboBox1.Items.Count > 500 Then
Begin
  SUIMsgDlg('Ayn� anda en fazla 500 slayt indirebilirsiniz.'+#13+'L�tfen D�zenle d��mesine basarak slaytlar� uygun say�larda se�erek i�leme devam ediniz. ',mtConfirmation,[mbok],suiThemeManager1.UIStyle);
  Exit;
end;

suiProgressBar1.Max := ComboBox1.Items.Count;
suiProgressBar1.Visible := True;
suiProgressBar1.Position :=0;
IslemDevamEdiyor := True;
//Animate1.Visible := True;
//Animate1.Active := True;
dxButton6.Enabled := False;
Listelenen1.Enabled := False;
dxButton1.Enabled := False;
Listeyial1.Enabled := False;
dxButton2.Enabled := False;
Dzenle1.Enabled :=False;

dxButton3.Enabled := False;
Gzat1.Enabled :=True;

Edit1.Enabled := False;
for i:=0 to ComboBox1.Items.Count -1 do
Begin
tmp :=ComboBox1.Items[i];
tmp := StringReplace(tmp,'"','',[rfReplaceAll,rfIgnoreCase]);
Delete(tmp,Pos('.asp',tmp)+4,Length(tmp));
tmp := 'http://www.ntvmsnbc.com' + tmp;
    Application.Title := 'Ve �nsan Slayt �ndirme Arac� [�ndirilen Slayt '  + IntToStr(i+1) + '/'+ IntToStr(ComboBox1.Items.Count) + ']               ';
    Timer1.Enabled := True;
if Pos('gallery',tmp) <= 0 Then
Begin
    memo1.Lines.Clear;
    suiStatusBar1.SimpleText :=tmp + ' al�n�yor...';
    Application.ProcessMessages;
    Edit3.Text := tmp;
    list :=TGetlist.Create(False);
    while list.Suspended = False do
      Application.ProcessMessages;

    suiStatusBar1.SimpleText :=tmp + ' kontrol ediliyor...';
    Button4.Click;
end
else
begin
 baseAdres := tmp;  //default.asp
 Delete(baseAdres,Length(baseAdres)-10,11);
 xmlAdres := baseAdres+'photo_gallery.xml';
 SlaytName := trim(Copy(xmlAdres,41,15));
 if FileExists(ExtractFilePath(Application.ExeName)+'temp_gallery.xml') then
  DeleteFile(ExtractFilePath(Application.ExeName)+'temp_gallery.xml');
 clDownLoader1.URL := xmlAdres; ;
 clDownLoader1.SaveToFile := ExtractFilePath(Application.ExeName)+'temp_gallery.xml';
 clDownLoader1.DownLoad;
 suiStatusBar1.SimpleText :=xmlAdres+ ' download ediliyor...';
 Application.ProcessMessages;
 while clDownLoader1.IsBusy do
    Application.ProcessMessages;

  suiStatusBar1.SimpleText :=xmlAdres + ' download edildi.';
  suiStatusBar1.SimpleText :=SlaytName + ' resimleri al�n�yor...';

galery := Loadgallery(ExtractFilePath(Application.ExeName)+'temp_gallery.xml');
ForceDirectories(Edit1.Text+SlaytName);
for k:=0 to galery.Cue.Count - 1 do
begin
 clDownLoader1.URL := baseAdres + galery.Conf.ImgFolder +'/'+ galery.Cue.Items[k].Name;
 clDownLoader1.SaveToFile := Edit1.Text+SlaytName+'\'+galery.Cue.Items[k].Name;
 clDownLoader1.DownLoad;
 suiStatusBar1.SimpleText :=SlaytName +' '+ galery.Cue.Items[k].Name + ' download ediliyor...';
 Application.ProcessMessages;
 while clDownLoader1.IsBusy do
    Application.ProcessMessages;

 Memo2.Lines.Clear;
 Memo2.Lines.Add('');
 Memo2.Lines.Add('');
 Memo2.Lines.Add('');
 Memo2.Lines.Add(galery.Cue.Items[k].Info);
 memo2.Lines.SaveToFile(Edit1.Text+SlaytName+'\'+ChangeFileExt(galery.Cue.Items[k].Name,'') + '.txt');
end;
 { xml i download et    http://www.ntvmsnbc.com/modules/gallery/VeInsan20070531/photo_gallery.xml
   xml i yukle
   resim al
   aciklama al



  tmpSavePath :=Edit1.Text+ProjectName +'\'+Resimler[i];
  clDownLoader1.URL := tmpDownloadPath;
  clDownLoader1.SaveToFile := tmpSavePath;
  clDownLoader1.DownLoad;
//  Label5.Caption := ProjectName + ' ' +Resimler[i] + ' download ediliyor...';
  suiStatusBar1.SimpleText :=ProjectName + ' ' +Resimler[i] + ' download ediliyor...';
Application.ProcessMessages;
//StatusBar1.Refresh;
  while clDownLoader1.IsBusy do
  Begin
    Application.ProcessMessages;
  end;
  //Label5.Caption := ProjectName +  ' ' + Resimler[i] + ' download edildi.';
  suiStatusBar1.SimpleText :=ProjectName +  ' ' + Resimler[i] + ' download edildi.';

Application.ProcessMessages;


 }
end;
 suiStatusBar1.SimpleText :='Slayt indirme g�revi tamamland�...';

    Timer1.Enabled := False;
    suiProgressBar1.StepIt;
end;

dxButton6.Enabled := True;
Listelenen1.Enabled := True;

dxButton1.Enabled := True;
Listeyial1.Enabled := True;
dxButton3.Enabled := True;
Gzat1.Enabled :=True;

dxButton2.Enabled := True;
Dzenle1.Enabled :=True;

Edit1.Enabled := True;
IslemDevamEdiyor := False;
suiProgressBar1.Visible := False;
//Animate1.Active := False;
//Animate1.Visible := False;

end;

procedure TForm1.Button5Click(Sender: TObject);
//var
//i:Integer;
begin
//for i:=0 to Memo1.Lines.Count -1 do
//begin
//  Memo1.Lines[i] :=  StringReplace(Memo1.Lines[i],'option','OPTION',[rfReplaceAll,rfIgnoreCase]);
//  Memo1.Lines[i] :=  StringReplace(Memo1.Lines[i],'VALUE','value',[rfReplaceAll,rfIgnoreCase]);
//  Memo1.Lines[i] :=  StringReplace(Memo1.Lines[i],'form','FORM',[rfReplaceAll,rfIgnoreCase]);
//  Memo1.Lines[i] :=  StringReplace(Memo1.Lines[i],'NAME','name',[rfReplaceAll,rfIgnoreCase]);
//  Memo1.Lines[i] :=  StringReplace(Memo1.Lines[i],'MENUBUILDER','menuBuilder',[rfReplaceAll,rfIgnoreCase]);
//end;

end;

procedure TForm1.Button8Click(Sender: TObject);
begin
//info := 'written by sadettinpolat@yahoo.com' + #13 + 'http://www.turkiyeweb.com/VeInsan/';

//ShellAboutA(Handle,'Ve �nsan',PChar(info),Application.Icon.Handle);
frmhakkinda.ShowModal;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if IslemDevamEdiyor Then
Begin
{  suiMessageDialog1.Caption := 'Dikkat!';
  suiMessageDialog1.Button1Caption :='&Evet';
  suiMessageDialog1.Button2Caption :='&Hay�r';
  suiMessageDialog1.ButtonCursor := crHandPoint;
  suiMessageDialog1.Button1ModalResult := mrYes;
  suiMessageDialog1.Button2ModalResult := mrNone;
  suiMessageDialog1.IconType := suiStop;
  suiMessageDialog1.Text :='��lem devam ediyor. Sonland�rmak istiyor musun?';
  suiMessageDialog1.UIStyle :=suiThemeManager1.UIStyle;
  suiMessageDialog1.ButtonCount :=2;}

  if  SUIMsgDlg('��lem devam ediyor. Sonland�rmak istiyor musunuz?',mtConfirmation,[mbyes,mbno],suiThemeManager1.UIStyle) = mrYes Then
//  if suiMessageDialog1.ShowModal = mrYes Then
  Begin
//      Label5.Caption :='��lem sonland�r�l�yor. L�tfen bekleyin....';
      suiStatusBar1.SimpleText :='��lem sonland�r�l�yor. L�tfen bekleyin....';
       if clDownLoader1.IsBusy Then
        clDownLoader1.Stop;
        while clDownLoader1.IsBusy do
          Application.ProcessMessages;

        Halt;
  end
  else
      Action :=  caNone;
end;
end;
procedure TForm1.Button7Click(Sender: TObject);
var
path:string;
begin
filectrl.SelectDirectory('Dizin Belirtin','',path);
if path <> '' then
//  Edit1.Text := 'C:\VeInsan\'
//else
  Edit1.Text := path;
end;

procedure TForm1.Button9Click(Sender: TObject);
var
i:Integer;
begin
if ComboBox1.Items.Count = 0 then exit;

with frmAyarlar do
begin
//  CheckListBox1.Items.Clear;
  ListView1.Items.Clear;
  for i:=0 to ComboBox1.Items.Count -1 do
  Begin
//    CheckListBox1.Items.Add(ComboBox1.Items[i]);

    if (Pos('VeInsan20070409',ComboBox1.Items[i]) > 0) or
       (Pos('VeInsan20070410',ComboBox1.Items[i]) > 0) or
       (Pos('VeInsan20070411',ComboBox1.Items[i]) > 0) or
       (Pos('VeInsan20070412',ComboBox1.Items[i]) > 0) or
       (Pos('VeInsan20070413',ComboBox1.Items[i]) > 0) or
       (Pos('VeInsan20070418',ComboBox1.Items[i]) > 0) or
       (Pos('VeInsan20070419',ComboBox1.Items[i]) > 0) Then
    begin
      //islem yapma
    end
    else
    begin
      with ListView1.Items.Add do
      Begin
      Caption := ComboBox1.Items[i];
      Checked := True;
      end;
    end;
  end;
//                        0B,3A,A1
//  for i:=0 to CheckListBox1.Items.Count-1 do
//  Begin
//    CheckListBox1.Checked[i] := True;
//  end;
    ListView1.VScrollBar := nil;
    ListView1.VScrollBar := suiScrollBar1;

end;


frmayarlar.ShowModal;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
Application.Title  :=COPY(Application.Title,2,LENGTH(Application.Title)-1)+Application.Title[1];
end;

{ TGetlist }

procedure TGetlist.Execute;
begin
//  inherited;
//
indir(Form1.Memo1,Form1.IdHTTP1,Form1.Edit3);
Suspend;
end;

procedure TGetlist.indir(Memo: TMemo; http: TIdHTTP; Edit: TEdit);
begin

try
memo.Lines.Text := HTTP.Get(Edit.Text);
except
  Exit;
end;

end;

procedure TForm1.Panel1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
  SC_DragMove = $F012;
begin
  Begin
   ReleaseCapture;
   form1.perform(WM_SysCommand, SC_DragMove, 0);
  End;
end;


procedure TForm1.Edit2Enter(Sender: TObject);
begin
Edit2.Color :=   clWhite;
end;

procedure TForm1.Edit2Exit(Sender: TObject);
begin
Edit2.Color :=   $00E8E8E8;
end;

procedure TForm1.Edit1Enter(Sender: TObject);
begin
Edit1.Color :=   clWhite;
end;

procedure TForm1.Edit1Exit(Sender: TObject);
begin
Edit1.Color :=   $00E8E8E8;
end;

procedure TForm1.ComboBox1Enter(Sender: TObject);
begin
ComboBox1.Color :=   clWhite;

end;

procedure TForm1.ComboBox1Exit(Sender: TObject);
begin
ComboBox1.Color :=   $00E8E8E8;
end;


procedure TForm1.dxButton4Click(Sender: TObject);
begin
Close;
end;

procedure TForm1.suiComboBox1Change(Sender: TObject);

begin

//BlueGlass
//DeepBlue
//MacOS
//Protein
//WinXP


end;

procedure TForm1.BlueGlass1Click(Sender: TObject);
begin
    suiThemeManager1.UIStyle :=BlueGlass;
    frmAyarlar.suiThemeManager1.UIStyle :=BlueGlass;
    frmHakkinda.suiThemeManager1.UIStyle := BlueGlass;
    Form2.suiThemeManager1.UIStyle := BlueGlass;
    BlueGlass1.Checked := True;
//      SetMenuChecked(False);
end;

procedure TForm1.DeepBlue1Click(Sender: TObject);
begin
    suiThemeManager1.UIStyle :=DeepBlue;
    frmAyarlar.suiThemeManager1.UIStyle :=DeepBlue;
    frmHakkinda.suiThemeManager1.UIStyle := DeepBlue;
        Form2.suiThemeManager1.UIStyle := DeepBlue;
//    SetMenuChecked(False);
DeepBlue1.Checked := True;
end;

procedure TForm1.MacOS1Click(Sender: TObject);
begin
    suiThemeManager1.UIStyle :=MacOS;
    frmAyarlar.suiThemeManager1.UIStyle :=MacOS;
    frmHakkinda.suiThemeManager1.UIStyle := MacOS;
//      SetMenuChecked(False);
        Form2.suiThemeManager1.UIStyle := MacOS;
MacOS1.Checked := True;
end;

procedure TForm1.Protein1Click(Sender: TObject);
begin
    suiThemeManager1.UIStyle :=Protein;
    frmAyarlar.suiThemeManager1.UIStyle :=Protein;
    frmHakkinda.suiThemeManager1.UIStyle := Protein;
            Form2.suiThemeManager1.UIStyle := Protein;
//      SetMenuChecked(False);
Protein1.Checked := True;
end;

procedure TForm1.WinXP1Click(Sender: TObject);
begin
    suiThemeManager1.UIStyle :=WinXP;
    frmAyarlar.suiThemeManager1.UIStyle :=WinXP;
    frmHakkinda.suiThemeManager1.UIStyle := WinXP;
                Form2.suiThemeManager1.UIStyle := WinXP;
//    SetMenuChecked(False);
WinXP1.Checked := True;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

if Key = vk_f9 then
  zelletir1.Caption :='Lost :)';


end;

procedure TForm1.SetMenuChecked(Value: Boolean);
begin
DeepBlue1.Checked := Value;
MacOS1.Checked := Value;
WinXP1.Checked := Value;
BlueGlass1.Checked := Value;
Protein1.Checked := Value;
end;

procedure TForm1.Hakknda1Click(Sender: TObject);
begin
frmhakkinda.ShowModal;
end;

procedure TForm1.k1Click(Sender: TObject);
begin
Close;
end;

procedure TForm1.kabukdegistir(Sender: TObject);
begin
if Sender is TMenuItem then
Begin
  KabukDeger := (Sender as TMenuItem).Tag;
  (Sender as TMenuItem).Checked := True;
end;

if not (KabukDeger in [0..4]) then
  KabukDeger :=2;

 case KabukDeger of
 0: Begin
    suiThemeManager1.UIStyle :=BlueGlass;
    frmAyarlar.suiThemeManager1.UIStyle :=BlueGlass;
    frmHakkinda.suiThemeManager1.UIStyle := BlueGlass;
    Form2.suiThemeManager1.UIStyle := BlueGlass;
    BlueGlass1.Checked := True;

    end;
 1: Begin
    suiThemeManager1.UIStyle :=DeepBlue;
    frmAyarlar.suiThemeManager1.UIStyle :=DeepBlue;
    frmHakkinda.suiThemeManager1.UIStyle := DeepBlue;
    Form2.suiThemeManager1.UIStyle := DeepBlue;
    DeepBlue1.Checked := True;

    end;
 2: Begin
    suiThemeManager1.UIStyle :=MacOS;
    frmAyarlar.suiThemeManager1.UIStyle :=MacOS;
    frmHakkinda.suiThemeManager1.UIStyle := MacOS;
    Form2.suiThemeManager1.UIStyle := MacOS;
    MacOS1.Checked := True;
    end;
 3: Begin
    suiThemeManager1.UIStyle :=Protein;
    frmAyarlar.suiThemeManager1.UIStyle :=Protein;
    frmHakkinda.suiThemeManager1.UIStyle := Protein;
    Form2.suiThemeManager1.UIStyle := Protein;
    Protein1.Checked := True;
    end;
 4: Begin
    suiThemeManager1.UIStyle :=WinXP;
    frmAyarlar.suiThemeManager1.UIStyle :=WinXP;
    frmHakkinda.suiThemeManager1.UIStyle := WinXP;
    Form2.suiThemeManager1.UIStyle := WinXP;
    WinXP1.Checked := True;
    end;
 end;


end;

procedure TForm1.FormShow(Sender: TObject);
begin
kabukdegistir(sender);
end;

procedure TForm1.Yardm1Click(Sender: TObject);
begin
SUIMsgDlg('1-Slaytlar�n listesini almak i�in Listeyi Al d��mesine t�klay�n ve biraz bekleyin.' + #13+#10+#13+
          '2-D�zenle d��mesine t�klayarak indirmek istedi�iniz Slaytlar� ayarlay�n.' + #13+#10+ #13+
          '3-Slaytlar� bilgisayara kaydet d��mesine t�klay�n ve resimlerin indirilmesini bekleyin...',mtinformation,[mbok],suiThemeManager1.UIStyle)
end;

procedure TForm1.Listeyial1Click(Sender: TObject);
begin
Button6Click(self);
end;

procedure TForm1.Listelenen1Click(Sender: TObject);
begin
Button3Click(self);
end;

procedure TForm1.Gzat1Click(Sender: TObject);
begin
dxButton2.Click;
end;

procedure TForm1.Dzenle1Click(Sender: TObject);
begin
Button9Click(self);
end;

procedure TForm1.VISGA1Click(Sender: TObject);
begin
if FileExists(VISGA) then
   ShellExecute(handle,'open',pchar(visga),nil,nil,SW_SHOWNORMAL)
else
begin
  SUIMsgDlg('Ve �nsan Slayt �ndirme Arac� bulunamad�.'+#13+'Program�n bulundu�u yeri belirtebilece�iniz b�l�m �imdi a��lacakt�r.'+#13+
             'E�er Ve �nsan Slayt �ndirme Arac� bilgisayar�n�zda yoksa'+#13+
             'http://veinsan.googlecode.com adresinden indirebilirsiniz.',mtConfirmation,[mbok],suiThemeManager1.UIStyle);
  if Form2.ShowModal = mrOk Then
  Begin
   if FileExists(VISGA) then
      ShellExecute(handle,'open',pchar(visga),nil,nil,SW_SHOWNORMAL)
  End;
end;
end;

end.
