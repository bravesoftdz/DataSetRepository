unit DMX.Data.DSRepDataSets;

interface

uses
  System.Classes, Data.DB;

type
  TDataSetRepDataSet = class(TCollectionItem)
  private
    FDataSet: TDataSet;
    FDataName: string;
  published
    property DataSet: TDataSet read FDataSet write FDataSet;
    property DataName: string read FDataName write FDataName;
  end;

  TDataSetRepDataSets = class(TCollection)
  private
    function GetItems(AIndex: Integer): TDataSetRepDataSet;
    procedure SetItmes(AIndex: Integer; const Value: TDataSetRepDataSet);
  public
    function Add: TDataSetRepDataSet; overload;
    function Add(ADataName: string; ADataSet: TDataSet): TDataSetRepDataSet; overload;
    procedure Remove(ADataSet: TDataSet);
    function FindDataSet(const ADataName: string): TDataSetRepDataSet;
    property Items[AIndex: Integer]: TDataSetRepDataSet read GetItems write SetItmes; default;
  end;


implementation

{ TDataSetRepDataSets }

function TDataSetRepDataSets.Add(ADataName: string;
  ADataSet: TDataSet): TDataSetRepDataSet;
begin
  Result := Add;
  Result.DataName := ADataName;
  Result.DataSet := ADataSet;
end;

function TDataSetRepDataSets.FindDataSet(const ADataName: string): TDataSetRepDataSet;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Count - 1 do
    if Items[I].DataName = ADataName then
      Exit(Items[I]);
end;

function TDataSetRepDataSets.Add: TDataSetRepDataSet;
begin
  Result := TDataSetRepDataSet(inherited Add);
end;

function TDataSetRepDataSets.GetItems(AIndex: Integer): TDataSetRepDataSet;
begin
  Result := TDataSetRepDataSet(inherited Items[AIndex]);
end;

procedure TDataSetRepDataSets.Remove(ADataSet: TDataSet);
var
  I: Integer;
begin
  for I := Count - 1 downto 0 do
  begin
    if Items[I].DataSet = ADataSet then
    begin
      Items[I].DataSet := nil;
      Items[I].Free;
    end;
  end;
end;

procedure TDataSetRepDataSets.SetItmes(AIndex: Integer;
  const Value: TDataSetRepDataSet);
begin
  inherited Items[AIndex] := Value;
end;

end.
