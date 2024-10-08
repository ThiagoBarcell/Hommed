unit LoginFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, Vcl.StdCtrls, cxTextEdit, dxGDIPlusClasses,
  Vcl.ButtonStylesAttributes, Vcl.Menus, cxButtons, Vcl.StyledButton,
  dxBarBuiltInMenu, cxPC,OperacoesFrm, GeralDMFrm;

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
    pnlCadastro: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtCadUsuario: TcxTextEdit;
    edtCadSenha: TcxTextEdit;
    btnCancelCad: TStyledButton;
    btnCadUser: TStyledButton;
    StyledButton4: TStyledButton;
    StyledButton2: TStyledButton;
    StyledButton3: TStyledButton;
    procedure StyledButton1Click(Sender: TObject);
    procedure btnLogarClick(Sender: TObject);
    procedure btnCadUserClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelCadClick(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure StyledButton3Click(Sender: TObject);
    procedure StyledButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFarmed: TfrmFarmed;

implementation

{$R *.dfm}

procedure TfrmFarmed.btnCadastrarClick(Sender: TObject);
begin
  pagLogin.ActivePageIndex := 1;
  edtUsername.Clear;
  edtPassword.Clear;
end;

procedure TfrmFarmed.btnCadUserClick(Sender: TObject);
begin
  if ( edtCadUsuario.Text <> '' ) and ( edtCadSenha.Text <> '' ) then
  begin
    frmGeralDM.insUsuario.Close;
    frmGeralDM.insUsuario.ParamByName( 'NOME' ).AsString := edtCadUsuario.Text;
    frmGeralDM.insUsuario.ParamByName( 'SENHA' ).AsString := edtCadSenha.Text;
    frmGeralDM.insUsuario.ExecSQL;
    Application.MessageBox( 'Usu�rio cadastrado com sucesso', 'AVISO', MB_OK );
    edtCadUsuario.Clear;
    edtCadSenha.Clear;
    pagLogin.ActivePageIndex := 0;
  end
  else
  begin
    Application.MessageBox( 'Por favor preencha corretamente todos os campos de cadastro!', 'AVISO', MB_OK );
  end;
end;

procedure TfrmFarmed.btnCancelCadClick(Sender: TObject);
begin
  pagLogin.ActivePageIndex := 0;
end;

procedure TfrmFarmed.btnLogarClick(Sender: TObject);
var
  tela1 : THommedFrm;
begin
  frmGeralDM.qryUsuarios.Close;
  frmGeralDM.qryUsuarios.ParamByName( 'NOME' ).AsString := edtUsername.Text;
  frmGeralDM.qryUsuarios.ParamByName( 'SENHA' ).AsString := edtPassword.Text;
  frmGeralDM.qryUsuarios.Open;

  if not ( frmGeralDM.qryUsuarios.IsEmpty ) then
  begin
    tela1 := THommedFrm.Create(self);
    frmgeraldm.qryPaciente.Open;
    tela1.ShowModal;
  end
  else
    Application.MessageBox( 'Usu�rio n�o encontrado', 'AVISO', MB_OK );



end;

procedure TfrmFarmed.FormShow(Sender: TObject);
begin
  pagLogin.ActivePageIndex := 0;
end;

procedure TfrmFarmed.StyledButton1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmFarmed.StyledButton2Click(Sender: TObject);
begin
  if edtPassword.Properties.EchoMode = eemNormal then
    edtPassword.Properties.EchoMode := eemPassword
  else
    edtPassword.Properties.EchoMode := eemNormal;
end;

procedure TfrmFarmed.StyledButton3Click(Sender: TObject);
begin
  if edtCadSenha.Properties.EchoMode = eemNormal then
    edtCadSenha.Properties.EchoMode := eemPassword
  else
    edtCadSenha.Properties.EchoMode := eemNormal;
end;

end.
