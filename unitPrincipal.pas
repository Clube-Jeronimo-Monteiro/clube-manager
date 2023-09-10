unit unitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls;

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
    procedure Socio1Click(Sender: TObject);
    procedure Socio2Click(Sender: TObject);
    procedure Socio3Click(Sender: TObject);
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
