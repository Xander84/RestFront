unit rfCheckDatabase;

interface

uses IBDatabase, IBSQL;

function CheckVersion(const Database: TIBDatabase): Boolean;
function AddVersionInfo(FSQL: TIBSQL; ID: Integer; ReleaseDate: TDate;
  Comment: String): Boolean;
function Check1(FSQL: TIBSQL): Integer;
function Check2(FSQL: TIBSQL): Boolean;
function Check3(ibsql: TIBSQL): Boolean;

implementation

uses SysUtils;

function CheckVersion(const Database: TIBDatabase): Boolean;
var
  FTransaction: TIBTransaction;
  FSQL: TIBSQL;
  DBVersion: Integer;
begin
  Result := False;

  if not Database.Connected then
    Exit;

  FTransaction := TIBTransaction.Create(nil);
  FTransaction.DefaultDatabase := Database;
  FTransaction.Params.Clear;
  FTransaction.Params.Add('read_committed');
  FTransaction.Params.Add('nowait');
  FTransaction.Params.Add('write');

  FSQL := TIBSQL.Create(nil);
  FSQL.Transaction := FTransaction;
  try
    DBVersion := Check1(FSQL);
    if DBVersion >= 0 then
    begin
      if DBVersion < 2 then
        Result := Check2(FSQL);
      if DBVersion < 3 then
        Result := Check3(FSQL);
    end;
  finally
    FSQL.Close;
    FSQL.Free;
    FTransaction.Free;
  end;
end;

function AddVersionInfo(FSQL: TIBSQL; ID: Integer; ReleaseDate: TDate;
  Comment: String): Boolean;
begin
  Result := True;
  try
    FSQL.Close;
    FSQL.SQL.Text :=
      ' INSERT INTO RF$VERSIONINFO (ID, RELEASEDATE, COMMENT) VALUES(:ID, :RELEASEDATE, :COMMENT) ';
    FSQL.ParamByName('ID').AsInteger := ID;
    FSQL.ParamByName('RELEASEDATE').AsDateTime := ReleaseDate;
    Delete(Comment, 40, Length(Comment) - 40);
    FSQL.ParamByName('COMMENT').AsString := Comment;
    FSQL.ExecQuery;
  except
    Result := False;
    raise ;
  end;
end;

function Check1(FSQL: TIBSQL): Integer;
begin
  Result := -1;
  FSQL.Transaction.StartTransaction;
  try
    FSQL.SQL.Text :=
      'SELECT r.rdb$relation_name FROM rdb$relations r ' + ' WHERE ' +
      ' r.rdb$relation_name = ''RF$VERSIONINFO''';
    FSQL.ExecQuery;
    if not FSQL.EOF then
    begin
      FSQL.Close;
      FSQL.SQL.Text := ' SELECT max(id) ID FROM RF$VERSIONINFO ';
      FSQL.ExecQuery;
      Result := FSQL.FieldByName('ID').AsInteger;
    end
    else
    begin
      try
        FSQL.Close;
        FSQL.SQL.Text := ' CREATE TABLE RF$VERSIONINFO(    ' +
          '  ID             DINTKEY,        ' +
          '  RELEASEDATE    DDATE NOT NULL, ' +
          '  COMMENT        DTEXT254)       ';
        FSQL.ExecQuery;

        FSQL.Close;
        FSQL.SQL.Text :=
          ' ALTER TABLE RF$VERSIONINFO ADD CONSTRAINT RF_PK_VERSIONINFO_ID PRIMARY KEY (ID) ';
        FSQL.ExecQuery;

        FSQL.Close;
        FSQL.SQL.Text := ' GRANT ALL ON RF$VERSIONINFO TO ADMINISTRATOR; ';
        FSQL.ExecQuery;
        FSQL.Transaction.Commit;
        FSQL.Transaction.StartTransaction;
        if AddVersionInfo(FSQL, 1, EncodeDate(2011, 08, 11),
          'Создали таблицу версий') then
          Result := 1;
      except
        raise ;
      end;
    end;
  finally
    FSQL.Transaction.Commit;
  end;
end;

function Check2(FSQL: TIBSQL): Boolean;
begin
  Result := False;
  FSQL.Transaction.StartTransaction;
  try
    try
      FSQL.SQL.Text :=
        ' ALTER TABLE USR$INV_PAYTYPE ADD USR$EXTERNALPROCESS DBOOLEAN ';
      FSQL.ExecQuery;

      FSQL.SQL.Text :=
        ' ALTER TABLE USR$MN_KINDTYPE ADD USR$EXTERNALKEY DINTEGER ';
      FSQL.ExecQuery;

      FSQL.SQL.Text :=
        ' create procedure RF$EXT_GETPAYTYPELIST(LogicDate DATE, CurrentDateTime TIMESTAMP, PayTypeKey INTEGER) '#10#13 +
        ' returns (id INTEGER, USR$NAME dtext60, USR$NOFISCAL DBOOLEAN ) '#10#13 +
        ' as '#10#13 +
        ' begin '#10#13 +
        '   /* Procedure Text */ '#10#13 +
        '   suspend; '#10#13 +
        ' end ';
      FSQL.ExecQuery;

      FSQL.SQL.Text :=
        ' create procedure RF$EXT_SAVEORDER(EXTKEY INTEGER, LogicDate DATE, CurrentDateTime TIMESTAMP, PAYSUM NUMERIC(15,4)) '#10#13 +
        ' as '#10#13 +
        ' begin '#10#13 +
        ' end  ';
      FSQL.ExecQuery;

      Result := AddVersionInfo(FSQL, 2, EncodeDate(2011, 08, 11),
        'Создали структуру для связи с внешней БД ')
    except
      raise;
    end;
  finally
    FSQL.Transaction.Commit;
  end;
end;

function Check3(ibsql: TIbSQL): Boolean;
  begin
    Result := False;
    ibsql.Transaction.StartTransaction;
    try
      try
        ibsql.SQL.Text :=
          ' ALTER TABLE USR$MN_KINDTYPE ' +
          ' ALTER COLUMN USR$ALIAS TYPE DTEXT20 ';
        ibsql.ExecQuery;

        Result := AddVersionInfo(ibsql, 3, EncodeDate(2011, 08, 16), 'Удлинили поле Alias в типах оплаты ')
      except
        raise;
      end;
    finally
      ibsql.Transaction.Commit;
    end;
  end;
end.
