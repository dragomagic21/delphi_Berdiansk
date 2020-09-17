unit uData;

interface

uses
  SysUtils, Classes, IBSQL, IBDatabase, DB, IniFiles, Forms, Dialogs, StdCtrls, Grids,
  OleServer, Word2000, Controls, DateUtils, IBServices, IBSQLMonitor;

type
  TfData = class(TDataModule)
    Database: TIBDatabase;
    Transaction: TIBTransaction;
    SQL: TIBSQL;
    SQL2: TIBSQL;
    Transaction2: TIBTransaction;
    WordA: TWordApplication;
    SQLMon: TIBSQLMonitor;
    procedure DataModuleCreate(Sender: TObject);
    procedure SQLMonSQL(EventText: String; EventTime: TDateTime);
  private
    log: byte;
    load: byte;
    { Private declarations }
  public
    Colorize: byte;
    UserID: integer;
    Admin: byte;
    { Public declarations }
    function cInsert(Table, Records, Values: string): byte;
    function cCount(Table, Records: string; Where: string=''): integer;
    function cSelectS(Table, Records: string; Where: string=''): string;
    function cSelectI(Table, Records: string; Where: string=''): integer;
    function cSelectD(Table, Records: string; Where: string=''): string;
    function cSelectRule(Table: string; Usr, Cat: integer; Rule: string): integer;
    function cUpdate(Table, Records, Values, Where: string): byte;
    function cUpdates(Table: string; Records, Values: TStringList; Where: string): byte;
    function cDelete(Table: string; Where: string=''): byte;
    function cMax(Table, Rec: string; Where: string=''): string;
    function FillLB(ListBox: TListBox;Table, Rec: string; Where: string=''; Order: string=''): byte;
    function FillCB(ComboBox: TComboBox;Table, Rec: string; Where: string=''; Order: string=''): byte;
    function FillCats(ListBox: TListBox): byte;
    function FillCatsC(ComboBox: TComboBox): byte;
    function FillUsers(ListBox: TListBox): byte;
    function FillUsrCb(ComboBox: TComboBox): byte;
    function FillClientC(ComboBox: TComboBox; Where: string=''): byte;
    function FillSgC(sg: TStringGrid; Data: TDateTime; Where: string; Order: string=''): byte;
    function FillSgT(sg: TStringGrid; DtB,DtE: TDateTime; Order: string=''): byte;
    function FillSgQ(sg: TStringGrid; Client: integer): byte;
    function FillSGF(sg: TStringGrid; Where: string): byte;
    function GetQDates(Where: string; var a: array of TDateTime): byte;
    function GetQDays(Month, Year: integer; var a: array of Cardinal): byte;

    function CheckQ(): byte;
    function CreateQ(ID: integer): byte;

    function SummToStr(Summ: string): string;

    function CheckConnect(): byte;

  end;

const
a: array[0..8,0..9] of string=(
('','один ','два ','три ','четыре ','пять ','шесть ','семь ','восемь ','девять '),
('','','двадцать ','тридцать ','сорок ','пятьдесят ','шестьдесят ','семьдесят ','восемьдесят ','девяносто '),
('','сто ','двести ','триста ','четыреста ','пятьсот ','шестьсот ','семьсот ','восемьсот ','девятьсот '),
('тысяч ','одна тысяча ','две тысячи ','три тысячи ','четыре тысячи ','пять тысячь ','шесть тысячь ','семь тысячь ',
'восемь тысячь ','девять тысячь '),
('','','двадцать ','тридцать ','сорок ','пятьдесят ','шестьдесят ','семьдесят ','восемьдесят ','девяносто '),
('','сто ','двести ','триста ','четыреста ','пятьсот ','шестьсот ','семьсот ','восемьсот ','девятьсот '),
('миллионов ','один миллион ','два миллиона ','три миллиона ','четыре миллиона ','пять миллионов ',
'шесть миллионов ','семь миллионов ','восемь миллионов ','девять миллионов '),
('','','двадцать ','тридцать ','сорок ','пятьдесят ','шестьдесят ','семьдесят ','восемьдесят ','девяносто '),
('','сто ','двести ','триста ','четыреста ','пятьсот ','шестьсот ','семьсот ','восемьсот ','девятьсот '));

b: array[0..9] of string=
('десять ','одинадцать ','двенадцать ','тринадцать ','четырнадцать ','пятьнадцать ','шестьнадцать ',
'семьнадцать ','восемьнадцать ','девятьнадцать ');


var
  fData: TfData;

implementation

uses uAudio, uTxt, MMSystem, uMain;

{$R *.dfm}

function TfData.cCount(Table, Records, Where: string): integer;
begin
 try
 if (load = 0) then CheckConnect();
  Transaction.Active := FALSE;
  SQL.Close;
  SQL.SQL.Clear;
  SQL.SQL.Add('Select count('+Trim(Records)+') as CNT from '+Trim(Table)+' '+Trim(Where)+';');
  Transaction.Active := TRUE;
  SQL.ExecQuery;
  Result:=SQL.FieldByName('CNT').AsInteger;
  Transaction.Active := FALSE;
 except
  Transaction.Rollback;
  Transaction.Active := FALSE;
  Result:=0;
 end;
end;

function TfData.cDelete(Table, Where: string): byte;
begin
 try
  CheckConnect();
  Transaction.Active := FALSE;
  SQL.Close;
  SQL.SQL.Clear;
  SQL.SQL.Add('Delete from '+Trim(Table)+' '+Trim(Where)+';');
  Transaction.Active := TRUE;
  SQL.ExecQuery;
  Transaction.Commit;
  Transaction.Active := FALSE;
  Result:=0;
 except
  Transaction.Rollback;
  Transaction.Active := FALSE;
  Result:=1;
 end;
