unit unitBaixaExame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, unitPrincipal;

type
  TForm6 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
   DataVencimento: TDate;
   ID: Integer;
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

procedure TForm6.Button2Click(Sender: TObject);
begin
Form1.FDBaixaExame.SQL.Text :=
  'UPDATE examepele ' +
  'SET status = :status, dataentrega = :dataentrega ' +
  'WHERE id = :id';

Form1.FDBaixaExame.Params.ParamByName('status').AsString := 'entregue';
Form1.FDBaixaExame.Params.ParamByName('dataentrega').AsDate := DateTimePicker2.Date;
Form1.FDBaixaExame.Params.ParamByName('id').Value := ID;

Form1.FDBaixaExame.ExecSQL;
ShowMessage('Entregue com Sucesso!');
Form1.FDExames.Refresh;

end;

procedure TForm6.FormShow(Sender: TObject);
begin
    DateTimePicker1.Date := DataVencimento;
    DateTimePicker2.Date := Now;
end;

end.
