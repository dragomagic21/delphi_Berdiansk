unit uQuest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, MPlayer, ExtCtrls, StdCtrls, ComCtrls, mmSystem, Mask;

type
  TfQuest = class(TForm)
    rgTyp: TRadioGroup;
    LClient: TLabel;
    eData: TDateTimePicker;
    Label2: TLabel;
    Bevel1: TBevel;
    Label3: TLabel;
    cbUsr: TComboBox;
    pAudio: TPanel;
    Media: TMediaPlayer;
    Label4: TLabel;
    bAOpen: TSpeedButton;
    AOpen: TOpenDialog;
    bACreate: TSpeedButton;
    pTxt: TPanel;
    Label1: TLabel;
    eTxt: TMemo;
    bSave: TSpeedButton;
    bClose: TSpeedButton;
    eLog: TMemo;
    eTime: TMaskEdit;
    cbStand: TComboBox;
    bStand: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SaveD: TSaveDialog;
    eExp: TMemo;
    bOk: TBitBtn;
    bCancel: TBitBtn;
    procedure bAOpenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bACreateClick(Sender: TObject);
    procedure bCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bSaveClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bStandClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure bOkClick(Sender: TObject);
    procedure bCancelClick(Sender: TObject);
  private
    Save: byte;
    { Private declarations }
    procedure CreateParams(var Params: TCreateParams); override;
  public
    ID: integer;
    { Public declarations }
    procedure ShowDoMedia();
  end;

var
  fQuest: TfQuest;

implementation

uses uData, uClient, uAudio;

{$R *.dfm}

procedure TfQuest.bAOpenClick(Sender: TObject);
begin
 AOpen.InitialDir := ExtractFileDir(Application.ExeName)+'\audio\';
 try
 if AOpen.Execute() then
  if Length(AOpen.FileName)>0 then
  begin
   Media.FileName := AOpen.FileName;
   Media.Open();
   Media.EnabledButtons := [btPlay,btStop,btPause];
  end else Media.EnabledButtons := [] else Media.EnabledButtons := [];
  except
  end;
end;

procedure TfQuest.ShowDoMedia;
begin
 case Media.Mode of
  mpNotReady : ShowMessage('Not ready');
  mpStopped  : ShowMessage('Stopped');
  mpPlaying  : ShowMessage('Playing');
  mpRecording: ShowMessage('Recording');
  mpSeeking  : ShowMessage('Seeking');
  mpPaused   : ShowMessage('Paused');
  mpOpen     : ShowMessage('Open');
 end;
end;

procedure TfQuest.FormCreate(Sender: TObject);
var t,hh,mm: string;
    i: integer;
begin
 Save := 0;
 Media.EnabledButtons := [];
 eData.DateTime := Now();
 t := TimeToStr(Now());
 i := pos(':',t); if (i = 2) then hh := '0'+t[1] else hh := t[1]+t[2];
 delete(t,1,i);
 i := pos(':',t); if (i = 2) then mm := '0'+t[1] else mm := t[1]+t[2];
 eTime.Text := hh+':'+mm;
 fData.FillUsrCb(cbUsr);
 if (fData.FillCB(cbStand,'TB_STANDART','NAME') = 0) then bStand.Enabled := TRUE else bStand.Enabled := FALSE;
end;

procedure TfQuest.bACreateClick(Sender: TObject);
begin
 Media.Close();
 Media.FileName := ExtractFileDir(Application.ExeName)+'\WorkDir\tmp.wav';
 Media.Open();
 Media.Wait := FALSE;
 Media.EnabledButtons := [btPlay,btStop,btPause,btRecord];
end;

procedure TfQuest.bCloseClick(Sender: TObject);
begin
 fQuest.Close();
end;

procedure TfQuest.FormShow(Sender: TObject);
var s: string;
    t,hh,mm: string;
    i: integer;
