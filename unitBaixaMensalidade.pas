unit unitBaixaMensalidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, unitPrincipal;

type
  TForm5 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
  private
    { Private declarations }
  public
    DataVencimento: TDate;
    Valor: Double;
    ID: Integer;
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);
begin
  Form1.Query1.SQL.Text :=
  'UPDATE mensalidade ' +
  'SET status = :status , datapagamento = null, valorpago = null ' +
  'WHERE id = :id';

  Form1.Query1.Params.ParamByName('id').Value := ID;
  Form1.Query1.Params.ParamByName('status').AsString := 'pendente';
  Form1.Query1.ExecSQL;
  ShowMessage('Mensalidade cancelada com Sucesso!');
  Form1.SelectMensalidade.Refresh;
end;

procedure TForm5.Button2Click(Sender: TObject);
var
  valueWithoutR: string;
  floatValue: Double;
begin
  valueWithoutR := StringReplace(Edit2.Text, 'R$', '', [rfIgnoreCase]);
  floatValue := StrToFloat(valueWithoutR);
  Form1.Query1.SQL.Text :=
    'UPDATE mensalidade ' +
    'SET status = :status, datapagamento = :datapagamento, valorpago = :valorpago ' +
    'WHERE id = :id';

  Form1.Query1.Params.ParamByName('status').AsString := 'pago';
  Form1.Query1.Params.ParamByName('datapagamento').AsDate := DateTimePicker2.Date;
  Form1.Query1.Params.ParamByName('valorpago').AsFloat := floatValue; // Assign the floating-point value
  Form1.Query1.Params.ParamByName('id').Value := ID;

  Form1.Query1.ExecSQL;
  ShowMessage('Pago com Sucesso!');
  Form1.SelectMensalidade.Refresh;
end;

procedure TForm5.Edit2Change(Sender: TObject);
var
  CursorPos: Integer;
begin
  CursorPos := Edit2.SelStart;
  Edit2.Text := StringReplace(Edit2.Text, ',', '.', [rfReplaceAll]);
  Edit2.SelStart := CursorPos;
end;

procedure TForm5.Edit2Exit(Sender: TObject);
begin
  if (Pos('R$', Edit2.Text) <> 1) then
    Edit2.Text := 'R$' + Edit2.Text;
end;

procedure TForm5.FormShow(Sender: TObject);
begin
    DateTimePicker1.Date := DataVencimento;
    DateTimePicker1.Date := DataVencimento;
    DateTimePicker2.Date := Now;
    Edit1.Text := 'R$' + Valor.ToString + ',00';
end;

end.
