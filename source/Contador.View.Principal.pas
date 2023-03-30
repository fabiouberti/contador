unit Contador.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  System.ImageList, Vcl.ImgList;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Label5: TLabel;
    ImageList1: TImageList;
    imgDia1: TImage;
    imgHora2: TImage;
    imgHora1: TImage;
    imgMin2: TImage;
    imgMin1: TImage;
    imgSec2: TImage;
    imgSec1: TImage;
    imgDia2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure CalculaTempo(const ADataFinal: TDateTime);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  System.DateUtils;

procedure TForm1.CalculaTempo(const ADataFinal: TDateTime);
var
  DataFim, DataDif: TDateTime;
  Dia1, Dia2: Integer;
  Hora1, Hora2: Integer;
  Minuto1, Minuto2: Integer;
  Segundo1, Segundo2: Integer;
  DiasStr: string;
begin
  DataFim := EncodeDateTime(2022, 08, 05, 18,00,00,00);
  DataDif := DataFim - Now;
  //ShowMessage(FormatDateTime('dd',DataDif));

    DiasStr := DaysBetween(Now, DataFim).ToString;
  if DaysBetween(Now, DataFim) < 10 then
    DiasStr := '0' + DiasStr;


  Dia1 := StrToInt(Copy(DiasStr,2,1));
  Dia2 := StrToInt(Copy(DiasStr,1,1));
  Hora1 := StrToInt(Copy(FormatDateTime('hh',DataDif),2,1));
  Hora2 := StrToInt(Copy(FormatDateTime('hh',DataDif),1,1));
  Minuto1 := StrToInt(Copy(FormatDateTime('nn',DataDif),2,1));
  Minuto2 := StrToInt(Copy(FormatDateTime('nn',DataDif),1,1));
  Segundo1 := StrToInt(Copy(FormatDateTime('ss',DataDif),2,1));
  Segundo2 := StrToInt(Copy(FormatDateTime('ss',DataDif),1,1));

  imgDia2.Picture := nil;
  imgDia1.Picture := nil;
  imgHora2.Picture := nil;
  imgHora1.Picture := nil;
  imgMin2.Picture := nil;
  imgMin1.Picture := nil;
  imgSec2.Picture := nil;
  imgSec1.Picture := nil;

  ImageList1.GetBitmap(Dia2, imgDia2.Picture.Bitmap);
  ImageList1.GetBitmap(Dia1, imgDia1.Picture.Bitmap);
  ImageList1.GetBitmap(Hora2, imgHora2.Picture.Bitmap);
  ImageList1.GetBitmap(Hora1, imgHora1.Picture.Bitmap);
  ImageList1.GetBitmap(Minuto2, imgMin2.Picture.Bitmap);
  ImageList1.GetBitmap(Minuto1, imgMin1.Picture.Bitmap);
  ImageList1.GetBitmap(Segundo2, imgSec2.Picture.Bitmap);
  ImageList1.GetBitmap(Segundo1, imgSec1.Picture.Bitmap);

end;

procedure TForm1.FormDblClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  CalculaTempo(now);
end;

end.
