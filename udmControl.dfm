object dmControl: TdmControl
  Height = 227
  Width = 249
  object conexao: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=masterkey;Persist Security Info=Tru' +
      'e;User ID=sa;Initial Catalog=TesteDelphi;Data Source=DESKTOP-74J' +
      '9NVH\SQLSERVER2024;Use Procedure for Prepare=1;Auto Translate=Tr' +
      'ue;Packet Size=4096;Workstation ID=DESKTOP-74J9NVH;Use Encryptio' +
      'n for Data=False;Tag with column collation when possible=False'
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 104
    Top = 32
  end
  object qrPrincipal: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    Left = 104
    Top = 96
  end
end
