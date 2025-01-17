unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  frxSmartMemo, frCoreClasses, frxClass, frxExportBaseDialog, frxExportPDF,
  frxDBSet, Data.FMTBcd, Data.DB, Data.SqlExpr,Data.Win.ADODB, Datasnap.DBClient,Datasnap.Provider;

type
  TfrPrincipal = class(TForm)
    btGerarRel: TButton;
    pnPrincipal: TPanel;
    edDataInicial: TMaskEdit;
    edDataFinal: TMaskEdit;
    lbDatIni: TLabel;
    lbDatFin: TLabel;
    rgOrdenar: TRadioGroup;
    ckTotalGrupo: TCheckBox;
    ckTotalGeral: TCheckBox;
    frxReport1: TfrxReport;
    frxDados: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    cbListaVendedores: TComboBox;
    Label1: TLabel;
    procedure btGerarRelClick(Sender: TObject);
    function frxReport1UserFunction(const MethodName: string;
      var Params: Variant): Variant;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    qrVendedores : TADOQuery;

    function fGetAndWhere(prSQL: String): String;
    function fckTotalGeral: Boolean;
    function fckTotalGrupo: Boolean;
    procedure pFazWhereData;
    procedure pFazProcessoComissao;
    function fCalculaComissao(prValorTotal: Double; prPercentual: Double): Double;

  public
    { Public declarations }
  end;

  type
  TVendedor = class
  private
    FValorTotal: Double;
  public
    property ValorTotal: Double read FValorTotal write FValorTotal;
  end;

  const
    cCincoPer = 0.05;
    cDezPer = 0.10;

var
  frPrincipal: TfrPrincipal;
  vDiretorioRaiz: String;

implementation

{$R *.dfm}

uses udmControl;

procedure TfrPrincipal.btGerarRelClick(Sender: TObject);
begin
  dmControl.qrPrincipal.Close;
  dmControl.qrPrincipal.SQL.Clear;
  dmControl.qrPrincipal.SQL.Add('SELECT *');

  dmControl.qrPrincipal.SQL.Add('FROM Vendas');
  pFazWhereData;

  if cbListaVendedores.ItemIndex > 0 then
     dmControl.qrPrincipal.SQL.Add(fGetAndWhere(dmControl.qrPrincipal.SQL.Text) + ' bdIdVendedor in ' + '(' +IntToStr(cbListaVendedores.ItemIndex)+ ')');


  dmControl.qrPrincipal.SQL.Add('ORDER BY bdIdVendedor,');
  case rgOrdenar.ItemIndex of
    0: begin
         dmControl.qrPrincipal.SQL.Add('bdData');
       end;
    1: begin
         dmControl.qrPrincipal.SQL.Add('bdValorTotal');
       end;
  end;

  dmControl.qrPrincipal.Open;

  //pFazProcessoComissao;

  DeleteFile(vDiretorioRaiz + 'RelVendas.fr3');
  if not FileExists(vDiretorioRaiz + 'RelVendas.fr3') then
     frxReport1.SaveToFile(vDiretorioRaiz + 'RelVendas.fr3');

  frxReport1.LoadFromFile(vDiretorioRaiz + 'RelVendas.fr3');

  frxReport1.PrepareReport;

  frxReport1.Variables['wMarcouTotGrupo'] := '0';
  if ckTotalGrupo.Checked then
    frxReport1.Variables['wMarcouTotGrupo'] := '1';

  frxReport1.Variables['wMarcouTotGeral'] := '0';
  if ckTotalGeral.Checked then
     frxReport1.Variables['wMarcouTotGeral'] := '1';


  frxReport1.ShowReport();

end;

function TfrPrincipal.fckTotalGeral: Boolean;
begin
  Result := ckTotalGeral.Checked;
end;

function TfrPrincipal.fckTotalGrupo: Boolean;
begin
  Result := ckTotalGrupo.Checked;
end;

function TfrPrincipal.fGetAndWhere(prSQL: String): String;
begin
  Result := 'WHERE';
  if Pos('WHERE',prSQL) > 0 then
     Result := 'AND';
end;

procedure TfrPrincipal.pFazWhereData;
var
  wDataInicial,
  wDataFinal : String;
