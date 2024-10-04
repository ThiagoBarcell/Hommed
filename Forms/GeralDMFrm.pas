unit GeralDMFrm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Phys.IBBase, FireDAC.Comp.UI, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TfrmGeralDM = class(TDataModule)
    dbConect: TFDConnection;
    fbDriver: TFDPhysFBDriverLink;
    fdCursorWait: TFDGUIxWaitCursor;
    qryPaciente: TFDQuery;
    dtsPaciente: TDataSource;
    upsPaciente: TFDUpdateSQL;
    qryPacienteID: TIntegerField;
    qryPacienteNOME: TStringField;
    qryPacienteCPF: TStringField;
    qryPacienteTELEFONE_1: TStringField;
    qryPacienteTELEFONE_2: TStringField;
    qryPacienteOBSERVACAO: TStringField;
    qryPacienteSEXO: TStringField;
    qryPacienteIDADE: TIntegerField;
    qryPacienteDATA_CAD: TDateField;
    qryConsulta: TFDQuery;
    dtsConsulta: TDataSource;
    upsConsulta: TFDUpdateSQL;
    qryConsultaID_PACIENTE: TIntegerField;
    qryConsultaMEDICO: TStringField;
    qryConsultaCONSULTA_DESC: TStringField;
    qryConsultaDATA: TDateField;
    qryConsultaID: TIntegerField;
    insConsulta: TFDQuery;
    qryRemedios: TFDQuery;
    qryUsuarios: TFDQuery;
    delRemedios: TFDQuery;
    insRemedios: TFDQuery;
    qryRemediosID: TIntegerField;
    qryRemediosPACIENTE_ID: TIntegerField;
    qryRemediosDESCRICAO: TStringField;
    qryRemediosLABORATORIO: TStringField;
    qryRemediosQUANTIDADE: TStringField;
    dtsRemedios: TDataSource;
    insUsuario: TFDQuery;
    delPaciente: TFDQuery;
    delConsulta: TFDQuery;
    procedure qryPacienteNewRecord(DataSet: TDataSet);
  private
    function ProximoNumero(GENERATOR: String): integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeralDM: TfrmGeralDM;

implementation

function TfrmGeralDM.ProximoNumero(GENERATOR: String): integer;
var
  oqryNovoNum : TFDQuery;
begin
  oqryNovoNum := TFDQuery.Create(nil);
  oqryNovoNum.Connection := dbConect;
  try
    oqryNovoNum.Close;
    oqryNovoNum.SQL.Clear;
    oqryNovoNum.SQL.Add( 'SELECT GEN_ID(' + GENERATOR + ',1) AS ID_ATUAL FROM RDB$DATABASE' );
    oqryNovoNum.Open;
  finally
    Result := oqryNovoNum.FieldByName( 'ID_ATUAL' ).AsInteger;
    FreeAndNil(oqryNovoNum);
  end;
end;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TfrmGeralDM.qryPacienteNewRecord(DataSet: TDataSet);
begin
  qryPacienteID.AsInteger := ProximoNumero('GEN_PACIENTES_ID');
  qryPacienteDATA_CAD.AsDateTime := Now;
end;

end.
