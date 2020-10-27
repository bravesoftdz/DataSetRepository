object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 242
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 88
    Top = 80
    Width = 320
    Height = 120
    DataSource = DataSource1
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DataSetRepository1: TDataSetRepository
    DataSet.Active = True
    DataSet.FetchOptions.AssignedValues = [evMode]
    DataSet.FetchOptions.Mode = fmAll
    DataSet.ResourceOptions.AssignedValues = [rvSilentMode]
    DataSet.ResourceOptions.SilentMode = True
    DataSet.UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    DataSet.UpdateOptions.CheckRequired = False
    DataSet.UpdateOptions.AutoCommitUpdates = True
    Left = 64
    Top = 24
  end
  object DataSource1: TDataSource
    DataSet.Active = True
    DataSet.FetchOptions.AssignedValues = [evMode]
    DataSet.FetchOptions.Mode = fmAll
    DataSet.ResourceOptions.AssignedValues = [rvSilentMode]
    DataSet.ResourceOptions.SilentMode = True
    DataSet.UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    DataSet.UpdateOptions.CheckRequired = False
    DataSet.UpdateOptions.AutoCommitUpdates = True
    Left = 232
    Top = 128
  end
end
