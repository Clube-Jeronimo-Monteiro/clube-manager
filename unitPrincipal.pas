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
    FDQuery2: TFDQuery;
    FDTable1: TFDTable;
    DSTabelaMensalidade: TDataSource;
    Button1: TButton;
    GerarMensalidade: TFDQuery;
    dateInterval: TDateTimePicker;
    Label1: TLabel;
    DBGrid2: TDBGrid;
    DSTabelaExames: TDataSource;
    FDExames: TFDQuery;
    GerarExames: TFDQuery;
    BaixaExame: TFDQuery;
    procedure Socio1Click(Sender: TObject);
    procedure Socio2Click(Sender: TObject);
    procedure Socio3Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure dateIntervalCloseUp(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    property Query1: TFDQuery read FDQuery1;
    property FDExamesSQL: TFDQuery read FDExames;
    property FDBaixaExame: TFDQuery read BaixaExame;
    property SelectMensalidade: TFDQuery read FDQuery2;
    property FDGerarExames : TFDQuery read GerarExames;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses unitDM, unitCadastroSocio, unitCadastroDependente, unitManagerSocio, unitBaixaMensalidade, unitBaixaExame, DateUtils;



procedure TForm1.Button1Click(Sender: TObject);
begin
  GerarExames.ExecSQL;
  ShowMessage('Exames do mes geradas');
  FDQuery2.Refresh;
  FDExames.Refresh;
End;

procedure TForm1.dateIntervalCloseUp(Sender: TObject);
var
  dataSelecionada : TDate;
  dataFormatada : String;
begin
  dataSelecionada := dateInterval.Date;
  dataFormatada := FormatDateTime('yyyy-mm-dd', dataSelecionada);
  FDQuery2.Close;
  FDQuery2.SQL.Clear;
  FDQuery2.SQL.Add('SELECT * FROM `socio` JOIN `mensalidade` ON `socioid` = socio.id WHERE mensalidade.datavencimento >= :date');
  FDQuery2.Params.ParamByName('date').Value := dataFormatada;
  FDQuery2.Open;
end;

procedure TForm1.DBGrid1DblClick(Sender: TObject);
var
  Form5: TForm5;
begin
   if DBGrid1.SelectedRows.CurrentRowSelected then
begin
  Form5 := TForm5.Create(Application);
  Form5.DataVencimento := FDQuery2.FieldByName('datavencimento').AsDateTime;
  Form5.Valor := FDQuery2.FieldByName('valor').AsFloat;
  Form5.ID := FDQuery2.FieldByName('id_1').Value;
  Form5.ShowModal;
end;
end;

procedure TForm1.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  CurrentDate, CellDate: TDateTime;
begin
 if (Column.FieldName = 'status') then
begin
  if DSTabelaMensalidade.DataSet.FieldByName('status').IsNull then
  begin
    // Trate o caso em que o campo 'status' est� vazio (NULL)
    DBGrid1.Canvas.Brush.Color := clWhite; // Define a cor padr�o
    DBGrid1.Canvas.Font.Color := clBlack;   // Define a cor do texto (opcional)
  end
  else if DSTabelaMensalidade.DataSet.FieldByName('status').AsString = 'pendente' then
  begin
    DBGrid1.Canvas.Brush.Color := clYellow; // Define a cor amarela
    DBGrid1.Canvas.Font.Color := clBlack;   // Define a cor do texto (opcional)
  end
  else if DSTabelaMensalidade.DataSet.FieldByName('status').AsString = 'pago' then
  begin
    DBGrid1.Canvas.Brush.Color := clGreen; // Define a cor verde
    DBGrid1.Canvas.Font.Color := clBlack;   // Define a cor do texto (opcional)
  end;
end;

if (Column.FieldName = 'status') then
begin
  CurrentDate := Now;
  CellDate := DSTabelaMensalidade.DataSet.FieldByName('datavencimento').AsDateTime;
  if (CurrentDate > CellDate) and (DSTabelaMensalidade.DataSet.FieldByName('status').AsString = 'pendente') then
  begin
    DBGrid1.Canvas.Brush.Color := clRed; // Define a cor vermelha
    DBGrid1.Canvas.Font.Color := clWhite; // Define a cor do texto (opcional)
  end;
end;

DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
begin
try
  if Assigned(Column.Field) then
  begin
    if Column.Field.DataType in [ftString, ftInteger, ftDate, ftFloat] then
    begin
      if FDQuery2.IndexFieldNames = Column.FieldName then
        FDQuery2.IndexFieldNames := Column.FieldName + ' DESC'
      else
        FDQuery2.IndexFieldNames := Column.FieldName;
    end;
  end;
  except
  end;
end;


procedure TForm1.DBGrid2DblClick(Sender: TObject);
var
  Form6: TForm6;
begin
   if DBGrid2.SelectedRows.CurrentRowSelected then
begin
  Form6 := TForm6.Create(Application);
  Form6.DataVencimento := FDExames.FieldByName('datavencimento').AsDateTime;
  Form6.ID := FDExames.FieldByName('id').Value;
  Form6.ShowModal;
end;

end;

procedure TForm1.Socio1Click(Sender: TObject);
 var
  CadastroUsuarioForm: TForm2;
begin
  CadastroUsuarioForm := TForm2.Create(nil);
  try
    CadastroUsuarioForm.ShowModal;
  finally
    CadastroUsuarioForm.Free;
  end;
end;


procedure TForm1.Socio2Click(Sender: TObject);
 var
  CadastroUsuarioForm: TForm3;
begin
  CadastroUsuarioForm := TForm3.Create(nil);
  try
    CadastroUsuarioForm.ShowModal;
  finally
    CadastroUsuarioForm.Free;
  end;
end;

procedure TForm1.Socio3Click(Sender: TObject);
begin
  Form4.ShowModal;
end;

end.