begin
  wDataInicial := '';
  wDataFinal   := '';

  if (StringReplace( StringReplace(edDataInicial.Text,'/','',[rfReplaceAll]),' ','',[rfReplaceAll]) <> '') and
     (StringReplace( StringReplace(edDataFinal.Text,'/','',[rfReplaceAll]),' ','',[rfReplaceAll]) <> '')   then
     begin
       wDataInicial := FormatDateTime('YYYY-MM-DD',StrToDate(edDataInicial.Text));
       wDataFinal   := FormatDateTime('YYYY-MM-DD',StrToDate(edDataFinal.Text));

       dmControl.qrPrincipal.SQL.Add(fGetAndWhere(dmControl.qrPrincipal.SQL.Text) + ' bdData BETWEEN ');
       dmControl.qrPrincipal.SQL.Add(QuotedStr(wDataInicial) + fGetAndWhere(dmControl.qrPrincipal.SQL.Text) + QuotedStr(wDataFinal));
     end
  else
  if (StringReplace( StringReplace(edDataInicial.Text,'/','',[rfReplaceAll]),' ','',[rfReplaceAll]) <> '') then
     begin
       wDataInicial := FormatDateTime('YYYY-MM-DD',StrToDate(edDataInicial.Text));
       dmControl.qrPrincipal.SQL.Add(fGetAndWhere(dmControl.qrPrincipal.SQL.Text) + ' bdData >=' + QuotedStr(wDataInicial));
     end
  else
  if (StringReplace( StringReplace(edDataFinal.Text,'/','',[rfReplaceAll]),' ','',[rfReplaceAll]) <> '') then
     begin
       wDataFinal := FormatDateTime('YYYY-MM-DD',StrToDate(edDataFinal.Text));
       dmControl.qrPrincipal.SQL.Add(fGetAndWhere(dmControl.qrPrincipal.SQL.Text) + ' bdData <=' + QuotedStr(wDataFinal));
     end;
end;

function TfrPrincipal.fCalculaComissao(prValorTotal,prPercentual: Double): Double;
begin
  Result := prValorTotal * prPercentual;
end;

procedure TfrPrincipal.pFazProcessoComissao;
var
  wslValoresVendedores :TStringList;
  wVendedor : TVendedor;
  wI : Integer;
  wCampoVirtualTotais,
  wEnds: String;
  wValComissao: Double;
  //cdsDadosVendedores : TClientDataSet;

  procedure pAtualizarVendedor(var prSlVendedores : TStringList; prIdVendedor: String; prValor: Double);
  begin
    if wslValoresVendedores.IndexOf(prIdVendedor) = -1 then
       begin
         wVendedor := TVendedor.Create;
         wVendedor.ValorTotal := prValor;
         wslValoresVendedores.AddObject(prIdVendedor,wVendedor);
       end
    else
       begin
         wVendedor := TVendedor(wslValoresVendedores.Objects[wslValoresVendedores.IndexOf(prIdVendedor)]);
         wVendedor.ValorTotal := wVendedor.ValorTotal + prValor;
       end;
  end;


