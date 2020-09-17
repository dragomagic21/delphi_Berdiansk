unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, jpeg, ExtCtrls;

type
  TfLogin = class(TForm)
    LPresent: TLabel;
    LLogin: TLabel;
    LPass: TLabel;
    EPass: TEdit;
    bCancel: TSpeedButton;
    bLogin: TSpeedButton;
    ELogin: TComboBox;
    ELog: TMemo;
    Image1: TImage;
    procedure bCancelClick(Sender: TObject);
    procedure bLoginClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EPassKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure CreateParams(var Params: TCreateParams); override;
  public
    { Public declarations }
  end;

var
  fLogin: TfLogin;

implementation

uses uData, uMain;

{$R *.dfm}

procedure TfLogin.bCancelClick(Sender: TObject);
begin
 Application.Terminate();
end;

procedure TfLogin.bLoginClick(Sender: TObject);
var i, c: integer;
begin
 { ЗАПОМИНАЕМ ВВЕДЕННЫЙ ЛОГИН }
 c := 0;
 for i := 0 to ELog.Lines.Count-1 do
  if (Trim(ELogin.Text) = Trim(ELog.Lines[i])) then
  begin
   c := 1;
   break;
  end;
 if (c = 0) then
 begin
  ELog.Lines.Add(ELogin.Text);
  ELog.Lines.SaveToFile(ExtractFileDir(Application.ExeName)+'\login.log');
 end;

 { ПРОВЕРКА ЛОГИНА\ПАРОЛЯ }
 i := StrToInt(fData.cSelectS('TB_USERS','ID','where (LOGIN='+''''+Trim(ELogin.Text)+''''+')and(PASS='+''''+Trim(EPass.Text)+''''+')'));
 if ((i = -1)or(i = 0)) then
  MessageBox(fLogin.Handle,'Неправельный логин/пароль!','Ошибка!',MB_ICONWARNING or MB_OK) else
  begin
   fData.UserID := i;
   fData.Admin := StrToInt(fData.cSelectS('TB_USERS','GOD','where ID='+IntToStr(i)));
   fMain.TUser.Caption := fData.cSelectS('TB_USERS','PRIM','Where ID='+IntToStr(i));
   fMain.Mode := 1;
   fMain.Refr();
   fLogin.Close();
  end;
end;

procedure TfLogin.CreateParams(var Params: TCreateParams);
begin
inherited CreateParams(Params);
with params do
   ExStyle := ExStyle or WS_EX_APPWINDOW;
end;

procedure TfLogin.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if (Key = VK_RETURN) then bLoginClick(self);
 if (Key = VK_ESCAPE) then bCancelClick(self);
end;

procedure TfLogin.EPassKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if (Key = VK_RETURN) then bLoginClick(self);
end;

procedure TfLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TfLogin.FormCreate(Sender: TObject);
var i: integer;
begin
 ELogin.Clear;
 ELog.Lines.LoadFromFile(ExtractFileDir(Application.ExeName)+'\login.log');
 for i := 0 to ELog.Lines.Count-1 do
  ELogin.Items.Add(Trim(ELog.Lines[i]));
 if (ELogin.Items.Count > 0) then ELogin.ItemIndex := 0;
end;

procedure TfLogin.FormShow(Sender: TObject);
var d,m,y: Word;
begin
 DecodeDate(Now(),y,m,d);
 if ((d = 31)and(m = 12)) then
 begin
  MessageBox(fLogin.Handle,PChar('Кто ж работает 31 декабря?! С наступающим! Удачно встретить Новый '+IntToStr(y+1)+' Год! :)'),'С Новым Годом!',MB_ICONINFORMATION or MB_OK);
  Image1.Enabled := TRUE;
  Image1.Visible := TRUE;
 end;
end;

end.