begin
 Media.Close();
 LClient.Caption := fData.cSelectS('TB_QUEST,TB_CLIENT','TB_CLIENT.FAM','Where ((TB_CLIENT.ID=TB_QUEST.CLIENT)and(TB_QUEST.ID='+IntToStr(ID)+'))')+' '+fData.cSelectS('TB_QUEST,TB_CLIENT','TB_CLIENT.NAME','Where ((TB_CLIENT.ID=TB_QUEST.CLIENT)and(TB_QUEST.ID='+IntToStr(ID)+'))')+' '+fData.cSelectS('TB_QUEST,TB_CLIENT','TB_CLIENT.SNAME','Where ((TB_CLIENT.ID=TB_QUEST.CLIENT)and(TB_QUEST.ID='+IntToStr(ID)+'))');
 fQuest.Caption := 'Задача по '+LClient.Caption;
 eData.DateTime := StrToDateTime(fData.cSelectS('TB_QUEST','DATA','Where ID='+IntToStr(ID)));
 t := fData.cSelectS('TB_QUEST','DATA','Where ID='+IntToStr(ID));
 delete(t,1,11);
 i := pos(':',t); if (i = 2) then hh := '0'+t[1] else hh := t[1]+t[2];
 delete(t,1,i);
 i := pos(':',t); if (i = 2) then mm := '0'+t[1] else mm := t[1]+t[2];
 eTime.Text := hh+':'+mm;
 rgTyp.ItemIndex := fData.cSelectI('TB_QUEST','TP','Where ID='+IntToStr(ID));
 case rgTyp.ItemIndex of
  0: eTxt.Text := fData.cSelectS('TB_QUEST','TEXT','Where ID='+IntToStr(ID));
  1: begin
      s := fData.cSelectS('TB_QUEST','TEXT','Where ID='+IntToStr(ID));
      if (FileExists(s) = TRUE) then
      begin
       Media.FileName := s;
       Media.Open();
       Media.EnabledButtons := [btPlay,btStop,btPause];
      end else MessageBox(fQuest.Handle,'Произошла ошибка! Не найден требуемый файл аудио.','Ошибка!',MB_ICONWARNING or MB_OK);
     end;
 end;
 eLog.Text := fData.cSelectS('TB_QUEST','LOG','Where ID='+IntToStr(ID));
end;

procedure TfQuest.CreateParams(var Params: TCreateParams);
begin
inherited CreateParams(Params);
with params do
   ExStyle := ExStyle or WS_EX_APPWINDOW;
end;

procedure TfQuest.bSaveClick(Sender: TObject);
var r,v: TStringList;
    s,f: string;
      i: integer;
