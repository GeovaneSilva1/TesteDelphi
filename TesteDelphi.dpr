program TesteDelphi;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frPrincipal},
  udmControl in 'udmControl.pas' {dmControl: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmControl, dmControl);
  Application.CreateForm(TfrPrincipal, frPrincipal);
  Application.Run;
end.
