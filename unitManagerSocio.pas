unit unitManagerSocio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  TForm4 = class(TForm)
    DBGrid1: TDBGrid;
    EDName: TEdit;
    EDCode: TEdit;
    GroupBox1: TGroupBox;
    GroupBox3: TGroupBox;
    EDRua: TEdit;
    EDBairro: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    EDNumero: TEdit;
    Label3: TLabel;
    Button3: TButton;
    Button1: TButton;
    Label4: TLabel;
    Label5: TLabel;
    FDConnection1: TFDConnection;
    FDTable1: TFDTable;
    dsSocio: TDataSource;
    EDTelefone: TEdit;
    Label6: TLabel;
    FDQuery1: TFDQuery;
    Button2: TButton;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin
  FDQuery1.Params.Clear;
  FDQuery1.SQL.Text := 'DELETE FROM socio WHERE codSocio = :codSocio LIMIT 1';
  FDQuery1.ParamByName('codSocio').AsInteger := StrToInt(EDCode.Text);
  FDQuery1.ExecSQL;
  ShowMessage('Socio removido com sucesso!');
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  FDQuery1.Params.Clear;
  FDQuery1.SQL.Text := 'UPDATE socio SET codSocio=:Codigo LIMIT 1';
  FDQuery1.ParamByName('Codigo').AsInteger := StrToInt(EDCode.Text);
  FDQuery1.ExecSQL;
  ShowMessage('Codigo alterado!');
end;

procedure TForm4.Button3Click(Sender: TObject);
begin
  FDQuery1.Params.Clear;
  FDQuery1.SQL.Text := 'UPDATE socio SET nome=:Nome, telefone=:Telefone, bairro=:Bairro, rua=:Rua, numero=:Numero LIMIT 1';
  FDQuery1.ParamByName('Nome').Value := EDName.Text;
  FDQuery1.ParamByName('Telefone').Value := EDTelefone.Text;
  FDQuery1.ParamByName('Numero').Value := EDNumero.Text;
  FDQuery1.ParamByName('Bairro').Value := EDBairro.Text;
  FDQuery1.ParamByName('Rua').Value := EDRua.Text;

  FDQuery1.ExecSQL;
  ShowMessage('Dados atualizado!');
end;

procedure TForm4.DBGrid1CellClick(Column: TColumn);

begin
  EDName.Text :=  DBGrid1.Fields[1].Value;
  EDCode.Text :=  DBGrid1.Fields[2].Value;
  EDTelefone.Text :=  DBGrid1.Fields[3].Value;
  EDBairro.Text := DBGrid1.Fields[4].Value;
  EDRua.Text := DBGrid1.Fields[5].Value;
  EDNumero.Text := DBGrid1.Fields[6].Value;
end;

procedure TForm4.DBGrid1TitleClick(Column: TColumn);
var
i:integer;
begin
  for i := 0 to DBGrid1.Columns.Count -1 do
    DBGrid1.Columns[i].Title.Font.Style := [];
    TFDQuery(DBGrid1.DataSource.DataSet).IndexFieldNames := Column.FieldName;
    Column.Title.Font.Style := [fsBold];
end;

end.
