unit Unitayarlar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, CheckLst, ComCtrls, Menus,
SUIDlg,  SUIForm, SUIPopupMenu, SUIMgr, SUIListView, SUIButton, SUIScrollBar;

type
  TfrmAyarlar = class(TForm)
    Label2: TLabel;
    Shape2: TShape;
    Shape1: TShape;
    suiForm1: TsuiForm;
    suiThemeManager1: TsuiThemeManager;
    suiPopupMenu1: TsuiPopupMenu;
    mnSe2: TMenuItem;
    mnBrak2: TMenuItem;
    ersevir2: TMenuItem;
    aretle2: TMenuItem;
    aretiKaldr2: TMenuItem;
    ListView1: TsuiListView;
    StaticText1: TLabel;
    suiButton1: TsuiButton;
    suiButton2: TsuiButton;
    suiButton3: TsuiButton;
    suiButton4: TsuiButton;
    suiButton5: TsuiButton;
    suiButton6: TsuiButton;
    suiButton7: TsuiButton;
    suiScrollBar1: TsuiScrollBar;
    procedure Button7Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure PDJXPButton5Click(Sender: TObject);
    procedure Panel2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mnSe1Click(Sender: TObject);
    procedure mnBrak1Click(Sender: TObject);
    procedure ersevir1Click(Sender: TObject);
    procedure aretle1Click(Sender: TObject);
    procedure aretiKaldr1Click(Sender: TObject);
    procedure ListView11DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAyarlar: TfrmAyarlar;

implementation

uses UnitAna;

{$R *.dfm}

procedure TfrmAyarlar.Button7Click(Sender: TObject);
var
i:Integer;
begin
  Form1.ComboBox1.Items.Clear;
  for i:=0 to ListView1.Items.Count -1 do
    if ListView1.Items[i].Checked Then
       Form1.ComboBox1.Items.Add(ListView1.Items[i].Caption);

  Form1.ComboBox1.ItemIndex := 0;
  Close;
end;

procedure TfrmAyarlar.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmAyarlar.Button2Click(Sender: TObject);
var
i:Integer;
begin
  for i:=0 to ListView1.Items.Count -1 do
    ListView1.Items[i].Checked := True;
end;

procedure TfrmAyarlar.Button3Click(Sender: TObject);
var
i:Integer;
begin
  for i:=0 to ListView1.Items.Count -1 do
    ListView1.Items[i].Checked := False;
end;

procedure TfrmAyarlar.Button4Click(Sender: TObject);
var
i:Integer;
begin
  for i:=0 to ListView1.Items.Count -1 do
    ListView1.Items[i].Checked := not ListView1.Items[i].Checked;
end;

procedure TfrmAyarlar.Button5Click(Sender: TObject);
var
i:Integer;
begin
  for i:=0 to ListView1.Items.Count -1 do
    if  ListView1.Items[i].Selected Then
       ListView1.Items[i].Checked := True;
end;

procedure TfrmAyarlar.PDJXPButton5Click(Sender: TObject);
var
i:Integer;
begin
  for i:=0 to ListView1.Items.Count -1 do
    if  ListView1.Items[i].Selected Then
        ListView1.Items[i].Checked := False;
end;

procedure TfrmAyarlar.Panel2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
  SC_DragMove = $F012;
begin
  Begin
   ReleaseCapture;
   frmAyarlar.perform(WM_SysCommand, SC_DragMove, 0);
  end;
end;

procedure TfrmAyarlar.mnSe1Click(Sender: TObject);
begin
  Button2Click(self);
end;

procedure TfrmAyarlar.mnBrak1Click(Sender: TObject);
begin
  Button3Click(self) //PDJXPButton2.Click;
end;

procedure TfrmAyarlar.ersevir1Click(Sender: TObject);
begin
  Button4Click(self) //PDJXPButton3.Click;
end;

procedure TfrmAyarlar.aretle1Click(Sender: TObject);
begin
  Button5Click(self)  //PDJXPButton4.Click;
end;

procedure TfrmAyarlar.aretiKaldr1Click(Sender: TObject);
begin
  PDJXPButton5Click(self); //PDJXPButton5.Click;
end;

procedure TfrmAyarlar.ListView11DblClick(Sender: TObject);
begin
  ListView1.Items[ListView1.ItemIndex].Checked := not ListView1.Items[ListView1.ItemIndex].Checked
end;

end.