end;

function TfData.CheckQ: byte;
var i,z: integer;
begin
 try
  CheckConnect();
  Transaction2.Active := FALSE;
  SQL2.Close;
  SQL2.SQL.Clear;
  SQL2.SQL.Add('Select ID from TB_QUEST where (((USR=0)or(USR='+IntToStr(UserID)+'))and((OK='+''''+'0'+''''+')or(OK='+''''+'2'+''''+'))and(DATA <= '+''''+DateTimeToStr(Now())+''''+'))');
  Transaction2.Active := TRUE;
  SQL2.ExecQuery();

  while not(SQL2.Eof) do
  begin
   z := 0;
   for i := 0 to Application.ComponentCount-1 do
    if (((Application.Components[i].ClassName = 'TfTxt')or(Application.Components[i].ClassName = 'TfAudio'))and(Application.Components[i].Tag = SQL2.FieldByName('ID').AsInteger)) then
     z := 1;
     if (z = 0) then CreateQ(SQL2.FieldByName('ID').AsInteger);

   SQL2.Next();
  end;

  Transaction2.Active := FALSE;

  Result := 0;
 except
  Transaction2.Rollback;
  Transaction2.Active := FALSE;
  Result := 1;
 end;
end;

function TfData.cInsert(Table, Records, Values: string): byte;
begin
 try
  CheckConnect();
  Transaction.Active := FALSE;
  SQL.Close;
  SQL.SQL.Clear;
  SQL.SQL.Add('Insert into '+Trim(Table)+' ('+Trim(Records)+') values ('+Trim(Values)+');');
  Transaction.Active := TRUE;
  SQL.ExecQuery;
  Transaction.Commit;
  Transaction.Active := FALSE;
  Result:=0;
 except
  Transaction.Rollback;
  Transaction.Active := FALSE;
  Result:=1;
 end;
end;

function TfData.cMax(Table, Rec, Where: string): string;
begin
 try
  CheckConnect();
  Transaction.Active := FALSE;
  SQL.Close;
  SQL.SQL.Clear;
  SQL.SQL.Add('Select MAX ('+Trim(Rec)+') AS REC from '+Trim(Table)+' '+Trim(Where)+';');
  Transaction.Active := TRUE;
  SQL.ExecQuery;
  Result:=SQL.FieldByName('REC').AsString;
  Transaction.Active := FALSE;
 except
  Transaction.Rollback;
  Transaction.Active := FALSE;
  Result:='-1';
 end;
end;

function TfData.CreateQ(ID: integer): byte;
var fT: TfTxt;
    fA: TfAudio;
begin
 try
  CheckConnect();
  sndPlaySound(PChar(ExtractFileDir(Application.ExeName)+'\WorkDir\alarm.wav'), SND_FILENAME or SND_SYNC);
  case cSelectI('TB_QUEST','TP','Where ID='+IntToStr(ID)) of
   0: begin
       fT := TfTxt.Create(Application);
       fT.ID := ID;
       fT.Tag := ID;
       fT.Show();
      end;
   1: begin
       fA := TfAudio.Create(Application);
       fA.ID := ID;
       fA.Tag := ID;
       fA.Show();
      end;
  end;
  Result := 0;
 except
  Result := 1;
 end;
end;

function TfData.cSelectD(Table, Records, Where: string): string;
begin
 try
  CheckConnect();
  Transaction.Active := FALSE;
  SQL.Close;
  SQL.SQL.Clear;
  SQL.SQL.Add('Select '+Trim(Records)+' as REC from '+Trim(Table)+' '+Trim(Where)+';');
  Transaction.Active := TRUE;
  SQL.ExecQuery;
  if (SQL.FieldByName('REC').AsString = '')or(SQL.FieldByName('REC').AsString = '0') then Result := '-1' else
   Result := SQL.FieldByName('REC').AsString;
  Transaction.Active := FALSE;
 except
  Transaction.Rollback;
  Transaction.Active := FALSE;
  Result := '-1';
 end;
end;

function TfData.cSelectI(Table, Records, Where: string): integer;
begin
 try
  CheckConnect();
  Transaction.Active := FALSE;
  SQL.Close;
  SQL.SQL.Clear;
  SQL.SQL.Add('Select '+Trim(Records)+' as REC from '+Trim(Table)+' '+Trim(Where)+';');
  Transaction.Active := TRUE;
  SQL.ExecQuery;
  Result := SQL.FieldByName('REC').AsInteger;
  Transaction.Active := FALSE;
 except
  Transaction.Rollback;
  Transaction.Active := FALSE;
  Result := -1;
 end;
end;

function TfData.cSelectRule(Table: string; Usr, Cat: integer; Rule: string): integer;
begin
 try
  CheckConnect();
  Transaction2.Active := FALSE;
  SQL2.Close;
  SQL2.SQL.Clear;
  SQL2.SQL.Add('Select count (ID) as REC from '+Trim(Table)+' where ((USR='+IntToStr(Usr)+')and(CAT='+IntToStr(Cat)+')and(RULE='+''''+Trim(Rule)+''''+'));');
  Transaction2.Active := TRUE;
  SQL2.ExecQuery;
  if (SQL2.FieldByName('REC').AsInteger = 0) then Result := 0 else Result := 1;
  Transaction2.Active := FALSE;
 except
  Transaction2.Rollback;
  Transaction2.Active := FALSE;
  Result := -1;
 end;
end;

