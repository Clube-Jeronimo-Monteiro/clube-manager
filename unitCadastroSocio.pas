unit unitCadastroSocio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, unitPrincipal;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    EDName: TEdit;
    EDCodSocio: TEdit;
    EDBairro: TEdit;
    EDRua: TEdit;
    EDNumero: TEdit;
    EDTelefone: TEdit;
    Label6: TLabel;
    Conexao: TFDConnection;
    tbSocio: TFDTable;
    tbSocioid: TFDAutoIncField;
    tbSocionome: TStringField;
    tbSociocodSocio: TIntegerField;
    tbSociotelefone: TStringField;
    tbSociobairro: TStringField;
    tbSociorua: TStringField;
    tbSocionumero: TStringField;
    dsSocio: TDataSource;
    FDQuery1: TFDQuery;
    GerarExame: TFDQuery;
    FDMensalidade: TFDQuery;
    procedure Button1Click(Sender: TObject);
    procedure EDNameKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin


  try
    FDQuery1.SQL.Text := 'INSERT INTO socio (nome, codSocio, telefone, bairro, rua, numero) VALUES (:Nome, :codSocio, :Telefone, :Bairro, :Rua, :Numero)';

  FDQuery1.ParamByName('Nome').AsString := EDName.Text;
  FDQuery1.ParamByName('codSocio').AsInteger := StrToInt(EDCodSocio.Text);
  FDQuery1.ParamByName('Telefone').AsString := EDTelefone.Text;
  FDQuery1.ParamByName('Bairro').AsString := EDBairro.Text;
  FDQuery1.ParamByName('Rua').AsString := EDRua.Text;
  FDQuery1.ParamByName('Numero').AsString := EDNumero.Text;

  FDQuery1.ExecSQL;

  GerarExame.SQL.Clear();
  GerarExame.SQL.Text := 'INSERT INTO examepele (datavencimento, nome) SELECT DATE_ADD(CURDATE(), INTERVAL 6 MONTH) AS datavencimento,     :Nome AS nome UNION ALL SELECT DATE_ADD(CURDATE(), INTERVAL 12 MONTH) AS datavencimento, :Nome AS nome;';
  GerarExame.ParamByName('Nome').AsString := EDName.Text;
  GerarExame.ExecSQL;

  ShowMessage('Socio cadastrado!');
  Form1.FDExamesSQL.Refresh();
  Close;
except
  on E: EFDDBEngineException do
  begin
      if E.ErrorCode = 1062 then
      begin
        ShowMessage('Codigo de socio ja atribuido, Escolha Outro');
      end
      else
      begin
        ShowMessage(E.Message);
      end;
  end;
end;

   try
     Form1.GerarExames.ExecSQL;
     Form1.FDQuery2.Refresh;
     Form1.FDExames.Refresh;
     ShowMessage('Mensalidade gerada!');
   finally

   end;

end;

procedure TForm2.EDNameKeyPress(Sender: TObject; var Key: Char);
begin
 if (Key in ['0'..'9']) then
  begin
    ShowMessage('Não são permitidos números no nome do socio');
    Key := #0;
  end;
end;

end.
