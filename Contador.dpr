program Contador;

uses
  Vcl.Forms,
  Contador.View.Principal in 'source\Contador.View.Principal.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
