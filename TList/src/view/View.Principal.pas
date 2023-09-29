unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, System.Generics.Collections, Vcl.Samples.Spin, Vcl.Buttons;

type
  TViewPrincipal = class(TForm)
    GridPanel1: TGridPanel;
    btnAdd: TSpeedButton;
    btnDelete: TSpeedButton;
    btnList: TSpeedButton;
    btnCapacity: TSpeedButton;
    btnCount: TSpeedButton;
    btnOnNotify: TSpeedButton;
    Memo1: TMemo;
    SpinEdit1: TSpinEdit;
    btnExtract: TSpeedButton;
    btnInsert: TSpeedButton;
    btnSort: TSpeedButton;
    btnReverse: TSpeedButton;
    btnTrimExcess: TSpeedButton;
    btnClear: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnListClick(Sender: TObject);
    procedure btnCapacityClick(Sender: TObject);
    procedure btnCountClick(Sender: TObject);
    procedure btnOnNotifyClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExtractClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnSortClick(Sender: TObject);
    procedure btnReverseClick(Sender: TObject);
    procedure btnTrimExcessClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
  private
    Lista: TList<Integer>;
    /// <summary>Identifica qual evento foi acionado em algum item da lista.</summary>
    procedure Notificacao(Sender: TObject; const Item: Integer; Action: TCollectionNotification);
    function ListarItens: string;
    procedure TratarListaVazia(Sender: TObject);
  public
    { Public declarations }
  end;

var
  ViewPrincipal: TViewPrincipal;

implementation

{$R *.dfm}

{ TViewPrincipal }

procedure TViewPrincipal.btnAddClick(Sender: TObject);
begin
  Lista.Add(SpinEdit1.Value);
  Memo1.Lines.Add(Format(' -> %s (o item "%d" foi inserido na lista).', [(Sender as TSpeedButton).Caption,
    SpinEdit1.Value]));
end;

procedure TViewPrincipal.btnCapacityClick(Sender: TObject);
begin
  Memo1.Lines.Add(Format(' -> %s (capacidade da lista reservada na memória): %d.', [(Sender as TSpeedButton).Caption,
    Lista.Capacity]));
end;

procedure TViewPrincipal.btnClearClick(Sender: TObject);
begin
  Memo1.Lines.Add(Format(' -> %s (em 3 segundos a lista será apagada).', [(Sender as TSpeedButton).Caption]));
  Sleep(3000);
  Lista.Clear;
  Memo1.Lines.Clear;
end;

procedure TViewPrincipal.btnCountClick(Sender: TObject);
begin
  Memo1.Lines.Add(Format(' -> %s (quantidade de itens da lista): %d.' , [(Sender as TSpeedButton).Caption,
    Lista.Count]));
end;

procedure TViewPrincipal.btnDeleteClick(Sender: TObject);
var
  I,
    LItemLista: Cardinal;
begin
  if Lista.Count = 0 then
    TratarListaVazia(Sender);

  LItemLista := 0;
  for I := 0 to Pred(Lista.Count) do
    LItemLista := Lista[I];

  Memo1.Lines.Add(Format(' -> %s (o último item da lista "%d" foi removido).',
    [(Sender as TSpeedButton).Caption, LItemLista]));
  Lista.Delete(Pred(Lista.Count));
end;

procedure TViewPrincipal.btnExtractClick(Sender: TObject);
var
  I: Cardinal;
  LEncontrouItem: Boolean;
begin
  if Lista.Count = 0 then
  begin
    Memo1.Lines.Add(Format(' -> %s (quantidade insuficiente de itens na lista: %d.',
      [(Sender as TSpeedButton).Caption, Lista.Count]));
    Exit;
  end;

  LEncontrouItem := False;
  for I := 0 to Pred(Lista.Count) do
    if Lista[I] = SpinEdit1.Value then
    begin
      LEncontrouItem := True;
      Break;
    end;

  if not LEncontrouItem then
    Memo1.Lines.Add(Format(' -> %s (o item "%d" não consta na lista).', [(Sender as TSpeedButton).Caption,
      SpinEdit1.Value]))
  else
  begin
    Lista.Extract(SpinEdit1.Value);
    Memo1.Lines.Add(Format(' -> %s (o item "%d" foi extraído da lista).', [(Sender as TSpeedButton).Caption,
      SpinEdit1.Value]));
  end;
end;

procedure TViewPrincipal.btnInsertClick(Sender: TObject);
begin
  if Lista.Count = 0 then
    TratarListaVazia(Sender);

  Lista.Insert(1, SpinEdit1.Value);
  Memo1.Lines.Add(Format(' -> %s (o item "%d" foi inserido na posição #2 da lista).', [(Sender as TSpeedButton).Caption,
    SpinEdit1.Value]));
end;

procedure TViewPrincipal.btnListClick(Sender: TObject);
begin
  if Lista.Count = 0 then
    TratarListaVazia(Sender);

  Memo1.Lines.Add(Format(' -> %s (itens da lista): %s.', [(Sender as TSpeedButton).Caption, ListarItens]));
end;

procedure TViewPrincipal.btnOnNotifyClick(Sender: TObject);
begin
  Lista.OnNotify := Notificacao;
  Memo1.Lines.Add(Format(' -> O %s foi ativado; eventos serão informados.', [(Sender as TSpeedButton).Caption]));
end;

procedure TViewPrincipal.btnReverseClick(Sender: TObject);
begin
  if Lista.Count = 0 then
    TratarListaVazia(Sender);

  { Em testes, observei que sem executar o Sort pela primeira vez, a lista não era corretamente ordenada no Reverse.
  Sendo assim, aciono o Sorte antes do Reverse. }
  Lista.Sort;
  Lista.Reverse;
  Memo1.Lines.Add(Format(' -> %s (itens da lista): %s.', [(Sender as TSpeedButton).Caption, ListarItens]));
end;

procedure TViewPrincipal.btnSortClick(Sender: TObject);
begin
  if Lista.Count = 0 then
    TratarListaVazia(Sender);

  Lista.Sort;
  Memo1.Lines.Add(Format(' -> %s (itens da lista): %s.', [(Sender as TSpeedButton).Caption, ListarItens]));
end;

procedure TViewPrincipal.btnTrimExcessClick(Sender: TObject);
{A capacidade da fila na memória não é alterada após itens serem incluídos e excluídos.
O TrimExcess faz um Trim na capacidade da fila na memória, de acordo com a quantidade de itens que existirem.}
begin
	Lista.TrimExcess;
  Memo1.Lines.Add(Format(' -> O %s foi executado.', [(Sender as TSpeedButton).Caption]));
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

procedure TViewPrincipal.TratarListaVazia(Sender: TObject);
begin
  Memo1.Lines.Add(Format(' -> %s (a lista está vazia).', [(Sender as TSpeedButton).Caption]));
  Abort;
end;

end.

