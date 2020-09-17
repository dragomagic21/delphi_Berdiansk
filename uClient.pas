unit uClient;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Grids, Buttons, Spin, OleServer,
  Word2000, Mask, ImgList;

type
  TfClient = class(TForm)
    rgSex: TRadioGroup;
    Bevel2: TBevel;
    Lfam: TLabel;
    Lname: TLabel;
    Lsname: TLabel;
    Lbdate: TLabel;
    Cbdate: TDateTimePicker;
    Esname: TEdit;
    Ename: TEdit;
    Efam: TEdit;
    Lpasp: TLabel;
    Bevel3: TBevel;
    Eps: TEdit;
    Lps: TLabel;
    Lpplace: TLabel;
    Epplace: TEdit;
    Lpdate: TLabel;
    Cpdate: TDateTimePicker;
    Epnum: TEdit;
    Lpnum: TLabel;
    Lpid: TLabel;
    Epid: TEdit;
    Ltel: TLabel;
    Bevel6: TBevel;
    Ltel_m: TLabel;
    Ltel_h: TLabel;
    Etel_h: TEdit;
    Etel_m: TEdit;
    sgQ: TStringGrid;
    bAdd: TSpeedButton;
    bEdit: TSpeedButton;
    bDel: TSpeedButton;
    LQuests: TLabel;
    Bevel1: TBevel;
    LPrim: TLabel;
    EPrim: TMemo;
    bPrint: TSpeedButton;
    bSave: TSpeedButton;
    LNum: TLabel;
    eNum: TSpinEdit;
    LData: TLabel;
    eData: TDateTimePicker;
    LSumma: TLabel;
    Label1: TLabel;
    ePredop: TEdit;
    eSumma: TEdit;
    Bevel4: TBevel;
    bDogovor: TSpeedButton;
    WordA: TWordApplication;
    Llstreet: TLabel;
    Estreet: TEdit;
    Llhome: TLabel;
    Ehome: TEdit;
    Ekr: TEdit;
    Llkorp: TLabel;
    Llkv: TLabel;
    Ekv: TEdit;
    Label2: TLabel;
    Bevel5: TBevel;
    Ebdate: TMaskEdit;
    Epdate: TMaskEdit;
    EProc: TEdit;
    Label3: TLabel;
    ImageList: TImageList;
    Bevel7: TBevel;
    Label6: TLabel;
    cbClCat: TComboBox;
    Bevel8: TBevel;
    Label7: TLabel;
    LStatus: TLabel;
    eDOpen: TDateTimePicker;
    bDType: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bSaveClick(Sender: TObject);
    procedure bDelClick(Sender: TObject);
    procedure bEditClick(Sender: TObject);
    procedure bAddClick(Sender: TObject);
    procedure bPrintClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgQDblClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bDogovorClick(Sender: TObject);
    procedure CbdateChange(Sender: TObject);
    procedure CpdateChange(Sender: TObject);
    procedure eSummaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ePredopKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EProcKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eSummaChange(Sender: TObject);
    procedure ePredopChange(Sender: TObject);
    procedure EProcChange(Sender: TObject);
    procedure bDTypeClick(Sender: TObject);
  private
    Save: boolean;
    sex, num,cat: integer;
    fam,name,sname,ps,pnum,pplace,pid,t_h,t_m,street,home,kr,kv,summa,predop,prim: string;
    birthday,pdate, data: TDateTime;
    { Private declarations }
    procedure CreateParams(var Params: TCreateParams); override;
    function CheckChange(): byte;
  public
    ID: integer;
    { Public declarations }
    procedure RefQ();
  end;

var
  fClient: TfClient;

implementation

uses uData, uMain, uQuest;

{$R *.dfm}

procedure TfClient.CreateParams(var Params: TCreateParams);
begin
inherited CreateParams(Params);
with params do
   ExStyle := ExStyle or WS_EX_APPWINDOW;
end;

