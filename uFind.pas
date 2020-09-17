unit uFind;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, ComCtrls, StdCtrls;

type
  TfFind = class(TForm)
    Label1: TLabel;
    eText: TEdit;
    cCat: TCheckBox;
    Label2: TLabel;
    eCat: TComboBox;
    cClient: TCheckBox;
    eClient: TComboBox;
    cTP: TRadioGroup;
    cData: TCheckBox;
    eData: TDateTimePicker;
    cDirec: TCheckBox;
    eDirec: TComboBox;
    eUsr: TComboBox;
    cUsr: TCheckBox;
    bFind: TSpeedButton;
    Bevel1: TBevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cCatClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eCatChange(Sender: TObject);
    procedure bFindClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure eTextChange(Sender: TObject);
    procedure cClientClick(Sender: TObject);
    procedure eClientChange(Sender: TObject);
    procedure cTPClick(Sender: TObject);
    procedure cDirecClick(Sender: TObject);
    procedure eDirecChange(Sender: TObject);
    procedure cUsrClick(Sender: TObject);
    procedure eUsrChange(Sender: TObject);
    procedure cDataClick(Sender: TObject);
    procedure eDataChange(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure CreateParams(var Params: TCreateParams); override;
  public
    { Public declarations }
  end;

var
  fFind: TfFind;

implementation

uses uData, uMain;

{$R *.dfm}

{ TfFind }

procedure TfFind.CreateParams(var Params: TCreateParams);
begin
inherited CreateParams(Params);
with params do
   ExStyle := ExStyle or WS_EX_APPWINDOW;
end;

procedure TfFind.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TfFind.cCatClick(Sender: TObject);
begin
 if (cCat.Checked = TRUE) then cClient.Enabled := TRUE else
 begin
  cClient.Enabled := FALSE;
  cClient.Checked := FALSE;
 end;
 bFindClick(self);
end;

procedure TfFind.FormShow(Sender: TObject);
begin
 if fData.FillUsrCb(eDirec) = 0 then cDirec.Enabled := TRUE else cDirec.Enabled := FALSE;
 if fData.FillUsrCb(eUsr)   = 0 then cUsr.Enabled   := TRUE else cUsr.Enabled   := FALSE;
 if fData.FillCatsC(eCat)   = 0 then
 begin
  cCat.Enabled := TRUE;
  if fData.FillClientC(eClient,'Where CAT='+IntToStr(integer(eCat.Items.Objects[eCat.ItemIndex]))) = 0 then
   begin
    eClient.Enabled := TRUE;
    cClient.Enabled := TRUE;
   end else
   begin
    eClient.Enabled := FALSE;
    cClient.Enabled := FALSE;
   end;
 end else
  begin
   cCat.Enabled := FALSE;
   eClient.Clear;
   eClient.Items.Add('Пусто :р');
   eClient.Enabled := FALSE;
   cClient.Enabled := FALSE;
  end;

end;

procedure TfFind.eCatChange(Sender: TObject);
begin
  if fData.FillClientC(eClient,'Where CAT='+IntToStr(integer(eCat.Items.Objects[eCat.ItemIndex]))) = 0 then
   begin
    eClient.Enabled := TRUE;
    cClient.Enabled := TRUE;
   end else
   begin
    eClient.Enabled := FALSE;
    cClient.Enabled := FALSE;
   end;
 bFindClick(self);
end;

procedure TfFind.bFindClick(Sender: TObject);
var Where: string;
begin
 if (Length(eText.Text) > 0) then Where := ('Where ((TB_QUEST.TEXT LIKE '+''''+'%'+eText.Text+'%'+''''+')') else Where := ('Where ((TB_QUEST.TEXT LIKE '+''''+'%'+''''+')');
 if (cCat.Checked) then Where := Where+'and(TB_CLIENT.CAT='+IntToStr(integer(eCat.Items.Objects[eCat.ItemIndex]))+')';
 if (cClient.Checked) then Where := Where+'and(TB_QUEST.CLIENT='+IntToStr(integer(eClient.Items.Objects[eClient.ItemIndex]))+')';
 if (cDirec.Checked) then Where := Where+'and(TB_QUEST.DIREC='+IntToStr(integer(eDirec.Items.Objects[eDirec.ItemIndex]))+')';
 if (cUsr.Checked) then Where := Where+'and(TB_QUEST.USR='+IntToStr(integer(eUsr.Items.Objects[eUsr.ItemIndex]))+')';
 if (cData.Checked) then Where := Where+'and((TB_QUEST.DATA >='+''''+DateToStr(eData.Date)+' 00:00:00'+''''+')and(TB_QUEST.DATA <='+''''+DateToStr(eData.Date)+' 23:59:59'+''''+'))';
 case cTP.ItemIndex of
  1: Where := Where+'and(TB_QUEST.TP='+''''+'0'+''''+')';
  2: Where := Where+'and(TB_QUEST.TP='+''''+'1'+''''+')';
 end;
 Where := Where+')';
 if fData.FillSGF(fMain.sgClients,Where) = 0 then
 begin
  fMain.Timer.Enabled := FALSE;
  fMain.rgClOrder.Enabled := FALSE;
//  fFind.Close();
 end else
  begin
   fMain.Timer.Enabled := TRUE;
   MessageBox(fFind.Handle,'Ничего не найдено.','Найдено.',MB_ICONINFORMATION or MB_OK);
  end;
end;

procedure TfFind.FormCreate(Sender: TObject);
begin
 eData.DateTime := Now();
end;

procedure TfFind.eTextChange(Sender: TObject);
begin
 bFindClick(self);
end;

procedure TfFind.cClientClick(Sender: TObject);
begin
 bFindClick(self);
end;

procedure TfFind.eClientChange(Sender: TObject);
begin
 bFindClick(self);
end;

procedure TfFind.cTPClick(Sender: TObject);
begin
 bFindClick(self);
end;

procedure TfFind.cDirecClick(Sender: TObject);
begin
 bFindClick(self);
end;

procedure TfFind.eDirecChange(Sender: TObject);
begin
 bFindClick(self);
end;

procedure TfFind.cUsrClick(Sender: TObject);
begin
 bFindClick(self);
end;

procedure TfFind.eUsrChange(Sender: TObject);
begin
 bFindClick(self);
end;

procedure TfFind.cDataClick(Sender: TObject);
begin
 bFindClick(self);
end;

procedure TfFind.eDataChange(Sender: TObject);
begin
 bFindClick(self);
end;

procedure TfFind.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
// if (Key = VK_RETURN) then  bFindClick(self);
end;

end.
