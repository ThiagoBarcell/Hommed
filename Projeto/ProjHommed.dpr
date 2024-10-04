program ProjHommed;

uses
  Vcl.Forms,
  LoginFrm in '..\Forms\LoginFrm.pas' {frmFarmed},
  OperacoesFrm in '..\Forms\OperacoesFrm.pas' {HommedFrm},
  GeralDMFrm in '..\Forms\GeralDMFrm.pas' {frmGeralDM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFarmed, frmFarmed);
  Application.CreateForm(TfrmGeralDM, frmGeralDM);
  Application.Run;
end.