begin
  if dmControl.qrPrincipal.RecordCount = 0 then
     Exit;

  wEnds := '';
  wCampoVirtualTotais := '';
  wslValoresVendedores := TStringList.Create;

  {cdsDadosVendedores := TClientDataSet.Create(Self);
  cdsDadosVendedores.Close;

  cdsDadosVendedores.Fields.Clear;
  cdsDadosVendedores.FieldDefs.Add('bdIdVendedor',ftinteger,0, false);
  cdsDadosVendedores.FieldDefs.Add('bdVendedor',ftString,50, false);
  cdsDadosVendedores.FieldDefs.Add('bdValorTotalVendedores',ftFloat,0, false);
  cdsDadosVendedores.FieldDefs.Add('bdValorComissao',ftFloat,0, false);

  cdsDadosVendedores.IndexDefs.Clear;
  cdsDadosVendedores.IndexDefs.Add('ibdIdVendedor','bdIdVendedor',[ixPrimary,ixUnique]);

  cdsDadosVendedores.CreateDataSet;
  cdsDadosVendedores.Open;}

  qrVendedores.Close;
  qrVendedores.SQL.Clear;
  qrVendedores.SQL.Add('select Vendedores.bdIdVendedor,Vendedores.bdVendedor,');

  try
    dmControl.qrPrincipal.First;
    while not dmControl.qrPrincipal.Eof do
      begin
        pAtualizarVendedor(wslValoresVendedores,dmControl.qrPrincipal.FieldByName('bdIdVendedor').AsString,dmControl.qrPrincipal.FieldByName('bdValorTotal').AsFloat);

        dmControl.qrPrincipal.Next;
      end;
    for wI := 0 to wslValoresVendedores.Count-1 do
      begin
        wCampoVirtualTotais := wslValoresVendedores[wI] + ': ' + FloatToStr(TVendedor(wslValoresVendedores.Objects[wI]).ValorTotal);
        wCampoVirtualTotais := '(case when Vendas.bdIdVendedor =' + wslValoresVendedores[wI] +
                               ' then ' + StringReplace(floatToStr(TVendedor(wslValoresVendedores.Objects[wI]).ValorTotal),',','.',[rfReplaceAll]) +
                               ' else 0 +';
        if wI = wslValoresVendedores.Count-1 then
           wCampoVirtualTotais := '(case when Vendas.bdIdVendedor =' + wslValoresVendedores[wI] +
                                  ' then ' + StringReplace(floatToStr(TVendedor(wslValoresVendedores.Objects[wI]).ValorTotal),',','.',[rfReplaceAll]) +
                                  ' else 0';

        qrVendedores.SQL.Add(wCampoVirtualTotais);
        wEnds := wEnds + 'end)';
      end;
    qrVendedores.SQL.Add(wEnds);
    qrVendedores.SQL.Add('as bdValorTotalVendedores');
    qrVendedores.SQL.Add('from Vendedores');
    qrVendedores.SQL.Add('left join Vendas on (Vendedores.bdIdVendedor = Vendas.bdIdVendedor)');
    qrVendedores.SQL.Add('group by Vendedores.bdIdVendedor, Vendedores.bdVendedor, Vendas.bdIdVendedor');
    qrVendedores.SQL.Add('order by bdValorTotalVendedores');
    qrVendedores.Open;
    qrVendedores.First;
    while not qrVendedores.Eof do
      begin
        {cdsDadosVendedores.Insert;
        cdsDadosVendedores.FieldByName('bdIdVendedor').AsInteger         := qrVendedores.FieldByName('bdIdVendedor').AsInteger;
        cdsDadosVendedores.FieldByName('bdVendedor').AsString            := qrVendedores.FieldByName('bdVendedor').AsString;
        cdsDadosVendedores.FieldByName('bdValorTotalVendedores').AsFloat := qrVendedores.FieldByName('bdValorTotalVendedores').AsFloat;
        }
        if qrVendedores.RecNo =  qrVendedores.Recordcount then // Maior valor 10% + 20% em cima dos 10%
           begin
             wValComissao := fCalculaComissao(qrVendedores.FieldByName('bdValorTotalVendedores').AsFloat,cDezPer);
             wValComissao := wValComissao + (fCalculaComissao(wValComissao,0.20));
             //cdsDadosVendedores.FieldByName('bdValorComissao').AsFloat := wValComissao;
           end
        else
        if qrVendedores.RecNo = 1 then  // Menor valor -> 5%
           begin
             wValComissao := fCalculaComissao(qrVendedores.FieldByName('bdValorTotalVendedores').AsFloat,cCincoPer);
             //cdsDadosVendedores.FieldByName('bdValorComissao').AsFloat := wValComissao;
           end
        else  //para todos os outros vendedores intermediários
           begin
             wValComissao := fCalculaComissao(qrVendedores.FieldByName('bdValorTotalVendedores').AsFloat,cDezPer);
             //cdsDadosVendedores.FieldByName('bdValorComissao').AsFloat := wValComissao;
           end;
        //cdsDadosVendedores.Post;
        qrVendedores.Next;
      end;
      //frxDadosVendedores.DataSet := cdsDadosVendedores;
  finally
    for wI := 0 to wslValoresVendedores.Count - 1 do
      wslValoresVendedores.Objects[wI].Free;
    wslValoresVendedores.Free;
    //cdsDadosVendedores.Free;
  end;


end;

procedure TfrPrincipal.FormCreate(Sender: TObject);
begin
  vDiretorioRaiz := copy(application.exename,1,pos('TesteDelphi.exe',application.exename)-1);

  qrVendedores := TADOQuery.Create(self);
  qrVendedores.Connection := dmControl.conexao;
  qrVendedores.Close;
  qrVendedores.SQL.Clear;
  qrVendedores.SQL.Add('Select * from Vendedores');
  qrVendedores.Open;
  while not qrVendedores.Eof do
  begin
    cbListaVendedores.Items.Add(qrVendedores.FieldByName('bdVendedor').AsString);

    qrVendedores.Next;
  end;

  {
  frxReport1.OnUserFunction := frxReport1UserFunction;
  frxReport1.AddFunction('function fckTotalGeral: Boolean', 'ctOther', 'Retorna o valor marcado no CheckBox Total Geral');
  frxReport1.AddFunction('function fckTotalGrupo: Boolean', 'ctOther', 'Retorna o valor marcado no CheckBox Total Grupo');
  }
end;

procedure TfrPrincipal.FormDestroy(Sender: TObject);
begin
  qrVendedores.Free;
end;

function TfrPrincipal.frxReport1UserFunction(const MethodName: string;
  var Params: Variant): Variant;
begin
  if UpperCase(MethodName) = 'FCKTOTALGERAL' then
     Result := fckTotalGeral
  else
  if UpperCase(MethodName) = 'FCKTOTALGRUPO' then
     Result := fckTotalGrupo;
end;

end.
