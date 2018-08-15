program ManagedRecord;

uses
  Vcl.Forms,
  formTerminal in 'formTerminal.pas' {Form1},
  uManagedRecord in 'uManagedRecord.pas',
  uNullable in 'uNullable.pas',
  uTeste in 'uTeste.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