function TfData.cSelectS(Table, Records, Where: string): string;
begin
 try
  CheckConnect();
  Transaction.Active := FALSE;
  SQL.Close;
  SQL.SQL.Clear;
  SQL.SQL.Add('Select '+Trim(Records)+' as REC from '+Trim(Table)+' '+Trim(Where)+';');
  Transaction.Active := TRUE;
  SQL.ExecQuery;
{  if (SQL.FieldByName('REC').AsString = '')or(SQL.FieldByName('REC').AsString = '0') then Result := '-1' else    }
  if (SQL.FieldByName('REC').AsString = '17.11.1858') then Result := '' else
   Result := SQL.FieldByName('REC').AsString;
  Transaction.Active := FALSE;
 except
  Transaction.Rollback;
  Transaction.Active := FALSE;
  Result := '-1';
 end;
end;

function TfData.cUpdate(Table, Records, Values, Where: string): byte;
begin
 try
  CheckConnect();
  Transaction.Active := FALSE;
  SQL.Close;
  SQL.SQL.Clear;
  SQL.SQL.Add('Update '+Trim(Table)+' set '+Trim(Records)+'='+Trim(Values)+' where '+Trim(Where)+';');
  Transaction.Active := TRUE;
  SQL.ExecQuery;
  Transaction.Commit;
  Result := 0;
 except
  Transaction.Rollback;
  Transaction.Active := FALSE;
  Result := 1;
 end;
end;

function TfData.cUpdates(Table: string; Records, Values: TStringList; Where: string): byte;
var str: string;
    i: integer;
begin
 try
  CheckConnect();
  Transaction.Active := FALSE;
  SQL.Close;
  SQL.SQL.Clear;
  str:='';
  for i:=0 to Values.Count-1 do
   str:=str+Records[i]+'='+Values[i]+',';
  delete(str,Length(str),1);
  SQL.SQL.Add('Update '+Trim(Table)+' SET '+str+' where '+where+';');
  Transaction.Active := TRUE;
  SQL.ExecQuery;
  Transaction.Commit;
  Transaction.Active := FALSE;
  Result:=0;
 except
  Transaction.Rollback;
  Transaction.Active := FALSE;
  Result:=1;
 end;
end;

procedure TfData.DataModuleCreate(Sender: TObject);
var f: TIniFile;
    s,n: string;
