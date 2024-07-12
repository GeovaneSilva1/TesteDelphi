unit udmControl;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdmControl = class(TDataModule)
    conexao: TADOConnection;
    qrPrincipal: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmControl: TdmControl;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
