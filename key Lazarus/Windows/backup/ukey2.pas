unit ukey2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  DBCtrls, DBGrids, ComCtrls, Menus, ZConnection, ZDataset, ZSqlUpdate;

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
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    SelectDirectoryDialog1: TSelectDirectoryDialog;
    StatusBar1: TStatusBar;
    tbCLIENTEDESCRICAO: TMemoField;
    tbCLIENTEID: TLargeintField;
    tbCLIENTESENHA: TMemoField;
    tbCLIENTEUSUARIO: TMemoField;
    ZConnection1: TZConnection;
    tbCLIENTE: TZQuery;
    upCLIENTE: TZUpdateSQL;
    procedure FormCreate(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);


  private

  public
    procedure VerificacaoEstatus();
    procedure ConexaoDB();
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.FormCreate(Sender: TObject);
begin
  VerificacaoEstatus();

end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  //Localizando o caminho para criar o banco de DB
  if SelectDirectoryDialog1.Execute = True then
  begin
    ZConnection1.Database := SelectDirectoryDialog1.FileName;
  end;



end;

procedure TForm1.MenuItem3Click(Sender: TObject);

begin
  //Localizando o caminho para abrir o banco de DB
  if OpenDialog1.Execute = True then
  begin
    ZConnection1.Database := OpenDialog1.FileName;
  end;


  //Verificando se arquivo BD foi selecionado
  if (OpenDialog1.FileName <> '') then
  begin
    ConexaoDB();
    VerificacaoEstatus();
  end;

end;

procedure TForm1.VerificacaoEstatus();
begin
  //Verificaçao do estatus do DB
  if (ZConnection1.Connected = False) then
    StatusBar1.Panels[0].Text := 'Não a conexão com o Banco de dados'
  else
    StatusBar1.Panels[0].Text := 'A conexão com o Banco de dados';
end;

procedure TForm1.ConexaoDB();
begin
  //Fazendo a conexao
  ZConnection1.Connected := True;
  tbCLIENTE.Connection := ZConnection1;
  tbCLIENTE.Active := True;
end;


end.

