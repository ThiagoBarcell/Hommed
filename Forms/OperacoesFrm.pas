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
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxContainer, cxMaskEdit, cxDropDownEdit, cxImageComboBox, cxTextEdit,
  cxDBEdit, cxLabel, Vcl.DBCtrls,GeralDMFrm, cxCalendar, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxDBLabel;

type
  THommedFrm = class(TForm)
    pnlTop: TPanel;
    Panel2: TPanel;
    pagLogin: TcxPageControl;
    tabPacienteFind: TcxTabSheet;
    pnlPacienteFind: TPanel;
    btnFindPacientes: TStyledButton;
    Panel3: TPanel;
    btnConsultas: TStyledButton;
    btnRemedios: TStyledButton;
    StyledButton3: TStyledButton;
    Bevel1: TBevel;
    Image1: TImage;
    Label2: TLabel;
    grdPacientesDBTableView1: TcxGridDBTableView;
    grdPacientesLevel1: TcxGridLevel;
    grdPacientes: TcxGrid;
    pnlBotton: TPanel;
    Bevel2: TBevel;
    grdPacientesDBTableView1Column1: TcxGridDBColumn;
    grdPacientesDBTableView1Column2: TcxGridDBColumn;
    grdPacientesDBTableView1Column3: TcxGridDBColumn;
    btnCadGeral: TStyledButton;
    btnDelGeral: TStyledButton;
    tabCadPaciente: TcxTabSheet;
    cxLabel1: TcxLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    cxLabel2: TcxLabel;
    cxLabel16: TcxLabel;
    cxDBTextEdit10: TcxDBTextEdit;
    cxImageComboBox1: TcxImageComboBox;
    cxLabel7: TcxLabel;
    cmbSexo: TcxDBImageComboBox;
    cxDBTextEdit3: TcxDBTextEdit;
    cxLabel10: TcxLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    Bevel3: TBevel;
    cxLabel5: TcxLabel;
    cxImageComboBox2: TcxImageComboBox;
    cxDBTextEdit1: TcxDBTextEdit;
    DBMemo1: TDBMemo;
    cxLabel6: TcxLabel;
    btnSalvar: TStyledButton;
    pagConsulta: TcxTabSheet;
    Panel1: TPanel;
    grdConsulta: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel8: TcxLabel;
    edtConsulta: TcxTextEdit;
    edtMedico: TcxTextEdit;
    edtDataConsulta: TcxDateEdit;
    lblPaciente: TLabel;
    cxDBLabel1: TcxDBLabel;
    pagRemedios: TcxTabSheet;
    Panel4: TPanel;
    Label1: TLabel;
    grdRemedios: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    cxLabel9: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    edtDescRemedio: TcxTextEdit;
    edtLabRemedio: TcxTextEdit;
    cxDBLabel2: TcxDBLabel;
    edtQTDRemedio: TcxTextEdit;
    cxGridDBTableView2Column1: TcxGridDBColumn;
    procedure StyledButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure grdPacientesDBTableView1CellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCadGeralClick(Sender: TObject);
    procedure btnFindPacientesClick(Sender: TObject);
    procedure btnConsultasClick(Sender: TObject);
    procedure tabPacienteFindShow(Sender: TObject);
    procedure tabCadPacienteShow(Sender: TObject);
    procedure btnDelGeralClick(Sender: TObject);
    procedure pagConsultaShow(Sender: TObject);
    procedure btnRemediosClick(Sender: TObject);
    procedure pagRemediosShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HommedFrm: THommedFrm;

implementation

{$R *.dfm}

procedure THommedFrm.btnCadGeralClick(Sender: TObject);
begin
  case pagLogin.ActivePageIndex of
    0 :
    begin
      pagLogin.ActivePageIndex := 1;
      frmGeralDM.qryPaciente.Append;
    end;
    2 :
    begin
      frmGeralDM.insConsulta.Close;
      frmGeralDM.insConsulta.ParamByName( 'ID_PACIENTE' ).AsInteger := frmGeralDM.qryPacienteID.AsInteger;
      frmGeralDM.insConsulta.ParamByName( 'MEDICO' ).AsString := edtMedico.Text;
      frmGeralDM.insConsulta.ParamByName( 'CONSULTA_DESC' ).AsString := edtConsulta.Text;
      frmGeralDM.insConsulta.ParamByName( 'DATA' ).AsDateTime := edtDataConsulta.Date;
      frmGeralDM.insConsulta.ExecSQL;
      frmGeralDM.qryConsulta.Refresh;

      edtConsulta.Clear;
      edtMedico.Clear;
      edtDataConsulta.Clear;
    end;
    3:
    begin
      frmGeralDM.qryRemedios.Close;
      frmGeralDM.qryRemedios.ParamByName( 'PACIENTE_ID' ).AsInteger := frmGeralDM.qryPacienteID.AsInteger;
      frmGeralDM.qryRemedios.Open;

      frmGeralDM.insRemedios.Close;
      frmGeralDM.insRemedios.ParamByName( 'PACIENTE_ID' ).AsInteger := frmGeralDM.qryPacienteID.AsInteger;
      frmGeralDM.insRemedios.ParamByName( 'DESCRICAO' ).AsString := edtDescRemedio.Text;
      frmGeralDM.insRemedios.ParamByName( 'LABORATORIO' ).AsString := edtLabRemedio.Text;
      frmGeralDM.insRemedios.ParamByName( 'QUANTIDADE' ).AsString := edtQTDRemedio.Text;
      frmGeralDM.insRemedios.ExecSQL;
      frmGeralDM.qryRemedios.Refresh;

      edtDescRemedio.Clear;
      edtLabRemedio.Clear;
      edtQTDRemedio.Clear;
    end;
  end;

