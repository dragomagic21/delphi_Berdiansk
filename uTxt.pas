unit uTxt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons, Mask;

type
  TfTxt = class(TForm)
    Label1: TLabel;
    LDirec: TLabel;
    eMsg: TMemo;
    bOk: TBitBtn;
    bCancel: TBitBtn;
    bIgnore: TBitBtn;
    Bevel1: TBevel;
    rgRep: TRadioGroup;
    eData: TDateTimePicker;
    cbM: TComboBox;
    cbD: TComboBox;
    eTime: TMaskEdit;
    Label2: TLabel;
    LClient: TLabel;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure bOkClick(Sender: TObject);
    procedure bCancelClick(Sender: TObject);
    procedure bIgnoreClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    procedure CreateParams(var Params: TCreateParams); override;
  public
    ID: integer;
    { Public declarations }
  end;

var
  fTxt: TfTxt;

implementation

uses uData, MMSystem;

{$R *.dfm}

procedure TfTxt.FormCreate(Sender: TObject);
var t,hh,mm: string;
    i: integer;
begin
 eData.DateTime := Now();
 t := TimeToStr(Now());
 i := pos(':',t); if (i = 2) then hh := '0'+t[1] else hh := t[1]+t[2];
 delete(t,1,i);
 i := pos(':',t); if (i = 2) then mm := '0'+t[1] else mm := t[1]+t[2];
 eTime.Text := hh+':'+mm;
end;

