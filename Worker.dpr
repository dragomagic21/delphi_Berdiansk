program Worker;

uses
  Forms,
  uMain in 'uMain.pas' {fMain},
  uData in 'uData.pas' {fData: TDataModule},
  uLogin in 'uLogin.pas' {fLogin},
  uClient in 'uClient.pas' {fClient},
  uQuest in 'uQuest.pas' {fQuest},
  uTxt in 'uTxt.pas' {fTxt},
  uAudio in 'uAudio.pas' {fAudio},
  uFind in 'uFind.pas' {fFind},
  uSplash in 'uSplash.pas' {fSplash},
  uClientU in 'uClientU.pas' {fClientU};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Clientoffice';

  fSplash := TfSplash.Create(Application);
  fSplash.Show;

  fSplash.Update;
  while fSplash.Timer1.Enabled do
    Application.ProcessMessages;

  fSplash.Hide;
  fSplash.Free;
  Application.CreateForm(TfData, fData);
  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TfLogin, fLogin);
  Application.Run;
end.
