unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, System.Generics.Collections;

type
  TPessoa = record
		CPF,
  		Nome: String;
	end;

  TViewPrincipal = class(TForm)
    GridPanel1: TGridPanel;
    Memo1: TMemo;
    RadioGroup1: TRadioGroup;
    btnOk: TSpeedButton;
    grdCpfNome: TGridPanel;
    edtCpf: TEdit;
    lblCpf: TLabel;
    lblNome: TLabel;
    edtNome: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RadioGroup1Click(Sender: TObject);
  private
    Lista: TDictionary<String, TPessoa>;
    procedure VerificarTratarListaVazia;
    procedure KeyNotify(Sender: TObject; const Item: string; Action: TCollectionNotification);
    procedure ValueNotify(Sender: TObject; const Item: TPessoa; Action: TCollectionNotification);
    procedure ValidarKey;
    procedure ValidarValue;
  public
    { Public declarations }
  end;

var
  ViewPrincipal: TViewPrincipal;

implementation

{$R *.dfm}

procedure TViewPrincipal.btnOkClick(Sender: TObject);
var
	Pessoa: TPessoa;
  LKey,
    S: string;
begin
  Pessoa.CPF := edtCpf.Text;
  Pessoa.Nome := edtNome.Text;
  edtCpf.SetFocus;

  case RadioGroup1.ItemIndex of
    -1: Memo1.Lines.Add('Nenhuma opção foi selecionada.');
    0: // Add
      begin
        ValidarKey;
        ValidarValue;
        try
          Lista.Add(Pessoa.CPF, Pessoa);
          Memo1.Lines.Add(Format(' -> Add (a Key "%s" e o Value "%s" foram adicionados na lista).', [Pessoa.CPF,
            Pessoa.Nome]));
        except
          on Exception do
            Memo1.Lines.Add(' -> Add (Key duplicada não é permitido).');
        end;
      end;
    1: // AddOrSetValue
      // Verifica se existe a chave e altera o item da lista (se necessário)
      begin
        ValidarKey;
        ValidarValue;
        VerificarTratarListaVazia;

      	Lista.AddOrSetValue(Pessoa.CPF, Pessoa);
        Memo1.Lines.Add(Format(' -> AddOrSetValue (a Key "%s" foi identificada; novo Value): %s.',
          [Pessoa.CPF, Pessoa.Nome]));
      end;
    2: // Remove
      begin
        ValidarKey;
        VerificarTratarListaVazia;

        if not Lista.ContainsKey(Pessoa.CPF) then
        begin
          Memo1.Lines.Add(Format(' -> Remove (a Key "%s" não foi encontrada).', [Pessoa.CPF]));
          edtCpf.SetFocus;
          Exit;
        end;

        Lista.Remove(Pessoa.CPF);
        Memo1.Lines.Add(Format(' -> Remove (a Key "%s" foi removida).', [Pessoa.CPF]));
      end;
    3: // Keys
      begin
        VerificarTratarListaVazia;

        for LKey in Lista.Keys do
          if S = '' then
            S := LKey
          else
            S := S + ', ' + LKey;

    		Memo1.Lines.Add(Format(' -> Keys (lista das Keys): %s.', [S]));
      end;
    4: // Values
      begin
        VerificarTratarListaVazia;

      	for Pessoa in Lista.Values do
          if S = '' then
            S := Pessoa.Nome
          else
            S := S + ', ' + Pessoa.Nome;

     		Memo1.Lines.Add(Format(' -> Values (lista dos Values): %s.', [S]));
      end;
    5: // TryGetValue
      begin
        ValidarKey;
        VerificarTratarListaVazia;

        if Lista.TryGetValue(Pessoa.CPF, Pessoa) then
          Memo1.Lines.Add(Format(' -> TryGetValue (Value da Key "%s"): %s.', [Pessoa.CPF, Pessoa.Nome]))
        else
          Memo1.Lines.Add(Format(' -> TryGetValue (Key "%s" não encontrada).', [Pessoa.CPF]));
      end;
    6: // ContainsKey
      begin
        ValidarKey;

        if Lista.ContainsKey(Pessoa.CPF) then
          Memo1.Lines.Add(Format(' -> ContainsKey (Key "%s" encontrado).', [Pessoa.CPF]))
        else
          Memo1.Lines.Add(Format(' -> ContainsKey (Key "%s" não encontrado).', [Pessoa.CPF]));
      end;
    7: // ContainsValue
      begin
        ValidarValue;
        { Nos testes que eu fiz, ContainsValues NÃO encontrou a chave e o valor correspondentes, apesar de existirem na
        lista e estarem corretos. Sendo assim, implementei a minha solução, abaixo. }
        for LKey in Lista.Keys do
          if (LKey = Pessoa.CPF) and (Lista.TryGetValue(LKey, Pessoa)) then
            if Pessoa.Nome = edtNome.Text then            
            begin
              Memo1.Lines.Add(Format(' -> ContainsValue (Value "%s" encontrado para a Key "%s").',
                [Pessoa.Nome, Pessoa.CPF]));
              Exit;
            end;

        Memo1.Lines.Add(Format(' -> ContainsValue (Value "%s" não encontrado para a Key "%s").',
          [edtNome.Text, Pessoa.CPF]));
      end;
    8: // ExtractPair
      begin
        ValidarKey;
        VerificarTratarListaVazia;

        if not Lista.ContainsKey(Pessoa.CPF) then
        begin
          Memo1.Lines.Add(Format(' -> ExtractPair (a Key "%s" não foi localizada).', [Pessoa.CPF]));
          edtCpf.SetFocus;
          Exit;
        end;

        Lista.ExtractPair(Pessoa.CPF);
        Memo1.Lines.Add(Format(' -> ExtractPair (a Key "%s" foi extraída).', [Pessoa.CPF]));
      end;
    9: // Count
      Memo1.Lines.Add(Format(' -> Count (quantidade de itens da lista): %d.' , [Lista.Count]));
    10: // Clear
      begin
        Memo1.Lines.Add(' -> Clear (em 3 segundos a lista será apagada).');
        Sleep(3000);
        Lista.Clear;
        Memo1.Lines.Clear;
      end;
    11: // OnKeyNotify
     begin
       Lista.OnKeyNotify := KeyNotify;
       Memo1.Lines.Add('O OnKeyNotify foi ativado; eventos serão informados.');
      end;
    12: // OnValueNotify
     begin
       Lista.OnValueNotify := ValueNotify;
       Memo1.Lines.Add('O OnValueNotify foi ativado; eventos serão informados.');
      end;
    13: // Capacity
      Memo1.Lines.Add(Format(' -> Capacity (capacidade da lista reservada na memória): %d.', [Lista.Capacity]));
    14: // TrimExcess
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

  Lista := TDictionary<String, TPessoa>.Create;
