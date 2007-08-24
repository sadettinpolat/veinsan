unit Tkanal;

interface

uses
  Classes;

type
  TKanal2 = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation

uses UnitHakkinda;

{ Important: Methods and properties of objects in VCL or CLX can only be used
  in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TKanal.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ TKanal }

procedure TKanal2.Execute;
begin

try
frmHakkinda.suiMemo1.Lines.Text := frmHakkinda.IdHTTP1.Get('http://veinsan.googlecode.com/files/destek.txt');
except
  frmHakkinda.suiMemo1.Lines.Add('Bilgiler alýnamadý...');
end;
   Suspend;
end;

end.
