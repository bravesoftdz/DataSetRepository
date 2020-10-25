unit DMX.Data.DataSetRepository;

interface

uses
  System.Classes,
  System.Generics.Collections,
  DMX.Data.VirtualDataSet,
  DMX.Data.DSRepDataSets;

type
  TDataSetRepManager = class;
  TDataSetRepService = class;

  TDataSetRepository = class(TComponent)
  private
    FDataSet: TVirtualDataSet;
    FDataName: string;
    FManager: TDataSetRepManager;
  published
    property DataName: string read FDataName write FDataName;
    property DataSet: TVirtualDataSet read FDataSet write FDataSet;
    property Manager: TDataSetRepManager read FManager write FManager;
  end;

  TDataSetRepManager = class(TComponent)
  private
    FActiveService: TDataSetRepService;
    FServices: TList<TDataSetRepService>;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure RegistService(AService: TDataSetRepService);
    procedure UnregistService(AService: TDataSetRepService);
  published
    property ActiveService: TDataSetRepService read FActiveService write FActiveService;
  end;

  TDataSetRepService = class(TComponent)
  private
    FManager: TDataSetRepManager;
    procedure SetManager(const Value: TDataSetRepManager);
  published
    property Manager: TDataSetRepManager read FManager write SetManager;
  end;

  TDataSetRepDAOs = class(TComponent)
  private
    FService: TDataSetRepService;
    FDataSets: TDataSetRepDataSets;
  published
    property Service: TDataSetRepService read FService write FService;
    property DataSets: TDataSetRepDataSets read FDataSets write FDataSets;
  end;

implementation

{ TDataSetRepService }

procedure TDataSetRepService.SetManager(const Value: TDataSetRepManager);
begin
  if FManager = Value then
    Exit;

  if Assigned(FManager) then
    FManager.UnregistService(Self);



  FManager := Value;
end;

{ TDataSetRepManager }

constructor TDataSetRepManager.Create(AOwner: TComponent);
begin
  inherited;

  FServices := TList<TDataSetRepService>.Create;
end;

destructor TDataSetRepManager.Destroy;
begin
  FServices.Clear;
  FServices.Free;

  inherited;
end;

procedure TDataSetRepManager.RegistService(AService: TDataSetRepService);
begin
  FServices.Add(AService);
end;

procedure TDataSetRepManager.UnregistService(AService: TDataSetRepService);
begin
  FServices.Remove(AService);
end;

end.
