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
  ShowMessage(ID.ToString);
  Form1.Query1.SQL.Text	:= 'UPDATE mensalidade SET status = :status WHERE id = :id';
  Form1.Query1.Params.ParamByName('status').AsString := 'pendente';
  Form1.Query1.Params.ParamByName('id').Value := ID;
  Form1.Query1.ExecSQL;
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
  Form1.Query1.SQL.Text	:= 'UPDATE mensalidade SET status = :status WHERE id = :id';
  Form1.Query1.Params.ParamByName('status').AsString := 'pago';
  Form1.Query1.Params.ParamByName('id').Value := ID;
  Form1.Query1.ExecSQL;
end;

procedure TForm5.FormShow(Sender: TObject);
begin
    DateTimePicker1.Date := DataVencimento;
    DateTimePicker1.Date := DataVencimento;
    DateTimePicker2.Date := Now;
end;

end.
