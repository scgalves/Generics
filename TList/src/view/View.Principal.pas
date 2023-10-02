unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, System.Generics.Collections, Vcl.Samples.Spin, Vcl.Buttons;

type
  TViewPrincipal = class(TForm)
    GridPanel1: TGridPanel;
    Memo1: TMemo;
    RadioGroup1: TRadioGroup;
    btnOk: TSpeedButton;
    Panel1: TPanel;
    Label1: TLabel;
    SpinEdit1: TSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RadioGroup1Click(Sender: TObject);
  private
    Lista: TList<Integer>;
    /// <summary>Identifica qual evento foi acionado em algum item da lista.</summary>
    procedure Notificacao(Sender: TObject; const Item: Integer; Action: TCollectionNotification);
    function ListarItens: string;
    procedure TratarListaVazia(Sender: TObject);
    function EncontrouNaLista(AValor: Integer): Boolean;
  public
    { Public declarations }
  end;

var
  ViewPrincipal: TViewPrincipal;

implementation

{$R *.dfm}

{ TViewPrincipal }

procedure TViewPrincipal.btnOkClick(Sender: TObject);
var
  I: Cardinal;
begin
  case RadioGroup1.ItemIndex of
    -1: Memo1.Lines.Add('Nenhuma opção foi selecionada.');
    0: // Add
      begin
        Lista.Add(SpinEdit1.Value);
        Memo1.Lines.Add(Format(' -> Add (o item "%d" foi inserido na lista).', [SpinEdit1.Value]));
      end;
    1: // Insert #2
      begin
        if Lista.Count = 0 then
          TratarListaVazia(Sender);

        Lista.Insert(1, SpinEdit1.Value);
        Memo1.Lines.Add(Format(' -> Insert (o item "%d" foi inserido no índice #1 da lista).', [SpinEdit1.Value]));
      end;
    2: // Delete
      begin
        if Lista.Count = 0 then
          TratarListaVazia(Sender);

        Memo1.Lines.Add(Format(' -> Delete (o último item da lista "%d" foi removido).', [Pred(Lista.Count)]));
        Lista.Delete(Pred(Lista.Count));
      end;
    3: // Extract
      begin
        if Lista.Count = 0 then
          TratarListaVazia(Sender);

        if not EncontrouNaLista(SpinEdit1.Value) then
          Memo1.Lines.Add(Format(' -> Extract (o item "%d" não consta na lista).', [SpinEdit1.Value]))
        else
        begin
          Lista.Extract(SpinEdit1.Value);
          Memo1.Lines.Add(Format(' -> Extract (o item "%d" foi extraído da lista).', [SpinEdit1.Value]));
        end;
      end;
    4: // List
      begin
        if Lista.Count = 0 then
          TratarListaVazia(Sender);

        Memo1.Lines.Add(Format(' -> List (itens da lista): %s.', [ListarItens]));
      end;
    5: // Sort
      begin
        if Lista.Count = 0 then
          TratarListaVazia(Sender);

        Lista.Sort;
        Memo1.Lines.Add(Format(' -> Sort (itens da lista): %s.', [ListarItens]));
      end;
    6: // Reverse
      begin
        if Lista.Count = 0 then
          TratarListaVazia(Sender);
        { Em testes, observei que sem executar o Sort pela primeira vez, a lista não era corretamente ordenada.
        Sendo assim, aciono o Sorte antes do Reverse. }
        Lista.Sort;
        Lista.Reverse;
        Memo1.Lines.Add(Format(' -> Reverse (itens da lista): %s.', [ListarItens]));
      end;
    7: // IndexOf
      begin
        if Lista.Count = 0 then
          TratarListaVazia(Sender);

        if not EncontrouNaLista(SpinEdit1.Value) then
          Memo1.Lines.Add(Format(' -> IndexOf (o item "%d" não consta na lista).', [SpinEdit1.Value]))
        else
          Memo1.Lines.Add(Format(' -> IndexOf (índice do item "%d" desde o início da lista): %d.', [SpinEdit1.Value,
            Lista.IndexOf(SpinEdit1.Value)]));
      end;
    8: // LastIndexOf
      begin
        if Lista.Count = 0 then
          TratarListaVazia(Sender);

        if not EncontrouNaLista(SpinEdit1.Value) then
          Memo1.Lines.Add(Format(' -> LastIndexOf (o item "%d" não consta na lista).', [SpinEdit1.Value]))
        else
          Memo1.Lines.Add(Format(' -> LastIndexOf (índice do item "%d" desde o fim da lista): %d.', [SpinEdit1.Value,
            Lista.LastIndexOf(SpinEdit1.Value)]));
      end;
    9: // Contains
      begin
        if Lista.Count = 0 then
          TratarListaVazia(Sender);

        if Lista.Contains(SpinEdit1.Value) then
          Memo1.Lines.Add(Format(' -> Contains (a lista contém o item "%d"): Verdadeiro.', [SpinEdit1.Value]))
        else
          Memo1.Lines.Add(Format(' -> Contains (a lista contém o item "%d"): Falso.', [SpinEdit1.Value]));
      end;
    10: // Last
      Memo1.Lines.Add(Format(' -> Last (último item da lista): %d.', [Pred(Lista.Count)]));
    11: // Exchange
      begin
        if Lista.Count = 0 then
          TratarListaVazia(Sender);

        if Lista.Count < 2 then
        begin
          Memo1.Lines.Add(' -> Exchange (quantidade insuficiente de itens na lista).');
          Exit;
        end
        else
        begin
          Lista.Exchange(1, 0);
          Memo1.Lines.Add(' -> Exchange (os itens dos índices #1 e #0 foram permutados).');
        end;
      end;
    12: // Count
      Memo1.Lines.Add(Format(' -> Count (quantidade de itens da lista): %d.' , [Lista.Count]));
    13: // Clear
      begin
        Memo1.Lines.Add(' -> Clear (em 3 segundos a lista será apagada).');
        Sleep(3000);
        Lista.Clear;
        Memo1.Lines.Clear;
      end;
    14: // OnNotity
      begin
        Lista.OnNotify := Notificacao;
        Memo1.Lines.Add('O OnNotity foi ativado; eventos serão informados.');
      end;
    15: // Capacity
      Memo1.Lines.Add(Format(' -> Capacity (capacidade da lista reservada na memória): %d.', [Lista.Capacity]));
    16: // TrimExcess
      {A capacidade da lista na memória não é alterada após itens serem incluídos e excluídos.
      O TrimExcess faz um Trim na capacidade da lista, de acordo com a quantidade de itens que existirem.}
      begin
        Lista.TrimExcess;
        Memo1.Lines.Add(' -> O TrimExcess foi executado.');
      end;
  end;