procedure TfTxt.bOkClick(Sender: TObject);
var r,v: TStringList; i: integer;
begin
 r := TStringList.Create; r.Clear;
 v := TStringList.Create; v.Clear;
 r.Add('OK'); r.Add('LOG');
 v.Add(''''+'1'+'''');
 v.Add(''''+DateTimeToStr(Now())+' '+fData.cSelectS('TB_USERS','PRIM','Where ID='+IntToStr(fData.UserID))+' выполнил задание'+#10#13+fData.cSelectS('TB_QUEST','LOG','Where ID='+IntToStr(ID))+'''');
 i := fData.cUpdates('TB_QUEST',r,v,'ID='+IntToStr(ID));
 r.Free; v.Free;
 case i of
  0: Self.Close();
  1: MessageBox(Self.Handle,'Произошла ошибка. Проверьте данные и повторите попытку.','Ошибка!',MB_ICONWARNING or MB_OK);
 end;
end;

procedure TfTxt.bCancelClick(Sender: TObject);
var r,v: TStringList;
    i: integer;
begin
 r := TStringList.Create; r.Clear;
 v := TStringList.Create; v.Clear;
 r.Add('OK'); r.Add('LOG');
 v.Add(''''+'3'+'''');
 v.Add(''''+DateTimeToStr(Now())+' '+fData.cSelectS('TB_USERS','PRIM','Where ID='+IntToStr(fData.UserID))+' отменил задание'+#10#13+fData.cSelectS('TB_QUEST','LOG','Where ID='+IntToStr(ID))+'''');
 i := fData.cUpdates('TB_QUEST',r,v,'ID='+IntToStr(ID));
 r.Free; v.Free;
 case i of
  0: Self.Close();
  1: MessageBox(Self.Handle,'Произошла ошибка. Проверьте данные и повторите попытку.','Ошибка!',MB_ICONWARNING or MB_OK);
 end;
end;

procedure TfTxt.bIgnoreClick(Sender: TObject);
var r,v: TStringList; i: integer; d: TDateTime;
begin
 r := TStringList.Create; r.Clear;
 v := TStringList.Create; v.Clear;

 r.Add('OK'); r.Add('LOG'); r.Add('DATA');
 v.Add(''''+'2'+'''');

 case rgRep.ItemIndex of
  0: case cbM.ItemIndex of
      0: begin
          d := Now() + StrToTime('00:05:00');
          v.Add(''''+DateTimeToStr(Now())+' '+fData.cSelectS('TB_USERS','PRIM','Where ID='+IntToStr(fData.UserID))+' отложил задание на 5 минут'+#10#13+fData.cSelectS('TB_QUEST','LOG','Where ID='+IntToStr(ID))+'''');
         end;
      1: begin
          d := Now() + StrToTime('00:10:00');
          v.Add(''''+DateTimeToStr(Now())+' '+fData.cSelectS('TB_USERS','PRIM','Where ID='+IntToStr(fData.UserID))+' отложил задание на 10 минут'+#10#13+fData.cSelectS('TB_QUEST','LOG','Where ID='+IntToStr(ID))+'''');
         end;
      2: begin
          d := Now() + StrToTime('00:15:00');
          v.Add(''''+DateTimeToStr(Now())+' '+fData.cSelectS('TB_USERS','PRIM','Where ID='+IntToStr(fData.UserID))+' отложил задание на 15 минут'+#10#13+fData.cSelectS('TB_QUEST','LOG','Where ID='+IntToStr(ID))+'''');
         end;
      3: begin
          d := Now() + StrToTime('00:20:00');
          v.Add(''''+DateTimeToStr(Now())+' '+fData.cSelectS('TB_USERS','PRIM','Where ID='+IntToStr(fData.UserID))+' отложил задание на 20 минут'+#10#13+fData.cSelectS('TB_QUEST','LOG','Where ID='+IntToStr(ID))+'''');
         end;
      4: begin
          d := Now() + StrToTime('00:30:00');
          v.Add(''''+DateTimeToStr(Now())+' '+fData.cSelectS('TB_USERS','PRIM','Where ID='+IntToStr(fData.UserID))+' отложил задание на 30 минут'+#10#13+fData.cSelectS('TB_QUEST','LOG','Where ID='+IntToStr(ID))+'''');
         end;
      5: begin
          d := Now() + StrToTime('01:00:00');
          v.Add(''''+DateTimeToStr(Now())+' '+fData.cSelectS('TB_USERS','PRIM','Where ID='+IntToStr(fData.UserID))+' отложил задание на 1 час'+#10#13+fData.cSelectS('TB_QUEST','LOG','Where ID='+IntToStr(ID))+'''');
         end;
      6: begin
          d := Now() + StrToTime('02:00:00');
          v.Add(''''+DateTimeToStr(Now())+' '+fData.cSelectS('TB_USERS','PRIM','Where ID='+IntToStr(fData.UserID))+' отложил задание на 2 часа'+#10#13+fData.cSelectS('TB_QUEST','LOG','Where ID='+IntToStr(ID))+'''');
         end;
      7: begin
          d := Now() + StrToTime('03:00:00');
          v.Add(''''+DateTimeToStr(Now())+' '+fData.cSelectS('TB_USERS','PRIM','Where ID='+IntToStr(fData.UserID))+' отложил задание на 3 часа'+#10#13+fData.cSelectS('TB_QUEST','LOG','Where ID='+IntToStr(ID))+'''');
         end;
      8: begin
          d := Now() + StrToTime('05:00:00');
          v.Add(''''+DateTimeToStr(Now())+' '+fData.cSelectS('TB_USERS','PRIM','Where ID='+IntToStr(fData.UserID))+' отложил задание на 5 часов'+#10#13+fData.cSelectS('TB_QUEST','LOG','Where ID='+IntToStr(ID))+'''');
         end;
     end;
  1: case cbD.ItemIndex of
      0: begin
          d := StrToDateTime(fData.cSelectS('TB_QUEST','DATA','Where ID='+IntToStr(ID))) + StrToDate('02.01.0001') - StrToDate('01.01.0001');
          v.Add(''''+DateTimeToStr(Now())+' '+fData.cSelectS('TB_USERS','PRIM','Where ID='+IntToStr(fData.UserID))+' отложил задание на завтра'+#10#13+fData.cSelectS('TB_QUEST','LOG','Where ID='+IntToStr(ID))+'''');
         end;
      1: begin
          d := StrToDateTime(fData.cSelectS('TB_QUEST','DATA','Where ID='+IntToStr(ID))) + StrToDate('03.01.0001') - StrToDate('01.01.0001');
          v.Add(''''+DateTimeToStr(Now())+' '+fData.cSelectS('TB_USERS','PRIM','Where ID='+IntToStr(fData.UserID))+' отложил задание на 2 дня'+#10#13+fData.cSelectS('TB_QUEST','LOG','Where ID='+IntToStr(ID))+'''');
         end;
      2: begin
          d := StrToDateTime(fData.cSelectS('TB_QUEST','DATA','Where ID='+IntToStr(ID))) + StrToDate('04.01.0001') - StrToDate('01.01.0001');
          v.Add(''''+DateTimeToStr(Now())+' '+fData.cSelectS('TB_USERS','PRIM','Where ID='+IntToStr(fData.UserID))+' отложил задание на 3 дня'+#10#13+fData.cSelectS('TB_QUEST','LOG','Where ID='+IntToStr(ID))+'''');
         end;
      3: begin
          d := StrToDateTime(fData.cSelectS('TB_QUEST','DATA','Where ID='+IntToStr(ID))) + StrToDate('06.01.0001') - StrToDate('01.01.0001');
          v.Add(''''+DateTimeToStr(Now())+' '+fData.cSelectS('TB_USERS','PRIM','Where ID='+IntToStr(fData.UserID))+' отложил задание на 5 дней'+#10#13+fData.cSelectS('TB_QUEST','LOG','Where ID='+IntToStr(ID))+'''');
         end;
      4: begin
          d := StrToDateTime(fData.cSelectS('TB_QUEST','DATA','Where ID='+IntToStr(ID))) + StrToDate('08.01.0001') - StrToDate('01.01.0001');
          v.Add(''''+DateTimeToStr(Now())+' '+fData.cSelectS('TB_USERS','PRIM','Where ID='+IntToStr(fData.UserID))+' отложил задание на неделю'+#10#13+fData.cSelectS('TB_QUEST','LOG','Where ID='+IntToStr(ID))+'''');
         end;
      5: begin
          d := StrToDateTime(fData.cSelectS('TB_QUEST','DATA','Where ID='+IntToStr(ID))) + StrToDate('15.01.0001') - StrToDate('01.01.0001');
          v.Add(''''+DateTimeToStr(Now())+' '+fData.cSelectS('TB_USERS','PRIM','Where ID='+IntToStr(fData.UserID))+' отложил задание на 2 недели'+#10#13+fData.cSelectS('TB_QUEST','LOG','Where ID='+IntToStr(ID))+'''');
         end;
      6: begin
          d := StrToDateTime(fData.cSelectS('TB_QUEST','DATA','Where ID='+IntToStr(ID))) + StrToDate('22.01.0001') - StrToDate('01.01.0001');
          v.Add(''''+DateTimeToStr(Now())+' '+fData.cSelectS('TB_USERS','PRIM','Where ID='+IntToStr(fData.UserID))+' отложил задание на 3 недели'+#10#13+fData.cSelectS('TB_QUEST','LOG','Where ID='+IntToStr(ID))+'''');
         end;
      7: begin
          d := StrToDateTime(fData.cSelectS('TB_QUEST','DATA','Where ID='+IntToStr(ID))) + StrToDate('01.02.0001') - StrToDate('01.01.0001');
          v.Add(''''+DateTimeToStr(Now())+' '+fData.cSelectS('TB_USERS','PRIM','Where ID='+IntToStr(fData.UserID))+' отложил задание на месяц'+#10#13+fData.cSelectS('TB_QUEST','LOG','Where ID='+IntToStr(ID))+'''');
         end;
      8: begin
          d := StrToDateTime(fData.cSelectS('TB_QUEST','DATA','Where ID='+IntToStr(ID))) + StrToDate('01.03.0001') - StrToDate('01.01.0001');
          v.Add(''''+DateTimeToStr(Now())+' '+fData.cSelectS('TB_USERS','PRIM','Where ID='+IntToStr(fData.UserID))+' отложил задание на 2 месяца'+#10#13+fData.cSelectS('TB_QUEST','LOG','Where ID='+IntToStr(ID))+'''');
         end;
     end;
  2: begin
      d := StrToDateTime(DateToStr(eData.Date)+' '+eTime.Text+':00');
      v.Add(''''+DateTimeToStr(Now())+' '+fData.cSelectS('TB_USERS','PRIM','Where ID='+IntToStr(fData.UserID))+' отложил задание на '+DateToStr(eData.Date)+' '+eTime.Text+#10#13+fData.cSelectS('TB_QUEST','LOG','Where ID='+IntToStr(ID))+'''');
     end;
 end;

 v.Add(''''+DateTimeToStr(d)+'''');
 i := fData.cUpdates('TB_QUEST',r,v,'ID='+IntToStr(ID));
 r.Free; v.Free;
 case i of
  0: Self.Close();
  1: MessageBox(Self.Handle,'Произошла ошибка. Проверьте данные и повторите попытку.','Ошибка!',MB_ICONWARNING or MB_OK);
 end;
end;

procedure TfTxt.FormShow(Sender: TObject);
begin
 LDirec.Caption := fData.cSelectS('TB_USERS','PRIM','Where ID='+fData.cSelectS('TB_QUEST','DIREC','Where ID='+IntToStr(ID)));
 LClient.Caption := fData.cSelectS('TB_CLIENT','FAM','Where ID='+fData.cSelectS('TB_QUEST','CLIENT','Where ID='+IntToStr(ID)))+' '+(fData.cSelectS('TB_CLIENT','NAME','Where ID='+fData.cSelectS('TB_QUEST','CLIENT','Where ID='+IntToStr(ID))))[1]+'. '+(fData.cSelectS('TB_CLIENT','SNAME','Where ID='+fData.cSelectS('TB_QUEST','CLIENT','Where ID='+IntToStr(ID))))[1]+'.';
 eMsg.Text := fData.cSelectS('TB_QUEST','TEXT','Where ID='+IntToStr(ID));
end;

procedure TfTxt.CreateParams(var Params: TCreateParams);
begin
inherited CreateParams(Params);
with params do
   ExStyle := ExStyle or WS_EX_APPWINDOW;
end;

procedure TfTxt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TfTxt.Timer1Timer(Sender: TObject);
begin
  if (fData.CheckConnect = 0) then
  begin
   Timer1.Enabled := TRUE;
   if (fData.cSelectI('TB_QUEST','OK','Where ID='+IntToStr(ID)) = 1) then Self.Close();
   FlashWindow(Self.Handle, TRUE);
   sndPlaySound(PChar(ExtractFileDir(Application.ExeName)+'\WorkDir\alarm.wav'), SND_FILENAME or SND_SYNC);
  end else Timer1.Enabled := FALSE;
end;

end.
