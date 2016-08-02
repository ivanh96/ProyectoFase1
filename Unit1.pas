unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Shape1: TShape;
    OpenDialog1: TOpenDialog;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  lab:array[1..1000] of string;
  a:textfile;
  p:integer;
  band:boolean;

implementation

{$R *.dfm}
//INICIALIZAR------------------------------------------------
procedure ini;
var x,y:integer;
begin
if form1.opendialog1.execute then
  begin
    assignfile(a,form1.opendialog1.filename);
    reset(a);
    p:=0;
    while not eof(a) do
      begin
        inc(p);
        readln(a,lab[p]);
      end;

    for y := 1 to p do
      for x := 1 to length(lab[y]) do
      begin
        if lab[y][x]<>' ' then
          begin
            form1.Image1.Canvas.Brush.Color:=clblue;
            form1.Image1.Canvas.Rectangle((x-1)*10,(y-1)*10,x*10,y*10);
          end;

        if lab[y][x]='*' then
          begin
            form1.Image1.Canvas.Brush.Color:=ClYellow;
            form1.Image1.Canvas.Rectangle((x-1)*10,(y-1)*10,x*10,y*10);
          end;
      end;

  closefile(a);
  end;
end;

//MOVER------------------------------------------------------
procedure mover(x,y:integer);
begin
  Application.ProcessMessages;
  Sleep(50);
  form1.Shape1.Left:=(x-1)*10;
  form1.Shape1.Top:=(y-1)*10;
end;

//BUSCAR-----------------------------------------------------
procedure busca(x,y:integer);

begin


  if lab[y][x]='*' then
   band:=true
   else
     if lab[y][x]=' ' then
     Begin
       lab[y][x]:='.';
       mover(x,y);
       if not band then busca(x,y+1);
       if not band then busca(x-1,y);
       if not band then busca(x+1,y);
       if not band then busca(x,y-1);
       if not band then mover(x,y);
     End;

end;

  {if lab[y][x]='*' then
   band:=true
   else
     if lab[y][x]=' ' then
     Begin
       lab[y][x]:='.';
       mover(x,y);
       if not band then busca(x,y+1);
       if not band then busca(x-1,y);
       if not band then busca(x+1,y);
       if not band then busca(x,y-1);
       mover(x,y);
     End;  }





procedure TForm1.Button1Click(Sender: TObject);
var x,y:integer;
begin
busca(2,2);

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ini;
  form1.Shape1.Brush.Color:=clred;
  form1.Shape1.Left:=10;
  form1.Shape1.Top:=10;
  form1.Shape1.Width:=10;
  form1.Shape1.Height:=10;
end;

end.
