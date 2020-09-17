unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, ComCtrls, Buttons, ImgList, Spin, IniFiles, ShellApi,
  OleServer, Word2000, DateUtils;

type
  TfMain = class(TForm)
    pc: TPageControl;
    tClients: TTabSheet;
    tCalendar: TTabSheet;
    tOptions: TTabSheet;
    sgCalendar: TStringGrid;
    lbCats: TListBox;
    pnames: TPanel;
    LCats: TLabel;
    pMain: TPanel;
    pButtons: TPanel;
    bAdd: TSpeedButton;
    bEdit: TSpeedButton;
    bDel: TSpeedButton;
    LClients: TLabel;
    L1: TLabel;
    images: TImageList;
    Splitter: TSplitter;
    pcOptions: TPageControl;
    tCats: TTabSheet;
    tUsers: TTabSheet;
    tUsrRules: TTabSheet;
    LtCats: TLabel;
    lbACats: TListBox;
    bCatAdd: TSpeedButton;
    LCatAdd: TLabel;
    LCatAddName: TLabel;
    ECatAdd: TEdit;
    Bevel1: TBevel;
    LCatEdit: TLabel;
    ECatEdit: TEdit;
    Bevel2: TBevel;
    bCatEdit: TSpeedButton;
    LAcatEdit: TLabel;
    LACatDel: TLabel;
    Bevel3: TBevel;
    bCatDel: TSpeedButton;
    LAUserAdd: TLabel;
    LAUaddL: TLabel;
    LAUaddP: TLabel;
    LAUaddE: TLabel;
    EAUaddL: TEdit;
    EAUaddP: TEdit;
    EAUaddA: TCheckBox;
    EAUaddE: TMemo;
    bUserAdd: TSpeedButton;
    Bevel4: TBevel;
    LUsers: TLabel;
    lbUsers: TListBox;
    LUserData: TLabel;
    LAUedL: TLabel;
    EAUedL: TEdit;
    LAUedP: TLabel;
    EAUedP: TEdit;
    EAUedA: TCheckBox;
    LAUedE: TLabel;
    EAUedE: TMemo;
    bUserEdit: TSpeedButton;
    Bevel5: TBevel;
    bUserDel: TSpeedButton;
    Bevel6: TBevel;
    LqUsers: TLabel;
    LqCats: TLabel;
    Lq: TLabel;
    cShow: TCheckBox;
    cAdd: TCheckBox;
    cEdit: TCheckBox;
    cDel: TCheckBox;
    lbRUsers: TListBox;
    lbRCats: TListBox;
    Bevel7: TBevel;
    bCatUp: TSpeedButton;
    bCatDw: TSpeedButton;
    Timer: TTimer;
    TmQuest: TTimer;
    WordA: TWordApplication;
    bUsrPrint: TSpeedButton;
    Label1: TLabel;
    Db: TDateTimePicker;
    De: TDateTimePicker;
    Label2: TLabel;
    bFind: TSpeedButton;
    Calendar: TMonthCalendar;
    tStand: TTabSheet;
    lbStand: TListBox;
    eStand: TMemo;
    bStandAdd: TSpeedButton;
    bStandEdit: TSpeedButton;
    bStandDel: TSpeedButton;
    sgClients: TStringGrid;
    rgClOrder: TRadioGroup;
    pCData: TPanel;
    Label3: TLabel;
    cbCData: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    eDBegin: TDateTimePicker;
    eDEnd: TDateTimePicker;
    bShow: TSpeedButton;
    tBD: TTabSheet;
    Label6: TLabel;
    LbdTP: TLabel;
    bSetLoc: TSpeedButton;
    bSetNet: TSpeedButton;
    Bevel8: TBevel;
    Label7: TLabel;
    bChLtoN: TSpeedButton;
    bChNtoL: TSpeedButton;
    Bevel9: TBevel;
    bQImport: TSpeedButton;
    OpenD: TOpenDialog;
    eQImport: TMemo;
    tCopyRights: TStaticText;
    TUser: TStaticText;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    TWork: TStaticText;
    bRefr: TBitBtn;
    LMyB: TLabel;
    Label8: TLabel;
    EdbLoc: TEdit;
    Label9: TLabel;
    bCdbLoc: TSpeedButton;
    Label10: TLabel;
    EdbNet: TEdit;
    bCdbNet: TSpeedButton;
    Label11: TLabel;
    Bevel10: TBevel;
    ODdb: TOpenDialog;
    Label12: TLabel;
    Label13: TLabel;
    ETimeQ: TSpinEdit;
    Label14: TLabel;
    Label15: TLabel;
    ETimeR: TSpinEdit;
    Label16: TLabel;
    Label17: TLabel;
    Bevel11: TBevel;
    Label18: TLabel;
    bTimerSave: TSpeedButton;
    bLocBase: TSpeedButton;
    bNetBase: TSpeedButton;
    Label19: TLabel;
    LOfSite: TLabel;
    bAddU: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure lbCatsClick(Sender: TObject);
    procedure tOptionsEnter(Sender: TObject);
    procedure tOptionsShow(Sender: TObject);
    procedure bCatAddClick(Sender: TObject);
    procedure bCatEditClick(Sender: TObject);
    procedure bCatDelClick(Sender: TObject);
    procedure tClientsShow(Sender: TObject);
    procedure bUserAddClick(Sender: TObject);
    procedure lbUsersClick(Sender: TObject);
    procedure bUserEditClick(Sender: TObject);
    procedure bUserDelClick(Sender: TObject);
    procedure tUsersShow(Sender: TObject);
    procedure tCatsShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure pcChange(Sender: TObject);
    procedure tUsrRulesShow(Sender: TObject);
    procedure cShowClick(Sender: TObject);
    procedure lbRCatsClick(Sender: TObject);
    procedure lbRUsersClick(Sender: TObject);
    procedure cAddClick(Sender: TObject);
    procedure cEditClick(Sender: TObject);
    procedure cDelClick(Sender: TObject);
    procedure bAddClick(Sender: TObject);
    procedure bCatUpClick(Sender: TObject);
    procedure bCatDwClick(Sender: TObject);
    procedure bEditClick(Sender: TObject);
    procedure bDelClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure tCalendarShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure TmQuestTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bPrintClick(Sender: TObject);
    procedure bUsrPrintClick(Sender: TObject);
    procedure sgClientsDblClick(Sender: TObject);
    procedure sgCalendarDblClick(Sender: TObject);
    procedure bFindClick(Sender: TObject);
    procedure CalendarGetMonthInfo(Sender: TObject; Month: Cardinal;
      var MonthBoldInfo: Cardinal);
    procedure CalendarClick(Sender: TObject);
    procedure bStandAddClick(Sender: TObject);
    procedure tStandShow(Sender: TObject);
    procedure lbStandClick(Sender: TObject);
    procedure bStandEditClick(Sender: TObject);
    procedure bStandDelClick(Sender: TObject);
    procedure rgClOrderClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bShowClick(Sender: TObject);
    procedure cbCDataChange(Sender: TObject);
    procedure tBDShow(Sender: TObject);
    procedure bSetLocClick(Sender: TObject);
    procedure bSetNetClick(Sender: TObject);
    procedure bChNtoLClick(Sender: TObject);
    procedure bChLtoNClick(Sender: TObject);
    procedure bQImportClick(Sender: TObject);
    procedure sgClientsKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgCalendarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbCDataKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eDBeginKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eDEndKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bRefrClick(Sender: TObject);
    procedure lbACatsClick(Sender: TObject);
    procedure SplitterMoved(Sender: TObject);
    procedure bCdbLocClick(Sender: TObject);
    procedure bCdbNetClick(Sender: TObject);
    procedure bTimerSaveClick(Sender: TObject);
    procedure bLocBaseClick(Sender: TObject);
    procedure bNetBaseClick(Sender: TObject);
    procedure LOfSiteClick(Sender: TObject);
    procedure bAddUClick(Sender: TObject);
    procedure sgCalendarDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    SetRules: byte;
    FormHeight: integer;
    { Private declarations }
    procedure FillRules();
    procedure SelRule();
    procedure Ic(n:Integer);
    procedure SetTxt();
    function CheckDBName(s: string): string;
  protected
   procedure ControlWindow(var Msg: TMessage); message WM_SYSCOMMAND;
   procedure IconMouse(var Msg: TMessage); message WM_USER + 1;
  public
    Mode: integer;
    { Public declarations }
    procedure Refr();
    procedure StdRef();
    function PrintClient(ID: integer): byte;
    function PrintUser(ID: integer; Db,De: TDateTime): byte;
  end;

var
  fMain: TfMain;

implementation

uses uData, uLogin, uClient, uQuest, uTxt, uAudio, uFind, uClientU;

{$R *.dfm}

procedure TfMain.FormCreate(Sender: TObject);
var f: TIniFile;
begin
 FormHeight := fMain.Height;
 f := TIniFile.Create(ExtractFileDir(Application.ExeName)+'\config.ini');
 Timer.Interval := f.ReadInteger('TIMER','Time',30000);
 TmQuest.Interval := f.ReadInteger('TIMER','Quest',60000);
 f.Free;
 SetTxt();
 Mode := 0;
 SetRules := 0;
 pc.ActivePageIndex := 0;
 lbCats.ItemIndex := 0;
 Calendar.Date := Now();
 Calendar.EndDate := Now();
 { USERS }
 sgClients.ColWidths[0] := 60;
 sgClients.ColWidths[1] := 200;
 sgClients.ColWidths[2] := sgClients.Width-360-25;
 sgClients.ColWidths[3] := 100;
