unit ukey;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBCtrls, StdCtrls,
  DBGrids, ZConnection, ZDataset, ZSqlUpdate;

type

  { TfrmKey }

  TfrmKey = class(TForm)
    DBGrid1: TDBGrid;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    DBMemo4: TDBMemo;
    DBNavigator1: TDBNavigator;
    dskey: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    tbKEYDESCRICAO: TMemoField;
    tbKEYID: TLargeintField;
    tbKEYSENHA: TMemoField;
    tbKEYUSUARIO: TMemoField;
    ZConnection1: TZConnection;
    tbKEY: TZQuery;
    upKEY: TZUpdateSQL;
    procedure ZConnection1AfterConnect(Sender: TObject);
  private

  public

  end;

var
  frmKey: TfrmKey;

implementation

{$R *.lfm}

{ TfrmKey }

procedure TfrmKey.ZConnection1AfterConnect(Sender: TObject);
begin

end;

end.

