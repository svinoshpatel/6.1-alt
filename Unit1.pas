unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TVehicle = class
  private
    FName: String;
  public
    constructor Create(AName: String);
    property Name: String read FName;
  end;

  TCar = class(TVehicle)
  private
    FDoors: Integer;
  public
    constructor Create(AName: String; ADoors: Integer);
    property Doors: Integer read FDoors;
  end;

  TBicycle = class(TVehicle)
  private
    FBrakeType: String;
  public
    constructor Create(AName: String; ABrakeType: String);
    property BrakeType: String read FBrakeType;
  end;

  TForm1 = class(TForm)
    EditName: TEdit;
    ButtonCar: TButton;
    ButtonBicycle: TButton;
    LabelResult: TLabel;
    EditExtra: TEdit;
    LabelExtra: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ButtonCarClick(Sender: TObject);
    procedure ButtonBicycleClick(Sender: TObject);
  private
    vehicle: TVehicle;
    procedure UpdateResult;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TVehicle }
constructor TVehicle.Create(AName: String);
begin
  FName := AName;
end;

{ TCar }
constructor TCar.Create(AName: String; ADoors: Integer);
begin
  inherited Create(AName);
  FDoors := ADoors;
end;

{ TBicycle }
constructor TBicycle.Create(AName: String; ABrakeType: String);
begin
  inherited Create(AName);
  FBrakeType := ABrakeType;
end;

{ TForm1 }
procedure TForm1.FormCreate(Sender: TObject);
begin
  vehicle := nil;
  LabelResult.Caption := 'Результат: транспорт не створено';
  LabelExtra.Caption := 'Додатково (двері/гальма):';
end;

procedure TForm1.ButtonCarClick(Sender: TObject);
var
  doors: Integer;
begin
  if not TryStrToInt(EditExtra.Text, doors) then
    doors := 4; // За замовчуванням 4 двері
  if Assigned(vehicle) then
    vehicle.Free;
  vehicle := TCar.Create(Trim(EditName.Text), doors);
  UpdateResult;
end;

procedure TForm1.ButtonBicycleClick(Sender: TObject);
begin
  if Assigned(vehicle) then
    vehicle.Free;
  vehicle := TBicycle.Create(Trim(EditName.Text), Trim(EditExtra.Text));
  UpdateResult;
end;

procedure TForm1.UpdateResult;
var
  resultText: String;
begin
  if vehicle = nil then
  begin
    LabelResult.Caption := 'Результат: транспорт не створено';
    Exit;
  end;

  resultText := 'Результат: ' + vehicle.Name + ' - ';
  if vehicle is TVehicle then
    resultText := resultText + 'транспорт, ';

  if vehicle is TCar then
  begin
    resultText := resultText + 'автомобіль, ';
    resultText := resultText + 'двері: ' + IntToStr((vehicle as TCar).Doors);
  end
  else if vehicle is TBicycle then
  begin
    resultText := resultText + 'велосипед, ';
    resultText := resultText + 'гальма: ' + (vehicle as TBicycle).BrakeType;
  end;

  LabelResult.Caption := resultText;
end;

end.
