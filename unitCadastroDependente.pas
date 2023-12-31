unit unitCadastroDependente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, unitPrincipal;

type
  TForm3 = class(TForm)
    Conexao: TFDConnection;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EDNameDependente: TEdit;
    Button1: TButton;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    EDNome: TEdit;
    DBGrid1: TDBGrid;
    FDConnection1: TFDConnection;
    dsSocio: TDataSource;
    tbSocio: TFDTable;
    tbSocioid: TFDAutoIncField;
    tbSocionome: TStringField;
    tbSociocodSocio: TIntegerField;
    tbSociotelefone: TStringField;
    tbSociobairro: TStringField;
    tbSociorua: TStringField;
    tbSocionumero: TStringField;
    Button2: TButton;
    REQuery: TDataSource;
    FDQuery1: TFDQuery;
    FDQuery2: TFDQuery;
    Label3: TLabel;
    NomeSocio: TLabel;
    GerarExame: TFDQuery;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure EDNameDependenteKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
var
 DataSet: TDataSet;
 IDValue: Variant;
begin
    FDQuery2.SQL.Text := 'INSERT INTO dependente (nome, idSocio) VALUES(:Nome, :idSocio)';
    FDQuery2.ParamByName('Nome').AsString := EDNameDependente.Text;
    if NomeSocio.Caption <> null then
    begin
      IDValue := DBGrid1.Fields[0].Value;
      FDQuery2.ParamByName('idSocio').AsInteger	:= IDValue;
      FDQuery2.ExecSQL;
      ShowMessage('Dependente cadastrado com sucesso!, exames gerados automaticamente!');
      GerarExame.SQL.Clear();
      GerarExame.SQL.Text := 'INSERT INTO examepele (datavencimento, nome) SELECT DATE_ADD(CURDATE(), INTERVAL 6 MONTH) AS datavencimento,     :Nome AS nome UNION ALL SELECT DATE_ADD(CURDATE(), INTERVAL 12 MONTH) AS datavencimento, :Nome AS nome;';
      GerarExame.ParamByName('Nome').AsString := EDNameDependente.Text;
      GerarExame.ExecSQL;
      Form1.FDExamesSQL.Refresh();
    end
    else
    begin
      ShowMessage('Nenhum Socio selecionado');
      FDQuery2.Close;
    end;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  FDQuery1.SQL.Text := 'SELECT * FROM socio WHERE nome LIKE :NomeCliente';
  FDQuery1.ParamByName('NomeCliente').AsString := '%' + EDNome.Text + '%';

  REQuery.DataSet := FDQuery1;
  FDQuery1.Open;
end;

procedure TForm3.DBGrid1CellClick(Column: TColumn);
begin
  NomeSocio.Caption := DBGrid1.Fields[1].Value;
end;

procedure TForm3.EDNameDependenteKeyPress(Sender: TObject; var Key: Char);
begin
if (Key in ['0'..'9']) then
  begin
    ShowMessage('N�o s�o permitidos n�meros no nome do dependente');
    Key := #0;
  end;
end;

end.
