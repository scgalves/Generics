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
  LEncontrouItem: Boolean;
begin
  if (Lista.Count = 0) and (RadioGroup1.ItemIndex in [1..3, 5, 6, 8]) then
    TratarListaVazia(Sender);

  case RadioGroup1.ItemIndex of
    -1: Memo1.Lines.Add('Nenhuma opção foi selecionada.');
    0: // Add
      begin
        Lista.Add(SpinEdit1.Value);
        Memo1.Lines.Add(Format(' -> Add (o item "%d" foi inserido na lista).', [SpinEdit1.Value]));
      end;
    1: // Insert #2
      begin

        Lista.Insert(1, SpinEdit1.Value);
        Memo1.Lines.Add(Format(' -> Insert (o item "%d" foi inserido na posição #2 da lista).', [SpinEdit1.Value]));
      end;
    2: // Delete
      begin
        var LItemLista: Cardinal;
        LItemLista := 0;

        for I := 0 to Pred(Lista.Count) do
          LItemLista := Lista[I];

        Memo1.Lines.Add(Format(' -> Delete (o último item da lista "%d" foi removido).', [LItemLista]));
        Lista.Delete(Pred(Lista.Count));
      end;
    3: // Extract
      begin
        LEncontrouItem := False;
        for I := 0 to Pred(Lista.Count) do
          if Lista[I] = SpinEdit1.Value then
          begin
            LEncontrouItem := True;
            Break;
          end;

        if not LEncontrouItem then
          Memo1.Lines.Add(Format(' -> Extract (o item "%d" não consta na lista).', [SpinEdit1.Value]))
        else
        begin
          Lista.Extract(SpinEdit1.Value);
          Memo1.Lines.Add(Format(' -> Extract (o item "%d" foi extraído da lista).', [SpinEdit1.Value]));
        end;
      end;
    4: // List
      Memo1.Lines.Add(Format(' -> List (itens da lista): %s.', [ListarItens]));
    5: // Sort
      begin
        Lista.Sort;
        Memo1.Lines.Add(Format(' -> Sort (itens da lista): %s.', [ListarItens]));
      end;
    6: // Reverse
      begin
        { Em testes, observei que sem executar o Sort pela primeira vez, a lista não era corretamente ordenada.
        Sendo assim, aciono o Sorte antes do Reverse. }
        Lista.Sort;
        Lista.Reverse;
        Memo1.Lines.Add(Format(' -> Reverse (itens da lista): %s.', [ListarItens]));
      end;
    7: // Count
      Memo1.Lines.Add(Format(' -> Count (quantidade de itens da lista): %d.' , [Lista.Count]));
    8: // Clear
      begin
        Memo1.Lines.Add(' -> Clear (em 3 segundos a lista será apagada).');
        Sleep(3000);
        Lista.Clear;
        Memo1.Lines.Clear;
      end;
    9: // OnNotity
      begin
        Lista.OnNotify := Notificacao;
        Memo1.Lines.Add('O OnNotity foi ativado; eventos serão informados.');
      end;
    10: // Capacity
      Memo1.Lines.Add(Format(' -> Capacity (capacidade da lista reservada na memória): %d.', [Lista.Capacity]));
    11: // TrimExcess
      {A capacidade da lista na memória não é alterada após itens serem incluídos e excluídos.
      O TrimExcess faz um Trim na capacidade da lista, de acordo com a quantidade de itens que existirem.}
      begin
        Lista.TrimExcess;
        Memo1.Lines.Add(' -> O TrimExcess foi executado.');
      end;
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

