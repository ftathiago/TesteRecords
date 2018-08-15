unit uManagedRecord;

interface

type
  ManagedRecord = record
  private
    FVariavelDeObjeto: TObject;
    FVariavelString: string;
    FVariavelInteger: integer;
    procedure SetVariavelDeObjeto(const Value: TObject);
    procedure SetVariavelInteger(const Value: integer);
    procedure SetVariavelString(const Value: string);
  public
    constructor Create(const AValorInicial: integer);
    class operator Add(ARight: ManagedRecord; ALeft: integer): integer;
    property VariavelDeObjeto: TObject read FVariavelDeObjeto
      write SetVariavelDeObjeto;
    property VariavelString: string read FVariavelString
      write SetVariavelString;
    property VariavelInteger: integer read FVariavelInteger
      write SetVariavelInteger;
  end;

  NormalRecord = record
    VariavelDeObjeto: TObject;
    VariavelString: string;
    VariavelInteger: string;
  end;

implementation

uses
  System.StrUtils, System.SysUtils;

{ ManagedRecord }

class operator ManagedRecord.Add(ARight: ManagedRecord; ALeft: integer)
  : integer;
begin
  result := ARight.VariavelInteger + ALeft;
end;

constructor ManagedRecord.Create(const AValorInicial: integer);
begin
  inherited;
  FVariavelDeObjeto := nil;
  FVariavelString := EmptyStr;
  FVariavelInteger := 0;
end;

procedure ManagedRecord.SetVariavelDeObjeto(const Value: TObject);
begin
  FVariavelDeObjeto := Value;
end;

procedure ManagedRecord.SetVariavelInteger(const Value: integer);
begin
  FVariavelInteger := Value;
end;

procedure ManagedRecord.SetVariavelString(const Value: string);
begin
  FVariavelString := Value;
end;

end.
