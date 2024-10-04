object frmGeralDM: TfrmGeralDM
  OldCreateOrder = False
  Height = 342
  Width = 475
  object dbConect: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=masterkey'
      
        'Database=C:\Users\Thiago\Documents\Trabalho Faculdade\DataBase\F' +
        'ARMEDDB.FDB'
      'Server=localHost'
      'DriverID=FB')
    Connected = True
    Left = 33
    Top = 26
  end
  object fbDriver: TFDPhysFBDriverLink
    VendorLib = 
      'C:\Users\Thiago\Documents\Trabalho Faculdade\Dependencias\fbclie' +
      'nt.dll'
    Left = 33
    Top = 79
  end
  object fdCursorWait: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 33
    Top = 132
  end
  object qryPaciente: TFDQuery
    OnNewRecord = qryPacienteNewRecord
    Connection = dbConect
    UpdateObject = upsPaciente
    SQL.Strings = (
      'SELECT'
      '  id,'
      '  nome,'
      '  cpf,'
      '  telefone_1,'
      '  telefone_2,'
      '  observacao,'
      '  sexo,'
      '  data_cad,'
      '  idade'
      '  FROM PACIENTES')
    Left = 128
    Top = 28
    object qryPacienteID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPacienteNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 250
    end
    object qryPacienteCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Size = 50
    end
    object qryPacienteTELEFONE_1: TStringField
      FieldName = 'TELEFONE_1'
      Origin = 'TELEFONE_1'
      Size = 50
    end
    object qryPacienteTELEFONE_2: TStringField
      FieldName = 'TELEFONE_2'
      Origin = 'TELEFONE_2'
      Size = 50
    end
    object qryPacienteOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      Size = 2500
    end
    object qryPacienteSEXO: TStringField
      FieldName = 'SEXO'
      Origin = 'SEXO'
    end
    object qryPacienteIDADE: TIntegerField
      FieldName = 'IDADE'
      Origin = 'IDADE'
    end
    object qryPacienteDATA_CAD: TDateField
      FieldName = 'DATA_CAD'
      Origin = 'DATA_CAD'
    end
  end
  object dtsPaciente: TDataSource
    DataSet = qryPaciente
    Left = 128
    Top = 84
  end
  object upsPaciente: TFDUpdateSQL
    Connection = dbConect
    InsertSQL.Strings = (
      
        'INSERT INTO PACIENTES (id,  nome,  cpf,  telefone_1,  telefone_2' +
        ',  observacao,'
      
        '  sexo, idade )VALUES ( :id,  :nome,  :cpf,  :telefone_1,  :tele' +
        'fone_2,  :observacao,'
      '  :sexo, :idade )')
    ModifySQL.Strings = (
      '  UPDATE PACIENTES'
      'SET id = :id ,'
      '    nome = :nome,'
      '    cpf =:cpf,'
      '    telefone_1 = :telefone_1,'
      '    telefone_2 = :telefone_2,'
      '    observacao = :observacao,'
      '    sexo = :sexo,'
      '    idade = :idade'
      'WHERE id = :old_id')
    DeleteSQL.Strings = (
      'DELETE FROM PACIENTES'
      'WHERE id = :old_id')
    Left = 128
    Top = 140
  end
  object qryConsulta: TFDQuery
    OnNewRecord = qryPacienteNewRecord
    Connection = dbConect
    UpdateObject = upsConsulta
    SQL.Strings = (
      'SELECT'
      '  ID_PACIENTE,'
      '  MEDICO,'
      '  CONSULTA_DESC,'
      '  DATA,'
      '  ID'
      '  FROM CONSULTA'
      '  WHERE ID_PACIENTE = :ID_PACIENTE')
    Left = 208
    Top = 28
    ParamData = <
      item
        Name = 'ID_PACIENTE'
        ParamType = ptInput
      end>
    object qryConsultaID_PACIENTE: TIntegerField
      FieldName = 'ID_PACIENTE'
      Origin = 'ID_PACIENTE'
    end
    object qryConsultaMEDICO: TStringField
      FieldName = 'MEDICO'
      Origin = 'MEDICO'
      Size = 50
    end
    object qryConsultaCONSULTA_DESC: TStringField
      FieldName = 'CONSULTA_DESC'
      Origin = 'CONSULTA_DESC'
      Size = 100
    end
    object qryConsultaDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object qryConsultaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
    end
  end
  object dtsConsulta: TDataSource
    DataSet = qryConsulta
    Left = 208
    Top = 84
  end
  object upsConsulta: TFDUpdateSQL
    Connection = dbConect
    InsertSQL.Strings = (
      'INSERT INTO CONSULTA (ID_PACIENTE,MEDICO,CONSULTA_DESC,DATA )'
      '  VALUES ( :ID_PACIENTE,:MEDICO,:CONSULTA_DESC,:DATA, :ID )')
    ModifySQL.Strings = (
      '    UPDATE CONSULTA'
      'SET'
      '  ID_PACIENTE = :ID_PACIENTE,'
      '  MEDICO = :MEDICO,'
      '  CONSULTA_DESC = :CONSULTA_DESC,'
      '  DATA = :DATA,'
      '  ID = :ID'
      'WHERE id = :old_id')
    DeleteSQL.Strings = (
      'DELETE FROM CONSULTA'
      'WHERE id = :old_id')
    Left = 208
    Top = 140
  end
  object insConsulta: TFDQuery
    Connection = dbConect
    SQL.Strings = (
      '  INSERT INTO CONSULTA (ID_PACIENTE,MEDICO,CONSULTA_DESC,DATA )'
      '  VALUES ( :ID_PACIENTE,:MEDICO,:CONSULTA_DESC,:DATA )')
    Left = 272
    Top = 28
    ParamData = <
      item
        Name = 'ID_PACIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'MEDICO'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Name = 'CONSULTA_DESC'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'DATA'
        DataType = ftDate
        ParamType = ptInput
      end>
  end
  object qryRemedios: TFDQuery
    Connection = dbConect
    SQL.Strings = (
      'SELECT * FROM REMEDIOS'
      'WHERE PACIENTE_ID = :PACIENTE_ID')
    Left = 368
    Top = 32
    ParamData = <
      item
        Name = 'PACIENTE_ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryRemediosID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryRemediosPACIENTE_ID: TIntegerField
      FieldName = 'PACIENTE_ID'
      Origin = 'PACIENTE_ID'
    end
    object qryRemediosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 50
    end
    object qryRemediosLABORATORIO: TStringField
      FieldName = 'LABORATORIO'
      Origin = 'LABORATORIO'
      Size = 50
    end
    object qryRemediosQUANTIDADE: TStringField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Size = 50
    end
  end
  object qryUsuarios: TFDQuery
    Connection = dbConect
    SQL.Strings = (
      'SELECT * FROM USUARIOS'
      'WHERE NOME = :NOME'
      'AND SENHA = :SENHA')
    Left = 224
    Top = 208
    ParamData = <
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 20
        Value = Null
      end
      item
        Name = 'SENHA'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end>
  end
  object delRemedios: TFDQuery
    Connection = dbConect
    SQL.Strings = (
      'DELETE FROM REMEDIOS'
      'WHERE REMEDIOS.ID = :ID')
    Left = 184
    Top = 280
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object insRemedios: TFDQuery
    Connection = dbConect
    SQL.Strings = (
      
        'INSERT INTO REMEDIOS(PACIENTE_ID, DESCRICAO, LABORATORIO, QUANTI' +
        'DADE )'
      'VALUES( :PACIENTE_ID, :DESCRICAO, :LABORATORIO, :QUANTIDADE )')
    Left = 368
    Top = 88
    ParamData = <
      item
        Name = 'PACIENTE_ID'
        ParamType = ptInput
      end
      item
        Name = 'DESCRICAO'
        ParamType = ptInput
      end
      item
        Name = 'LABORATORIO'
        ParamType = ptInput
      end
      item
        Name = 'QUANTIDADE'
        ParamType = ptInput
      end>
  end
  object dtsRemedios: TDataSource
    DataSet = qryRemedios
    Left = 368
    Top = 200
  end
  object insUsuario: TFDQuery
    Connection = dbConect
    SQL.Strings = (
      'INSERT INTO USUARIOS ( NOME, SENHA ) VALUES( :NOME, :SENHA )')
    Left = 160
    Top = 208
    ParamData = <
      item
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        Name = 'SENHA'
        ParamType = ptInput
      end>
  end
  object delPaciente: TFDQuery
    Connection = dbConect
    SQL.Strings = (
      'DELETE FROM PACIENTES'
      'WHERE PACIENTES.ID = :ID')
    Left = 24
    Top = 280
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object delConsulta: TFDQuery
    Connection = dbConect
    SQL.Strings = (
      'DELETE FROM CONSULTA'
      'WHERE ID = :ID')
    Left = 96
    Top = 280
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
end