begin
 try
  load := 1;
  f := TIniFile.Create(ExtractFileDir(Application.ExeName)+'\config.ini');
  log := f.ReadInteger('DataBase','Log',0);
  Database.Params.Clear;
  Colorize := f.ReadInteger('DataBase','Colorize',0);
  s := f.ReadString('DataBase','TP','Loc');
  n := f.ReadString('DataBase',s,ExtractFileDir(Application.ExeName)+'\WorkDir\BASE.FDB');
  if ((n[1]='\')and(n[2]='\')) then delete(n,pos(':',n),1);
  if (s[1] = 'N')and(not FileExists(n)) then
  begin
   s := 'Loc';
   f.WriteString('DataBase','TP','Loc');
   Application.MessageBox('Невозможно подлючится к сетевой базе данных.'+#10#13+'Программа будет работать в локальном режиме.'+#10#13+'Возможно не включен сервер или же на сервере не запущена программа.','Ошибка!');
  end;
  Database.DatabaseName:=f.ReadString('DataBase',s,ExtractFileDir(Application.ExeName)+'\WorkDir\BASE.FDB');
  Database.Params.Add('user_name='+f.ReadString('DataBase','user_name','SYSDBA'));
  Database.Params.Add('password='+f.ReadString('DataBase','password','masterkey'));
  Database.Params.Add('lc_ctype='+f.ReadString('DataBase','lc_ctype','WIN1251'));
  f.Free;
  Database.Open;
  
  { ЕСЛИ НЕТ НИОДНОГО ЮЗЕРА С АДМИН ПРАВАМИ - СОЗДАЕМ ПО УМОЛЧАНИЮ }
  if cCount('TB_USERS','ID','where GOD=1')=0 then
   cInsert('TB_USERS',('LOGIN,PASS,GOD,PRIM'),(''''+'admin'+''''+','+''''+'21071988'+''''+','+''''+'1'+''''+','+''''+'Временный админ :) Кучеренко Вадим Владимирович'+''''));
  load := 0;
 except
  Application.MessageBox('Невозможно подлючится к сетевой базе данных.'+#10#13+'Программа будет работать в локальном режиме.'+#10#13+'Возможно не включен сервер или же на сервере не запущена программа.','Ошибка!');
  f := TIniFile.Create(ExtractFileDir(Application.ExeName)+'\config.ini');
              f.WriteString('DataBase','TP','Loc');
              f.Free;
  Application.Terminate;
 end;
 UserID := -1;
 Admin  := 2;
end;

function TfData.FillCats(ListBox: TListBox): byte;
begin
 try
  CheckConnect();
  ListBox.Clear;
  ListBox.Enabled := TRUE;
  ListBox.Items.Add('Все клиенты');
  ListBox.Items.Objects[0] := Pointer(-2);
  { ЮЗЕР АДМИН - МОЖЕТ ВСЕ :) В ПРЕДЕЛАХ ДОЗВОЛЕННОГО }
  if (Admin = 1) then
  begin
   Transaction.Active := FALSE;
   SQL.Close;
   SQL.SQL.Clear;
   SQL.SQL.Add('Select * from TB_CATS order by LVL;');
   Transaction.Active := TRUE;
   SQL.ExecQuery;
   while not SQL.Eof do
   begin
    ListBox.Items.AddObject(SQL.FieldByName('NAME').AsString,Pointer(SQL.FieldByName('ID').AsInteger));
    SQL.Next;
   end;
   Transaction.Active := FALSE;
  end else
  { ЮЗЕР НЕ АДМИН - ЛОХ. ПРОВЕРЯЕМ МОЖЕТ ЛИ ОН ВИДИТЬ ОПРЕДЕЛЕННУЮ КАТЕГОРИЮ }
  begin
   Transaction.Active := FALSE;
   SQL.Close;
   SQL.SQL.Clear;
   SQL.SQL.Add('Select * from TB_CATS;');
   Transaction.Active := TRUE;
   SQL.ExecQuery;
   while not SQL.Eof do
   begin
    if cSelectRule('TB_RULES',UserID,SQL.FieldByName('ID').AsInteger,'S') = 0 then
     ListBox.Items.AddObject(SQL.FieldByName('NAME').AsString,Pointer(SQL.FieldByName('ID').AsInteger));
    SQL.Next;
   end;
   Transaction.Active := FALSE;
  end;

  if (ListBox.Items.Count = 0) then
  begin
   ListBox.Items.Add('Нет ниодной категории');
   ListBox.Items.Objects[0] := Pointer(integer(-1));
   ListBox.Items.Add('или у Вас недостаточно');
   ListBox.Items.Add('прав!');
   ListBox.Enabled := FALSE;
   Result := 2;
  end else Result := 0;
  ListBox.ItemIndex := 0;
 except
  Transaction.Rollback;
  Transaction.Active := FALSE;
  Result := 1;
 end;
end;

function TfData.FillCatsC(ComboBox: TComboBox): byte;
begin
 try
  CheckConnect();
  ComboBox.Clear;
  ComboBox.Enabled := TRUE;
  { ЮЗЕР АДМИН - МОЖЕТ ВСЕ :) В ПРЕДЕЛАХ ДОЗВОЛЕННОГО }
  if (Admin = 1) then
  begin
   Transaction.Active := FALSE;
   SQL.Close;
   SQL.SQL.Clear;
   SQL.SQL.Add('Select * from TB_CATS order by LVL;');
   Transaction.Active := TRUE;
   SQL.ExecQuery;
   while not SQL.Eof do
   begin
    ComboBox.Items.AddObject(SQL.FieldByName('NAME').AsString,Pointer(SQL.FieldByName('ID').AsInteger));
    SQL.Next;
   end;
   Transaction.Active := FALSE;
  end else
  { ЮЗЕР НЕ АДМИН - ЛОХ. ПРОВЕРЯЕМ МОЖЕТ ЛИ ОН ВИДИТЬ ОПРЕДЕЛЕННУЮ КАТЕГОРИЮ }
  begin
   Transaction.Active := FALSE;
   SQL.Close;
   SQL.SQL.Clear;
   SQL.SQL.Add('Select * from TB_CATS;');
   Transaction.Active := TRUE;
   SQL.ExecQuery;
   while not SQL.Eof do
   begin
    if cSelectRule('TB_RULES',UserID,SQL.FieldByName('ID').AsInteger,'S') = 0 then
     ComboBox.Items.AddObject(SQL.FieldByName('NAME').AsString,Pointer(SQL.FieldByName('ID').AsInteger));
    SQL.Next;
   end;
   Transaction.Active := FALSE;
  end;

  if (ComboBox.Items.Count = 0) then
  begin
   ComboBox.Items.Add('Нет ниодной категории');
   ComboBox.Items.Objects[0] := Pointer(integer(-1));
   ComboBox.Items.Add('или у Вас недостаточно');
   ComboBox.Items.Add('прав!');
   ComboBox.Enabled := FALSE;
   Result := 2;
  end else Result := 0;
  ComboBox.ItemIndex := 0;
 except
  Transaction.Rollback;
  Transaction.Active := FALSE;
  Result := 1;
 end;
end;

function TfData.FillCB(ComboBox: TComboBox; Table, Rec, Where, Order: string): byte;
begin
 try
  CheckConnect();
  ComboBox.Clear;
  ComboBox.Enabled := TRUE;

   Transaction.Active := FALSE;
   SQL.Close;
   SQL.SQL.Clear;
   SQL.SQL.Add('Select ID, '+Trim(Rec)+' AS REC from '+Trim(Table)+' '+Trim(Where)+' '+Trim(Order)+';');
   Transaction.Active := TRUE;
   SQL.ExecQuery;
   while not SQL.Eof do
   begin
    ComboBox.Items.AddObject(SQL.FieldByName('REC').AsString,Pointer(SQL.FieldByName('ID').AsInteger));
    SQL.Next;
   end;
   Transaction.Active := FALSE;

  if (ComboBox.Items.Count = 0) then
  begin
   ComboBox.Items.Add('Пусто :р');
   ComboBox.Items.Objects[0] := Pointer(integer(-1));
   ComboBox.Enabled := FALSE;
   Result := 2;
  end else Result := 0;
  ComboBox.ItemIndex := 0;
 except
  Transaction.Rollback;
  Transaction.Active := FALSE;
  Result := 1;
 end;
end;

function TfData.FillClientC(ComboBox: TComboBox; Where: string): byte;
begin
  try
  CheckConnect();
  ComboBox.Clear;
  ComboBox.Enabled := TRUE;
  { ЮЗЕР АДМИН - МОЖЕТ ВСЕ :) В ПРЕДЕЛАХ ДОЗВОЛЕННОГО }
//  if (Admin = 1) then
//  begin
   Transaction.Active := FALSE;
   SQL.Close;
   SQL.SQL.Clear;
   SQL.SQL.Add('Select ID,FAM,NAME,SNAME from TB_CLIENT '+Trim(Where)+' order by FAM,NAME,SNAME;');
   Transaction.Active := TRUE;
   SQL.ExecQuery;
   while not SQL.Eof do
   begin
    ComboBox.Items.AddObject(SQL.FieldByName('FAM').AsString+' '+SQL.FieldByName('NAME').AsString+' '+SQL.FieldByName('SNAME').AsString,Pointer(SQL.FieldByName('ID').AsInteger));
    SQL.Next;
   end;
   Transaction.Active := FALSE;
//  end else
  { ЮЗЕР НЕ АДМИН - ЛОХ. ПРОВЕРЯЕМ МОЖЕТ ЛИ ОН ВИДИТЬ ОПРЕДЕЛЕННУЮ КАТЕГОРИЮ }
{
  begin
   Transaction.Active := FALSE;
   SQL.Close;
   SQL.SQL.Clear;
   SQL.SQL.Add('Select ID,FAM,NAME,SNAME from TB_CLIENT '+Trim(Where)+' order by FAM,NAME,SNAME;');
   Transaction.Active := TRUE;
   SQL.ExecQuery;
   while not SQL.Eof do
   begin
    if cSelectRule('TB_RULES',UserID,SQL.FieldByName('ID').AsInteger,'S') = 0 then
     ComboBox.Items.AddObject(SQL.FieldByName('NAME').AsString,Pointer(SQL.FieldByName('ID').AsInteger));
    SQL.Next;
   end;
   Transaction.Active := FALSE;
  end;
}
  if (ComboBox.Items.Count = 0) then
  begin
   ComboBox.Items.Add('Пусто :р');
   ComboBox.Items.Objects[0] := Pointer(integer(-1));
   ComboBox.Enabled := FALSE;
   Result := 2;
  end else Result := 0;
  ComboBox.ItemIndex := 0;
 except
  Transaction.Rollback;
  Transaction.Active := FALSE;
  Result := 1;
 end;
end;

function TfData.FillLB(ListBox: TListBox; Table, Rec, Where, Order: string): byte;
begin
 try
   CheckConnect();
  ListBox.Clear;
  ListBox.Enabled := TRUE;
  
   Transaction.Active := FALSE;
   SQL.Close;
   SQL.SQL.Clear;
   SQL.SQL.Add('Select ID, '+Trim(Rec)+' AS REC from '+Trim(Table)+' '+Trim(Where)+' '+Trim(Order)+';');
   Transaction.Active := TRUE;
   SQL.ExecQuery;
   while not SQL.Eof do
   begin
    ListBox.Items.AddObject(SQL.FieldByName('REC').AsString,Pointer(SQL.FieldByName('ID').AsInteger));
    SQL.Next;
   end;
   Transaction.Active := FALSE;

  if (ListBox.Items.Count = 0) then
  begin
   ListBox.Items.Add('Пусто :р');
   ListBox.Items.Objects[0] := Pointer(integer(-1));
   ListBox.Enabled := FALSE;
   Result := 2;
  end else Result := 0;
  ListBox.ItemIndex := 0;
 except
  Transaction.Rollback;
  Transaction.Active := FALSE;
  Result := 1;
 end;
end;

function TfData.FillSgC(sg: TStringGrid; Data: TDateTime; Where,Order: string): byte;
var i,j: integer;
begin
 try
  CheckConnect();
  for i := 0 to sg.ColCount-1 do
   for j := 1 to sg.RowCount-1 do
    sg.Cells[i,j] := '';
  sg.RowCount := 2;
  sg.Enabled := TRUE;

  Transaction.Active := FALSE;
  SQL.Close;
  SQL.SQL.Clear;
  SQL.SQL.Add('Select ID,DATA,FAM,NAME,SNAME,CTYPE from TB_CLIENT '+Trim(Where)+' '+Trim(Order));
  Transaction.Active := TRUE;
  SQL.ExecQuery;
  i := 2;
  while not SQL.Eof do
  begin
   sg.RowCount := i;
   sg.Objects[0,i-1] := Pointer(SQL.FieldByName('ID').AsInteger);
   sg.Cells[0,i-1] := DateToStr(SQL.FieldByName('DATA').AsDateTime);
   case SQL.FieldByName('CTYPE').AsInteger of
    0: sg.Cells[1,i-1] := SQL.FieldByName('FAM').AsString+' '+SQL.FieldByName('NAME').AsString+' '+SQL.FieldByName('SNAME').AsString;
    1: sg.Cells[1,i-1] := SQL.FieldByName('FAM').AsString;
   end; 
//   sg.Cells[4,i-1] := SQL.FieldByName('PRIM').AsString;
   Inc(i);
   SQL.Next;
  end;

  if not((sg.RowCount = 2)and(sg.Cells[0,1]='')) then
  for i := 1 to sg.RowCount-1 do
   if integer(sg.Objects[0,i]) <> 0 then
    if cCount('TB_QUEST','ID','Where ((CLIENT='+IntToStr(integer(sg.Objects[0,i]))+')and(DATA >= '+''''+DateTimeToStr(Data)+''''+'))') > 0 then
    begin
     SQL.Close;
     SQL.SQL.Clear;
     SQL.SQL.Add('Select TB_QUEST.DATA AS DT,TB_QUEST.TEXT AS TXT, TB_QUEST.USR AS USR from TB_QUEST where ((TB_QUEST.DATA >= '+''''+DateTimeToStr(Data)+''''+')and(TB_QUEST.CLIENT='+IntToStr(integer(sg.Objects[0,i]))+')) order by TB_QUEST.DATA');
     Transaction.Active := TRUE;
     SQL.ExecQuery;
     sg.Cells[2,i] := DateTimeToStr(SQL.FieldByName('DT').AsDateTime)+' '+SQL.FieldByName('TXT').AsString;
     sg.Objects[3,i] := Pointer(SQL.FieldByName('USR').AsInteger);
     Transaction.Active := FALSE;
     if (integer(sg.Objects[3,i]) = 0) then sg.Cells[3,i] := 'Все сотрудники' else sg.Cells[3,i] := cSelectS('TB_USERS','PRIM','Where ID='+IntToStr(integer(sg.Objects[3,i])));
    end;

  Transaction.Active := FALSE;

  if ((sg.RowCount = 2)and(sg.Cells[0,1]='')) then Result := 2 else Result := 0;
 except
  Transaction.Rollback;
  Transaction.Active := FALSE;
  Result := 1;
 end;
end;

function TfData.FillSGF(sg: TStringGrid; Where: string): byte;
var i,j: integer;
begin
 try
  CheckConnect();
  sg.Cells[0,0] := 'Тип'; sg.Cells[1,0] := 'Клиент'; sg.Cells[2,0] := 'Напоминание'; sg.Cells[3,0] := 'Назначил'; sg.Cells[4,0] := 'Ответственный';
  for i := 0 to sg.ColCount-1 do
   for j := 1 to sg.RowCount-1 do
    sg.Cells[i,j] := '';
  sg.RowCount := 2;
  sg.Enabled := TRUE;

  Transaction.Active := FALSE;
  SQL.Close;
  SQL.SQL.Clear;
  SQL.SQL.Add('Select TB_CLIENT.ID AS ID,TB_CLIENT.FAM AS FAM,TB_CLIENT.NAME AS NAME,TB_CLIENT.SNAME AS SNAME,TB_CLIENT.CTYPE,TB_CATS.NAME AS CN, TB_QUEST.ID AS QID, TB_QUEST.TEXT AS TXT, TB_QUEST.DIREC, TB_QUEST.USR from TB_CLIENT,TB_QUEST,TB_CATS '+Trim(Where)+'and(TB_QUEST.CLIENT=TB_CLIENT.ID)and(TB_CATS.ID=TB_CLIENT.CAT) ');
  Transaction.Active := TRUE;
  SQL.ExecQuery;
  i := 2;
  while not SQL.Eof do
  begin
   sg.RowCount := i;
   sg.Objects[0,i-1] := Pointer(SQL.FieldByName('ID').AsInteger);
   sg.Cells[0,i-1] := SQL.FieldByName('CN').AsString;
   case SQL.FieldByName('CTYPE').AsInteger of
    0: sg.Cells[1,i-1] := SQL.FieldByName('FAM').AsString+' '+SQL.FieldByName('NAME').AsString+' '+SQL.FieldByName('SNAME').AsString;
    1: sg.Cells[1,i-1] := SQL.FieldByName('FAM').AsString;
   end;
   sg.Objects[2,i-1] := Pointer(SQL.FieldByName('QID').AsInteger);
   sg.Cells[2,i-1] := SQL.FieldByName('TXT').AsString;
   sg.Objects[3,i-1] := Pointer(SQL.FieldByName('DIREC').AsInteger);
   sg.Objects[4,i-1] := Pointer(SQL.FieldByName('USR').AsInteger);
   Inc(i);
   SQL.Next;
  end;

  if ((sg.RowCount > 1)and(sg.Cells[0,1] <> '')) then
  for i := 1 to sg.RowCount-1 do
  begin
   sg.Cells[3,i] := cSelectS('TB_USERS','PRIM','Where ID='+IntToStr(integer(sg.Objects[3,i])));
   sg.Cells[4,i] := cSelectS('TB_USERS','PRIM','Where ID='+IntToStr(integer(sg.Objects[3,i])));
  end;

  Transaction.Active := FALSE;

  if ((sg.RowCount = 2)and(sg.Cells[0,1]='')) then Result := 2 else Result := 0;
 except
  Transaction.Rollback;
  Transaction.Active := FALSE;
  Result := 1;
 end;

end;

function TfData.FillSgQ(sg: TStringGrid; Client: integer): byte;
var i,j: integer;
begin
 try
 CheckConnect();
  for i := 0 to sg.ColCount-1 do
   for j := 1 to sg.RowCount-1 do
    sg.Cells[i,j] := '';
  sg.RowCount := 2;
  sg.Enabled := TRUE;

  Transaction.Active := FALSE;
  SQL.Close;
  SQL.SQL.Clear;
  SQL.SQL.Add('Select TB_QUEST.ID, TB_QUEST.DATA, TB_QUEST.TEXT, TB_QUEST.LOG, TB_QUEST.USR from TB_QUEST where ((TB_QUEST.CLIENT='+IntToStr(Client)+')) order by DATA');
  Transaction.Active := TRUE;
  SQL.ExecQuery;
  i := 2;
  while not SQL.Eof do
  begin
   sg.RowCount := i;
   sg.Objects[0,i-1] := Pointer(SQL.FieldByName('ID').AsInteger);
   sg.Cells[0,i-1] := DateToStr(SQL.FieldByName('DATA').AsDateTime);
   sg.Cells[1,i-1] := SQL.FieldByName('TEXT').AsString;
   sg.Objects[2,i-1] := Pointer(SQL.FieldByName('USR').AsInteger);
   sg.Cells[3,i-1] := SQL.FieldByName('LOG').AsString;
   Inc(i);
   SQL.Next;
  end;

  Transaction.Active := FALSE;

  if not((sg.RowCount = 2)and(sg.Cells[0,1]='')) then
   for i := 1 to sg.RowCount-1 do
    if (integer(sg.Objects[2,i]) = 0) then sg.Cells[2,i] := 'Все сотрудники' else sg.Cells[2,i] := cSelectS('TB_USERS','PRIM','Where ID='+IntToStr(integer(sg.Objects[2,i])));

  if ((sg.RowCount = 2)and(sg.Cells[0,1]='')) then Result := 2 else Result := 0;
 except
  Transaction.Rollback;
  Transaction.Active := FALSE;
  Result := 1;
 end;
end;

function TfData.FillSgT(sg: TStringGrid; DtB, DtE: TDateTime; Order: string): byte;
var i,j: integer; db,de: string;
begin
 try
  CheckConnect();
  for i:= 1 to sg.RowCount-1 do
   for j := 0 to sg.ColCount-1 do
    sg.Cells[j,i] := '';
  sg.RowCount := 2;
  sg.Enabled := TRUE;

  db := DateToStr(DtB)+' 00:00:00';
  de := DateToStr(DtE)+' 23:59:59';
  Transaction.Active := FALSE;
  SQL.Close;
  SQL.SQL.Clear;
  SQL.SQL.Add('Select TB_CLIENT.ID, TB_CLIENT.FAM, TB_CLIENT.NAME,  TB_CLIENT.SNAME, TB_CLIENT.CTYPE, TB_CLIENT.DATA, TB_CLIENT.PRIM, TB_QUEST.ID AS QID,TB_QUEST.DATA AS QDATA, TB_QUEST.TEXT AS QT, TB_QUEST.USR AS QU, TB_QUEST.USR AS USR from TB_CLIENT,TB_QUEST');
  SQL.SQL.Add('where ((TB_CLIENT.ID=TB_QUEST.CLIENT)and(TB_QUEST.DATA>='+''''+db+''''+')and(TB_QUEST.DATA<='+''''+de+''''+'))');
  Transaction.Active := TRUE;
  SQL.ExecQuery;

  i := 2;
  while not (SQL.Eof) do
  begin
   sg.RowCount := i;
   sg.Objects[0,i-1] := Pointer(SQL.FieldByName('ID').AsInteger);
   sg.Cells[0,i-1] := SQL.FieldByName('DATA').AsString;
   case SQL.FieldByName('CTYPE').AsInteger of
    0: sg.Cells[1,i-1] := SQL.FieldByName('FAM').AsString+' '+SQL.FieldByName('NAME').AsString+' '+SQL.FieldByName('SNAME').AsString;
    1: sg.Cells[1,i-1] := SQL.FieldByName('FAM').AsString;
   end;
   sg.Objects[2,i-1] := Pointer(SQL.FieldByName('QID').AsInteger);
   sg.Cells[2,i-1] := SQL.FieldByName('QDATA').AsString+' '+SQL.FieldByName('QT').AsString;
   sg.Objects[3,i-1] := Pointer(SQL.FieldByName('USR').AsInteger);
   sg.Cells[4,i-1] := SQL.FieldByName('PRIM').AsString;
   Inc(i);
   SQL.Next();
  end;

  if not((sg.RowCount = 2)and(sg.Cells[0,1]='')) then
   for i := 1 to sg.RowCount-1 do
    if (integer(sg.Objects[3,i]) = 0) then sg.Cells[3,i] := 'Все сотрудники' else sg.Cells[3,i] := cSelectS('TB_USERS','PRIM','Where ID='+IntToStr(integer(sg.Objects[3,i])));

  if ((sg.RowCount = 2)and(sg.Cells[0,1] = '')) then
  begin
   sg.Enabled := FALSE;
   Result := 2;
  end else  Result := 0;
 except
  Transaction.Rollback;
  Transaction.Active := FALSE;
  Result := 1;
 end;