end;

procedure THommedFrm.btnConsultasClick(Sender: TObject);
begin
  pagLogin.ActivePageIndex := 2;
  frmGeralDM.qryConsulta.Close;
  //frmGeralDM.qryConsulta.ParamByName( 'ID_PACIENTE' ).AsInteger :=  frmGeralDM.qryPacienteID.AsInteger;
  frmGeralDM.qryConsulta.Open;
  btnCadGeral.Visible := true;
  btnDelGeral.Visible := True;
end;

procedure THommedFrm.btnDelGeralClick(Sender: TObject);
begin
  case pagLogin.ActivePageIndex of
    0 :
    begin
      frmGeralDM.delPaciente.Close;
      frmGeralDM.delPaciente.ParamByName( 'ID' ).AsInteger := frmGeralDM.qryPacienteID.AsInteger;
      frmGeralDM.delPaciente.ExecSQL;
      frmGeralDM.qryPaciente.Refresh;
    end;
    2:
    begin
      frmGeralDM.delConsulta.Close;
      frmGeralDM.delConsulta.ParamByName( 'ID' ).AsInteger := frmGeralDM.qryConsultaID.AsInteger;
      frmGeralDM.delConsulta.ExecSQL;
      frmGeralDM.qryConsulta.Refresh;
    end;
    3:
    begin
      frmGeralDM.delRemedios.Close;
      frmGeralDM.delRemedios.ParamByName( 'ID' ).AsInteger := frmGeralDM.qryRemediosID.AsInteger;
      frmGeralDM.delRemedios.ExecSQL;
      frmGeralDM.qryRemedios.Refresh;
    end;
  end;

end;

procedure THommedFrm.btnFindPacientesClick(Sender: TObject);
begin
  pagLogin.ActivePageIndex := 0;
end;

procedure THommedFrm.btnRemediosClick(Sender: TObject);
begin
  pagLogin.ActivePageIndex := 3;
  frmGeralDM.qryConsulta.Close;
  //frmGeralDM.qryConsulta.ParamByName( 'ID_PACIENTE' ).AsInteger :=  frmGeralDM.qryPacienteID.AsInteger;
  frmGeralDM.qryConsulta.Open;
  btnCadGeral.Visible := true;
  btnDelGeral.Visible := True;
end;

procedure THommedFrm.btnSalvarClick(Sender: TObject);
begin
  if pagLogin.ActivePageIndex = 2 then
  begin

  end
  else
  if pagLogin.ActivePageIndex = 1 then
  begin

    pagLogin.ActivePageIndex := 0;
    frmGeralDM.qryPacienteSEXO.AsString := cmbSexo.EditValue;
    frmGeralDM.qryPaciente.post;
  end;
end;

procedure THommedFrm.FormCreate(Sender: TObject);
begin
  pagLogin.ActivePageIndex := 0;
end;

procedure THommedFrm.grdPacientesDBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  pagLogin.ActivePageIndex := 1;
end;

procedure THommedFrm.pagConsultaShow(Sender: TObject);
begin
  frmGeralDM.qryConsulta.Close;
  frmGeralDM.qryConsulta.ParamByName( 'ID_PACIENTE' ).AsInteger := frmGeralDM.qryPacienteID.AsInteger;
  frmGeralDM.qryConsulta.Open;

  btnSalvar.Visible := False
end;

procedure THommedFrm.pagRemediosShow(Sender: TObject);
begin
  frmGeralDM.qryRemedios.Close;
  frmGeralDM.qryRemedios.ParamByName( 'PACIENTE_ID' ).AsInteger := frmGeralDM.qryPacienteID.AsInteger;
  frmGeralDM.qryRemedios.Open;
end;

Procedure THommedFrm.StyledButton3Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure THommedFrm.tabCadPacienteShow(Sender: TObject);
begin
  btnDelGeral.Visible := False;
  btnCadGeral.Visible := False;
  btnSalvar.Visible := True;
  frmGeralDM.qryPaciente.Edit;
end;

procedure THommedFrm.tabPacienteFindShow(Sender: TObject);
begin
  btnDelGeral.Visible := True;
  btnCadGeral.Visible := True;
  btnSalvar.Visible := False;
end;

end.