// sgClients.ColWidths[4] := 140;
 sgClients.Cells[0,0]:='Дата';
 sgClients.Cells[1,0]:='Ф.И.О.';
 sgClients.Cells[2,0]:='Ближайшая задача';
 sgClients.Cells[3,0]:='Ответственный';
// sgClients.Cells[4,0]:='Примечание';
 { CALENDAR }
 sgCalendar.ColWidths[0] := 60;
 sgCalendar.ColWidths[1] := 200;
 sgCalendar.ColWidths[2] := sgCalendar.Width-360-25;
 sgCalendar.ColWidths[3] := 100;
// sgCalendar.ColWidths[4] := 140;
 sgCalendar.Cells[0,0]:='Дата';
 sgCalendar.Cells[1,0]:='Ф.И.О.';
 sgCalendar.Cells[2,0]:='Ближайшая задача';
 sgCalendar.Cells[3,0]:='Ответственный';
// sgCalendar.Cells[4,0]:='Примечание';
 pc.ActivePageIndex := 0;
end;

procedure TfMain.FormResize(Sender: TObject);
begin
 FormHeight := fMain.Height;
 sgClients.ColWidths[2] := sgClients.Width-360-25;
 sgCalendar.ColWidths[2] := sgCalendar.Width-360-25;
end;