end;

function TfData.FillUsers(ListBox: TListBox): byte;
begin
 try
  CheckConnect();
  ListBox.Clear;
  ListBox.Enabled := TRUE;
  { ЮЗЕР АДМИН - МОЖЕТ ВСЕ :) В ПРЕДЕЛАХ ДОЗВОЛЕННОГО }
  if (Admin = 1) then
  begin
   Transaction.Active := FALSE;
   SQL.Close;
   SQL.SQL.Clear;
   SQL.SQL.Add('Select ID, LOGIN from TB_USERS;');
   Transaction.Active := TRUE;
   SQL.ExecQuery;
   while not SQL.Eof do
   begin
    ListBox.Items.AddObject(SQL.FieldByName('LOGIN').AsString,Pointer(SQL.FieldByName('ID').AsInteger));
    SQL.Next;
   end;
  end;
   Transaction.Active := FALSE;
  if (ListBox.Items.Count = 0) then
  begin
   ListBox.Items.Add('Нет пользователей!');
   ListBox.Enabled := FALSE;
   Result := 2;
  end else Result := 0;
  ListBox.ItemIndex := 0;
 except
  Transaction.Rollback;
  Transaction.Active := FALSE;
  Result := 1;
 end;
end;

function TfData.FillUsrCb(ComboBox: TComboBox): byte;
begin
 try
  CheckConnect();
  ComboBox.Clear;
  ComboBox.Items.Add('Все сотрудники');
  ComboBox.Enabled := TRUE;
  { ЮЗЕР АДМИН - МОЖЕТ ВСЕ :) В ПРЕДЕЛАХ ДОЗВОЛЕННОГО }
