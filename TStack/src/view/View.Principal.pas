unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, System.Generics.Collections;

type
  TViewPrincipal = class(TForm)
    GridPanel1: TGridPanel;
    RadioGroup1: TRadioGroup;
    btnOk: TSpeedButton;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Memo1: TMemo;
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RadioGroup1Click(Sender: TObject);
  private
    Pilha: TStack<String>;
    /// <summary>Identifica qual evento foi acionado em algum item da pilha.</summary>
    procedure Notificacao(Sender: TObject; const Item: String; Action: TCollectionNotification);
    function ListarItens: string;
    procedure VerificarTratarPilhaVazia;
  public
    { Public declarations }
  end;

var
  ViewPrincipal: TViewPrincipal;

implementation

{$R *.dfm}

procedure TViewPrincipal.btnOkClick(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
    -1: Memo1.Lines.Add('Nenhuma opção foi selecionada.');
    0: // Push
      begin
        Pilha.Push(Edit1.Text);
        Memo1.Lines.Add(Format(' -> Push (o item "%s" foi inserido na pilha).', [Edit1.Text]));
      end;
    1: // Pop
      begin
        VerificarTratarPilhaVazia;

        Memo1.Lines.Add(Format(' -> Pop (o último item da pilha "%s" foi removido).', [Pilha.Peek]));
        Pilha.Pop;
      end;
    2: // Extract
      begin
        VerificarTratarPilhaVazia;

        Memo1.Lines.Add(Format(' -> Extract (o último item da pilha "%s" foi extraído).', [Pilha.Peek]));
        Pilha.Extract;
      end;
    3: // List
      begin
        VerificarTratarPilhaVazia;

        Memo1.Lines.Add(Format(' -> List (itens da pilha): %s.', [ListarItens]));
      end;
    4: // Peek
      Memo1.Lines.Add(Format(' -> Peek (o primeiro item da pilha é "%s").', [Pilha.Peek]));
    5: // Count
      Memo1.Lines.Add(Format(' -> Count (quantidade de itens da pilha): %d.' , [Pilha.Count]));
    6: // Clear
      begin
        Memo1.Lines.Add(' -> Clear (em 3 segundos a pilha será apagada).');
        Sleep(3000);
        Pilha.Clear;
        Memo1.Lines.Clear;
      end;
    7: // OnNotify
      begin
        Pilha.OnNotify := Notificacao;
        Memo1.Lines.Add('O OnNotity foi ativado; eventos serão informados.');
      end;
    8: // Capacity
      Memo1.Lines.Add(Format(' -> Capacity (capacidade da pilha reservada na memória): %d.', [Pilha.Capacity]));
    9: // TrimExcess
      begin
        {A capacidade da pilha na memória não é alterada após itens serem incluídos e excluídos.
        O TrimExcess faz um Trim na capacidade da pilha, de acordo com a quantidade de itens que existirem.}
        Pilha.TrimExcess;
        Memo1.Lines.Add(' -> O TrimExcess foi executado.');
      end;
  end;
end;

procedure TViewPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Pilha.Free;
end;

procedure TViewPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;

  Pilha := TStack<String>.Create;
end;

procedure TViewPrincipal.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F2 then
    btnOk.Click;
end;

function TViewPrincipal.ListarItens: string;
var
  I: Cardinal;
begin
  for I := 0 to Pred(Pilha.Count) do
    if Result = '' then
      Result := Pilha.List[I]
    else
      Result := Format('%s, %s', [Result, Pilha.List[I]]);
end;

procedure TViewPrincipal.Notificacao(Sender: TObject; const Item: String; Action: TCollectionNotification);
// Acionado quando algum evento ocorrer na pilha
begin
  case Action of
    cnAdded:
      Memo1.Lines.Add(Format(' -> Action.cnAdded (o item "%s" foi inserido na pilha).', [Item]));
    cnRemoved:
      Memo1.Lines.Add(Format(' -> Action.cnRemoved (o item "%s" foi removido da pilha).', [Item]));
    cnExtracted:
      Memo1.Lines.Add(Format(' -> Action.cnExtracted (o item "%s" foi extraído da pilha).', [Item]));
  end;
end;

procedure TViewPrincipal.RadioGroup1Click(Sender: TObject);
begin
  Edit1.SetFocus;
end;

procedure TViewPrincipal.VerificarTratarPilhaVazia;
begin
  if Pilha.Count = 0 then
  begin
    Memo1.Lines.Add('A pilha está vazia.');
    Abort;
  end;
end;

end.