begin
 i := 0;
 Save := 1;
 r := TStringList.Create; r.Clear;
 v := TStringList.Create; v.Clear;

 r.Add('TP'); r.Add('DATA'); r.Add('TEXT'); r.Add('USR'); r.Add('LOG'); r.Add('OK');
 v.Add(IntToStr(rgTyp.ItemIndex));
 s := DateToStr(eData.Date)+' '+eTime.Text+':00'; v.Add(''''+s+'''');
 case rgTyp.ItemIndex of
  0: v.Add(''''+Trim(eTxt.Text)+'''');
  1: begin
      f := ExtractFileDir(fData.Database.DatabaseName)+'\audio\'+IntToStr(StrToInt(fData.cMax('TB_QUEST','ID'))+1)+'.wav';
      if ((f[1] = '\')and(f[2] = '\')) then delete(f,pos(':',f),1)
      else if (f[1] = 'W') then f := ExtractFileDir(Application.ExeName)+'\WorkDir\audio\'+IntToStr(StrToInt(fData.cMax('TB_QUEST','ID'))+1)+'.wav';
      Media.Stop();
      Media.FileName := f;
      Media.Save();
      v.Add(''''+Trim(f)+'''');
     end;
 end;
 v.Add(IntToStr(integer(cbUsr.Items.Objects[cbUsr.ItemIndex])));
 s := DateTimeToStr(Now())+' '+fData.cSelectS('TB_USERS','PRIM','Where ID='+IntToStr(fData.UserID))+' отредактировал текущую задачу.'+#10#13+fData.cSelectS('TB_QUEST','LOG','Where ID='+IntToStr(ID));
 v.Add(''''+s+'''');
 v.Add(''''+'0'+'''');
 i := 0;
 case fData.cUpdates('TB_QUEST',r,v,'ID='+IntToStr(ID)) of
  0: begin
      MessageBox(fQuest.Handle,'Данные успешно сохранены.','Выполнено!',MB_ICONINFORMATION or MB_OK);
      i := 99;
     end;
  1: begin
      if (FileExists(s) = TRUE) then DeleteFile(f);
      MessageBox(fQuest.Handle,'Произошла ошибка! Проверьте данные и повторите попытку.','Ошибка!',MB_ICONWARNING or MB_OK);
     end;
 end;
 r.Free; v.Free;
 fClient.RefQ();
 if (i = 99) then fQuest.Close();
end;

procedure TfQuest.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 Media.Close();
// if (Save = 0) then fData.cDelete('TB_QUEST','Where ID='+IntToStr(ID));
end;

procedure TfQuest.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TfQuest.bStandClick(Sender: TObject);
begin
 eTxt.Clear;
 eTxt.Text := fData.cSelectS('TB_STANDART','NAME','Where ID='+IntToStr(integer(cbStand.Items.Objects[cbStand.ItemIndex])));
end;

procedure TfQuest.SpeedButton1Click(Sender: TObject);
begin
 if (rgTyp.ItemIndex = 1) then
 begin
  MessageBox(Self.Handle,'Нельзя экспортировать аудио-напоминания.','Ошибка!',MB_ICONINFORMATION or MB_OK);
  exit;
 end;
 SaveD.InitialDir := ExtractFileDir(Application.ExeName);
 SaveD.FileName := 'Задача '+LClient.Caption;
 if SaveD.Execute() then
  if Length(SaveD.FileName)>0 then
  begin
   eExp.Clear;
   eExp.Lines.Add('CLIENT,TP,DATA,DENTER,TEXT,DIREC,USR,LOG,OK');
   eExp.Lines.Add(IntToStr(fData.cSelectI('TB_QUEST','CLIENT','Where ID='+IntToStr(ID)))       +','+
                  ''''+IntToStr(fData.cSelectI('TB_QUEST','TP','Where ID='+IntToStr(ID)))+'''' +','+
                  ''''+fData.cSelectS('TB_QUEST','DATA','Where ID='+IntToStr(ID))+''''        +','+
                  ''''+fData.cSelectS('TB_QUEST','DENTER','Where ID='+IntToStr(ID))+''''      +','+
                  ''''+fData.cSelectS('TB_QUEST','TEXT','Where ID='+IntToStr(ID))+''''        +','+
                  IntToStr(fData.cSelectI('TB_QUEST','DIREC','Where ID='+IntToStr(ID)))        +','+
                  IntToStr(fData.cSelectI('TB_QUEST','USR','Where ID='+IntToStr(ID)))          +','+
                  ''''+fData.cSelectS('TB_QUEST','LOG','Where ID='+IntToStr(ID))+''''         +','+
                  ''''+IntToStr(fData.cSelectI('TB_QUEST','OK','Where ID='+IntToStr(ID)))+'''');
   eExp.Lines.SaveToFile(SaveD.FileName);
   MessageBox(Self.Handle,'Задача успешно экспортирована.','Успешно!',MB_ICONINFORMATION or MB_OK);
  end;
end;

procedure TfQuest.bOkClick(Sender: TObject);
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

procedure TfQuest.bCancelClick(Sender: TObject);
var r,v: TStringList;
    i: integer;
begin
 r := TStringList.Create; r.Clear;
 v := TStringList.Create; v.Clear;
 r.Add('OK'); r.Add('LOG');
 v.Add(''''+'1'+'''');
 v.Add(''''+DateTimeToStr(Now())+' '+fData.cSelectS('TB_USERS','PRIM','Where ID='+IntToStr(fData.UserID))+' отменил задание'+#10#13+fData.cSelectS('TB_QUEST','LOG','Where ID='+IntToStr(ID))+'''');
 i := fData.cUpdates('TB_QUEST',r,v,'ID='+IntToStr(ID));
 r.Free; v.Free;
 case i of
  0: Self.Close();
  1: MessageBox(Self.Handle,'Произошла ошибка. Проверьте данные и повторите попытку.','Ошибка!',MB_ICONWARNING or MB_OK);
 end;
end;

end.
