unit DSRepReg;

interface

uses
  SysUtils, Classes, DesignIntf, DSDesign, DesignEditors;


{ TODO : Go to Design Package after completion }

type
  TDataSetRepEditor = class(TComponentEditor)
  protected
    function GetDSDesignerClass: TDSDesignerClass; virtual;
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

procedure Register;

implementation

uses
  DsnDBCst,
  DMX.Data.DataSetRepository;


{ TDataSetEditor }

procedure TDataSetRepEditor.ExecuteVerb(Index: Integer);
begin
  if Index = 0 then
    ShowFieldsEditor(Designer, TDataSetRepository(Component).DataSet, GetDSDesignerClass);
end;

function TDataSetRepEditor.GetDSDesignerClass: TDSDesignerClass;
begin
  Result := TDSDesigner;
end;

function TDataSetRepEditor.GetVerb(Index: Integer): string;
begin
  Result := SDatasetDesigner;
end;

function TDataSetRepEditor.GetVerbCount: Integer;
begin
  // Sub components can't persiste fields, only owner
  if not (csSubComponent in Component.ComponentStyle) then
    Result := 1
  else
    Result := 0
end;

{ TDataSetRepMgrProperty }
type
  TDataSetRepMgrProperty = class(TComponentProperty)
  private
    FCheckProc: TGetStrProc;
    procedure CheckComponent(const Value: string);
  public
    procedure GetValues(Proc: TGetStrProc); override;
  end;

procedure TDataSetRepMgrProperty.CheckComponent(const Value: string);
begin
end;

procedure TDataSetRepMgrProperty.GetValues(Proc: TGetStrProc);
begin
end;


const
  DEVMAX_DATA_COMP = 'DevMax Datas';

procedure Register;
begin
  RegisterComponents(DEVMAX_DATA_COMP, [TDataSetRepository]);

  RegisterPropertyEditor(TypeInfo(TDataSetRepManager), TDataSetRepository, 'Manager', TDataSetRepMgrProperty);

  RegisterComponentEditor(TDataSetRepository, TDataSetRepEditor);
end;


end.
