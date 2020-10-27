unit BasicForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  DMX.Data.DataSetRepository;

type
  TForm3 = class(TForm)
    DataSetRepository1: TDataSetRepository;
    DataSetRepository1test: TStringField;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

end.
