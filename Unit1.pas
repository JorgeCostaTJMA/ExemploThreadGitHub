unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    procedure EncerraThread(Sender: Tobject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.EncerraThread(Sender : Tobject);
begin
  // Verificando se deu erro na Thread
  if Sender is TThread then
  begin
    if Assigned(TThread(Sender).FatalException) then
    begin
      ShowMessage(Exception(Tthread(Sender).FatalException).Message);
      exit;
    end;

  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var t : TThread;
begin

  t := TThread.CreateAnonymousThread(procedure
      var
        i : integer;
      begin
          //strToInt('A');

          for I := 1 to 10 do
          begin
            sleep(250);
            label1.Text := i.ToString;
          end;
      end);

  t.OnTerminate := EncerraThread;
  t.Start;
end;

end.
