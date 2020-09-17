object fData: TfData
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 192
  Top = 110
  Height = 150
  Width = 215
  object Database: TIBDatabase
    DatabaseName = 'localhost:\\Sekretar\D:\Office program\WorkDir\BASE.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = [tfQExecute, tfError, tfConnect, tfTransact]
    Left = 16
    Top = 8
  end
  object Transaction: TIBTransaction
    Active = False
    DefaultDatabase = Database
    DefaultAction = TACommitRetaining
    AutoStopAction = saNone
    Left = 72
    Top = 8
  end
  object SQL: TIBSQL
    Database = Database
    ParamCheck = True
    Transaction = Transaction
    Left = 136
    Top = 8
  end
  object SQL2: TIBSQL
    Database = Database
    ParamCheck = True
    Transaction = Transaction2
    Left = 128
    Top = 64
  end
  object Transaction2: TIBTransaction
    Active = False
    DefaultDatabase = Database
    DefaultAction = TACommitRetaining
    AutoStopAction = saNone
    Left = 72
    Top = 64
  end
  object WordA: TWordApplication
    AutoConnect = False
    ConnectKind = ckNewInstance
    AutoQuit = False
    Left = 16
    Top = 64
  end
  object SQLMon: TIBSQLMonitor
    OnSQL = SQLMonSQL
    TraceFlags = [tfQPrepare, tfQExecute, tfQFetch, tfError, tfStmt, tfConnect, tfTransact, tfBlob, tfService, tfMisc]
    Left = 168
    Top = 64
  end
end