//  if (Admin = 1) then
  begin
   Transaction.Active := FALSE;
   SQL.Close;
   SQL.SQL.Clear;
   SQL.SQL.Add('Select ID, PRIM from TB_USERS;');
   Transaction.Active := TRUE;
   SQL.ExecQuery;
   while not SQL.Eof do
   begin
    ComboBox.Items.AddObject(SQL.FieldByName('PRIM').AsString,Pointer(SQL.FieldByName('ID').AsInteger));
    SQL.Next;
   end;
  end;
   Transaction.Active := FALSE;
  Result := 0;
  ComboBox.ItemIndex := 0;
 except
  Transaction.Rollback;
  Transaction.Active := FALSE;
  Result := 1;
 end;
end;

function TfData.GetQDates(Where: string; var a: array of TDateTime): byte;
var i: integer;
begin
 try
 CheckConnect();
 //  SetLength(a, 0);
  Transaction.Active := FALSE;
  SQL.Close;
  SQL.SQL.Clear;
  SQL.SQL.Add('Select DATA from TB_QUEST '+Trim(Where)+' order by DATA');
  Transaction.Active := TRUE;
  SQL.ExecQuery();

  i := 0;
  while not(SQL.Eof) do
  begin
//   SetLength(a, Length(a)+1);
   a[i] := SQL.FieldByName('DATA').AsDateTime;
   Inc(i);
   SQL.Next();
  end;

  Transaction.Active := FALSE;

  Result := 0;
 except
  Transaction.Active := FALSE;
  Result := 1;
 end;
