program Project1;

uses
  Forms,
  KG_Prj in 'KG_Prj.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'KassGraf :: SPS ::';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