procedure TfMain.Refr;
var i: integer;
begin
 Timer.Enabled := TRUE;
 TimerTimer(self);
 TmQuest.Enabled := TRUE;
 TmQuestTimer(self);
 i := fData.FillCats(lbCats);
 { ERROR }
 if (i = 1) then
  MessageBox(fMain.Handle,('Во время выполнения программы возникла ошибка!'+#10#13+'Попробуйте перезапустить программу.'),'Ошибка!',MB_ICONWARNING or MB_OK);
 { LISTBOX IS EMPTY }
 if (i = 2) then
 begin
  bAdd.Enabled   := FALSE;
  bEdit.Enabled  := FALSE;
  bDel.Enabled   := FALSE;
//  bPrint.Enabled := FALSE;
 end;
 { ВСЁ ХОРОШО :) }
 if (i = 0) then
 begin
  lbCatsClick(self);
  SelRule();        
 end;
 { ПОКАЗЫВАТЬ ЛИ ВКЛАДКУ "НАСТРОЙКИ" }
 if (fData.Admin = 2) then
 begin
  tOptions.Enabled := FALSE;
  tOptions.Visible := FALSE;
 end
end;

procedure TfMain.lbCatsClick(Sender: TObject);
var ord,s: string;
begin
 rgClOrder.Enabled := TRUE;
 case rgClOrder.ItemIndex of
  0: ord := 'order by FAM, NAME, SNAME';
  1: ord := 'order by NUM';
  2: ord := 'order by DATA';
 end;
 lbCats.Hint := lbCats.Items[lbCats.ItemIndex];
 lbCats.ShowHint := TRUE;
 SelRule();
 sgClients.Cells[0,0]:='Дата';
 sgClients.Cells[1,0]:='Ф.И.О.';
 sgClients.Cells[2,0]:='Ближайшая задача';
 sgClients.Cells[3,0]:='Ответственный';
 sgClients.Cells[4,0]:='Примечание';
 Timer.Enabled := TRUE;
 if (integer(lbCats.Items.Objects[lbCats.ItemIndex]) = -2) then s := '' else s := 'where CAT='+IntToStr(integer(lbCats.Items.Objects[lbCats.ItemIndex]));
 case fData.FillSgC(sgClients,Now(),s,ord) of
  0: begin
      bAdd.Enabled   := TRUE;
      bEdit.Enabled  := TRUE;
      bDel.Enabled   := TRUE;
//      bPrint.Enabled := TRUE;
     end;
  1: begin
      bAdd.Enabled   := FALSE;
      bEdit.Enabled  := FALSE;
      bDel.Enabled   := FALSE;
//      bPrint.Enabled := FALSE;
      MessageBox(fMain.Handle,'Произошла ошибка! Проверьте данные и повторите попытку.','Ошибка!',MB_ICONWARNING or MB_OK);
     end;
  2: begin
      bAdd.Enabled   := TRUE;
      bEdit.Enabled  := FALSE;
      bDel.Enabled   := FALSE;
//      bPrint.Enabled := FALSE;
     end;
 end;
 SelRule();
 if (integer(lbCats.Items.Objects[lbCats.ItemIndex]) = -2) then bAdd.Enabled := FALSE else bAdd.Enabled := TRUE;
end;

procedure TfMain.tOptionsEnter(Sender: TObject);
begin
 pcOptions.ActivePageIndex := 0;
end;

procedure TfMain.tOptionsShow(Sender: TObject);
begin
 pcOptions.ActivePageIndex := 0;
end;

procedure TfMain.bCatAddClick(Sender: TObject);
var lvl: integer;
begin
 lvl := StrToInt(fData.cMax('TB_CATS','LVL'));
 Inc(lvl);
 if (fData.cInsert('TB_CATS','NAME,LVL',''''+Trim(ECatAdd.Text)+''''+','+IntToStr(lvl)) = 0) then
 begin
  ECatAdd.Text := '';
  fData.FillCats(lbACats);
 end else MessageBox(fMain.Handle,('Во время добавления новой категории возникла ошибка!'+#10#13+'Проверьте правильность вводимых данных и повторите попытку.'),'Ошибка!',MB_ICONWARNING or MB_OK);
end;

procedure TfMain.bCatEditClick(Sender: TObject);
begin
 if (fData.cUpdate('TB_CATS','NAME',''''+Trim(ECatEdit.Text)+'''','ID='+IntToStr(integer(lbACats.Items.Objects[lbACats.ItemIndex]))) = 0) then
 begin
  ECatEdit.Text := '';
  fData.FillCats(lbACats);
 end else MessageBox(fMain.Handle,('Во время изменения названия категории возникла ошибка!'+#10#13+'Проверьте правильность вводимых данных и повторите попытку.'),'Ошибка!',MB_ICONWARNING or MB_OK);
end;

procedure TfMain.bCatDelClick(Sender: TObject);
begin
 if MessageDlg('Вы уверены?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 if (fData.cDelete('TB_CATS','where ID='+IntToStr(integer(lbACats.Items.Objects[lbACats.ItemIndex]))) = 0) then
  fData.FillCats(lbACats)
  else MessageBox(fMain.Handle,('Во время удаления категории возникла ошибка!'+#10#13+'Повторите попытку позднее.'),'Ошибка!',MB_ICONWARNING or MB_OK);
end;

procedure TfMain.tClientsShow(Sender: TObject);
begin
 if (Mode = 1) then Refr();
end;

procedure TfMain.bUserAddClick(Sender: TObject);
var god: string;
begin
 if (EAUaddA.Checked) then god:='1' else god:='2';
 if fData.cInsert('TB_USERS','LOGIN,PASS,GOD,PRIM',''''+Trim(EAUaddL.Text)+''''+','+''''+Trim(EAUaddP.Text)+''''+','+''''+Trim(god)+''''+','+''''+Trim(EAUaddE.Text)+'''') = 1 then
  MessageBox(fMain.Handle,('Произошла ошика! Возможно такой пользователь уже существует.'+#10#13+'Проверьте данные и повторите попытку.'),'Ошибка!',MB_ICONWARNING or MB_OK) else
  begin
   EAUaddL.Text := '';
   EAUaddP.Text := '';
   EAUaddA.Checked := FALSE;
   EAUaddE.Text := '';
   tUsersShow(self);
  end;
end;

procedure TfMain.lbUsersClick(Sender: TObject);
begin
 if (lbUsers.Items.Count > 0) then
 begin
  EAUedL.Text := fData.cSelectS('TB_USERS','LOGIN','where ID='+IntToStr(integer(lbUsers.Items.Objects[lbUsers.ItemIndex])));
  EAUedP.Text := fData.cSelectS('TB_USERS','PASS','where ID='+IntToStr(integer(lbUsers.Items.Objects[lbUsers.ItemIndex])));
  case StrToInt(fData.cSelectS('TB_USERS','GOD','where ID='+IntToStr(integer(lbUsers.Items.Objects[lbUsers.ItemIndex])))) of
   0: EAUedA.Checked := FALSE;
   1: EAUedA.Checked := TRUE;
  end;
  EAUedE.Text := fData.cSelectS('TB_USERS','PRIM','where ID='+IntToStr(integer(lbUsers.Items.Objects[lbUsers.ItemIndex])));
 end;
end;

procedure TfMain.bUserEditClick(Sender: TObject);
var Records,Values: TStringList; god: string;
begin
 if (EAUedA.Checked) then god := '1' else god := '2';
 Records := TStringList.Create; Records.Clear;
 Values  := TStringList.Create; Values.Clear;
 Records.Add('LOGIN'); Records.Add('PASS'); Records.Add('GOD'); Records.Add('PRIM');
 Values.Add(''''+Trim(EAUedL.Text)+''''); Values.Add(''''+Trim(EAUedP.Text)+''''); Values.Add(''''+Trim(god)+''''); Values.Add(''''+Trim(EAUedE.Text)+'''');
 if fData.cUpdates('TB_USERS',Records,Values,'ID='+IntToStr(integer(lbUsers.Items.Objects[lbUsers.ItemIndex]))) = 1 then
  MessageBox(fMain.Handle,'Произошла ошибка! Проверьте данные и повторите попытку.','Ошибка!',MB_ICONWARNING or MB_OK) else
  begin
   EAUedL.Text := '';
   EAUedP.Text := '';
   EAUedA.Checked := FALSE;
   EAUedE.Text := '';
   tUsersShow(self);
  end;
end;

procedure TfMain.bUserDelClick(Sender: TObject);
var i1,i2: integer;
begin
 { НЕЛЬЗЯ УДАЛЯТЬ САМОГО СЕБЯ !!! }
 if (fData.UserID = integer(lbUsers.Items.Objects[lbUsers.ItemIndex])) then
  MessageBox(fMain.Handle,'Нельзя удалить самого себя!!! :р','Ошибка!',MB_ICONWARNING or MB_OK) else
  if MessageDlg('Вы уверены?'+#10#13+'Будут удалены все задания, за которые ответственнен пользователь и которые он назначал.',mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
   i1 := fData.cDelete('TB_QUEST', 'where ((DIREC='+IntToStr(integer(lbUsers.Items.Objects[lbUsers.ItemIndex]))+')or(USR='+IntToStr(integer(lbUsers.Items.Objects[lbUsers.ItemIndex]))+'))');
   i2 := fData.cDelete('TB_USERS','where ID='+IntToStr(integer(lbUsers.Items.Objects[lbUsers.ItemIndex])));
   if ((i1 = 1)or(i2 = 1)) then MessageBox(fMain.Handle,'Произошла ошибка! Попробуйте повторить попытку позднее.','Ошибка!',MB_ICONWARNING or MB_OK);
   tUsersShow(self);
  end;

end;

procedure TfMain.tUsersShow(Sender: TObject);
var i: integer;
begin
 Db.DateTime := Now();
 De.DateTime := Now();
 i := fData.FillUsers(lbUsers);
 if ((i = 1)or(i = 2)) then
 begin
  bUserEdit.Enabled := FALSE;
  bUserDel.Enabled  := FALSE;
  bUsrPrint.Enabled := FALSE;
 end else
 begin
  bUserEdit.Enabled := TRUE;
  bUserDel.Enabled  := TRUE;
  bUsrPrint.Enabled := TRUE;
  lbUsersClick(self);
 end;
end;

procedure TfMain.tCatsShow(Sender: TObject);
begin
 case fData.FillCats(lbACats) of
  0: begin
      bCatAdd.Enabled  := TRUE;
      bCatEdit.Enabled := TRUE;
      bCatDel.Enabled  := TRUE;
      bCatUp.Enabled   := TRUE;
      bCatDw.Enabled   := TRUE;
     end;
  1: begin
      bCatAdd.Enabled  := FALSE;
      bCatEdit.Enabled := FALSE;
      bCatDel.Enabled  := FALSE;
      bCatUp.Enabled   := FALSE;
      bCatDw.Enabled   := FALSE;
      MessageBox(fMain.Handle,'Произошла ошибка! Проверьте данные и повторите попытку.','Ошибка!',MB_ICONWARNING or MB_OK);
     end;
  2: begin
      bCatAdd.Enabled  := TRUE;
      bCatEdit.Enabled := FALSE;
      bCatDel.Enabled  := FALSE;
      bCatUp.Enabled   := FALSE;
      bCatDw.Enabled   := FALSE;
     end;
 end;
 lbACatsClick(self);
end;

procedure TfMain.FormActivate(Sender: TObject);
begin
 if (Mode = 0) then fLogin.ShowModal();
end;

procedure TfMain.pcChange(Sender: TObject);
begin
 if (pc.ActivePageIndex = 2) then
  if (fData.Admin = 2) then
  begin
   pc.ActivePageIndex := 0;
   MessageBox(fMain.Handle,'У Вас нет прав для просмотра данной вкладки! :р','Ошибка!',MB_ICONWARNING or MB_OK);
  end;
end;

procedure TfMain.tUsrRulesShow(Sender: TObject);
var i: integer;
begin
 i := fData.FillUsers(lbRUsers);
 if ((i = 1)or(i = 2)) then
 { ЛАЖА НА ПОЛЬЗОВАТЕЛЯХ }
 begin
  lbRUsers.Enabled := FALSE;
  lbRCats.Enabled  := FALSE;
  cShow.Enabled    := FALSE;
  cAdd.Enabled     := FALSE;
  cEdit.Enabled    := FALSE;
  cDel.Enabled     := FALSE;
 end else
 { С ЮЗЕРАМИ ВСЕ ОК }
     begin
      i:= fData.FillCats(lbRCats);
      if ((i = 1)or(i = 2)) then
      { ЛАЖА НА КАТЕГОРИЯХ }
      begin
       lbRUsers.Enabled := FALSE;
       lbRCats.Enabled  := FALSE;
       cShow.Enabled    := FALSE;
       cAdd.Enabled     := FALSE;
       cEdit.Enabled    := FALSE;
       cDel.Enabled     := FALSE;
       end else { ВСЕ ОК }
        FillRules();
     end;
end;

procedure TfMain.FillRules;
begin
SetRules := 0;
if (integer(lbRCats.Items.Objects[lbRCats.ItemIndex]) = -2) then
begin
 cShow.Checked := FALSE; cShow.Enabled := FALSE;
 cAdd.Checked  := FALSE; cAdd.Enabled  := FALSE;
 cEdit.Checked := FALSE; cEdit.Enabled := FALSE;
 cDel.Checked  := FALSE; cDel.Enabled  := FALSE;
 SetRules := 1;
end else
  begin
  cShow.Enabled := TRUE;
  cAdd.Enabled  := TRUE;
  cEdit.Enabled := TRUE;
  cDel.Enabled  := TRUE;
 case fData.cSelectRule('TB_RULES',integer(lbRUsers.Items.Objects[lbRUsers.ItemIndex]), integer(lbRCats.Items.Objects[lbRCats.ItemIndex]), 'S') of
  -1: cShow.Checked := FALSE;
   0: cShow.Checked := FALSE;
   1: cShow.Checked := TRUE;
 end;
 case fData.cSelectRule('TB_RULES',integer(lbRUsers.Items.Objects[lbRUsers.ItemIndex]), integer(lbRCats.Items.Objects[lbRCats.ItemIndex]), 'A') of
  -1: cAdd.Checked := FALSE;
   0: cAdd.Checked := FALSE;
   1: cAdd.Checked := TRUE;
 end;
 case fData.cSelectRule('TB_RULES',integer(lbRUsers.Items.Objects[lbRUsers.ItemIndex]), integer(lbRCats.Items.Objects[lbRCats.ItemIndex]), 'E') of
  -1: cEdit.Checked := FALSE;
   0: cEdit.Checked := FALSE;
   1: cEdit.Checked := TRUE;
 end;
 case fData.cSelectRule('TB_RULES',integer(lbRUsers.Items.Objects[lbRUsers.ItemIndex]), integer(lbRCats.Items.Objects[lbRCats.ItemIndex]), 'D') of
  -1: cDel.Checked := FALSE;
   0: cDel.Checked := FALSE;
   1: cDel.Checked := TRUE;
 end;
SetRules := 1;
end;
end;

procedure TfMain.cShowClick(Sender: TObject);
begin
if (SetRules = 1) then
 case (cShow.Checked) of
  FALSE: fData.cDelete('TB_RULES','where ((USR='+IntToStr(integer(lbRUsers.Items.Objects[lbRUsers.ItemIndex]))+')and(CAT='+IntToStr(integer(lbRCats.Items.Objects[lbRCats.ItemIndex]))+')and(RULE='+''''+'S'+''''+'))');
   TRUE: fData.cInsert('TB_RULES','USR,CAT,RULE',IntToStr(integer(lbRUsers.Items.Objects[lbRUsers.ItemIndex]))+','+IntToStr(integer(lbRCats.Items.Objects[lbRCats.ItemIndex]))+','+''''+'S'+'''');
 end;
end;

procedure TfMain.lbRCatsClick(Sender: TObject);
begin
 FillRules();
end;

procedure TfMain.lbRUsersClick(Sender: TObject);
begin
 FillRules();
end;

procedure TfMain.SelRule;
begin
 if (bAdd.Enabled = TRUE) then
 if (fData.cSelectRule('TB_RULES',fData.UserID,integer(lbCats.Items.Objects[lbCats.ItemIndex]),'A') = 1) then
  bAdd.Enabled := FALSE else bAdd.Enabled := TRUE;
 if (bEdit.Enabled = TRUE) then
 if (fData.cSelectRule('TB_RULES',fData.UserID,integer(lbCats.Items.Objects[lbCats.ItemIndex]),'E') = 1) then
  bEdit.Enabled := FALSE else bEdit.Enabled := TRUE;
 if (bDel.Enabled = TRUE) then
 if (fData.cSelectRule('TB_RULES',fData.UserID,integer(lbCats.Items.Objects[lbCats.ItemIndex]),'D') = 1) then
  bDel.Enabled := FALSE else bDel.Enabled := TRUE;
// if (fData.cSelectRule('TB_RULES',fData.UserID,integer(lbCats.Items.Objects[lbCats.ItemIndex]),'P') = 1) then
//  bPrint.Enabled := FALSE else bPrint.Enabled := TRUE;
end;

procedure TfMain.cAddClick(Sender: TObject);
begin
if (SetRules = 1) then
 case (cAdd.Checked) of
  FALSE: fData.cDelete('TB_RULES','where ((USR='+IntToStr(integer(lbRUsers.Items.Objects[lbRUsers.ItemIndex]))+')and(CAT='+IntToStr(integer(lbRCats.Items.Objects[lbRCats.ItemIndex]))+')and(RULE='+''''+'A'+''''+'))');
   TRUE: fData.cInsert('TB_RULES','USR,CAT,RULE',IntToStr(integer(lbRUsers.Items.Objects[lbRUsers.ItemIndex]))+','+IntToStr(integer(lbRCats.Items.Objects[lbRCats.ItemIndex]))+','+''''+'A'+'''');
 end;
end;

procedure TfMain.cEditClick(Sender: TObject);
begin
if (SetRules = 1) then
 case (cEdit.Checked) of
  FALSE: fData.cDelete('TB_RULES','where ((USR='+IntToStr(integer(lbRUsers.Items.Objects[lbRUsers.ItemIndex]))+')and(CAT='+IntToStr(integer(lbRCats.Items.Objects[lbRCats.ItemIndex]))+')and(RULE='+''''+'E'+''''+'))');
   TRUE: fData.cInsert('TB_RULES','USR,CAT,RULE',IntToStr(integer(lbRUsers.Items.Objects[lbRUsers.ItemIndex]))+','+IntToStr(integer(lbRCats.Items.Objects[lbRCats.ItemIndex]))+','+''''+'E'+'''');
 end;
end;

procedure TfMain.cDelClick(Sender: TObject);
begin
if (SetRules = 1) then
 case (cDel.Checked) of
  FALSE: fData.cDelete('TB_RULES','where ((USR='+IntToStr(integer(lbRUsers.Items.Objects[lbRUsers.ItemIndex]))+')and(CAT='+IntToStr(integer(lbRCats.Items.Objects[lbRCats.ItemIndex]))+')and(RULE='+''''+'D'+''''+'))');
   TRUE: fData.cInsert('TB_RULES','USR,CAT,RULE',IntToStr(integer(lbRUsers.Items.Objects[lbRUsers.ItemIndex]))+','+IntToStr(integer(lbRCats.Items.Objects[lbRCats.ItemIndex]))+','+''''+'D'+'''');
 end;
end;

procedure TfMain.bAddClick(Sender: TObject);
begin
 case fData.cInsert('TB_CLIENT','CAT,NUM,BIRTHDAY,PDATE,DATA,CTYPE,DTYPE,DOPEN',IntToStr(integer(lbCats.Items.Objects[lbCats.ItemIndex]))+','+IntToStr(StrToInt(fData.cMax('TB_CLIENT','NUM'))+1)+','+''''+DateTimeToStr(Now())+''''+','+''''+DateTimeToStr(Now())+''''+','+''''+DateTimeToStr(Now())+''''+','+'0'+','+'0'+','+''''+DateTimeToStr(Now())+'''') of
  0: begin
      Application.CreateForm(TfClient, fClient);
      fClient.ID := StrToInt(fData.cMax('TB_CLIENT','ID'));
      fClient.Show();
      lbCatsClick(self);
     end;
  1: MessageBox(fMain.Handle,'Произошла ошибка! Проверьте данные и повторите попытку.','Ошибка!',MB_ICONWARNING or MB_OK);
 end;
end;

procedure TfMain.bCatUpClick(Sender: TObject);
var d,u: integer;
begin
 if (lbACats.ItemIndex > 0) then
 begin
  d := StrToInt(fData.cSelectS('TB_CATS','LVL','where ID='+IntToStr(integer(lbACats.Items.Objects[lbACats.ItemIndex]))));
  u := StrToInt(fData.cSelectS('TB_CATS','LVL','where ID='+IntToStr(integer(lbACats.Items.Objects[lbACats.ItemIndex-1]))));
  fData.cUpdate('TB_CATS','LVL',IntToStr(d),'ID='+IntToStr(integer(lbACats.Items.Objects[lbACats.ItemIndex-1])));
  fData.cUpdate('TB_CATS','LVL',IntToStr(u),'ID='+IntToStr(integer(lbACats.Items.Objects[lbACats.ItemIndex])));
 end;
 tCatsShow(self);
end;

procedure TfMain.bCatDwClick(Sender: TObject);
var d,u: integer;
begin
 if (lbACats.ItemIndex < lbACats.Items.Count-1) then
 begin
  d := StrToInt(fData.cSelectS('TB_CATS','LVL','where ID='+IntToStr(integer(lbACats.Items.Objects[lbACats.ItemIndex]))));
  u := StrToInt(fData.cSelectS('TB_CATS','LVL','where ID='+IntToStr(integer(lbACats.Items.Objects[lbACats.ItemIndex+1]))));
  fData.cUpdate('TB_CATS','LVL',IntToStr(d),'ID='+IntToStr(integer(lbACats.Items.Objects[lbACats.ItemIndex+1])));
  fData.cUpdate('TB_CATS','LVL',IntToStr(u),'ID='+IntToStr(integer(lbACats.Items.Objects[lbACats.ItemIndex])));
 end;
 tCatsShow(self);
end;

procedure TfMain.bEditClick(Sender: TObject);
begin
 if (integer(lbCats.Items.Objects[lbCats.ItemIndex]) = -2) then
  if (fData.cSelectRule('TB_RULES',fData.UserID,fData.cSelectI('TB_CLIENT','CAT','Where ID='+IntToStr(integer(sgClients.Objects[0,sgClients.Row]))),'E') = 1) then
  begin
   MessageBox(fMain.Handle,'Внимание! У Вас нет прав на подобные действия.','Ошибка!',MB_ICONWARNING or MB_OK);
   exit;
  end;
 case fData.cSelectI('TB_CLIENT','CTYPE','Where ID='+IntToStr(integer(sgClients.Objects[0,sgClients.Row]))) of
  0: begin
      Application.CreateForm(TfClient, fClient);
      fClient.Caption := 'Клиент '+sgClients.Cells[1,sgClients.Row];
      fClient.ID := integer(sgClients.Objects[0,sgClients.Row]);
      fClient.Show();
     end;
  1: begin
      Application.CreateForm(TfClientU, fClientU);
      fClientU.Caption := 'Клиент '+sgClients.Cells[1,sgClients.Row];
      fClientU.ID := integer(sgClients.Objects[0,sgClients.Row]);
      fClientU.Show();
     end;
 end;
end;

procedure TfMain.bDelClick(Sender: TObject);
begin
 if (integer(lbCats.Items.Objects[lbCats.ItemIndex]) = -2) then
  if (fData.cSelectRule('TB_RULES',fData.UserID,fData.cSelectI('TB_CLIENT','CAT','Where ID='+IntToStr(integer(sgClients.Objects[0,sgClients.Row]))),'D') = 1) then
  begin
   MessageBox(fMain.Handle,'Внимание! У Вас нет прав на подобные действия.','Ошибка!',MB_ICONWARNING or MB_OK);
   exit;
  end;
 if MessageDlg('Вы уверены?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
 begin
  fData.cDelete('TB_QUEST','where CLIENT='+IntToStr(integer(sgClients.Objects[0,sgClients.Row])));
  fData.cDelete('TB_CLIENT','where ID='+IntToStr(integer(sgClients.Objects[0,sgClients.Row])));
 end;
 Refr();
end;

procedure TfMain.TimerTimer(Sender: TObject);
begin
 case pc.ActivePageIndex of
  0: if (lbCats.Items.Count > 0) then
      if (integer(lbCats.Items.Objects[0]) > -1) then lbCatsClick(self);
  1: CalendarClick(self);
{  2: case pcOptions.ActivePageIndex of
      0: tCatsShow(self);
      1: tUsersShow(self);
      2: tUsrRulesShow(self);
      3: tStandShow(self);
      4: tBDShow(self);
     end;              }
 end;
end;

procedure TfMain.tCalendarShow(Sender: TObject);
begin
// FormHeight := tCalendar.Height;
 eDBegin.DateTime := Now();
 eDEnd.DateTime   := Now();
 bShowClick(self);
// CalendarClick(self);
end;

procedure TfMain.BitBtn1Click(Sender: TObject);
begin
 Application.CreateForm(TfQuest, fQuest);
 fQuest.Show();
end;

procedure TfMain.Ic(n: Integer);
Var Nim:TNotifyIconData;
    s: string;
begin
With Nim do
Begin
cbSize:=SizeOf(Nim);
Wnd:=fMain.Handle;
uID:=1;
uFlags:=NIF_ICON or NIF_MESSAGE or NIF_TIP;
hicon:=Application.Icon.Handle;
uCallbackMessage:=wm_user+1;
szTip := 'Clientoffice';
if (fData.cCount('TB_QUEST','ID','where (((USR='+IntToStr(fData.UserID)+')or(USR=0))and(OK='+''''+'0'+''''+'))') > 0) then
{ ДОБАВЛЯЕМ ДАТУ БЛИЖАЙШЕЙ ЗАДАЧИ }
 begin
  s := fData.cSelectS('TB_QUEST','DATA','where (((USR='+IntToStr(fData.UserID)+')or(USR=0))and(OK='+''''+'0'+''''+'))');
  szTip := 'Clientoffice Есть задача: ';
  szTip[26] := s[1]; szTip[27] := s[2]; szTip[28] := s[3]; szTip[29] := s[4]; szTip[30] := s[5]; szTip[31] := s[6]; szTip[32] := s[9]; szTip[33] := s[10];
 end else
szTip := 'Clientoffice Задач нет.';
End;
Case n OF
1: Shell_NotifyIcon(Nim_Add,@Nim);
2: Shell_NotifyIcon(Nim_Delete,@Nim);
3: Shell_NotifyIcon(Nim_Modify,@Nim);
End;
end;

procedure TfMain.ControlWindow(var Msg: TMessage);
var i: integer;
begin
 if Msg.WParam = SC_MINIMIZE then
 begin
  Ic(1); // Добавляем значок в трей

  ShowWindow(Application.Handle, SW_HIDE); // Скрываем программу
//  ShowWindow(Application.MainForm.Handle, SW_HIDE);
  Application.MainForm.Hide();

  for i := 0 to Application.ComponentCount-1 do
   if ((Application.Components[i].ClassName = 'TfClient')or(Application.Components[i].ClassName = 'TfClientU')or(Application.Components[i].ClassName = 'TfQuest')or(Application.Components[i].ClassName = 'TfFind')) then
    ShowWindow((Application.Components[i] as TForm).Handle, SW_HIDE);
 end else
      inherited;
end;

procedure TfMain.IconMouse(var Msg: TMessage);
var p: tpoint;
    i: integer;
begin
 GetCursorPos(p); // Запоминаем координаты курсора мыши
 case Msg.LParam of // Проверяем какая кнопка была нажата
  WM_LBUTTONUP, WM_LBUTTONDBLCLK: {Действия, выполняемый по одинарному или двойному щел?ку левой кнопки мыши на зна?ке. В нашем слу?ае это просто активация приложения}
   begin
    Ic(2); // Удаляем зна?ок из трея
    ShowWindow(Application.Handle, SW_SHOW); // Восстанавливаем окно программы
//    ShowWindow(Application.MainForm.Handle, SW_SHOW);
    Application.MainForm.Show();
      for i := 0 to Application.ComponentCount-1 do
       if ((Application.Components[i].ClassName = 'TfClient')or(Application.Components[i].ClassName = 'TfClientU')or(Application.Components[i].ClassName = 'TfQuest')or(Application.Components[i].ClassName = 'TfFind')) then
        ShowWindow((Application.Components[i] as TForm).Handle, SW_SHOW);
   end;
 end;
end;

procedure TfMain.TmQuestTimer(Sender: TObject);
begin
 fData.CheckQ();
end;

procedure TfMain.FormClose(Sender: TObject; var Action: TCloseAction);
var fs:TSearchRec;
begin
if FindFirst(ExtractFileDir(Application.ExeName)+'\WorkDir\tmp\*.wav',faAnyFile-faDirectory-faVolumeID, fs)=0 then
   repeat
     DeleteFile(ExtractFileDir(Application.ExeName)+'\WorkDir\tmp\'+fs.Name);
   until FindNext(fs)<>0;
FindClose(fs);
end;

function TfMain.PrintClient(ID: integer): byte;
var FileName, Rs, Re, t1, t2: OleVariant;
    R: Range;
    s: string;
    i,c: integer;
begin
 FileName:=GetCurrentDir+'\WorkDir\Client.dot';
 with WordA do
 try  // Word не запущен, запустить
  WordA.Disconnect;
  WordA.Connect;
  WordA.Visible := TRUE;
  WordA.Documents.Open(FileName,EmptyParam,EmptyParam,EmptyParam,
                          EmptyParam,EmptyParam,EmptyParam,
	                  EmptyParam,EmptyParam,EmptyParam,
	                  EmptyParam,EmptyParam);
  SelectFirst;
  Selection.NextField;
  while (Selection.Text <> 'q')or(Selection.Text <> 'Q') do
  begin
   case Selection.Text[1] of
    { ТЕКСТОВОЕ ПОЛЕ }
    't','T': Selection.Text := fData.cSelectS('TB_CLIENT',Copy(Selection.Text,2,Length(Selection.Text)),'where ID='+IntToStr(ID));
    { ПОДСТАВНОЕ ПОЛЕ }
    'c','C': Selection.Text := fData.cSelectS('TB_CLIENT,TB_CATS','TB_CATS.NAME','where ((TB_CLIENT.CAT=TB_CATS.ID)and(TB_CLIENT.ID='+IntToStr(ID)+'))');
    { ВЫБОРОЧНО }
    'n','N': case Selection.Text[2] of
              's','S': case fData.cSelectI('TB_CLIENT',Copy(Selection.Text,2,Length(Selection.Text)),'where ID='+IntToStr(ID)) of
                        0: Selection.Text := 'муж.';
                        1: Selection.Text := 'жен.';
                       end;
             end;
    { ДАТА }
    'd','D': begin
              s := fData.cSelectS('TB_CLIENT',Copy(Selection.Text,2,Length(Selection.Text)),'where ID='+IntToStr(ID));
              i := pos(' ',s);
              delete(s, i, Length(s));
              Selection.Text := s;
             end;
    { ВЫХОД }
    'q','Q': begin
              WordA.Selection.Text := '';
              Result := 0;
              exit;
             end;
    { ЗАДАЧИ }
    'z','Z': begin
              Selection.Text := '';
              R := ActiveDocument.Tables.Item(WordA.ActiveDocument.Tables.Count).Cell(6,0).Range;
              Rs := R.Start;
              Re := R.End_;
              c := 0;

              fData.Transaction.Active := FALSE;
              fData.SQL.Close();
              fData.SQL.SQL.Clear;
              fData.SQL.SQL.Add('Select TB_QUEST.DATA,TB_QUEST.TP,TB_QUEST.TEXT,TB_QUEST.LOG, TB_QUEST.USR, TB_QUEST.DENTER from TB_QUEST where CLIENT='+IntToStr(ID)+' order by DENTER DESC');
              fData.Transaction.Active := TRUE;
              fData.SQL.ExecQuery;

              while not (fData.SQL.Eof) do
              begin
               ActiveDocument.Range(Rs,Re).InsertBefore(#10);
               case c of
                0: R.Start := R.Start + 1;
                1: R.Start := R.Start - 1;
               end;
               c := 1;
               R.End_  := R.Start;

                ActiveDocument.Tables.AddOld(R,3,1);
                t1 := 1; t2 := 2;
                ActiveDocument.Tables.Item(ActiveDocument.Tables.Count).Cell(6,0).Tables.Item(1).Cell(1,0).Split(t1,t2);
                ActiveDocument.Tables.Item(ActiveDocument.Tables.Count).Cell(6,0).Tables.Item(1).Cell(1,0).Range.Text := DateTimeToStr(fData.SQL.FieldByName('DENTER').AsDateTime);
                if (fData.SQL.FieldByName('USR').AsInteger = 0) then ActiveDocument.Tables.Item(ActiveDocument.Tables.Count).Cell(6,0).Tables.Item(1).Cell(1,0).Next.Range.Text := 'Ответственный: Все сотрудники' else
                begin
                 fData.Transaction2.Active := FALSE;
                 fData.SQL2.Close();
                 fData.SQL2.SQL.Clear;
                 fData.SQL2.SQL.Add('Select TB_USERS.PRIM from TB_USERS where ID='+fData.SQL.FieldByName('USR').AsString);
                 fData.Transaction2.Active := TRUE;
                 fData.SQL2.ExecQuery;
                 ActiveDocument.Tables.Item(ActiveDocument.Tables.Count).Cell(6,0).Tables.Item(1).Cell(1,0).Next.Range.Text := 'Ответственный: '+fData.SQL2.FieldByName('PRIM').AsString;
                 fData.Transaction2.Active := FALSE;
                end;
                ActiveDocument.Tables.Item(ActiveDocument.Tables.Count).Cell(6,0).Tables.Item(1).Cell(2,0).Range.Text := fData.SQL.FieldByName('TEXT').AsString;
                ActiveDocument.Tables.Item(ActiveDocument.Tables.Count).Cell(6,0).Tables.Item(1).Cell(3,0).Range.Text := fData.SQL.FieldByName('LOG').AsString;

               fData.SQL.Next;
              end;
              fData.Transaction.Active := FALSE;

             end;

   end;
   WordA.Selection.NextField();
  end;
  WordA.Selection.Text := '';
  Result := 0;
 except
  Result := 1;
  WordA.Disconnect;
  fData.Transaction.Active := FALSE;
  fData.Transaction2.Active := FALSE;
  MessageBox(fMain.Handle,'Произошла ошибка! Не удается найти Microsoft Word. Установка этого приложения исправит проблему.'+#10#13+'Или произошла ошибка на уровне Microsoft Word. Закройте MS Word и попробуйте повторить попытку.','Ошибка!',MB_ICONWARNING or MB_OK);
 end;
end;

procedure TfMain.bPrintClick(Sender: TObject);
begin
 PrintClient(integer(sgClients.Objects[0,sgClients.Row]));
end;

function TfMain.PrintUser(ID: integer; Db,De: TDateTime): byte;
var FileName, Rs, Re, t1, t2: OleVariant;
    R: Range;
    c: integer;
begin
 FileName:=GetCurrentDir+'\WorkDir\Usr.dot';
 with WordA do
 try  // Word не запущен, запустить
  WordA.Disconnect;
  WordA.Connect;
  WordA.Visible := TRUE;
  WordA.Documents.Open(FileName,EmptyParam,EmptyParam,EmptyParam,
                          EmptyParam,EmptyParam,EmptyParam,
	                  EmptyParam,EmptyParam,EmptyParam,
	                  EmptyParam,EmptyParam);
  SelectFirst;
  Selection.NextField;
  while (Selection.Text <> 'q')or(Selection.Text <> 'Q') do
  begin
   case Selection.Text[1] of
    { ТЕКСТОВОЕ ПОЛЕ }
    't','T': Selection.Text := fData.cSelectS('TB_USERS',Copy(Selection.Text,2,Length(Selection.Text)),'where ID='+IntToStr(ID));
    { ШАПКА ДАТА }
    'b','B': case Selection.Text[3] of
              'b','B': Selection.Text := DateToStr(Db);
              'e','E': Selection.Text := DateToStr(De);
             end;
    { ВЫХОД }
    'q','Q': begin
              WordA.Selection.Text := '';
              Result := 0;
              exit;
             end;
    { ЗАДАЧИ }
    'z','Z': begin
              Selection.Text := '';
              R := ActiveDocument.Tables.Item(WordA.ActiveDocument.Tables.Count).Cell(6,0).Range;
              Rs := R.Start;
              Re := R.End_;
              c := 0;

              fData.Transaction.Active := FALSE;
              fData.SQL.Close();
              fData.SQL.SQL.Clear;
              fData.SQL.SQL.Add('Select TB_QUEST.DATA,TB_QUEST.TP,TB_QUEST.TEXT,TB_QUEST.LOG, TB_QUEST.USR, TB_QUEST.DENTER, TB_CLIENT.FAM AS CF, TB_CLIENT.NAME AS CN, TB_CLIENT.SNAME AS CS from TB_QUEST,TB_CLIENT where ((TB_CLIENT.ID=TB_QUEST.CLIENT)and(TB_QUEST.DENTER >= '+''''+DateTimeToStr(Db)+''''+')and(TB_QUEST.DENTER <= '+''''+DateTimeToStr(De)+''''+')) order by TB_QUEST.DENTER DESC');
              fData.Transaction.Active := TRUE;
              fData.SQL.ExecQuery;

              while not (fData.SQL.Eof) do
              begin
               ActiveDocument.Range(Rs,Re).InsertBefore(#10);
               case c of
                0: R.Start := R.Start + 1;
                1: R.Start := R.Start - 1;
               end;
               c := 1;
               R.End_  := R.Start;

                ActiveDocument.Tables.AddOld(R,3,1);
                t1 := 1; t2 := 2;
                ActiveDocument.Tables.Item(ActiveDocument.Tables.Count).Cell(6,0).Tables.Item(1).Cell(1,0).Split(t1,t2);

                ActiveDocument.Tables.Item(ActiveDocument.Tables.Count).Cell(6,0).Tables.Item(1).Cell(1,0).Range.Text := DateTimeToStr(fData.SQL.FieldByName('DENTER').AsDateTime);
                ActiveDocument.Tables.Item(ActiveDocument.Tables.Count).Cell(6,0).Tables.Item(1).Cell(1,0).Next.Range.Text := 'Клиент: '+fData.SQL.FieldByName('CF').AsString+' '+fData.SQL.FieldByName('CN').AsString+' '+fData.SQL.FieldByName('CS').AsString;
                ActiveDocument.Tables.Item(ActiveDocument.Tables.Count).Cell(6,0).Tables.Item(1).Cell(2,0).Range.Text := fData.SQL.FieldByName('TEXT').AsString;
                ActiveDocument.Tables.Item(ActiveDocument.Tables.Count).Cell(6,0).Tables.Item(1).Cell(3,0).Range.Text := fData.SQL.FieldByName('LOG').AsString;

               fData.SQL.Next;
              end;
              fData.Transaction.Active := FALSE;

             end;

   end;
   WordA.Selection.NextField();
  end;
  WordA.Selection.Text := '';
  Result := 0;
 except
  Result := 1;
  WordA.Disconnect;
  fData.Transaction.Active := FALSE;
  MessageBox(fMain.Handle,'Произошла ошибка! Не удается найти Microsoft Word. Установка этого приложения исправит проблему.'+#10#13+'Или произошла ошибка на уровне Microsoft Word. Закройте MS Word и попробуйте повторить попытку.','Ошибка!',MB_ICONWARNING or MB_OK);
 end;
end;

procedure TfMain.bUsrPrintClick(Sender: TObject);
var tdb,tde: TDateTime;
begin
 tdb := StrToDateTime(DateToStr(Db.Date)+' 00:00:00');
 tde := StrToDateTime(DateToStr(De.Date)+' 23:59:59');
 PrintUser(integer(lbUsers.Items.Objects[lbUsers.ItemIndex]),tdb,tde);
end;

procedure TfMain.sgClientsDblClick(Sender: TObject);
begin
 if (bEdit.Enabled = TRUE) then bEditClick(self);
end;

procedure TfMain.sgCalendarDblClick(Sender: TObject);
begin
 if ((sgCalendar.RowCount > 1)and(sgCalendar.Cells[0,1] <> '')) then
 if (fData.cSelectRule('TB_RULES',fData.UserID,fData.cSelectI('TB_CLIENT','CAT','Where ID='+IntToStr(integer(sgCalendar.Objects[0,sgCalendar.Row]))),'E') = 1) then
  begin
   MessageBox(fMain.Handle,'Внимание! У Вас нет прав на подобные действия.','Ошибка!',MB_ICONWARNING or MB_OK);
   exit;
  end;

 Application.CreateForm(TfClient, fClient);
 fClient.Caption := 'Клиент '+sgCalendar.Cells[1,sgCalendar.Row];
 fClient.ID := integer(sgCalendar.Objects[0,sgCalendar.Row]);
 fClient.Show();
 Application.CreateForm(TfQuest, fQuest);
 fQuest.ID := integer(sgCalendar.Objects[2,sgCalendar.Row]);
 fQuest.Show();
end;

procedure TfMain.bFindClick(Sender: TObject);
var i,z: integer;
begin
 z := 0;
 for i := 0 to Application.ComponentCount-1 do
  if ((Application.Components[i].ClassName = 'TfFind')) then
  begin
   z := 1;
   break;
  end;
 case z of
  0: begin
      Application.CreateForm(TfFind, fFind);
      fFind.Show();
     end;
  1: (Application.Components[i] as TForm).Show;
 end; 
end;

procedure TfMain.CalendarGetMonthInfo(Sender: TObject; Month: Cardinal; var MonthBoldInfo: Cardinal);
var Dates: array of Cardinal;
    i: integer;
    Year,M,D: Word;
    s,dd: string;
begin
 DecodeDate(Calendar.Date,Year,M,D);
 for i := 1 to 12 do
 begin
  SetLength(Dates,0);
  if (i < 10) then s := '0'+IntToStr(i) else s := IntToStr(i);
  dd := IntToStr(DaysInAMonth(Year,i)); if (Length(dd) = 1) then dd := '0'+dd;
  SetLength(Dates, fData.cCount('TB_QUEST','ID','Where ((DATA >= '+''''+'01.'+s+'.'+IntToStr(Year)+''''+')and(DATA <= '+''''+dd+'.'+s+'.'+IntToStr(Year)+''''+'))'));
  if (Length(Dates) > 0) then
   if (fData.GetQDays(i,Year,Dates) = 0) then
    if (Month = i) then
     Calendar.BoldDays(Dates,MonthBoldInfo);
 end;
 SetLength(Dates,0);
end;

procedure TfMain.CalendarClick(Sender: TObject);
begin
 fData.FillSgT(sgCalendar,Calendar.Date,Calendar.EndDate,'order by DATA');
end;

procedure TfMain.bStandAddClick(Sender: TObject);
begin
 if fData.cInsert('TB_STANDART','NAME',''''+Trim(eStand.Text)+'''')= 0 then
 begin
  MessageBox(fMain.Handle,'Напоминание успешно добавлено.','Добавлено!',MB_ICONINFORMATION or MB_OK);
  StdRef();
 end else MessageBox(fMain.Handle,'Произошла ошибка! Проверьте данные и повторите попытку.','Ошибка!',MB_ICONWARNING or MB_OK);
end;

procedure TfMain.tStandShow(Sender: TObject);
begin
 StdRef();
end;

procedure TfMain.lbStandClick(Sender: TObject);
begin
 eStand.Text := fData.cSelectS('TB_STANDART','NAME','Where ID='+IntToStr(integer(lbStand.Items.Objects[lbStand.ItemIndex])));
end;

procedure TfMain.bStandEditClick(Sender: TObject);
begin
 if fData.cUpdate('TB_STANDART','NAME',''''+Trim(eStand.Text)+'''','ID ='+IntToStr(integer(lbStand.Items.Objects[lbStand.ItemIndex])))= 0 then
  StdRef()
   else MessageBox(fMain.Handle,'Произошла ошибка! Проверьте данные и повторите попытку.','Ошибка!',MB_ICONWARNING or MB_OK);
end;

procedure TfMain.bStandDelClick(Sender: TObject);
begin
 if (MessageDlg('Вы уверены?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
 if fData.cDelete('TB_STANDART','Where ID ='+IntToStr(integer(lbStand.Items.Objects[lbStand.ItemIndex])))= 0 then
  StdRef()
   else MessageBox(fMain.Handle,'Произошла ошибка! Проверьте данные и повторите попытку.','Ошибка!',MB_ICONWARNING or MB_OK);
end;

procedure TfMain.StdRef;
begin
 case fData.FillLB(lbStand,'TB_STANDART','NAME') of
  0: begin
      bStandAdd.Enabled  := TRUE;
      bStandEdit.Enabled := TRUE;
      bStandDel.Enabled  := TRUE;
      lbStandClick(self);
     end;
  1: begin
      bStandAdd.Enabled  := FALSE;
      bStandEdit.Enabled := FALSE;
      bStandDel.Enabled  := FALSE;
     end;
  2: begin
      bStandAdd.Enabled  := TRUE;
      bStandEdit.Enabled := FALSE;
      bStandDel.Enabled  := FALSE;
     end;
 end;
end;

procedure TfMain.rgClOrderClick(Sender: TObject);
begin
 lbCatsClick(self);
end;

procedure TfMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if (MessageDlg('Вы уверены, что хотите закрыть программу?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
  CanClose := TRUE else CanClose := FALSE;
end;

procedure TfMain.bShowClick(Sender: TObject);
var d,m,y: Word;
    s: string;
begin
{
Сегодня
3 дня
Текущая неделя
Текущий месяц
Выборочно
}
 case cbCData.ItemIndex of
  0: begin
      Calendar.Date    := Now();
      Calendar.EndDate := Now();
     end;
  1: begin
      s := DateTimeToStr( Now() - StrToDateTime('02.01.0001 00:00:00') + StrToDateTime('01.01.0001 00:00:00') );
      delete(s,pos(' ',s),Length(s));
      Calendar.Date := StrToDate(s);
      s := DateTimeToStr( Now() + StrToDateTime('02.01.0001 00:00:00') - StrToDateTime('01.01.0001 00:00:00') );
      delete(s,pos(' ',s),Length(s));
      Calendar.EndDate := StrToDate(s);
     end;
  2: begin
      case DayOfWeek(Now()) of
       1: Calendar.Date := Now() - StrToDate('07.01.0001') + StrToDate('01.01.0001');
       2: Calendar.Date := Now();
       3: Calendar.Date := Now() - StrToDate('02.01.0001') + StrToDate('01.01.0001');
       4: Calendar.Date := Now() - StrToDate('03.01.0001') + StrToDate('01.01.0001');
       5: Calendar.Date := Now() - StrToDate('04.01.0001') + StrToDate('01.01.0001');
       6: Calendar.Date := Now() - StrToDate('05.01.0001') + StrToDate('01.01.0001');
       7: Calendar.Date := Now() - StrToDate('06.01.0001') + StrToDate('01.01.0001');
      end;
      Calendar.EndDate := Calendar.Date + StrToDate('07.01.0001') - StrToDate('01.01.0001');
     end;
  3: begin
      DecodeDate(Now(),y,m,d);
      if (m < 10) then s := '0'+IntToStr(m) else s := IntToStr(m);
      Calendar.Date := StrToDate('01.'+s+'.'+IntToStr(y));
      Calendar.EndDate := StrToDate( IntToStr(DaysInAMonth(y,m))+'.'+s+'.'+IntToStr(y));
     end;
  4: begin
      Calendar.Date := eDBegin.Date;
      Calendar.EndDate := eDEnd.Date;
     end;
 end;
 Calendar.Refresh();
 Calendar.Repaint();
 fData.FillSgT(sgCalendar,Calendar.Date,Calendar.EndDate,'order by DATA');
end;

procedure TfMain.cbCDataChange(Sender: TObject);
begin
 if (cbCData.ItemIndex = 4) then
 begin
  eDBegin.Enabled := TRUE;
  eDEnd.Enabled   := TRUE;
 end else
 begin
  eDBegin.Enabled := FALSE;
  eDEnd.Enabled   := FALSE;
 end;
end;

procedure TfMain.tBDShow(Sender: TObject);
var f: TIniFile;
    s: string;
    d,m,y: Word;
begin
 f := TIniFile.Create(ExtractFileDir(Application.ExeName)+'\config.ini');
 s := f.ReadString('DataBase','TP','Loc');
 EdbLoc.Text := f.ReadString('DataBase','Loc','WorkDir\BASE.FDB');
 EdbNet.Text := f.ReadString('DataBase','Net','WorkDir\BASE.FDB');
 ETimeR.Value := Round(f.ReadInteger('TIMER','Time',60000)/1000);
 ETimeQ.Value := Round(f.ReadInteger('TIMER','Quest',60000)/1000);
 f.Free;
 case s[1] of
  'L': LbdTP.Caption := 'Локальная БД';
  'N': LbdTP.Caption := 'Сетевая БД';
 end;
 DecodeDate(Now(),y,m,d);
 if ((d = 21)and(m = 7)) then
 begin
  LMyB.Visible := TRUE;
  LMyB.Enabled := TRUE;
  LMyB.Caption := 'А сегодня у автора программы, Кучеренко Вадима Владимировича, день рождение! :)';
 end;
end;

procedure TfMain.bSetLocClick(Sender: TObject);
var f: TIniFile;
begin
 if (LbdTP.Caption[1] = 'С') then
  if (MessageDlg('Вы уверены?'+#10#13+'Программа перейдет в режим работы с локальной БД.'+#10#13+'Для продолжения работы будет необходимо перезапустить программу.',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
  begin
   f := TIniFile.Create(ExtractFileDir(Application.ExeName)+'\config.ini');
   f.WriteString('DataBase','TP','Loc');
   f.Free;
   MessageBox(fMain.Handle,'Данные успешно изменены. Программа будет закрыта.','Внимание!',MB_ICONINFORMATION or MB_OK);
   Application.Terminate;
  end;
 SetTxt();
end;

procedure TfMain.bSetNetClick(Sender: TObject);
var f: TIniFile;
begin
 if (LbdTP.Caption[1] = 'Л') then
  if (MessageDlg('Вы уверены?'+#10#13+'Программа перейдет в режим работы с сетевой БД.'+#10#13+'Для продолжения работы будет необходимо перезапустить программу.',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
  begin
   f := TIniFile.Create(ExtractFileDir(Application.ExeName)+'\config.ini');
   f.WriteString('DataBase','TP','Net');
   f.Free;
   MessageBox(fMain.Handle,'Данные успешно изменены. Программа будет закрыта.','Внимание!',MB_ICONINFORMATION or MB_OK);
   Application.Terminate;
  end;
 SetTxt();
end;

procedure TfMain.bChNtoLClick(Sender: TObject);
var f: TIniFile;
    fL, fN: string;
begin
 f := TIniFile.Create(ExtractFileDir(Application.ExeName)+'\config.ini');
 fL := f.ReadString('DataBase','Loc','WorkDir\BASE.FDB');
 fN := f.ReadString('DataBase','Net','WorkDir\BASE.FDB');
 if ((fN[1]='\')and(fN[2]='\')) then delete(fN,pos(':',fN),1);
 f.Free;
 if (LbdTP.Caption[1] = 'С') then
  MessageBox(fMain.Handle,'Нельзя заменить открытую БД. Для решения проблемы перейдите в другой режим работы.','Внимание!',MB_ICONWARNING or MB_OK);
{
  if (MessageDlg('Вы уверены?'+#10#13+'Для удачного завершения задачи пожалуйста закройте все копии программы, которые работают с сетевой БД.'+#10#13+'Для продолжения работы будет необходимо перезапустить программу.',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
   if (CopyFile(PChar(fL),PChar(fN),FALSE)) then
   begin
    Timer.Enabled   := FALSE;
    TmQuest.Enabled := FALSE;
    fData.Database.Close();
    MessageBox(fMain.Handle,'Данные успешно изменены. Программа будет закрыта.','Внимание!',MB_ICONINFORMATION or MB_OK);
    Application.Terminate;
   end else MessageBox(fMain.Handle,'При копировании произошла ошибка! Проверьте не работает ли какая-либо копия программы в сетевом режиме и повторите попытку.','Ошибка!',MB_ICONWARNING or MB_OK);
}

 if (LbdTP.Caption[1] = 'Л') then
  if (MessageDlg('Вы уверены?'+#10#13+'Для удачного завершения задачи пожалуйста закройте все копии программы, которые работают с сетевой БД.',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
   if (CopyFile(PChar(fL),PChar(fN),FALSE)) then
    MessageBox(fMain.Handle,'Данные успешно изменены.','Внимание!',MB_ICONINFORMATION or MB_OK)
   else MessageBox(fMain.Handle,'При копировании произошла ошибка! Проверьте не работает ли какая-либо копия программы в сетевом режиме и повторите попытку.','Ошибка!',MB_ICONWARNING or MB_OK);
end;

procedure TfMain.bChLtoNClick(Sender: TObject);
var f: TIniFile;
    fL, fN: string;
begin
 f := TIniFile.Create(ExtractFileDir(Application.ExeName)+'\config.ini');
 fL := f.ReadString('DataBase','Loc','WorkDir\BASE.FDB');
 fN := f.ReadString('DataBase','Net','WorkDir\BASE.FDB');
 f.Free;
 if ((fN[1]='\')and(fN[2]='\')) then delete(fN,pos(':',fN),1);
 if (LbdTP.Caption[1] = 'Л') then
  MessageBox(fMain.Handle,'Нельзя заменить открытую БД. Для решения проблемы перейдите в другой режим работы.','Внимание!',MB_ICONWARNING or MB_OK);
 {
  if (MessageDlg('Вы уверены?'+#10#13+'Для продолжения работы будет необходимо перезапустить программу.',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
   if (CopyFile(PChar(fN),PChar(fL),FALSE)) then
   begin
    Timer.Enabled   := FALSE;
    TmQuest.Enabled := FALSE;
    fData.Database.Close();
    MessageBox(fMain.Handle,'Данные успешно изменены. Программа будет закрыта.','Внимание!',MB_ICONINFORMATION or MB_OK);
    Application.Terminate;
   end else MessageBox(fMain.Handle,'При копировании произошла ошибка! Повторите попытку позднее.','Ошибка!',MB_ICONWARNING or MB_OK);
}

 if (LbdTP.Caption[1] = 'С') then
  if (MessageDlg('Вы уверены?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
   if (CopyFile(PChar(fN),PChar(fL),FALSE)) then
    MessageBox(fMain.Handle,'Данные успешно изменены.','Внимание!',MB_ICONINFORMATION or MB_OK)
   else MessageBox(fMain.Handle,'При копировании произошла ошибка! Повторите попытку позднее.','Ошибка!',MB_ICONWARNING or MB_OK);
end;

procedure TfMain.bQImportClick(Sender: TObject);
var r,v: string;
begin
 if (OpenD.Execute()) then
  if FileExists(OpenD.FileName) then
  begin
   eQImport.Clear;
   eQImport.Lines.LoadFromFile(OpenD.FileName);
   r := eQImport.Lines[0];
   v := eQImport.Text;
   delete(v,1,Length(r));
   case fData.cInsert('TB_QUEST',r,v) of
    0: MessageBox(fMain.Handle,'Данные успешно добавлены.','Успешно!',MB_ICONINFORMATION or MB_OK);
    1: MessageBox(fMain.Handle,'При импорте произошла ошибка. Проверьте данные и повторите попытку позднее.','Ошибка!',MB_ICONWARNING or MB_OK);
   end;
  end;
end;

procedure TfMain.SetTxt;
var f: TIniFile;
    s: string;
begin
 f := TIniFile.Create(ExtractFileDir(Application.ExeName)+'\config.ini');
 s := f.ReadString('DataBase','TP','Loc');
 f.Free;
 case s[1] of
  'L': TWork.Caption := 'Локальная БД';
  'N': TWork.Caption := 'Сетевая БД'; 
 end;
end;

procedure TfMain.sgClientsKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if (Key = VK_RETURN) then sgClientsDblClick(self);
end;

procedure TfMain.sgCalendarKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if (Key = VK_RETURN) then sgCalendarDblClick(self);
end;

procedure TfMain.cbCDataKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if (Key = VK_RETURN) then bShowClick(self); 
end;

procedure TfMain.eDBeginKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if (Key = VK_RETURN) then bShowClick(self);
end;

procedure TfMain.eDEndKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if (Key = VK_RETURN) then bShowClick(self);
end;

procedure TfMain.bRefrClick(Sender: TObject);
begin
 case pc.ActivePageIndex of
  0: lbCatsClick(self);
  1: CalendarClick(self);
  2: case pcOptions.ActivePageIndex of
      0: tCatsShow(self);
      1: tUsersShow(self);
      2: tUsrRulesShow(self);
      3: tStandShow(self);
      4: tBDShow(self);
     end;
 end;
end;

procedure TfMain.lbACatsClick(Sender: TObject);
begin
 if (integer(lbACats.Items.Objects[lbACats.ItemIndex]) = -2) then
 begin
  bCatEdit.Enabled := FALSE;
  bCatDel.Enabled  := FALSE;
  bCatUp.Enabled   := FALSE;
  bCatDw.Enabled   := FALSE;
 end else
     begin
      bCatEdit.Enabled := TRUE;
      bCatDel.Enabled  := TRUE;
      bCatUp.Enabled   := TRUE;
      bCatDw.Enabled   := TRUE;
     end;
 if ((lbACats.ItemIndex = 0)or(lbACats.ItemIndex = 1)) then
  bCatUp.Enabled := FALSE else bCatUp.Enabled := TRUE;
end;

procedure TfMain.SplitterMoved(Sender: TObject);
begin
 if (Splitter.Top < 200) then Splitter.Top := 200;
// sgCalendar.Constraints.MaxHeight := FormHeight;

// sgCalendar.Top := Splitter.Top + 10;
// sgCalendar.Height := tCalendar.Height - sgCalendar.Top;
end;

procedure TfMain.bCdbLocClick(Sender: TObject);
var f: TIniFile;
begin
 if ODdb.Execute() then
  if Length(ODdb.FileName)>0 then
   if MessageDlg('Вы уверены, что хотите изменить путь локальной БД'+#10#13+EdbLoc.Text+#10#13+'на '+#10#13+ODdb.FileName,mtConfirmation,[mbOk,mbCancel],0) = mrOk then
   begin
    f := TIniFile.Create(ExtractFileDir(Application.ExeName)+'\config.ini');
    f.WriteString('DataBase','Loc',CheckDBName(ODdb.FileName));
    f.Free;
    MessageBox(fMain.Handle,'Путь был успешно изменен. Для продолжения работы программу необходимо перезапустить.','Успешно!',MB_ICONINFORMATION or MB_OK);
    Application.Terminate;
   end;

end;

procedure TfMain.bCdbNetClick(Sender: TObject);
var f: TIniFile;
begin
 if ODdb.Execute() then
  if Length(ODdb.FileName)>0 then
   if MessageDlg('Вы уверены, что хотите изменить путь локальной БД'+#10#13+EdbLoc.Text+#10#13+'на '+#10#13+ODdb.FileName,mtConfirmation,[mbOk,mbCancel],0) = mrOk then
   begin
    f := TIniFile.Create(ExtractFileDir(Application.ExeName)+'\config.ini');
    f.WriteString('DataBase','Net',CheckDBName(ODdb.FileName));
    f.Free;
    MessageBox(fMain.Handle,'Путь был успешно изменен. Для продолжения работы программу необходимо перезапустить.','Успешно!',MB_ICONINFORMATION or MB_OK);
    Application.Terminate;
   end;
end;

procedure TfMain.bTimerSaveClick(Sender: TObject);
var f: TIniFile;
begin
 f := TIniFile.Create(ExtractFileDir(Application.ExeName)+'\config.ini');
 f.WriteInteger('TIMER','Time',ETimeR.Value*1000);
 f.WriteInteger('TIMER','Quest',ETimeQ.Value*1000);
 f.Free;
 MessageBox(fMain.Handle,'Изменения вступят в силу после перезапуска программы.','Успешно!',MB_ICONINFORMATION or MB_OK);
end;

function TfMain.CheckDBName(s: string): string;
var t, srvName: string;
begin
 Result := s;
 if ((s[1] = '\')and(s[2] = '\')) then
    begin
     t := copy(s,3,Length(s));
     srvName := copy(t,1,pos('\',t));
     delete(t,1,pos('\',t));
     s := '\\'+srvName+copy(t,1,pos('\',t)-1)+':'+copy(t,pos('\',t),Length(t));
     Result := s;
    end;
end;

procedure TfMain.bLocBaseClick(Sender: TObject);
var f: TIniFile;
begin
 if (TWork.Caption[1] = 'С') then
  if (MessageDlg('Вы уверены?'+#10#13+'Программа перейдет в режим работы с локальной БД.'+#10#13+'Для продолжения работы будет необходимо перезапустить программу.',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
  begin
   f := TIniFile.Create(ExtractFileDir(Application.ExeName)+'\config.ini');
   f.WriteString('DataBase','TP','Loc');
   f.Free;
   MessageBox(fMain.Handle,'Данные успешно изменены. Программа будет закрыта.','Внимание!',MB_ICONINFORMATION or MB_OK);
   Application.Terminate;
  end;
 SetTxt();
end;

procedure TfMain.bNetBaseClick(Sender: TObject);
var f: TIniFile;
begin
 if (TWork.Caption[1] = 'Л') then
  if (MessageDlg('Вы уверены?'+#10#13+'Программа перейдет в режим работы с сетевой БД.'+#10#13+'Для продолжения работы будет необходимо перезапустить программу.',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
  begin
   f := TIniFile.Create(ExtractFileDir(Application.ExeName)+'\config.ini');
   f.WriteString('DataBase','TP','Net');
   f.Free;
   MessageBox(fMain.Handle,'Данные успешно изменены. Программа будет закрыта.','Внимание!',MB_ICONINFORMATION or MB_OK);
   Application.Terminate;
  end;
 SetTxt();
end;

procedure TfMain.LOfSiteClick(Sender: TObject);
begin
ShellExecute(Handle, nil, 'http://clientoffice.ucoz.net', nil, nil, SW_SHOW);
end;

procedure TfMain.bAddUClick(Sender: TObject);
begin
 case fData.cInsert('TB_CLIENT','CAT,NUM,BIRTHDAY,PDATE,DATA,CTYPE,DTYPE,DOPEN',IntToStr(integer(lbCats.Items.Objects[lbCats.ItemIndex]))+','+IntToStr(StrToInt(fData.cMax('TB_CLIENT','NUM'))+1)+','+''''+DateTimeToStr(Now())+''''+','+''''+DateTimeToStr(Now())+''''+','+''''+DateTimeToStr(Now())+''''+','+'1'+','+'0'+','+''''+DateTimeToStr(Now())+'''') of
  0: begin
      Application.CreateForm(TfClientU, fClientU);
      fClientU.ID := StrToInt(fData.cMax('TB_CLIENT','ID'));
      fClientU.Show();
      lbCatsClick(self);
     end;
  1: MessageBox(fMain.Handle,'Произошла ошибка! Проверьте данные и повторите попытку.','Ошибка!',MB_ICONWARNING or MB_OK);
 end;
end;

procedure TfMain.sgCalendarDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var c: TColor;
begin
 if (fData.Colorize = 1) then
 if ((ARow > 0)and(sgCalendar.Cells[0,ARow] <> '')) then
 begin
  c := sgCalendar.Canvas.Brush.Color;
  case fData.cSelectI('TB_QUEST','OK','Where ID='+IntToStr(integer(sgCalendar.Objects[2,ARow]))) of
   0: sgCalendar.Canvas.Brush.Color := clWindow;
   1: sgCalendar.Canvas.Brush.Color := RGB(240,255,240);
   2: sgCalendar.Canvas.Brush.Color := RGB(255,255,240);
   3: sgCalendar.Canvas.Brush.Color := RGB(255,240,240);
  end;
  sgCalendar.Canvas.FillRect(Rect);
  sgCalendar.Canvas.TextOut(Rect.Left+2,Rect.Top,sgCalendar.Cells[ACol,ARow]);
  sgCalendar.Canvas.Brush.Color := c;
 end;
end;

end.
