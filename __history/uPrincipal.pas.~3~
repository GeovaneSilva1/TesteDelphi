unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrPrincipal = class(TForm)
    Button1: TButton;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frPrincipal: TfrPrincipal;

implementation

{$R *.dfm}

uses udmControl;

procedure TfrPrincipal.Button1Click(Sender: TObject);
begin
  dmControl.qrPrincipal.Close;
  dmControl.qrPrincipal.SQL.Add('select * from vendedor');
  dmControl.qrPrincipal.SQL.Text;
  dmControl.qrPrincipal.Open;
end;

end.
