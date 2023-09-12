program Clube_Manager;

uses
  Vcl.Forms,
  unitPrincipal in 'unitPrincipal.pas' {Form1},
  unitDM in 'unitDM.pas' {DM: TDataModule},
  unitCadastroSocio in 'unitCadastroSocio.pas' {Form2},
  unitCadastroDependente in 'unitCadastroDependente.pas' {Form3},
  unitManagerSocio in 'unitManagerSocio.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