end;

function TfData.GetQDays(Month, Year: integer; var a: array of Cardinal): byte;
var i: integer;
    y,m,d: Word;
    s,dd: string;
begin
 try
  CheckConnect();
  if (Month < 10) then s := '0'+IntToStr(Month) else s := IntToStr(Month);
  dd := IntToStr(DaysInAMonth(Year,Month)); if (Length(dd) = 1) then dd := '0'+dd;
  Transaction.Active := FALSE;
  SQL.Close;
  SQL.SQL.Clear;
  SQL.SQL.Add('Select DATA from TB_QUEST where ((DATA >= '+''''+'01.'+s+'.'+IntToStr(Year)+''''+')and(DATA <= '+''''+dd+'.'+s+'.'+IntToStr(Year)+''''+')) order by DATA');
  Transaction.Active := TRUE;
  SQL.ExecQuery();

  i := 0;
  while not(SQL.Eof) do
  begin
   DecodeDate(SQL.FieldByName('DATA').AsDateTime,y,m,d);
   a[i] := d;
   Inc(i);
   SQL.Next();
  end;

  Transaction.Active := FALSE;

  Result := 0;
 except
  Transaction.Active := FALSE;
  Result := 1;
 end;
end;

function TfData.SummToStr(Summ: string): string;
var
  s, t: string;
  p, pp, i, k: integer;