end;

procedure TViewPrincipal.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F2 then
    btnOk.Click;
end;

procedure TViewPrincipal.KeyNotify(Sender: TObject; const Item: string; Action: TCollectionNotification);
// Acionado quando algum evento ocorrer na lista
begin
  case Action of
    cnAdded:
      Memo1.Lines.Add(Format(' -> Action.cnAdded (a Key "%s" foi inserida na lista).', [Item]));
    cnRemoved:
      Memo1.Lines.Add(Format(' -> Action.cnRemoved (a Key "%s" foi removida da lista).', [Item]));
    cnExtracted:
      Memo1.Lines.Add(Format(' -> Action.cnExtracted (a Key "%s" foi extraída da lista).', [Item]));
  end;
end;

procedure TViewPrincipal.ValueNotify(Sender: TObject; const Item: TPessoa; Action: TCollectionNotification);
// Acionado quando algum evento ocorrer na lista
begin
  case Action of
    cnAdded:
      Memo1.Lines.Add(Format(' -> Action.cnAdded (o Value "%s" foi inserido na lista).', [Item.Nome]));
    cnRemoved:
      Memo1.Lines.Add(Format(' -> Action.cnRemoved (o Value "%s" foi removido da lista).', [Item.Nome]));
    cnExtracted:
      Memo1.Lines.Add(Format(' -> Action.cnExtracted (o Value "%s" foi extraído da lista).', [Item.Nome]));
  end;
end;

procedure TViewPrincipal.RadioGroup1Click(Sender: TObject);
begin
  edtCpf.SetFocus;
end;

procedure TViewPrincipal.ValidarKey;
begin
  if Trim(edtCpf.Text) = '' then
  begin
    Memo1.Lines.Add('O CPF não foi digitado.');
    edtCpf.SetFocus;
    Abort;
  end;
end;

procedure TViewPrincipal.ValidarValue;
begin
  if Trim(edtNome.Text) = '' then
  begin
    Memo1.Lines.Add('O Nome não foi digitado.');
    edtNome.SetFocus;
    Abort;
  end;
end;

procedure TViewPrincipal.VerificarTratarListaVazia;
begin
  if Lista.Count = 0 then
  begin
    Memo1.Lines.Add('A lista está vazia.');
    Abort;
  end;
end;

end.
