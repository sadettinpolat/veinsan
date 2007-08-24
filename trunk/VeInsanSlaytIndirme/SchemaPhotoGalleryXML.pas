
{******************************************************************************************************}
{                                                                                                      }
{                                       Delphi XML Data Binding                                        }
{                                                                                                      }
{         Generated on: 23.08.2007 02:11:58                                                            }
{       Generated from: F:\Developers\#MyProject\VeInsan\VeInsan v.2.1\flash sunum\photo_gallery.xml   }
{   Settings stored in: F:\Developers\#MyProject\VeInsan\VeInsan v.2.1\flash sunum\photo_gallery.xdb   }
{                                                                                                      }
{******************************************************************************************************}
unit SchemaPhotoGalleryXML;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLGalleryType = interface;
  IXMLConfType = interface;
  IXMLSoundType = interface;
  IXMLCueType = interface;
  IXMLCueTypeList = interface;

{ IXMLGalleryType }

  IXMLGalleryType = interface(IXMLNode)
    ['{2BFBA9CA-5B35-4E67-96C9-603CB8727668}']
    { Property Accessors }
    function Get_Conf: IXMLConfType;
    function Get_Sound: IXMLSoundType;
    function Get_Cue: IXMLCueTypeList;
    { Methods & Properties }
    property Conf: IXMLConfType read Get_Conf;
    property Sound: IXMLSoundType read Get_Sound;
    property Cue: IXMLCueTypeList read Get_Cue;
  end;

{ IXMLConfType }

  IXMLConfType = interface(IXMLNode)
    ['{BC1A2FC8-3518-4FEB-A92E-79D08C2CC3FE}']
    { Property Accessors }
    function Get_Header: WideString;
    function Get_ImgFolder: WideString;
    procedure Set_Header(Value: WideString);
    procedure Set_ImgFolder(Value: WideString);
    { Methods & Properties }
    property Header: WideString read Get_Header write Set_Header;
    property ImgFolder: WideString read Get_ImgFolder write Set_ImgFolder;
  end;

{ IXMLSoundType }

  IXMLSoundType = interface(IXMLNode)
    ['{B54C45DA-1D40-4529-BFC4-EA6A3CC43025}']
    { Property Accessors }
    function Get_File_: WideString;
    function Get_AutoPlay: WideString;
    procedure Set_File_(Value: WideString);
    procedure Set_AutoPlay(Value: WideString);
    { Methods & Properties }
    property File_: WideString read Get_File_ write Set_File_;
    property AutoPlay: WideString read Get_AutoPlay write Set_AutoPlay;
  end;

{ IXMLCueType }

  IXMLCueType = interface(IXMLNode)
    ['{868EE8FC-9440-441A-8E77-47F99DEFDEF9}']
    { Property Accessors }
    function Get_Start: WideString;
    function Get_Name: WideString;
    function Get_Header: WideString;
    function Get_Info: WideString;
    function Get_Source: WideString;
    procedure Set_Start(Value: WideString);
    procedure Set_Name(Value: WideString);
    procedure Set_Header(Value: WideString);
    procedure Set_Info(Value: WideString);
    procedure Set_Source(Value: WideString);
    { Methods & Properties }
    property Start: WideString read Get_Start write Set_Start;
    property Name: WideString read Get_Name write Set_Name;
    property Header: WideString read Get_Header write Set_Header;
    property Info: WideString read Get_Info write Set_Info;
    property Source: WideString read Get_Source write Set_Source;
  end;

{ IXMLCueTypeList }

  IXMLCueTypeList = interface(IXMLNodeCollection)
    ['{F6CB214A-6776-4CCC-9D80-15AC4E349772}']
    { Methods & Properties }
    function Add: IXMLCueType;
    function Insert(const Index: Integer): IXMLCueType;
    function Get_Item(Index: Integer): IXMLCueType;
    property Items[Index: Integer]: IXMLCueType read Get_Item; default;
  end;

{ Forward Decls }

  TXMLGalleryType = class;
  TXMLConfType = class;
  TXMLSoundType = class;
  TXMLCueType = class;
  TXMLCueTypeList = class;

{ TXMLGalleryType }

  TXMLGalleryType = class(TXMLNode, IXMLGalleryType)
  private
    FCue: IXMLCueTypeList;
  protected
    { IXMLGalleryType }
    function Get_Conf: IXMLConfType;
    function Get_Sound: IXMLSoundType;
    function Get_Cue: IXMLCueTypeList;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLConfType }

  TXMLConfType = class(TXMLNode, IXMLConfType)
  protected
    { IXMLConfType }
    function Get_Header: WideString;
    function Get_ImgFolder: WideString;
    procedure Set_Header(Value: WideString);
    procedure Set_ImgFolder(Value: WideString);
  end;

{ TXMLSoundType }

  TXMLSoundType = class(TXMLNode, IXMLSoundType)
  protected
    { IXMLSoundType }
    function Get_File_: WideString;
    function Get_AutoPlay: WideString;
    procedure Set_File_(Value: WideString);
    procedure Set_AutoPlay(Value: WideString);
  end;

{ TXMLCueType }

  TXMLCueType = class(TXMLNode, IXMLCueType)
  protected
    { IXMLCueType }
    function Get_Start: WideString;
    function Get_Name: WideString;
    function Get_Header: WideString;
    function Get_Info: WideString;
    function Get_Source: WideString;
    procedure Set_Start(Value: WideString);
    procedure Set_Name(Value: WideString);
    procedure Set_Header(Value: WideString);
    procedure Set_Info(Value: WideString);
    procedure Set_Source(Value: WideString);
  end;

{ TXMLCueTypeList }

  TXMLCueTypeList = class(TXMLNodeCollection, IXMLCueTypeList)
  protected
    { IXMLCueTypeList }
    function Add: IXMLCueType;
    function Insert(const Index: Integer): IXMLCueType;
    function Get_Item(Index: Integer): IXMLCueType;
  end;

{ Global Functions }

function Getgallery(Doc: IXMLDocument): IXMLGalleryType;
function Loadgallery(const FileName: WideString): IXMLGalleryType;
function Newgallery: IXMLGalleryType;

implementation

{ Global Functions }

function Getgallery(Doc: IXMLDocument): IXMLGalleryType;
begin
  Result := Doc.GetDocBinding('gallery', TXMLGalleryType) as IXMLGalleryType;
end;
function Loadgallery(const FileName: WideString): IXMLGalleryType;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('gallery', TXMLGalleryType) as IXMLGalleryType;
end;

function Newgallery: IXMLGalleryType;
begin
  Result := NewXMLDocument.GetDocBinding('gallery', TXMLGalleryType) as IXMLGalleryType;
end;

{ TXMLGalleryType }

procedure TXMLGalleryType.AfterConstruction;
begin
  RegisterChildNode('conf', TXMLConfType);
  RegisterChildNode('sound', TXMLSoundType);
  RegisterChildNode('cue', TXMLCueType);
  FCue := CreateCollection(TXMLCueTypeList, IXMLCueType, 'cue') as IXMLCueTypeList;
  inherited;
end;

function TXMLGalleryType.Get_Conf: IXMLConfType;
begin
  Result := ChildNodes['conf'] as IXMLConfType;
end;

function TXMLGalleryType.Get_Sound: IXMLSoundType;
begin
  Result := ChildNodes['sound'] as IXMLSoundType;
end;

function TXMLGalleryType.Get_Cue: IXMLCueTypeList;
begin
  Result := FCue;
end;

{ TXMLConfType }

function TXMLConfType.Get_Header: WideString;
begin
  Result := AttributeNodes['header'].Text;
end;

procedure TXMLConfType.Set_Header(Value: WideString);
begin
  SetAttribute('header', Value);
end;

function TXMLConfType.Get_ImgFolder: WideString;
begin
  Result := AttributeNodes['imgFolder'].Text;
end;

procedure TXMLConfType.Set_ImgFolder(Value: WideString);
begin
  SetAttribute('imgFolder', Value);
end;

{ TXMLSoundType }

function TXMLSoundType.Get_File_: WideString;
begin
  Result := AttributeNodes['file'].Text;
end;

procedure TXMLSoundType.Set_File_(Value: WideString);
begin
  SetAttribute('file', Value);
end;

function TXMLSoundType.Get_AutoPlay: WideString;
begin
  Result := AttributeNodes['autoPlay'].Text;
end;

procedure TXMLSoundType.Set_AutoPlay(Value: WideString);
begin
  SetAttribute('autoPlay', Value);
end;

{ TXMLCueType }

function TXMLCueType.Get_Start: WideString;
begin
  Result := AttributeNodes['start'].Text;
end;

procedure TXMLCueType.Set_Start(Value: WideString);
begin
  SetAttribute('start', Value);
end;

function TXMLCueType.Get_Name: WideString;
begin
  Result := AttributeNodes['name'].Text;
end;

procedure TXMLCueType.Set_Name(Value: WideString);
begin
  SetAttribute('name', Value);
end;

function TXMLCueType.Get_Header: WideString;
begin
  Result := AttributeNodes['header'].Text;
end;

procedure TXMLCueType.Set_Header(Value: WideString);
begin
  SetAttribute('header', Value);
end;

function TXMLCueType.Get_Info: WideString;
begin
  Result := AttributeNodes['info'].Text;
end;

procedure TXMLCueType.Set_Info(Value: WideString);
begin
  SetAttribute('info', Value);
end;

function TXMLCueType.Get_Source: WideString;
begin
  Result := AttributeNodes['source'].Text;
end;

procedure TXMLCueType.Set_Source(Value: WideString);
begin
  SetAttribute('source', Value);
end;

{ TXMLCueTypeList }

function TXMLCueTypeList.Add: IXMLCueType;
begin
  Result := AddItem(-1) as IXMLCueType;
end;

function TXMLCueTypeList.Insert(const Index: Integer): IXMLCueType;
begin
  Result := AddItem(Index) as IXMLCueType;
end;

function TXMLCueTypeList.Get_Item(Index: Integer): IXMLCueType;
begin
  Result := List[Index] as IXMLCueType;
end;

end.