begin
  s:=Summ;
  if s='0' then
    t:='Ноль '
  else
  begin
    p:=length(s);
    pp:=p;
    if p>1 then
      if (s[p-1]='1') and (s[p]>'0') then
      begin
        t:=b[strtoint(s[p])];
        pp:=pp-2;
      end;
    i:=pp;
    while i>0 do
    begin
      if (i=p-3) and (p>4) then
        if s[p-4]='1' then
        begin
          t:=b[strtoint(s[p-3])]+'тысяч '+t;
          i:=i-2;
        end;
      if (i=p-6) and (p>7) then
        if s[p-7]='1' then
        begin
          t:=b[strtoint(s[p-6])]+'миллионов '+t;
          i:=i-2;
        end;
      if i>0 then
      begin
        k:=strtoint(s[i]);
        t:=a[p-i,k]+t;
        i:=i-1;
      end;
    end;
  end;
  result:=t;
end;

procedure TfData.SQLMonSQL(EventText: String; EventTime: TDateTime);
var s: TStringList;
begin
// CheckConnect();
// zapis log faila
 if (log = 1) then
 begin
  s := TStringList.Create;
  s.Clear;
  if FileExists(ExtractFileDir(Application.ExeName)+'\log.txt') then
   s.LoadFromFile(ExtractFileDir(Application.ExeName)+'\log.txt');
  s.Add(DateTimeToStr(EventTime)+' '+EventText);
  s.SaveToFile(ExtractFileDir(Application.ExeName)+'\log.txt');
  s.Free;
 end;
end;

function TfData.CheckConnect: byte;
var f: TIniFile;
    s: string;
begin
 Result := 0;
 if (load = 1) then exit;
// ne propala li set'
 s := Database.DatabaseName;
 if ((s[1] = '\')and(s[2] = '\')) then delete(s,pos(':',s),1);
 if ((s[1] = '\')and(s[2] = '\')) then
  if not(FileExists(s)) then
  case MessageDlg('Невозможно подключиться к сетевой БД!'+#10#13+'Перейти в режим работы с локальной БД?',mtWarning,[mbOK,mbRetry,mbCancel],0) of
       mrOk: begin
              Result := 1;
              fMain.Timer.Enabled := FALSE;
              fMain.TmQuest.Enabled := FALSE;
              f := TIniFile.Create(ExtractFileDir(Application.ExeName)+'\config.ini');
              f.WriteString('DataBase','TP','Loc');
              f.Free;
              Application.MessageBox('Невозможно подлючится к сетевой базе данных.'+#10#13+'Программа будет работать в локальном режиме.'+#10#13+'Возможно не включен сервер или же на сервере не запущена программа.','Ошибка!');
              Application.Terminate;
             end;
    mrRetry: CheckConnect();
   mrCancel: Application.Terminate;
  end else
   begin
    fMain.Timer.Enabled := TRUE;
    fMain.TmQuest.Enabled := TRUE;
   end;
end;

end.
