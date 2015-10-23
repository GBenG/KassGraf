unit KG_Prj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, XPMan, ComCtrls, Gauges;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Memo1: TMemo;
    Button1: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    GroupBox1: TGroupBox;
    XPManifest1: TXPManifest;
    TrackBar1: TTrackBar;
    Label_CString: TLabel;
    ProgConv: TGauge;
    procedure DrawGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure StringGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure TrackBar1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  table: array[1..60, 1..60] of Boolean;

implementation

{$R *.dfm}

procedure TForm1.DrawGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin

end;

///////////////////////////////////////////////////////////////////////////////////

procedure TForm1.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Col, Row : Integer;
  Sg : TStringGrid;
begin
 Sg := Sender as TStringGrid;
  //Определяем координаты ячейки, на которой произошёл щелчок мыши.
  Sg.MouseToCell(X, Y, Col, Row);
  //Если произошёл щелчок левой кнопкой мыши - устанавливаем флаг.
  if Button = mbLeft then begin
    //Под видом указателя на объект, который связан с ячейкой, записываем
    //значение флага. Значение флага, равное 1, означает, что цвет ячейки изменён.
    Sg.Rows[Row].Objects[Col] := TObject(1); //Или: := Pointer(1);
    table[Row,Col]:=true;
  //Если произошёл щелчок правой кнопкой мыши - сбрасываем флаг.
  end else if Button = mbRight then begin
    Sg.Rows[Row].Objects[Col] := TObject(0); //Или: := Pointer(0);
    table[Row,Col]:=false;
  end;
end;

///////////////////////////////////////////////////////////////////////////////////

//Обработчик, который вызывается при перерисовке ячейки.
procedure TForm1.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
type
  TSave = record
    FontColor : TColor;
    FontStyle : TFontStyles;
    BrColor : TColor;
  end;
var
  Sg : TStringGrid;
  Save : TSave;
  Flag : Integer;
begin
  Sg := Sender as TStringGrid;
  //Читаем значение флага, которое записано под видом указателя на объект.
  Flag := Integer(Sg.Rows[ARow].Objects[ACol]);
  //Если флаг не равен 1 - выходим.
  if Flag <> 1 then Exit;
  //В противном случае, изменяем цвет ячейки.
  with Sg.Canvas, Save do begin
    //Запоминаем параметры шрифта и кисти.
    FontColor := Font.Color;
    FontStyle := Font.Style;
    BrColor := Brush.Color;
 
    //Устанавливаем новые парметры.
 
    //Цвет шрифта - белый.
    Font.Color := RGB(255, 255, 255);
    //Стиль шрифта - жирный.
    Font.Style := Font.Style + [fsBold];
    //Цвет кисти - коричневый.
    Brush.Color := RGB(0, 0, 0);
 
    //Прорисовываем ячейку.
 
    //Заливаем квадрат ячейки цветом кисти.
    FillRect(Rect);
    //Прорисовываем в ячейке текст. Здесь +2 - так мы задаём ширину полей в ячейке.
    TextOut(Rect.Left + 2, Rect.Top + 2, Sg.Cells[ACol, ARow]);

    //Восстанавливаем прежние параметры канвы.
    Font.Color := FontColor;
    Font.Style := FontStyle;
    Brush.Color := BrColor;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  xy, cx,cy:Integer;
