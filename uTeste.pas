unit uTeste;

interface
uses uManagedRecord, uNullable;
type
  TTeste = class
  private
    FCampoNull: Nullable<TObject>;
    procedure SetCampoNull(const Value: Nullable<TObject>);
  published
    property CampoNull: Nullable<TObject> read FCampoNull write SetCampoNull;
  end;

implementation


{ TTeste }

procedure TTeste.SetCampoNull(const Value: Nullable<TObject>);
begin
  FCampoNull := Value;
end;

end.
