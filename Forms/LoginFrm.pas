unit LoginFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, Vcl.StdCtrls, cxTextEdit, dxGDIPlusClasses,
  Vcl.ButtonStylesAttributes, Vcl.Menus, cxButtons, Vcl.StyledButton,
  dxBarBuiltInMenu, cxPC;

type
  TfrmFarmed = class(TForm)
    pnlLogo: TPanel;
    pnlLogin: TPanel;
    Image1: TImage;
    edtUsername: TcxTextEdit;
    edtPassword: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnLogar: TStyledButton;
    btnCadastrar: TStyledButton;
    Label4: TLabel;
    StyledButton1: TStyledButton;
    pagLogin: TcxPageControl;
    tabLogin: TcxTabSheet;
    tabCadastro: TcxTabSheet;
    procedure StyledButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFarmed: TfrmFarmed;

implementation

{$R *.dfm}

procedure TfrmFarmed.StyledButton1Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
