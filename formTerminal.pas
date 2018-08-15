unit formTerminal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, uManagedRecord,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Terminal: TMemo;
    btnEntrandoNoEscopo: TButton;
    btnTestarSoma: TButton;
    Button1: TButton;
    btnPassarObjParametro: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnEntrandoNoEscopoClick(Sender: TObject);
    procedure btnTestarSomaClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnPassarObjParametroClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
    procedure AdicionarAoTerminal(const AProcedimento,
      AComentario: string); overload;
    procedure AdicionarAoTerminal(const AButton: TButton;
      const AComentario: string); overload;
    procedure RecebeObjetoVar(var AManagedRecord: ManagedRecord);
    procedure RecebeObjetoConst(const AManagedRecord: ManagedRecord);
    procedure RecebeObjetoSemMarcar(AManagedRecord: ManagedRecord);
    procedure CopiaObjeto(AObjeto: TObject);
    procedure CopiaString(var AString: string);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  uNullable, uTeste;

procedure TForm1.btnEntrandoNoEscopoClick(Sender: TObject);
var
  _managedRecord: ManagedRecord;
begin
  if not Assigned(_managedRecord.VariavelDeObjeto) then
    AdicionarAoTerminal(Sender as TButton,
      'Variável de objeto não inicializada');
end;

procedure TForm1.btnTestarSomaClick(Sender: TObject);
var
  _managedRecord: ManagedRecord;
begin
  _managedRecord.VariavelInteger := _managedRecord + 10;
  AdicionarAoTerminal(Sender as TButton, Format('Valor da variavel inteira: %d',
    [_managedRecord.VariavelInteger]));
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  _managedRecord: ManagedRecord;
begin
  _managedRecord := ManagedRecord.Create(1);
  _managedRecord.VariavelInteger := _managedRecord + 10;
  AdicionarAoTerminal(Sender as TButton, Format('Valor da variavel inteira: %d',
    [_managedRecord.VariavelInteger]));
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  _obj: TObject;
  _nullObject: Nullable<TObject>;
  _nullObjCopiado: Nullable<TObject>;
begin
  _obj := TObject.Create;

  AdicionarAoTerminal(Sender as TButton, Format('Variavel obj: %d',
    [Integer(_obj)]));
  _nullObject := TObject.Create;

  AdicionarAoTerminal(Sender as TButton, Format('Variavel null: %d',
    [Integer(_nullObject.Valor)]));

  _nullObjCopiado := _nullObject;

  AdicionarAoTerminal(Sender as TButton, Format('Var Copiado: %d',
    [Integer(_nullObjCopiado.Valor)]));

  _nullObject := _obj;
  AdicionarAoTerminal(Sender as TButton, Format('Copiado _obj para null: %d',
    [Integer(_nullObject.Valor)]));

  AdicionarAoTerminal(Sender as TButton, Format('Var Copiado: %d',
    [Integer(_nullObjCopiado.Valor)]));

end;

procedure TForm1.Button3Click(Sender: TObject);
var
  _obj: TObject;
begin
  _obj := TObject.Create;
  AdicionarAoTerminal(Sender as TButton, Format('Endereço original: %d',
    [Integer(_obj)]));
  CopiaObjeto(_obj);
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  _str: string;
begin
  _str := 'asdf';
  AdicionarAoTerminal(Sender as TButton, Format('Endereço: %d',
    [Integer(@_str)]));
  CopiaString(_str);
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  _obj: TTeste;
  _null: Nullable<TObject>;
begin
  _obj := TTeste.Create;
  _null := TObject.Create;
  AdicionarAoTerminal(Sender as TButton, Format('Endereço da variável: %d',
    [Integer(@_null)]));
  AdicionarAoTerminal(Sender as TButton, Format('Endereço da variável (obj): %d',
    [Integer(_null.Valor)]));

  _obj.CampoNull := _null;
  AdicionarAoTerminal(Sender as TButton, Format('Endereço do objeto: %d',
    [Integer(@_obj.CampoNull)]));
  AdicionarAoTerminal(Sender as TButton, Format('Endereço do objeto (obj): %d',
    [Integer(_obj.CampoNull.Valor)]));
end;

procedure TForm1.CopiaObjeto(AObjeto: TObject);
begin
  AdicionarAoTerminal('Sem marcador', Format('Endereço: %d',
    [Integer(AObjeto)]));
end;

procedure TForm1.CopiaString(var AString: string);
begin
  AdicionarAoTerminal('Sem marcador', Format('Endereço: %d',
    [Integer(@AString)]));
end;

procedure TForm1.btnPassarObjParametroClick(Sender: TObject);
var
  _managedRecord: ManagedRecord;
begin
  _managedRecord.VariavelDeObjeto := Sender;
  AdicionarAoTerminal(Sender as TButton,
    Format('Endereço de memória: MR: %d Sender: %d',
    [Integer(_managedRecord.VariavelDeObjeto), Integer(Sender)]));
  AdicionarAoTerminal(Sender as TButton, Format('Record: %d',
    [Integer(@_managedRecord)]));

  RecebeObjetoVar(_managedRecord);
  RecebeObjetoConst(_managedRecord);
  RecebeObjetoSemMarcar(_managedRecord);
end;

procedure TForm1.RecebeObjetoConst(const AManagedRecord: ManagedRecord);
begin
  AdicionarAoTerminal('Objeto const', Format('Endereço de memória: %d',
    [Integer(AManagedRecord.VariavelDeObjeto)]));
  AdicionarAoTerminal('End. Recod const', Format('Endereço de memória: %d',
    [Integer(@AManagedRecord)]));
end;

procedure TForm1.RecebeObjetoSemMarcar(AManagedRecord: ManagedRecord);
begin
  AdicionarAoTerminal('Sem marcador', Format('Endereço de memória: %d',
    [Integer(AManagedRecord.VariavelDeObjeto)]));
  AdicionarAoTerminal('End. Record.', Format('Endereço de memória: %d',
    [Integer(@AManagedRecord)]));
end;

procedure TForm1.RecebeObjetoVar(var AManagedRecord: ManagedRecord);
begin
  AdicionarAoTerminal('Objeto var', Format('Endereço de memória: %d',
    [Integer(AManagedRecord.VariavelDeObjeto)]));
  AdicionarAoTerminal('End. Record var:', Format('Endereço de memória: %d',
    [Integer(@AManagedRecord)]));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Terminal.Clear;
end;

procedure TForm1.AdicionarAoTerminal(const AProcedimento, AComentario: string);
begin
  Terminal.Lines.Add(Format('[%s] - %s', [AProcedimento, AComentario]));
end;

procedure TForm1.AdicionarAoTerminal(const AButton: TButton;
  const AComentario: string);
begin
  AdicionarAoTerminal(AButton.Caption, AComentario);
end;

end.