begin
Memo1.Lines.Clear;
ProgConv.MaxValue:=TrackBar1.position;
xy:=1;
cy:=1;
while cy < TrackBar1.position do
  begin
    while xy < 56 do
    begin
 {     Memo1.Lines.Add(inttostr(cy)+','+inttostr(xy)+' = '+booltostr(table[cy,xy]));
      Memo1.Lines.Add(inttostr(cy)+','+inttostr(xy+1)+' = '+booltostr(table[cy,xy+1]));
      Memo1.Lines.Add(inttostr(cy+1)+','+inttostr(xy)+' = '+booltostr(table[cy+1,xy]));
      Memo1.Lines.Add(inttostr(cy+1)+','+inttostr(xy+1)+' = '+booltostr(table[cy+1,xy+1]));
 }//     Memo1.Lines.Add('====================');

      if (table[cy,xy]=false) and (table[cy,xy+1]=false)  and (table[cy+1,xy]=false)  and (table[cy+1,xy+1]=false)  then Memo1.Lines[Memo1.Lines.Count-1]:=Memo1.Lines[Memo1.Lines.Count-1]+'127, ';
      if (table[cy,xy]=true)  and (table[cy,xy+1]=false)  and (table[cy+1,xy]=false)  and (table[cy+1,xy+1]=false)  then Memo1.Lines[Memo1.Lines.Count-1]:=Memo1.Lines[Memo1.Lines.Count-1]+'128, ';
      if (table[cy,xy]=true)  and (table[cy,xy+1]=false)  and (table[cy+1,xy]=true)   and (table[cy+1,xy+1]=false)  then Memo1.Lines[Memo1.Lines.Count-1]:=Memo1.Lines[Memo1.Lines.Count-1]+'129, ';
      if (table[cy,xy]=true)  and (table[cy,xy+1]=false)  and (table[cy+1,xy]=false)  and (table[cy+1,xy+1]=true)   then Memo1.Lines[Memo1.Lines.Count-1]:=Memo1.Lines[Memo1.Lines.Count-1]+'130, ';
      if (table[cy,xy]=true)  and (table[cy,xy+1]=false)  and (table[cy+1,xy]=true)   and (table[cy+1,xy+1]=true)   then Memo1.Lines[Memo1.Lines.Count-1]:=Memo1.Lines[Memo1.Lines.Count-1]+'131, ';
      if (table[cy,xy]=false) and (table[cy,xy+1]=true)   and (table[cy+1,xy]=false)  and (table[cy+1,xy+1]=false)  then Memo1.Lines[Memo1.Lines.Count-1]:=Memo1.Lines[Memo1.Lines.Count-1]+'132, ';
      if (table[cy,xy]=false) and (table[cy,xy+1]=true)   and (table[cy+1,xy]=true)   and (table[cy+1,xy+1]=false)  then Memo1.Lines[Memo1.Lines.Count-1]:=Memo1.Lines[Memo1.Lines.Count-1]+'133, ';
      if (table[cy,xy]=false) and (table[cy,xy+1]=true)   and (table[cy+1,xy]=false)  and (table[cy+1,xy+1]=true)   then Memo1.Lines[Memo1.Lines.Count-1]:=Memo1.Lines[Memo1.Lines.Count-1]+'134, ';
      if (table[cy,xy]=false) and (table[cy,xy+1]=true)   and (table[cy+1,xy]=true)   and (table[cy+1,xy+1]=true)   then Memo1.Lines[Memo1.Lines.Count-1]:=Memo1.Lines[Memo1.Lines.Count-1]+'135, ';
      if (table[cy,xy]=true)  and (table[cy,xy+1]=true)   and (table[cy+1,xy]=false)  and (table[cy+1,xy+1]=false)  then Memo1.Lines[Memo1.Lines.Count-1]:=Memo1.Lines[Memo1.Lines.Count-1]+'137, ';
      if (table[cy,xy]=true)  and (table[cy,xy+1]=true)   and (table[cy+1,xy]=true)   and (table[cy+1,xy+1]=false)  then Memo1.Lines[Memo1.Lines.Count-1]:=Memo1.Lines[Memo1.Lines.Count-1]+'138, ';
      if (table[cy,xy]=true)  and (table[cy,xy+1]=true)   and (table[cy+1,xy]=false)  and (table[cy+1,xy+1]=true)   then Memo1.Lines[Memo1.Lines.Count-1]:=Memo1.Lines[Memo1.Lines.Count-1]+'139, ';
      if (table[cy,xy]=true)  and (table[cy,xy+1]=true)   and (table[cy+1,xy]=true)   and (table[cy+1,xy+1]=true)   then Memo1.Lines[Memo1.Lines.Count-1]:=Memo1.Lines[Memo1.Lines.Count-1]+'140, ';
      if (table[cy,xy]=false) and (table[cy,xy+1]=false)  and (table[cy+1,xy]=true)   and (table[cy+1,xy+1]=false)  then Memo1.Lines[Memo1.Lines.Count-1]:=Memo1.Lines[Memo1.Lines.Count-1]+'141, ';
      if (table[cy,xy]=false) and (table[cy,xy+1]=false)  and (table[cy+1,xy]=false)  and (table[cy+1,xy+1]=true)   then Memo1.Lines[Memo1.Lines.Count-1]:=Memo1.Lines[Memo1.Lines.Count-1]+'142, ';
      if (table[cy,xy]=false) and (table[cy,xy+1]=false)  and (table[cy+1,xy]=true)   and (table[cy+1,xy+1]=true)   then Memo1.Lines[Memo1.Lines.Count-1]:=Memo1.Lines[Memo1.Lines.Count-1]+'143, ';
      xy:=xy+2;
    end;
  xy:=1;
  cy:=cy+2;
  ProgConv.Progress:=cy;
end;
Memo1.Lines[Memo1.Lines.Count-1]:=Memo1.Lines[Memo1.Lines.Count-1]+'0';  //Завершаем массив нулем чтоб всякая хрень не лезла
ProgConv.Progress:=0;
end;

procedure TForm1.StringGrid1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  Col, Row : Integer;
  Sg : TStringGrid;
begin
 Sg := Sender as TStringGrid;
  //Определяем координаты ячейки, на которой произошёл щелчок мыши.
  Sg.MouseToCell(X, Y, Col, Row);
  //Если произошёл щелчок левой кнопкой мыши - устанавливаем флаг.
   if GetKeyState(VK_CONTROL)<0 then begin
    //Под видом указателя на объект, который связан с ячейкой, записываем
    //значение флага. Значение флага, равное 1, означает, что цвет ячейки изменён.
    Sg.Rows[Row].Objects[Col] := TObject(1); //Или: := Pointer(1);
    table[Row,Col]:=true;
  //Если произошёл щелчок правой кнопкой мыши - сбрасываем флаг.
  end else  if GetKeyState(VK_SHIFT)<0 then begin
    Sg.Rows[Row].Objects[Col] := TObject(0); //Или: := Pointer(0);
    table[Row,Col]:=false;
  end;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
 Label_CString.Caption:=inttostr(TrackBar1.position-1);
 StringGrid1.Height:=785-(56-TrackBar1.position)*14;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  xy:Integer;
begin
    for xy := 1 to 56 do
    begin
      StringGrid1.Cols[xy].Clear;
      StringGrid1.Rows[xy].Clear;
    end;
end;

procedure TForm1.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
 CanSelect:=true;    // Запрещаем выделение ячеек
end;

end.
