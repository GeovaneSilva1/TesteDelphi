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
  dmControl.qrPrincipal.SQL.Add('select * from Vendas');
  dmControl.qrPrincipal.SQL.Text;
  dmControl.qrPrincipal.Open;

  dmControl.qrPrincipal.First;
  while not dmControl.qrPrincipal.Eof do
  begin
    dmControl.qrPrincipal.Edit;
    if dmControl.qrPrincipal.FieldByName('bdVendedor').AsString = 'Vendedor 01' then
       dmControl.qrPrincipal.FieldByName('bdIdVendedor').AsInteger := 1
    else
    if dmControl.qrPrincipal.FieldByName('bdVendedor').AsString = 'Vendedor 02' then
       dmControl.qrPrincipal.FieldByName('bdIdVendedor').AsInteger := 2
    else
       dmControl.qrPrincipal.FieldByName('bdIdVendedor').AsInteger := 3;

    dmControl.qrPrincipal.Post;

    dmControl.qrPrincipal.Next;
  end;

end;

end.
