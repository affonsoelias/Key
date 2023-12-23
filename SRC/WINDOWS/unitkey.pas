unit Unitkey;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  DBCtrls, DBGrids, ComCtrls, Menus, ZConnection, ZDataset, ZSqlUpdate, UnitSobre;

type

  { TForm_Key }

  TForm_Key = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    DBNavigator1: TDBNavigator;
    Edit1: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    SaveDialog1: TSaveDialog;
    StatusBar1: TStatusBar;
    tbKEYID: TLargeintField;
    tbKEYPASSWORD: TMemoField;
    tbKEYREFERENCE: TMemoField;
    tbKEYUSER: TMemoField;
    ZConnection1: TZConnection;
    tbKEY: TZQuery;
    ZUpdateSQL1: TZUpdateSQL;

    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure tbKEYAfterPost(DataSet: TDataSet);
    procedure tbKEYBeforeInsert(DataSet: TDataSet);
  private

  public
    procedure VerificacaoEstatus();
    procedure ConexaoDB();
  end;

var
  Form_Key: TForm_Key;

implementation

{$R *.lfm}

{ TForm_Key }

procedure TForm_Key.FormCreate(Sender: TObject);
begin
  VerificacaoEstatus();
end;

procedure TForm_Key.Edit1Change(Sender: TObject);
begin
  if Edit1.Text <> '' then // Se algo estiver digitado
  begin
    // Use uma consulta parametrizada para buscar no banco de dados
    tbKEY.Close;
    tbKEY.SQL.Text := 'SELECT * FROM KEY_TABLE WHERE reference LIKE :parametro';
    tbKEY.ParamByName('parametro').AsString := '%' + Edit1.Text + '%';
    // Texto digitado no Edit1
    tbKEY.Open;
    // Atualize o DBGrid com os resultados da consulta
    DBGrid1.DataSource.DataSet := tbKEY;
  end
  else // Se nada estiver digitado, mostre todos os dados novamente
  begin
    tbKEY.Close;
    tbKEY.SQL.Text := 'SELECT * FROM KEY_TABLE';
    tbKEY.Open;
    DBGrid1.DataSource.DataSet := tbKEY;
  end;
end;

procedure TForm_Key.MenuItem2Click(Sender: TObject);
var
  SQL: string;
begin
  // Define o SQL para criar a tabela, como fornecido
  SQL := 'CREATE TABLE IF NOT EXISTS KEY_TABLE (' +
    'ID INTEGER PRIMARY KEY AUTOINCREMENT, ' + 'USER TEXT, ' +
    'PASSWORD TEXT, ' + 'REFERENCE TEXT' + ')';

  // Executa o diálogo para salvar o banco de dados
  if SaveDialog1.Execute then
  begin
    // Salva o arquivo no caminho selecionado no SaveDialog1
    ZConnection1.Disconnect; // Desconecta a conexão antes de salvar o arquivo
    ZConnection1.Database := SaveDialog1.FileName;
    ZConnection1.Connect;

    // Executa o SQL para criar a tabela
    if ZConnection1.Connected then
    begin
      try
        ZConnection1.ExecuteDirect(SQL);
        ShowMessage('Database saved successfully.');
      except
        on E: Exception do
          ShowMessage('Error saving database: ' + E.Message);
      end;
    end
    else
      ShowMessage('Unable to connect to the database.');
  end;
end;

procedure TForm_Key.MenuItem3Click(Sender: TObject);
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

procedure TForm_Key.MenuItem5Click(Sender: TObject);
begin
  Form1.ShowModal;
end;

procedure TForm_Key.tbKEYAfterPost(DataSet: TDataSet);
begin
  tbKEY.ApplyUpdates;
  tbKEY.Refresh;
end;

procedure TForm_Key.tbKEYBeforeInsert(DataSet: TDataSet);
begin
  DBMemo1.SetFocus;
end;

procedure TForm_Key.VerificacaoEstatus();
begin
  //Verificaçao do estatus do DB
  if (ZConnection1.Connected = False) then
    StatusBar1.Panels[0].Text := 'No connection to the Database'
  else
    StatusBar1.Panels[0].Text := 'Connection to the Database';
end;

procedure TForm_Key.ConexaoDB();
begin
  //Fazendo a conexao
  ZConnection1.Connected := False;
  ZConnection1.Connected := True;
  tbKEY.Connection := ZConnection1;
  tbKEY.Active := True;
end;

end.
