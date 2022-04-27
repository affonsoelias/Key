unit uFormCriarBAnco;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  DBCtrls, ComCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    procedure Edit1Change(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }



procedure TForm2.Edit1Change(Sender: TObject);
begin

end;

procedure TForm2.Label1Click(Sender: TObject);
begin

end;

procedure TForm2.Panel1Click(Sender: TObject);
begin

end;

procedure TForm2.Panel2Click(Sender: TObject);
begin

end;

end.

