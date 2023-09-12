unit unitCadastroSocio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait;

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
    procedure Button1Click(Sender: TObject);
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

  FDQuery1.SQL.Text := 'INSERT INTO mensalidade (socioid, valor, datavencimento) VALUES (:SocioId, :Valor, :DataVencimento)';
  FDQuery1.ParamByName('SocioId').AsInteger := StrToInt(EDCodSocio.Text);
  FDQuery1.ParamByName('Valor').AsFloat := 80.0;
  FDQuery1.ParamByName('DataVencimento').AsDate := EncodeDate(2023, 12, 15);
  FDQuery1.ExecSQL;

  ShowMessage('Socio cadastrado com sucesso e mensalidade gerada!');
  Close;
except
  on E: Exception do
  begin
      ShowMessage('Ocorreu um erro, verifique os campos');
  end;
end;



end;

end.
