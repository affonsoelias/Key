unit ukey2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  DBCtrls, DBGrids, ZConnection, ZDataset, ZSqlUpdate;

type

  { TForm1 }

  TForm1 = class(TForm)
    dsCLIENTE: TDataSource;
    DBGrid1: TDBGrid;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    DBNavigator1: TDBNavigator;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    tbCLIENTEDESCRICAO: TMemoField;
    tbCLIENTEID: TLargeintField;
    tbCLIENTESENHA: TMemoField;
    tbCLIENTEUSUARIO: TMemoField;
    ZConnection1: TZConnection;
    tbCLIENTE: TZQuery;
    upCLIENTE: TZUpdateSQL;
    procedure Panel1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Panel1Click(Sender: TObject);
begin

end;

end.

