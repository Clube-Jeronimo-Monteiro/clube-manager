unit unitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    MainMenu1: TMainMenu;
    Cadastrar1: TMenuItem;
    Socio1: TMenuItem;
    Socio2: TMenuItem;
    Editar1: TMenuItem;
    Socio3: TMenuItem;
    Dependente1: TMenuItem;
    DBGrid1: TDBGrid;
    dbConnection: TFDConnection;
    FDTableMensalidade: TFDTable;
    DSMensalidade: TDataSource;
    FDQuery1: TFDQuery;
    procedure Socio1Click(Sender: TObject);
    procedure Socio2Click(Sender: TObject);
    procedure Socio3Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses unitDM, unitCadastroSocio, unitCadastroDependente, unitManagerSocio;

procedure TForm1.DBGrid1DblClick(Sender: TObject);
begin
   if DBGrid1.SelectedRows.CurrentRowSelected then
begin
    if (FDQuery1.Active) then
    begin
      // Use FieldByName para acessar o valor da coluna "id"
      ShowMessage('Valor da coluna "id": ' + FDQuery1.FieldByName('id').AsString);
    end;
end
else
begin

  ShowMessage('Nenhuma linha selecionada.');
end;
end;

procedure TForm1.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  CurrentDate, CellDate: TDateTime;
begin

// Verifica se o campo na coluna � nulo
  if (Column.FieldName = 'status') and (DSMensalidade.DataSet.FieldByName('status').AsString = 'pendente') then
  begin
    DBGrid1.Canvas.Brush.Color := clYellow; // Define a cor laranja
    DBGrid1.Canvas.Font.Color := clBlack;   // Define a cor do texto (opcional)
  end;
  if (Column.FieldName = 'status') and (DSMensalidade.DataSet.FieldByName('status').AsString = 'pago') then
  begin
    DBGrid1.Canvas.Brush.Color := clGreen; // Define a cor laranja
    DBGrid1.Canvas.Font.Color := clBlack;   // Define a cor do texto (opcional)
  end;
  if Column.FieldName = 'status' then
  begin
    CurrentDate := Now;
    CellDate := DSMensalidade.DataSet.FieldByName('datavencimento').AsDateTime;
    if (CurrentDate > CellDate) and (DSMensalidade.DataSet.FieldByName('status').AsString = 'pendente') then
    begin
      DBGrid1.Canvas.Brush.Color := clRed; // Define a cor vermelha
      DBGrid1.Canvas.Font.Color := clWhite; // Define a cor do texto (opcional)
    end;
  end;


  // Desenha a c�lula
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm1.Socio1Click(Sender: TObject);
begin
  Form2.ShowModal;
end;

procedure TForm1.Socio2Click(Sender: TObject);
begin
  Form3.ShowModal;
end;

procedure TForm1.Socio3Click(Sender: TObject);
begin
  Form4.ShowModal;
end;

end.