procedure TfClient.FormCreate(Sender: TObject);
begin
 Save := FALSE;
 sgQ.ColWidths[0] := 60;
 sgQ.ColWidths[1] := sgQ.Width-300-25;
 sgQ.ColWidths[2] := 100;
 sgQ.ColWidths[3] := 140;
 sgQ.Cells[0,0]:='Дата';
 sgQ.Cells[1,0]:='Ближайшая задача';
 sgQ.Cells[2,0]:='Ответственный';
 sgQ.Cells[3,0]:='Примечание';
end;

procedure TfClient.FormShow(Sender: TObject);
begin
 fData.FillCB(cbClCat,'TB_CATS','NAME','','order by LVL');
 cbClCat.ItemIndex := cbClCat.Items.IndexOfObject(pointer(fData.cSelectI('TB_CLIENT','CAT','Where ID='+IntToStr(ID))));
 cat := integer(cbClCat.Items.Objects[cbClCat.ItemIndex]);
 { ЗАПОЛНЯЕМ ДАННЫЕ }
 case StrToInt(fData.cSelectS('TB_CLIENT','SEX','Where ID='+IntToStr(ID))) of
  -1: rgSex.ItemIndex := 0;
   1: rgSex.ItemIndex := 1;
 end;
 sex := rgSex.ItemIndex;
 Efam.Text := fData.cSelectS('TB_CLIENT','FAM','Where ID='+IntToStr(ID)); fam := Efam.Text;
 Ename.Text := fData.cSelectS('TB_CLIENT','NAME','Where ID='+IntToStr(ID)); name := Ename.Text;
 Esname.Text := fData.cSelectS('TB_CLIENT','SNAME','Where ID='+IntToStr(ID)); sname := Esname.Text;
 Ebdate.Text := Copy(fData.cSelectS('TB_CLIENT','BIRTHDAY','Where ID='+IntToStr(ID)),1,10); birthday := StrToDateTime(Ebdate.Text+' 07:21:00');
 Cbdate.DateTime := StrToDateTime(fData.cSelectS('TB_CLIENT','BIRTHDAY','Where ID='+IntToStr(ID)));
 Eps.Text := fData.cSelectS('TB_CLIENT','PS','Where ID='+IntToStr(ID)); ps := Eps.Text;
 Epnum.Text := fData.cSelectS('TB_CLIENT','PNUM','Where ID='+IntToStr(ID)); pnum := Epnum.Text;
 Epplace.Text := fData.cSelectS('TB_CLIENT','PPLACE','Where ID='+IntToStr(ID)); pplace := Epplace.Text;
 Epdate.Text := Copy(fData.cSelectS('TB_CLIENT','PDATE','Where ID='+IntToStr(ID)),1,10);  pdate:= StrToDateTime(Epdate.Text+' 07:21:00');
 Cpdate.DateTime := StrToDateTime(fData.cSelectS('TB_CLIENT','PDATE','Where ID='+IntToStr(ID)));
 Epid.Text := fData.cSelectS('TB_CLIENT','PID','Where ID='+IntToStr(ID)); pid := Epid.Text;
 Estreet.Text := fData.cSelectS('TB_CLIENT','STREET','Where ID='+IntToStr(ID)); street := Estreet.Text;
 Ehome.Text := fData.cSelectS('TB_CLIENT','HOME','Where ID='+IntToStr(ID)); home := Ehome.Text;
 Ekr.Text := fData.cSelectS('TB_CLIENT','KR','Where ID='+IntToStr(ID)); kr := Ekr.Text;
 Ekv.Text := fData.cSelectS('TB_CLIENT','KV','Where ID='+IntToStr(ID)); kv := Ekv.Text;
 Etel_m.Text := fData.cSelectS('TB_CLIENT','T_M','Where ID='+IntToStr(ID)); t_m := Etel_m.Text;
 Etel_h.Text := fData.cSelectS('TB_CLIENT','T_M','Where ID='+IntToStr(ID)); t_h := Etel_h.Text;
 EPrim.Text := fData.cSelectS('TB_CLIENT','PRIM','Where ID='+IntToStr(ID)); prim := EPrim.Text;
 eNum.Value := StrToInt(fData.cSelectS('TB_CLIENT','NUM','Where ID='+IntToStr(ID))); num := eNum.Value;
 eData.DateTime := StrToDateTime(fData.cSelectS('TB_CLIENT','DATA','Where ID='+IntToStr(ID))); data := eData.DateTime;
 eSumma.Text := fData.cSelectS('TB_CLIENT','SUMMA','Where ID='+IntToStr(ID)); summa := eSumma.Text;
 ePredop.Text := fData.cSelectS('TB_CLIENT','PREDOP','Where ID='+IntToStr(ID)); predop := ePredop.Text;
 EProc.Text := FloatToStr( (StrToFloat(ePredop.Text)/StrToFloat(eSumma.Text))*100 );
 eDOpen.DateTime := StrToDateTime(fData.cSelectS('TB_CLIENT','DOPEN','Where ID='+IntToStr(ID)));
 case fData.cSelectI('TB_CLIENT','DTYPE','Where ID='+IntToStr(ID)) of
  0: begin
      bDType.Caption := 'Закрыть';
      ImageList.GetBitmap(1,bDType.Glyph);
      LStatus.Caption := 'Открытый';
      end;
  1: begin
      bDType.Caption := 'Открыть';
      ImageList.GetBitmap(0,bDType.Glyph);
      LStatus.Caption := 'Закрытый';
     end;
 end;
 RefQ();
