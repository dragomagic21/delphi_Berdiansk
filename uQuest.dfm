object fQuest: TfQuest
  Left = 306
  Top = 157
  Width = 340
  Height = 507
  Caption = #1047#1072#1076#1072#1095#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    332
    480)
  PixelsPerInch = 96
  TextHeight = 13
  object LClient: TLabel
    Left = 8
    Top = 8
    Width = 55
    Height = 13
    Caption = 'Client F.I.O.'
  end
  object Label2: TLabel
    Left = 8
    Top = 40
    Width = 108
    Height = 13
    Caption = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1079#1072#1076#1072#1095#1080
  end
  object Bevel1: TBevel
    Left = 8
    Top = 32
    Width = 320
    Height = 17
    Anchors = [akLeft, akTop, akRight]
    Shape = bsTopLine
  end
  object Label3: TLabel
    Left = 176
    Top = 40
    Width = 79
    Height = 13
    Caption = #1054#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081
  end
  object bSave: TSpeedButton
    Left = 5
    Top = 310
    Width = 100
    Height = 30
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Glyph.Data = {
      52040000424D5204000000000000120200002800000018000000180000000100
      08000000000040020000120B0000120B0000770000007700000000000000FFFF
      FF00F6F6F600F2F2F200EFEFEF00EDEDED00ECECEC00EBEBEB00E9E9E900E8E8
      E800E7E7E700E6E6E600E5E5E500E3E3E300E0E0E000DFDFDF00DDDDDD00DBDB
      DB00DADADA00D9D9D900D7D7D700D6D6D600D4D4D400D3D3D300D1D1D100CECE
      CE00CCCCCC00CBCBCB00C5C5C500C3C3C300C0C0C000BDBDBD00B6B6B600B3B3
      B300B2B2B200B1B1B100ACACAC00A8A8A8009595950093939300929292008E8E
      8E008D8D8D008B8B8B008888880087878700868686007F7F7F007C7C7C007A7A
      7A00787878007777770076767600757575007373730072727200717171006F6F
      6F006E6E6E006D6D6D006B6B6B006A6A6A006868680066666600636363006161
      6100606060005F5F5F005E5E5E005C5C5C005B5B5B005A5A5A00595959005858
      58005757570055555500545454005353530052525200505050004F4F4F004E4E
      4E004C4C4C004B4B4B004A4A4A00494949004747470046464600454545004343
      430042424200414141003F3F3F003E3E3E003D3D3D003C3C3C003B3B3B003A3A
      3A00393939003838380037373700363636003535350032323200313131002F2F
      2F002E2E2E002D2D2D0029292900252525002424240021212100202020001D1D
      1D001B1B1B00141414000606060001010100FFFFFF0076767676767676767676
      7676767676767676767676767676767676767676767676767676767676767676
      76767676767676767676767676767676764E7676767676767676767676767676
      7676767676767676485F00767676767676767676767676767676767676767661
      47717275767676767676767676767676767676767676763C6F706A3274007676
      76767676767676767676767676763C6D6E670101017100767676767676767676
      76767676763C6C6C651B3E0101016D007676767676767676767676763C6B6B6B
      161819260101016200767676767676767676763C686868101315161827090101
      1B0076767676767676763F6466660C0D0F101314172329010102730076767676
      76425462626158080B0D0E101214163B01012060007676766A3C5D5E5E5E5C54
      07080B0D0E1013142C015B66667676763D595A35392A5B5C502105080B0D0E10
      112E62626376763C56573136311A1D59594B4C0406080A0D1C5C5D5E76767653
      542F33381A1A1A1A3B574D480304060E595A5B767676767667302E1A1A1A1A1A
      1A2D555243131E56565876767676767676761A1A1A1A1A1A1A40285252445353
      54767676767676767676761A1A1A1A1A2B3E491F4F4F50517676767676767676
      76767676241A1A25374B1A344C4D4D7676767676767676767676767676761A69
      3A1A2649494A76767676767676767676767676767676761C1A22454546767676
      767676767676767676767676767676763B414242767676767676767676767676
      76767676767676767642767676767676767676767676}
    Margin = 5
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    OnClick = bSaveClick
  end
  object bClose: TSpeedButton
    Left = 230
    Top = 310
    Width = 100
    Height = 30
    Caption = #1047#1072#1082#1088#1099#1090#1100
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Glyph.Data = {
      B6050000424DB605000000000000760300002800000018000000180000000100
      08000000000040020000120B0000120B0000D0000000D000000000000000FFFF
      FF0001004E000604A0000605A10006009E000600970006009400060092000500
      8F0006008C000600850004008000030074000300680003004A0006029F00005C
      F300005BF200005BF100015DF300025DF300045EF300055FF300065FF3000961
      F3003A81F7004387F7004588F700488AF700498BF7004E8EF8004F8FF8005090
      F8005190F8005191F8005291F8005392F800005BF3000059F100005AF1000058
      EF000059EF000057EE000057ED000055EC000056EC000054EB000053EA000052
      E9000053E9000052E8000045C2000155EB00014CCF000148CA000258EE00035D
      F300034AC500045DF300085EF300085FF3000860F3000960F3000A61F4000C61
      F4000A50CC000D62F4000D63F4000E62F4000E63F4001064F4001164F4001165
      F4001265F4001365F4001466F4001363F2001567F4001257D0001668F4001357
      D1001765F1001868F4001559D1001969F4001A6AF5001C6BF5001D6CF5001D6D
      F5001E6DF5001F6DF5001F6CF400216FF500236FF5001E5ED1002471F5002571
      F5002673F5002773F5002873F6002971F5002A74F6002B75F6002563D1002D77
      F6002663D1002E77F6002257B6002F78F6002F79F600317AF6002559B600337B
      F600357DF700367DF700357CF600377EF700387FF700387DF600397FF7002A5D
      B600326CD2003B81F7003C82F7003D82F7003E82F7003E83F7003F83F7004084
      F7004184F7004185F7004285F7004386F7004587F7004688F7004787F7004789
      F7004076D3004077D3004C8CF7004D8DF800508CF5005491F8005C94F7006D9F
      F80073A2F8007EABF9007FAAF8008CB3FA000051E7000050E600002D8300014F
      E5000252E700024FE6000251E600024FE50003389B000546C7001250CA00165C
      E700226BF300256DF3003677F3002D64CC003873EB00457EF1007AA5F8007EA9
      F900F2F6FE000244DA001C5BE600306AEA003A6FE600457AEC005184F1005483
      EE005686F100628FF1007099F30085A9F3008FB0F7007B8FB900BFD2FB00D6E2
      FC001D59E3003168E8003E70E7004778EA006289EC00698FED006081CE007396
      EE007E9FF10082A1F000E7EEFE00063FD400164BD800022DB000021E8900021A
      85000422BC000316820002117700060FA900060CA700FFFFFF00CFCFCFCFCFCF
      CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCF
      CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCF0F0B05050505070BCFCFCFCFCFCF
      CFCFCFCFCFCFCFCF0E050505050505050505050ACFCFCFCFCFCFCFCFCFCFCF06
      050503C6B1C2C3C1AECA0505050DCFCFCFCFCFCFCFCF0505CDA7B0B230339697
      BBBFBEBA050508CFCFCFCFCFCF06053CA327292B2E2D303196979DBDBC030502
      CFCFCFCF0905433F171412282A2B2C2D2F32969699ACCE05CFCFCFCF05504E48
      45400115262827292CB4AA3031969C050CCFCFCF055A56534C0101013D3B1113
      B90101012D30319A04CFCFCC625E5D590101010101653FC4010101015C2C2D35
      10CFCFCB69666360A8B8010101010101010101A21327292BC7CFCFC96F6D6966
      6492B601010101010101A43E1611122837CFCFC87572716E6B67773801010101
      014D4B474419183936CFCFCF6C1A7673716F6D0101010101010156534C494641
      9FCFCFCF70817F7B787E0101010101010101015856554E4AC5CFCFCFA51C8582
      9301010101B574B701010101955B5751CFCFCFCFCF791E87AD010101A6907594
      C0010101B3615EA0CFCFCFCFCFAB208C1EAF019B8F7F7C78919B01A96B675FCF
      CFCFCFCFCFCFA123208D8E1D1C1B83807D7C88727168CFCFCFCFCFCFCFCFCF33
      8A24211F8C1E898684817F7B6ACFCFCFCFCFCFCFCFCFCFCFCF528B2522208D1E
      891C7A34CFCFCFCFCFCFCFCFCFCFCFCFCFCFCF983A4F54429ECFCFCFCFCFCFCF
      CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCF}
    Margin = 5
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    OnClick = bCloseClick
  end
  object bStand: TSpeedButton
    Left = 304
    Top = 115
    Width = 23
    Height = 22
    Flat = True
    Glyph.Data = {
      BA020000424DBA02000000000000BA0100002800000010000000100000000100
      08000000000000010000120B0000120B0000610000006100000000000000FFFF
      FF00A1E2C400B7ECD300BEF0D900C2EDD900C3ECD900C5EDDA00CDF5E20072CC
      A50081D8B2007CCFAB008FD8B80099E1C10097DABD0084B9A200ACE3CB00ADE3
      CB00BAE6D300C0ECD9003CB684003FB7850042BD8A0046BE8D005AC8990057C1
      94005AC2960063CB9F006ED0A60084D7B40092BDAB00B9E6D30027A1720028A2
      73002DA778002EAA78002FAB7A002FAA79002EA6780031B07D0031B07E0030AB
      7B0035B682003CB8860050A886005DA388005C98810069AA910070B1970077B7
      9D007BB79F0080B09D0088B6A4001E93680022996D0021946A0023996D00249C
      6F00259A6E0027A07200279C710029A174003BA880003B9C790040A580004698
      7A00529C800061AB9000399B78003FA17E003F9D7C00398E700044A38200419A
      7B0046A08100639E89006DA28F0045987D0077A79700749288007C958D00879C
      9500869B94008D9F9900CBD1CF00319274007591890077938B0077918A00869C
      9600BFC7C500FEFEFE00FDFDFD00FBFBFB00EFEFEF00EAEAEA00FFFFFF006060
      6060606060606060606060606060606060606060605759606060606060606060
      60606060564A4952606060606060606060606050483537465360606060606060
      606058453936383C3F52606060606060604F3E2220213D3B2640516060606060
      5A55443A242325292C434D5460606060606060472A27282B2E60606060606060
      60606041161514174B606060606060606060604218191A1B4C60606060606060
      6060602D1C090B1D4E606060606060606060602F0A0C0E023360606060606060
      606060300D111003346060606060606060606032040706081E60606060606060
      6060603105121F130F606060606060606060606060606060606060606060}
    OnClick = bStandClick
  end
  object SpeedButton1: TSpeedButton
    Left = 120
    Top = 310
    Width = 100
    Height = 30
    Caption = #1069#1082#1089#1087#1086#1088#1090
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Glyph.Data = {
      0A050000424D0A05000000000000CA0200002800000018000000180000000100
      08000000000040020000120B0000120B0000A5000000A500000000000000FFFF
      FF007697730077987400BAC8B900C1CFC0006889660075967300AEC1AD009CAB
      9B004C724D00366F3B0075977900618566005C8B67005F916D00228148001976
      3F0059AB7D005D977700E2FBEE00167B4900187E4B00BDEDD600D2F5E400D6F4
      E500E0FBEE00DCF7EA00E0F9ED00055A33006FCBA10077CFA70096DDBC009BDF
      C0009DDFC0009EDFC1009EDDC000A4DFC400ADE4CB00B6E8D100B6E7D000BCEB
      D500BEEDD700C3EDD900CBF1DF00C9EFDD00D0F3E30024A36C002DA7720032AD
      770035AE790038B07C003AB17D003CB27E004CB9890051BC8E0055BE90005AC1
      93005AC194005BC194005CC195006FCAA10075CEA60073C9A30085D3B00088D3
      B2008AD4B3008DD4B50093DABA00A3DFC400B8E7D200CCECDE00CCEBDD001E98
      650023A16B0025A56E00289C6C003EA67A00539F7F00076B47000E7850001D7F
      5A00026141000464430072958900005E3F00086244002A715A00FEFEFE00FDFD
      FD00FCFCFC00FBFBFB00FAFAFA00F9F9F900F8F8F800F7F7F700F6F6F600F5F5
      F500F4F4F400F3F3F300F2F2F200F1F1F100EFEFEF00EEEEEE00EDEDED00ECEC
      EC00EBEBEB00EAEAEA00E9E9E900E7E7E700E5E5E500E4E4E400E3E3E300E0E0
      E000DEDEDE00DDDDDD00DCDCDC00DBDBDB00D9D9D900D7D7D700D0D0D000CFCF
      CF00CECECE00CDCDCD00CBCBCB00CACACA00C8C8C800C7C7C700C6C6C600C5C5
      C500C4C4C400C2C2C200C1C1C100C0C0C000BFBFBF00BEBEBE00BDBDBD00BABA
      BA00B9B9B900B5B5B500B4B4B400B3B3B300B2B2B200B0B0B000AFAFAF00ADAD
      AD00ACACAC00ABABAB00AAAAAA00A9A9A900A8A8A800A7A7A700A6A6A600A4A4
      A400A0A0A0009E9E9E009C9C9C00999999009898980097979700959595009292
      92008B8B8B008A8A8A00FFFFFF00A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4
      A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4
      A4A4A4A4A4A4A4A4A49CA38AA4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4
      9E01016CA1A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A496010101010199A4A4
      A4A4A4A4A4A4A4A4A4A4A4A4A4A49201010101595C5B9AA4A4A4A4A4A4A4A4A4
      A4A4A4A4A4855F010101585F6B675C9287A4A4A4A4A4A4A4A4A4A4A4A48F0101
      01585D707B76635C6B97A4A4A4A4A4A4A4A4A4A488010101015D6D7D887C6A5E
      5F6298A4A4A4A4A4A4A4A490010101015C6E7F54558673626063679FA4A4A4A4
      A4A4910101010101627A8F154F8E826F64677477A0A4A4A4A48D010101010101
      658011494C578F7E72768583A0A4A4A4800101580101010162164A2F30559994
      8B8B55A2A4A4A48C0101585B590101015D1032343548539B99564D06A4A48462
      01010158010101015952383A3C39475055314B0AA4A48D010101010101010101
      0107123E1F3E1E413B36331DA4A4A48901010101010158595B050F2021232244
      403D370B04A4A4A481010101585F64666869080C172A29272624423F0DA4A4A4
      A492015A61686D718B8C75094E182E2C2B28454351A4A4A4A4A49267676E7795
      016D990E1A141C1B192D462513A4A4A4A4A4A4928E8A9360606060799D020303
      03030303A4A4A4A4A4A4A4A4A4787878787878A4A4A4A4A4A4A4A4A4A4A4A4A4
      A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4
      A4A4A4A4A4A4A4A4A4A4A4A4A4A4}
    Margin = 5
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    OnClick = SpeedButton1Click
  end
  object rgTyp: TRadioGroup
    Left = 8
    Top = 80
    Width = 320
    Height = 33
    Anchors = [akLeft, akTop, akRight]
    Caption = #1058#1080#1087' '#1085#1072#1087#1086#1084#1080#1085#1072#1085#1080#1103
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #1058#1077#1082#1089#1090
      #1040#1091#1076#1080#1086)
    TabOrder = 3
  end
  object eData: TDateTimePicker
    Left = 8
    Top = 56
    Width = 81
    Height = 21
    CalAlignment = dtaLeft
    Date = 39777.6681790625
    Time = 39777.6681790625
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 0
  end
  object cbUsr: TComboBox
    Left = 176
    Top = 56
    Width = 153
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 2
    Text = #1042#1089#1077' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1080
    Items.Strings = (
      #1042#1089#1077' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1080)
  end
  object pAudio: TPanel
    Left = 7
    Top = 221
    Width = 320
    Height = 85
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 6
    DesignSize = (
      320
      85)
    object Label4: TLabel
      Left = 5
      Top = 5
      Width = 30
      Height = 13
      Caption = #1040#1091#1076#1080#1086
    end
    object bAOpen: TSpeedButton
      Left = 10
      Top = 20
      Width = 150
      Height = 30
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1092#1072#1081#1083
      Flat = True
      Glyph.Data = {
        6E040000424D6E040000000000002E0200002800000018000000180000000100
        08000000000040020000120B0000120B00007E0000007E00000000000000FFFF
        FF00383534004A464400504E4D00191411003B3836002C262100030201004544
        43003D39340038393900B5B7B7007D7E7E005E5F5F0064666700A2A4A5006A6D
        6F008C8E9000A6A8AA00A7A8A900A9A9AB0089898A00FEFEFE00FDFDFD00FCFC
        FC00FBFBFB00FAFAFA00F9F9F900F8F8F800F7F7F700F6F6F600F5F5F500F3F3
        F300F1F1F100F0F0F000EFEFEF00EDEDED00ECECEC00EBEBEB00EAEAEA00E9E9
        E900E8E8E800E7E7E700E6E6E600E5E5E500E4E4E400E2E2E200E1E1E100E0E0
        E000DFDFDF00DEDEDE00D9D9D900D8D8D800D7D7D700CECECE00CBCBCB00C7C7
        C700C4C4C400C3C3C300C1C1C100BDBDBD00BCBCBC00BABABA00B9B9B900B8B8
        B800B7B7B700B5B5B500B3B3B300B1B1B100B0B0B000AEAEAE00AAAAAA00A7A7
        A700A5A5A500A3A3A300A1A1A100A0A0A0009F9F9F009D9D9D009C9C9C009999
        99009797970096969600939393009292920091919100909090008E8E8E008C8C
        8C008B8B8B008A8A8A0089898900848484007A7A7A0079797900787878007575
        75006E6E6E0068686800656565005D5D5D005B5B5B0053535300515151004C4C
        4C004B4B4B00484848003E3E3E0039393900363636002F2F2F002E2E2E002B2B
        2B002A2A2A0026262600222222001F1F1F001E1E1E001D1D1D00181818001414
        1400131313000303030001010100FFFFFF007D7D7D7D7D7D7D7D7D7D7D7D7D7D
        7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D6D6C
        7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D037977757D7D7D7D7D7D7D
        7D7D7D7D7D7D7D7D7D7D7D7D670673647C7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D
        7D7D7D040A716F7B7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D090272687B7D
        7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D6E077466707D7D7D7D7D7D7D7D7D7D
        7D7D7D7D7D7D7D7D76057A65657D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D
        087C6B6C7D7D7D7D7D7D7D7D7D7D7D7D0E110F0D0B7D7D6A7C78637D7D7D7D7D
        7D7D7D7D7D7D161012130C15145A4E65697C7D7D7D7D7D7D7D7D7D7D7D542F2F
        210101012A013B5B7D7D7D7D7D7D7D7D7D7D7D7D5418271A01010101011A3732
        7D7D7D7D7D7D7D7D7D7D7D7D212B1C171701010117171B2C487D7D7D7D7D7D7D
        7D7D7D502B2D1D171817171718191C2F287D7D7D7D7D7D7D7D7D7D413A271917
        1A1918191A1C1A2A327D7D7D7D7D7D7D7D7D7D4345251E191E1D1B1D1F1B1E22
        43577D7D7D7D7D7D7D7D7D474D31232B252322232520232B4B597D7D7D7D7D7D
        7D7D7D3D513C3836332F2E2422262E445C7D7D7D7D7D7D7D7D7D7D7D47533E3B
        393827292D3235524E7D7D7D7D7D7D7D7D7D7D7D46655744423F30333440565F
        7D7D7D7D7D7D7D7D7D7D7D7D7D49625A584A364F585E614C7D7D7D7D7D7D7D7D
        7D7D7D7D7D7D7D555D6060605A5A7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D
        7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D}
      Margin = 5
      OnClick = bAOpenClick
    end
    object bACreate: TSpeedButton
      Left = 162
      Top = 20
      Width = 150
      Height = 30
      Caption = #1047#1072#1087#1080#1089#1072#1090#1100
      Flat = True
      Glyph.Data = {
        62040000424D6204000000000000220200002800000018000000180000000100
        08000000000040020000120B0000120B00007B0000007B00000000000000FFFF
        FF008988BE0067A1FB006AA3FB005995F9002368F4002469F4003E7DF6004783
        F600637CAB00014CEF00537FEC000140E200013DDE000133D1000133D000012F
        CD00021DB60031323800A9AFDC000213A8000A1BAB00FEFEFE00FCFCFC00FBFB
        FB00FAFAFA00F9F9F900F8F8F800F7F7F700F5F5F500F4F4F400F3F3F300F2F2
        F200F1F1F100F0F0F000EFEFEF00EEEEEE00EDEDED00ECECEC00EBEBEB00EAEA
        EA00E9E9E900E8E8E800E7E7E700E6E6E600E5E5E500E4E4E400E3E3E300E2E2
        E200E1E1E100E0E0E000DFDFDF00DEDEDE00DDDDDD00DCDCDC00DADADA00D9D9
        D900D8D8D800D7D7D700D5D5D500D0D0D000CFCFCF00CECECE00CDCDCD00CCCC
        CC00C8C8C800C7C7C700C6C6C600C5C5C500C2C2C200C0C0C000BFBFBF00BEBE
        BE00BBBBBB00BABABA00B8B8B800B7B7B700B5B5B500B4B4B400B1B1B100ADAD
        AD00AAAAAA00A9A9A900A7A7A700A6A6A600A5A5A500A3A3A300A2A2A200A0A0
        A0009F9F9F009B9B9B009A9A9A00999999009898980097979700959595009494
        940091919100909090008E8E8E008C8C8C008888880086868600767676007575
        750066666600616161005A5A5A005757570056565600515151004F4F4F003F3F
        3F003636360035353500343434003333330031313100303030002E2E2E002D2D
        2D00FFFFFF007A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A
        7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A
        7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A
        7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A695E5E5E7A7A7A7A7A7A7A7A7A7A
        7A7A7A7A7A7A7A7A7A6F4532271E185C7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A
        7A673E443F1E1817197A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A63484E64661D1A
        1B226C7A7A7A7A7A7A7A7A7A7A7A7A7A7A6151664B4659010101317A7A7A7A7A
        7A7A7A7A7A7A7A7A7A60424C433D3C51013239557A7A7A7A737A7A7A7A7A7A7A
        7A333F484029342F503C4045627A7A717A777A7A7A7A7A7A7633412E57341D1D
        2C58474C557A72212938797A7A7A7A7433353D3A245D481F544D50535B7A721B
        302830787075752F2F3B342B2623495C53565A5C527A7A657A20281F37462533
        33312F272422275A515C5C51627A7A7A6A6B1F272602302F2D2C2825235F687A
        7A31367A7A7A7A7A7A7A6E2726142A2A2826264A6D7A7A7A7A7A7A7A7A7A7A7A
        7A7A13281C100C2423224F7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A15110B0708
        160F7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A120E0605040A7A7A7A7A7A7A7A
        7A7A7A7A7A7A7A7A7A7A7A7A0D09037A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A
        7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A
        7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A
        7A7A7A7A7A7A}
      Margin = 5
      OnClick = bACreateClick
    end
    object Media: TMediaPlayer
      Left = 108
      Top = 51
      Width = 113
      Height = 30
      VisibleButtons = [btPlay, btPause, btStop, btRecord]
      Anchors = [akLeft, akTop, akRight]
      AutoEnable = False
      TabOrder = 0
    end
  end
  object pTxt: TPanel
    Left = 7
    Top = 136
    Width = 320
    Height = 85
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 5
    DesignSize = (
      320
      85)
    object Label1: TLabel
      Left = 5
      Top = 5
      Width = 30
      Height = 13
      Caption = #1058#1077#1082#1089#1090
    end
    object eTxt: TMemo
      Left = 10
      Top = 20
      Width = 304
      Height = 57
      Anchors = [akLeft, akTop, akRight, akBottom]
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object eLog: TMemo
    Left = 10
    Top = 376
    Width = 315
    Height = 97
    Anchors = [akLeft, akTop, akRight, akBottom]
    ReadOnly = True
    TabOrder = 7
    WordWrap = False
  end
  object eTime: TMaskEdit
    Left = 92
    Top = 56
    Width = 56
    Height = 21
    EditMask = '!90:00;1;_'
    MaxLength = 5
    TabOrder = 1
    Text = '  :  '
  end
  object cbStand: TComboBox
    Left = 8
    Top = 115
    Width = 290
    Height = 21
    ItemHeight = 13
    TabOrder = 4
  end
  object eExp: TMemo
    Left = 264
    Top = 8
    Width = 57
    Height = 17
    Enabled = False
    TabOrder = 8
    Visible = False
    WordWrap = False
  end
  object bOk: TBitBtn
    Left = 8
    Top = 344
    Width = 155
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1077#1085#1086
    TabOrder = 9
    OnClick = bOkClick
    Kind = bkOK
  end
  object bCancel: TBitBtn
    Left = 174
    Top = 344
    Width = 155
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100
    TabOrder = 10
    OnClick = bCancelClick
    Kind = bkCancel
  end
  object AOpen: TOpenDialog
    Filter = '*.wav|*.wav'
    Left = 232
  end
  object SaveD: TSaveDialog
    DefaultExt = 'msq'
    Filter = '*.msq|*.msq'
    Title = #1069#1082#1089#1087#1086#1088#1090' '#1079#1072#1076#1072#1095#1080
    Left = 264
  end
end