unit rfCheckDatabase;
interface
uses IBDatabase, IBSQL;

  function CheckVersion(Database: TIbDatabase): Boolean;
  function AddVersionInfo(ibsql: TIBSQL; ID: Integer; ReleaseDate: TDate; Comment: String): Boolean;
  function Check1(ibsql: TIBSQL): Integer;

  function Check2(ibsql: TIBSQL): Boolean;

implementation
uses SysUtils;

  function CheckVersion(Database: TIbDatabase): Boolean;
  var
    tr: TIbTransaction;
    ibsql: TIBSQL;
    DBVersion: Integer;
  begin
    Result := False;

    if not Database.Connected then
      Exit;

    tr := TIBtransaction.Create(nil);
    tr.DefaultDatabase := DataBase;
    tr.Params.Clear;
    tr.Params.Add('read_committed');
    tr.Params.Add('nowait');
    tr.Params.Add('write');

    ibsql := TIBSQL.Create(nil);
    ibsql.Transaction := tr;
    try
      DBVersion := Check1(ibsql);
      if DBVersion >= 0 then
      begin
        if DBVersion < 2 then
          Result := Check2(ibsql);
      end;
    finally
      ibsql.Close;
      ibsql.Free;
      tr.Free
    end;
  end;

  function AddVersionInfo(ibsql: TIBSQL; ID: Integer; ReleaseDate: TDate; Comment: String): Boolean;
  begin
    Result := True;
    try
      ibsql.Close;
      ibsql.SQL.Text := ' INSERT INTO RF$VERSIONINFO (ID, RELEASEDATE, COMMENT) VALUES(:ID, :RELEASEDATE, :COMMENT) ';
      ibsql.ParamByName('ID').AsInteger := ID;
      ibsql.ParamByName('RELEASEDATE').AsDateTime := ReleaseDate;
      Delete(Comment, 40, Length(Comment) - 40);
      ibsql.ParamByName('COMMENT').AsString := Comment;
      ibsql.ExecQuery;
    except
      Result := False;
      raise;
    end;
  end;

  function Check1(ibsql: TIbSQL): Integer;
  begin
    Result := -1;
    ibsql.Transaction.StartTransaction;
    try
      ibsql.SQL.Text :=
        'SELECT r.rdb$relation_name FROM rdb$relations r ' +
        ' WHERE ' +
        ' r.rdb$relation_name = ''RF$VERSIONINFO''' ;
      ibsql.ExecQuery;
      if not ibsql.EOF then
      begin
        IBSQL.Close;
        IBSQL.SQL.Text :=
          ' SELECT max(id) ID FROM RF$VERSIONINFO ';
        IBSQL.ExecQuery;
        Result := ibsql.FieldByName('ID').AsInteger;
      end
      else
      begin
        try
          IBSQL.Close;
          IBSQL.SQL.Text :=
            ' CREATE TABLE RF$VERSIONINFO(    ' +
            '  ID             DINTKEY,        ' +
            '  RELEASEDATE    DDATE NOT NULL, ' +
            '  COMMENT        DTEXT254)       ';
          IBSQL.ExecQuery;

          IBSQL.Close;
          IBSQL.SQL.Text :=
            ' ALTER TABLE RF$VERSIONINFO ADD CONSTRAINT RF_PK_VERSIONINFO_ID PRIMARY KEY (ID) ';
          IBSQL.ExecQuery;

          IBSQL.Close;
          IBSQL.SQL.Text :=
            ' GRANT ALL ON RF$VERSIONINFO TO ADMINISTRATOR; ';
          IBSQL.ExecQuery;
          ibsql.Transaction.Commit;
          ibsql.Transaction.StartTransaction;
          if AddVersionInfo(ibsql, 1, EncodeDate(2011, 08, 11), 'Создали таблицу версий') then
            Result := 1;
        except
          raise;
        end;
      end;

    finally
      ibsql.Transaction.Commit;
    end;

  end;

  function Check2(ibsql: TIbSQL): Boolean;
  begin
    Result := False;
    ibsql.Transaction.StartTransaction;
    try
      try
        ibsql.SQL.Text :=
          ' ALTER TABLE USR$INV_PAYTYPE ADD USR$EXTERNALPROCESS DBOOLEAN ';
        ibsql.ExecQuery;

        ibsql.SQL.Text :=
          ' ALTER TABLE USR$MN_KINDTYPE ADD USR$EXTERNALKEY DINTEGER ';
        ibsql.ExecQuery;

        ibsql.SQL.Text :=
          ' create procedure RF$EXT_GETPAYTYPELIST(LogicDate DATE, CurrentDateTime TIMESTAMP, PayTypeKey INTEGER)                         ' + #10#13 +
          ' returns (id INTEGER, USR$NAME dtext60, USR$NOFISCAL DBOOLEAN ) ' + #10#13 +
          ' as                                                             ' + #10#13 +
          ' begin                                                          ' + #10#13 +
          '   /* Procedure Text */                                         ' + #10#13 +
          '   suspend;                                                     ' + #10#13 +
          ' end                                                            ';
        ibsql.ExecQuery;

        ibsql.SQL.Text :=
          ' create procedure RF$EXT_SAVEORDER(EXTKEY INTEGER, LogicDate DATE, CurrentDateTime TIMESTAMP, PAYSUM NUMERIC(15,4))      ' + #10#13 +
          ' as                                                             ' + #10#13 +
          ' begin                                                          ' + #10#13 +
          ' end                                                            ';
        ibsql.ExecQuery;
        Result := AddVersionInfo(ibsql, 2, EncodeDate(2011, 08, 11), 'Создали структуру для связи с внешней БД ')

      except
        raise;
      end;

    finally
      ibsql.Transaction.Commit;
    end;

  end;

end.
