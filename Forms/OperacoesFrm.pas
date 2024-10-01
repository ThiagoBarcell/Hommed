unit OperacoesFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, dxSkinsCore,
  dxSkinsDefaultPainters, dxBarBuiltInMenu, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.ButtonStylesAttributes,
  Vcl.StyledButton, cxPC, dxGDIPlusClasses, Vcl.StdCtrls, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid;

type
  THommedFrm = class(TForm)
    pnlTop: TPanel;
    Panel2: TPanel;
    pagLogin: TcxPageControl;
    tabPacienteFind: TcxTabSheet;
    pnlPacienteFind: TPanel;
    tabPacienteInfo: TcxTabSheet;
    pnlCadPaciente: TPanel;
    btnFindPacientes: TStyledButton;
    Panel3: TPanel;
    btnConsultas: TStyledButton;
    btnRemedios: TStyledButton;
    StyledButton3: TStyledButton;
    Bevel1: TBevel;
    Image1: TImage;
    Label2: TLabel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    pnlBotton: TPanel;
    procedure StyledButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HommedFrm: THommedFrm;

implementation

{$R *.dfm}

procedure THommedFrm.StyledButton3Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
