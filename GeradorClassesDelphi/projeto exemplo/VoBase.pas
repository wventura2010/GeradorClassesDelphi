unit VoBase;

interface

type
  TVoBase = class
  private
    FTag: integer;
  public
  constructor Create;
  property Tag: integer read FTag write FTag;
  end;


implementation

{ TVoBase }

constructor TVoBase.Create;
begin
  Tag := 0;
end;

end.
