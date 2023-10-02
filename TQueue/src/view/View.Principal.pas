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
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    btnOk: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    Fila: TQueue<string>;
    /// <summary>Identifica qual evento foi acionado em algum item da fila.</summary>
    procedure Notificacao(Sender: TObject; const Item: String; Action: TCollectionNotification);
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
begin
  if (Fila.Count = 0) and (RadioGroup1.ItemIndex in [1..3, 5]) then
    TratarListaVazia(Sender);

  case RadioGroup1.ItemIndex of
    -1: Memo1.Lines.Add('Nenhuma opção foi selecionada.');
    0: // Enqueue
      begin
      	Fila.Enqueue(Edit1.Text);
        Memo1.Lines.Add(Format(' -> Enqueue (o item "%s" foi inserido na fila).', [Edit1.Text]));
      end;
    1: // Dequeue
      begin
        Memo1.Lines.Add(Format(' -> Dequeue (o primeiro item da fila "%s" foi removido).', [Fila.Peek]));
        Fila.Dequeue;
      end;
    2: // Extract
      begin
        Memo1.Lines.Add(Format(' -> Extract (o primeiro item da fila "%s" foi extraído).', [Fila.Peek]));
        Fila.Extract;
      end;
    3: // Peek
      Memo1.Lines.Add(Format(' -> Peek (o primeiro item da fila é "%s").', [Fila.Peek]));
    4: // Count
      Memo1.Lines.Add(Format(' -> Count (quantidade de itens da fila): %d.' , [Fila.Count]));
    5: // Clear
      begin
        Memo1.Lines.Add(' -> Clear (em 3 segundos a fila será apagada).');
        Sleep(3000);
        Fila.Clear;
        Memo1.Lines.Clear;
      end;
    6: // OnNotify
      begin
        Fila.OnNotify := Notificacao;
        Memo1.Lines.Add('O OnNotity foi ativado; eventos serão informados.');
      end;
    7: // Capacity
      Memo1.Lines.Add(Format(' -> Capacity (capacidade da fila reservada na memória): %d.', [Fila.Capacity]));
    8: // TrimExcess
      begin
        {A capacidade da fila na memória não é alterada após itens serem incluídos e excluídos.
        O TrimExcess faz um Trim na capacidade da fila, de acordo com a quantidade de itens que existirem.}
        Fila.TrimExcess;
        Memo1.Lines.Add(' -> O TrimExcess foi executado.');
      end;
  end;
end;

procedure TViewPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Fila.Free;
end;

procedure TViewPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;

  Fila := TQueue<String>.Create;
end;

procedure TViewPrincipal.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F2 then
    btnOk.Click;
end;

procedure TViewPrincipal.Notificacao(Sender: TObject; const Item: String; Action: TCollectionNotification);
// Acionado quando algum evento ocorrer na Fila
begin
  case Action of
    cnAdded:
      Memo1.Lines.Add(Format(' -> Action.cnAdded (o item "%s" foi inserido na fila).', [Item]));
    cnRemoved:
      Memo1.Lines.Add(Format(' -> Action.cnRemoved (o item "%s" foi removido da fila).', [Item]));
    cnExtracted:
      Memo1.Lines.Add(Format(' -> Action.cnExtracted (o item "%s" foi extraído da fila).', [Item]));
  end;
end;

procedure TViewPrincipal.RadioGroup1Click(Sender: TObject);
begin
  Edit1.SetFocus;
end;

procedure TViewPrincipal.TratarListaVazia(Sender: TObject);
begin
  Memo1.Lines.Add('A fila está vazia.');
  Abort;
end;

end.