end;

function TViewPrincipal.EncontrouNaLista(AValor: Integer): Boolean;
var
  I: Cardinal;
begin
  Result := False;

  for I := 0 to Pred(Lista.Count) do
    if Lista[I] = AValor then
    begin
      Result := True;
      Break;
    end;
end;

procedure TViewPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Lista.Free;
end;

procedure TViewPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;

  Lista := TList<Integer>.Create;
end;

procedure TViewPrincipal.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F2 then
    btnOk.Click;
end;

function TViewPrincipal.ListarItens: string;
var
  I: Cardinal;
  LLista: string;
begin
  for I := 0 to Pred(Lista.Count) do
    if LLista = '' then
      LLista := Lista[I].ToString
    else
      LLista := Format('%s, %s', [LLista, Lista[I].ToString]);

  Result := LLista;
end;

procedure TViewPrincipal.Notificacao(Sender: TObject; const Item: Integer; Action: TCollectionNotification);
// Acionado quando algum evento ocorrer na lista
begin
  case Action of
    cnAdded:
      Memo1.Lines.Add(Format(' -> Action.cnAdded (o item "%d" foi inserido na lista).', [Item]));
    cnRemoved:
      Memo1.Lines.Add(Format(' -> Action.cnRemoved (o item "%d" foi removido da lista).', [Item]));
    cnExtracted:
      Memo1.Lines.Add(Format(' -> Action.cnExtracted (o item "%d" foi extraído da lista).', [Item]));
  end;
end;

procedure TViewPrincipal.RadioGroup1Click(Sender: TObject);
begin
  SpinEdit1.SetFocus;
end;

procedure TViewPrincipal.TratarListaVazia(Sender: TObject);
begin
  Memo1.Lines.Add('A lista está vazia.');
  Abort;
end;

end.