end;

procedure TfClient.bSaveClick(Sender: TObject);
var r,v: TStringList;
begin
 r := TStringList.Create; r.Clear;
 v := TStringList.Create; v.Clear;
 r.Add('SEX'); r.Add('FAM'); r.Add('NAME'); r.Add('SNAME'); r.Add('BIRTHDAY'); r.Add('PS'); r.Add('PNUM'); r.Add('PPLACE'); r.Add('PDATE'); r.Add('PID');
 r.Add('STREET'); r.Add('HOME'); r.Add('KR'); r.Add('KV'); r.Add('T_M'); r.Add('T_H'); r.Add('PRIM'); r.Add('NUM'); r.Add('DATA'); r.Add('SUMMA'); r.Add('PREDOP'); r.Add('CAT');
 v.Add(IntToStr(rgSex.ItemIndex));
 if Length(Efam.Text) > 0 then v.Add(''''+Trim(Efam.Text)+'''') else v.Add(''''+''+'''');
 if Length(Ename.Text) > 0 then v.Add(''''+Trim(Ename.Text)+'''') else v.Add(''''+''+'''');
 if Length(Esname.Text) > 0 then v.Add(''''+Trim(Esname.Text)+'''') else v.Add(''''+''+'''');
 v.Add(''''+Ebdate.Text+' 07:21:00'+'''');
 if Length(Eps.Text) > 0 then v.Add(''''+Trim(Eps.Text)+'''') else v.Add(''''+''+'''');
 if Length(Epnum.Text) > 0 then v.Add(''''+Trim(Epnum.Text)+'''') else v.Add(''''+''+'''');
 if Length(Epplace.Text) > 0 then v.Add(''''+Trim(Epplace.Text)+'''') else v.Add(''''+''+'''');
 v.Add(''''+Epdate.Text+' 07:21:00'+'''');
 if Length(Epid.Text) > 0 then v.Add(''''+Trim(Epid.Text)+'''') else v.Add(''''+''+'''');
 if Length(Estreet.Text) > 0 then v.Add(''''+Trim(Estreet.Text)+'''') else v.Add(''''+''+'''');
 if Length(Ehome.Text) > 0 then v.Add(''''+Trim(Ehome.Text)+'''') else v.Add(''''+''+'''');
 if Length(Ekr.Text) > 0 then v.Add(''''+Trim(Ekr.Text)+'''') else v.Add(''''+''+'''');
 if Length(Ekv.Text) > 0 then v.Add(''''+Trim(Ekv.Text)+'''') else v.Add(''''+''+'''');
 if Length(Etel_m.Text) > 0 then v.Add(''''+Trim(Etel_m.Text)+'''') else v.Add(''''+''+'''');
 if Length(Etel_h.Text) > 0 then v.Add(''''+Trim(Etel_h.Text)+'''') else v.Add(''''+''+'''');
 if Length(EPrim.Text) > 0 then v.Add(''''+Trim(EPrim.Text)+'''') else v.Add(''''+''+'''');
 v.Add(IntToStr(eNum.Value));
 v.Add(''''+DateTimeToStr(eData.DateTime)+'''');
 if Length(eSumma.Text) > 0 then v.Add(''''+Trim(eSumma.Text)+'''') else v.Add(''''+'0'+'''');
 if Length(ePredop.Text) > 0 then v.Add(''''+Trim(ePredop.Text)+'''') else v.Add(''''+'0'+'''');
 v.Add(IntToStr(integer(cbClCat.Items.Objects[cbClCat.ItemIndex])));
 case fData.cUpdates('TB_CLIENT',r,v,'ID='+IntToStr(ID)) of
  0: begin
      Save := TRUE;
      MessageBox(fClient.Handle,'Данные успешно сохранены.','Выполнено!',MB_ICONINFORMATION or MB_OK);
     end;
  1: begin
      Save := FALSE;
      MessageBox(fClient.Handle,'Произошла ошибка! Проверьте данные и повторите попытку.','Ошибка!',MB_ICONWARNING or MB_OK);
     end; 
 end;
 r.Free;
 v.Free;
 fMain.lbCatsClick(self);

end;

procedure TfClient.bDelClick(Sender: TObject);
begin
 if MessageDlg('Вы уверены?',mtConfirmation,[mbOk, mbCancel],0) = mrOk then
 case fData.cDelete('TB_QUEST','Where ID='+IntToStr(integer(sgQ.Objects[0,sgQ.Row]))) of
  0: RefQ();
  1: MessageBox(fClient.Handle,'Произошла ошибка! Проверьте данные и повторите попытку.','Ошибка!',MB_ICONWARNING or MB_OK);
 end;
end;

procedure TfClient.RefQ;
begin
 case fData.FillSgQ(sgQ,ID) of
  0: begin
      bAdd.Enabled  := TRUE;
      bEdit.Enabled := TRUE;
      bDel.Enabled  := TRUE;
     end;
  1: begin
      bAdd.Enabled  := FALSE;
      bEdit.Enabled := FALSE;
      bDel.Enabled  := FALSE;
      MessageBox(fClient.Handle,'Произошла ошибка! Проверьте данные и повторите попытку.','Ошибка!',MB_ICONWARNING or MB_OK);
     end;
  2: begin
      bAdd.Enabled  := TRUE;
      bEdit.Enabled := FALSE;
      bDel.Enabled  := FALSE;
     end;
 end;
end;

procedure TfClient.bEditClick(Sender: TObject);
begin
 Application.CreateForm(TfQuest, fQuest);
 fQuest.ID := integer(sgQ.Objects[0,sgQ.Row]);
 fQuest.Show();
end;

procedure TfClient.bAddClick(Sender: TObject);
var data: TDateTime;
    s: string;
begin
 data := Now();

 s := DateTimeToStr(Now())+' '+fData.cSelectS('TB_USERS','PRIM','Where ID='+IntToStr(fData.UserID))+' установил текущую задачу.';
 case fData.cInsert('TB_QUEST','CLIENT,TP,DATA,TEXT,DIREC,USR,LOG,OK,DENTER',IntToStr(ID)+','+'0'+','+''''+DateTimeToStr(data)+''''+','+''''+''+''''+','+IntToStr(fData.UserID)+','+'0'+','+''''+s+''''+','+'1'+','+''''+DateTimeToStr(Now())+'''') of
  0: begin
      Application.CreateForm(TfQuest, fQuest);
      fQuest.ID := StrToInt(fData.cMax('TB_QUEST','ID'));
      fQuest.Show();
     end;
  1: MessageBox(fMain.Handle,'Произошла ошибка! Проверьте данные и повторите попытку.','Ошибка!',MB_ICONWARNING or MB_OK);
 end;

end;

procedure TfClient.bPrintClick(Sender: TObject);
begin
 fMain.PrintClient(ID);
end;

procedure TfClient.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TfClient.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if (Key = VK_ESCAPE) then fClient.Close();
 if (((Key = Ord('s'))or(Key = Ord('S'))or(Key = Ord('ы'))or(Key = Ord('Ы'))or(Key = Ord('і'))or(Key = Ord('І')))and(ssCtrl in Shift)) then bSaveClick(self);
end;

procedure TfClient.sgQDblClick(Sender: TObject);
begin
 if (bEdit.Enabled = TRUE) then bEditClick(self);
end;

function TfClient.CheckChange: byte;
begin
 Result := 0;
 if (sex <> rgSex.ItemIndex)      then begin Result := 1; exit; end;
 if (fam <> Efam.Text)            then begin Result := 1; exit; end;
 if (name <> Ename.Text)          then begin Result := 1; exit; end;
 if (sname <> Esname.Text)        then begin Result := 1; exit; end;
 if (birthday <> StrToDateTime(Ebdate.Text+' 07:21:00')) then
                                       begin Result := 1; exit; end;
 if (ps <> Eps.Text)              then begin Result := 1; exit; end;
 if (pnum <> Epnum.Text)          then begin Result := 1; exit; end;
 if (pplace <> Epplace.Text)      then begin Result := 1; exit; end;
 if (pdate <> StrToDateTime(Epdate.Text+' 07:21:00')) then
                                       begin Result := 1; exit; end;
 if (pid <> Epid.Text)            then begin Result := 1; exit; end;
 if (street <> Estreet.Text)      then begin Result := 1; exit; end;
 if (home <> Ehome.Text)          then begin Result := 1; exit; end;
 if (kr <> Ekr.Text)              then begin Result := 1; exit; end;
 if (kv <> Ekv.Text)              then begin Result := 1; exit; end;
 if (t_h <> Etel_h.Text)          then begin Result := 1; exit; end;
 if (t_m <> Etel_m.Text)          then begin Result := 1; exit; end;
 if (num <> eNum.Value)           then begin Result := 1; exit; end;
 if (data <> eData.DateTime)      then begin Result := 1; exit; end;
 if (summa <> eSumma.Text)        then begin Result := 1; exit; end;
 if (predop <> ePredop.Text)      then begin Result := 1; exit; end;
 if (prim <> EPrim.Text)          then begin Result := 1; exit; end;
 if (cat <> integer(cbClCat.Items.Objects[cbClCat.ItemIndex])) then begin Result := 1; exit; end;
end;

procedure TfClient.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if (Save = FALSE) then
  if (CheckChange = 1) then
   if (MessageDlg('Сохранить изменения?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
    bSaveClick(self);
end;

procedure TfClient.bDogovorClick(Sender: TObject);
var FileName: OleVariant;
    d,m,y: Word;
begin
 FileName:=GetCurrentDir+'\WorkDir\dogr.dot';
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
    { ПРОЦЕНТЫ ! НЕ В БАЗЕ ! }
    'p','P': Selection.Text := Self.EProc.Text;
    { ДАТА }
    'd','D': begin
              DecodeDate(Now(),y,m,d);
              case Selection.Text[2] of
               'd','D': if (d < 10) then Selection.Text := '0'+IntToStr(d) else Selection.Text := IntToStr(d);
               'y','Y': Selection.Text := IntToStr(y);
               'm','M': case m of
                         1: Selection.Text := 'января';
                         2: Selection.Text := 'февраля';
                         3: Selection.Text := 'марта';
                         4: Selection.Text := 'апреля';
                         5: Selection.Text := 'мая';
                         6: Selection.Text := 'июня';
                         7: Selection.Text := 'июля';
                         8: Selection.Text := 'августа';
                         9: Selection.Text := 'сентября';
                        10: Selection.Text := 'октября';
                        11: Selection.Text := 'ноября';
                        12: Selection.Text := 'декабря';
                       end;
              end;
             end;
    { СУММА ПРОПИСЬЮ }
    'z','Z': Selection.Text := fData.SummToStr(fData.cSelectS('TB_CLIENT',Copy(Selection.Text,2,Length(Selection.Text)),'Where ID='+IntToStr(ID)));
    { ФАМИЛИЯ и ИНИЦИАЛЫ }
    'c','C': Selection.Text := fData.cSelectS('TB_CLIENT','FAM','Where ID='+IntToStr(ID))+' '+fData.cSelectS('TB_CLIENT','NAME','Where ID='+IntToStr(ID))[1]+'. '+fData.cSelectS('TB_CLIENT','SNAME','Where ID='+IntToStr(ID))[1]+'.';
    { ВЫХОД }
    'q','Q': begin
              Selection.Text := '';
              break;
             end;
   end;
   WordA.Selection.NextField();
  end;
  WordA.Selection.Text := '';
 except
  WordA.Disconnect;
  fData.Transaction.Active := FALSE;
  MessageBox(fClient.Handle,'Произошла ошибка! Не удается найти Microsoft Word. Установка этого приложения исправит проблему.'+#10#13+'Или произошла ошибка на уровне Microsoft Word. Закройте MS Word и попробуйте повторить попытку.','Ошибка!',MB_ICONWARNING or MB_OK);
 end;
end;

procedure TfClient.CbdateChange(Sender: TObject);
begin
 Ebdate.Text := DateToStr(Cbdate.Date);
end;

procedure TfClient.CpdateChange(Sender: TObject);
begin
 Epdate.Text := DateToStr(Cpdate.Date);
end;

procedure TfClient.eSummaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if (Key = VK_RETURN) then
//  EProc.Text := FloatToStr( (StrToFloat(ePredop.Text)/StrToFloat(eSumma.Text))*100 );
end;

procedure TfClient.ePredopKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if (Key = VK_RETURN) then
  EProc.Text := FloatToStr( (StrToFloat(ePredop.Text)/StrToFloat(eSumma.Text))*100 );
end;

procedure TfClient.EProcKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if (Key = VK_RETURN) then
  ePredop.Text := FloatToStr( StrToFloat(eSumma.Text)*StrToFloat(EProc.Text)/100 );
end;

procedure TfClient.eSummaChange(Sender: TObject);
begin
 try
  EProc.Text := FloatToStr( (StrToFloat(ePredop.Text)/StrToFloat(eSumma.Text))*100 );
 except
 end;
end;

procedure TfClient.ePredopChange(Sender: TObject);
begin
 try
  EProc.Text := FloatToStr( (StrToFloat(ePredop.Text)/StrToFloat(eSumma.Text))*100 );
 except
 end; 
end;

procedure TfClient.EProcChange(Sender: TObject);
begin
 try
  ePredop.Text := FloatToStr( StrToFloat(eSumma.Text)*StrToFloat(EProc.Text)/100 );
 except
 end;
end;

procedure TfClient.bDTypeClick(Sender: TObject);
begin
 case fData.cSelectI('TB_CLIENT','DTYPE','Where ID='+IntToStr(ID)) of
  0: begin
      fData.cUpdate('TB_CLIENT','DTYPE','1','ID='+IntToStr(ID));
      fData.cUpdate('TB_CLIENT','DOPEN',(''''+DateTimeToStr(eDOpen.DateTime)+''''),'ID='+IntToStr(ID));
      bDType.Caption := 'Открыть';
      bDType.Glyph := nil;
      ImageList.GetBitmap(0,bDType.Glyph);
      LStatus.Caption := 'Закрытый';
      MessageBox(self.Handle,'Договор закрыт.','Выполнено',MB_ICONINFORMATION or MB_OK);
     end;
  1: begin
      fData.cUpdate('TB_CLIENT','DTYPE','0','ID='+IntToStr(ID));
      bDType.Caption := 'Закрыть';
      bDType.Glyph := nil;
      ImageList.GetBitmap(1,bDType.Glyph);
      LStatus.Caption := 'Открытый';
     end;
 end;
end;

end.
