object frPrincipal: TfrPrincipal
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Vendas'
  ClientHeight = 262
  ClientWidth = 319
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object pnPrincipal: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 313
    Height = 256
    Align = alClient
    BevelOuter = bvSpace
    Padding.Left = 3
    Padding.Top = 3
    Padding.Right = 3
    Padding.Bottom = 3
    TabOrder = 0
    ExplicitWidth = 309
    ExplicitHeight = 255
    object lbDatIni: TLabel
      Left = 24
      Top = 60
      Width = 51
      Height = 13
      Caption = 'Data inicial'
    end
    object lbDatFin: TLabel
      Left = 162
      Top = 59
      Width = 46
      Height = 13
      Caption = 'Data final'
    end
    object Label1: TLabel
      Left = 18
      Top = 24
      Width = 57
      Height = 13
      Caption = 'Vendedores'
    end
    object btGerarRel: TButton
      Left = 118
      Top = 216
      Width = 87
      Height = 25
      Caption = 'Gerar Relat'#243'rio'
      TabOrder = 0
      OnClick = btGerarRelClick
    end
    object edDataInicial: TMaskEdit
      Left = 81
      Top = 56
      Width = 65
      Height = 21
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
    end
    object edDataFinal: TMaskEdit
      Left = 216
      Top = 56
      Width = 65
      Height = 21
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 2
      Text = '  /  /    '
    end
    object rgOrdenar: TRadioGroup
      Left = 18
      Top = 83
      Width = 263
      Height = 62
      Caption = 'Ordernar Por'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Data'
        'Valor Total')
      TabOrder = 3
    end
    object ckTotalGrupo: TCheckBox
      Left = 200
      Top = 166
      Width = 97
      Height = 17
      Caption = 'Total Grupo'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    object ckTotalGeral: TCheckBox
      Left = 18
      Top = 166
      Width = 97
      Height = 17
      Caption = 'Total Geral'
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
    object cbListaVendedores: TComboBox
      Left = 81
      Top = 21
      Width = 200
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 6
      Text = 'Todos'
      Items.Strings = (
        'Todos')
    end
  end
  object frxReport1: TfrxReport
    Version = '2024.2.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45485.866841550900000000
    ReportOptions.LastChange = 45486.921638495370000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var      '
      'wValorAtual,  '
      'Maior,'
      'Menor,  '
      
        'Intermediario: Double;                                          ' +
        '                    '
      '  '
      'procedure GroupFooter1OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      
        '{  Maior := Max(Max(<frxDados."vendas_VENDEDOR01">, <frxDados."v' +
        'endas_VENDEDOR02">), <frxDados."vendas_VENDEDOR03">);'
      
        '  Menor := Min(Min(<frxDados."vendas_VENDEDOR01">, <frxDados."ve' +
        'ndas_VENDEDOR02">), <frxDados."vendas_VENDEDOR03">);'
      ''
      
        '  if (<frxDados."vendas_VENDEDOR01"> <> Maior) and (<frxDados."v' +
        'endas_VENDEDOR01"> <> Menor) then'
      '    Intermediario := <frxDados."vendas_VENDEDOR01">   '
      
        '  else if (<frxDados."vendas_VENDEDOR02"> <> Maior) and (<frxDad' +
        'os."vendas_VENDEDOR02"> <> Menor) then'
      '    Intermediario := <frxDados."vendas_VENDEDOR02">   '
      '  else'
      '    Intermediario := <frxDados."vendas_VENDEDOR03">;'
      '                                      }        '
      '  '
      '  Memo12.Visible := (<wMarcouTotGrupo> = '#39'1'#39');'
      '  Memo11.Visible := (<wMarcouTotGrupo> = '#39'1'#39');'
      '  Memo9.Visible  := (<wMarcouTotGrupo> = '#39'1'#39');'
      '  Memo10.Visible := (<wMarcouTotGrupo> = '#39'1'#39');'
      ''
      
        '  Memo19.Visible := (<wMarcouTotGeral> = '#39'1'#39');                  ' +
        '        '
      '  Memo20.Visible := (<wMarcouTotGeral> = '#39'1'#39');          '
      '  Memo21.Visible := (<wMarcouTotGeral> = '#39'1'#39');          '
      
        '  Memo22.Visible := (<wMarcouTotGeral> = '#39'1'#39');                  ' +
        '              '
      '    '
      'end;'
      ''
      'procedure Memo18OnBeforePrint(Sender: TfrxComponent);'
      'var'
      '  DataOriginal: string;'
      '  Ano, Mes, Dia: Word;'
      '  DataConvertida: TDateTime;'
      '  DataFormatada: string;    '
      'begin'
      '  DataOriginal := <frxDados."bdData">;   '
      '  Ano := StrToInt(Copy(DataOriginal, 1, 4));'
      '  Mes := StrToInt(Copy(DataOriginal, 6, 2));'
      '  Dia := StrToInt(Copy(DataOriginal, 9, 2));'
      ''
      '  DataConvertida := EncodeDate(Ano, Mes, Dia);'
      ''
      '  DataFormatada := FormatDateTime('#39'dd/mm/yyyy'#39', DataConvertida);'
      ''
      '  Memo18.Text := DataFormatada;  '
      'end;'
      ''
      'begin     '
      '   Memo12.Visible := (<wMarcouTotGrupo> = '#39'1'#39');'
      '   Memo11.Visible := (<wMarcouTotGrupo> = '#39'1'#39');'
      '   Memo9.Visible := (<wMarcouTotGrupo> = '#39'1'#39');'
      '   Memo10.Visible := (<wMarcouTotGrupo> = '#39'1'#39');       '
      'end.')
    OnUserFunction = frxReport1UserFunction
    Left = 280
    Top = 104
    Datasets = <
      item
        DataSet = frxDados
        DataSetName = 'frxDados'
      end>
    Variables = <
      item
        Name = ' Locais'
        Value = Null
      end
      item
        Name = 'wMarcouTotGeral'
        Value = ''
      end
      item
        Name = 'wMarcouTotGrupo'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 34.015770000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baClient
          AllowVectorExport = True
          Width = 718.110717773437500000
          Height = 34.015769958496090000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -20
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de vendas')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897651670000000000
        Top = 154.960730000000000000
        Width = 718.110700000000000000
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 374.173470000000000000
        Width = 718.110700000000000000
        object Memo19: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 0.000112243437499993
          Width = 600.945270730000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Valor Total Geral:')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 600.945382973437500000
          Width = 117.165334800000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSetName = 'frxDadosVendedores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[(FormatFloat('#39'#,##0.00'#39',SUM(<frxDados."bdValorTotal">)))]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 600.945270730000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'Valor Total Geral Comiss'#245'es:')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 600.945382973437500000
          Top = 18.897650000000000000
          Width = 117.165334800000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSetName = 'frxDadosVendedores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            
              '[(FormatFloat('#39'#,##0.00'#39',SUM(<frxDados."bdValorTotal">) * 0.10))' +
              ']')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897651670000000000
        Top = 245.669450000000000000
        Width = 718.110700000000000000
        DataSet = frxDados
        DataSetName = 'frxDados'
        RowCount = 0
        object frxDadosbdIdVenda: TfrxMemoView
          IndexTag = 1
          Align = baLeft
          AllowVectorExport = True
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'bdIdVenda'
          DataSet = frxDados
          DataSetName = 'frxDados'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDados."bdIdVenda"]')
        end
        object frxDadosbdValorVenda: TfrxMemoView
          IndexTag = 1
          Align = baLeft
          AllowVectorExport = True
          Left = 162.519790730000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDados
          DataSetName = 'frxDados'
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[(FormatFloat('#39'#,##0.00'#39',<frxDados."bdValorVenda">))]')
        end
        object frxDadosbdValorDesconto: TfrxMemoView
          IndexTag = 1
          Align = baLeft
          AllowVectorExport = True
          Left = 309.921460730000000000
          Width = 291.023810000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDados
          DataSetName = 'frxDados'
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[(FormatFloat('#39'#,##0.00'#39',<frxDados."bdValorDesconto">))]')
        end
        object frxDadosbdValorTotal: TfrxMemoView
          IndexTag = 1
          Align = baLeft
          AllowVectorExport = True
          Left = 600.945270730000000000
          Width = 117.054730000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDados
          DataSetName = 'frxDados'
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[(FormatFloat('#39'#,##0.00'#39',<frxDados."bdValorTotal">))]')
        end
        object Memo18: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 75.590600000000000000
          Top = 0.000003989999999995
          Width = 86.929190730000000000
          Height = 18.897637800000000000
          OnBeforePrint = 'Memo18OnBeforePrint'
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDados
          DataSetName = 'frxDados'
          Frame.Typ = []
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 196.535560000000000000
        Width = 718.110700000000000000
        Condition = 'frxDados."bdIdVendedor"'
        object Memo8: TfrxMemoView
          IndexTag = 1
          Align = baClient
          AllowVectorExport = True
          Width = 718.110717773437500000
          Height = 26.456710815429690000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'bdVendedor'
          DataSet = frxDados
          DataSetName = 'frxDados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Memo.UTF8W = (
            '[frxDados."bdVendedor"]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 64.252011670000000000
        Top = 287.244280000000000000
        Width = 718.110700000000000000
        OnAfterPrint = 'GroupFooter1OnAfterPrint'
        object Memo11: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 0.000112243437499993
          Width = 600.945270730000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Valor Total [frxDados."bdVendedor"]:')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 600.945382973437500000
          Width = 117.165334800000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSetName = 'frxDadosVendedores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[(FormatFloat('#39'#,##0.00'#39',SUM(<frxDados."bdValorTotal">)))]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 600.945270730000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'Comiss'#227'o:')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 600.945382973437500000
          Top = 18.897650000000000000
          Width = 117.165334800000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSetName = 'frxDadosVendedores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            
              '[(FormatFloat('#39'#,##0.00'#39',SUM(<frxDados."bdValorTotal">) * 0.10))' +
              ']')
          ParentFont = False
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897651670000000000
        Top = 75.590600000000000000
        Width = 718.110700000000000000
        object Memo13: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Width = 75.590600730000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 75.590600730000000000
          Width = 86.929190730000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 162.519791460000000000
          Width = 147.401670730000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Valor da Venda')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 309.921462190000000000
          Width = 291.023810730000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Valor desconto')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 600.945272920000000000
          Width = 117.054727080000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Valor Total')
          ParentFont = False
        end
      end
      object ColumnFooter1: TfrxColumnFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 472.441250000000000000
        Width = 718.110700000000000000
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 517.795610000000000000
        Width = 718.110700000000000000
      end
    end
  end
  object frxDados: TfrxDBDataset
    UserName = 'frxDados'
    CloseDataSource = False
    DataSet = dmControl.qrPrincipal
    BCDToCurrency = False
    DataSetOptions = []
    Left = 280
    Top = 160
    FieldDefs = <
      item
        FieldName = 'bdIdVenda'
      end
      item
        FieldName = 'bdData'
        FieldType = fftString
      end
      item
        FieldName = 'bdVendedor'
        FieldType = fftString
        Size = 50
      end
      item
        FieldName = 'bdValorVenda'
      end
      item
        FieldName = 'bdValorDesconto'
      end
      item
        FieldName = 'bdValorTotal'
      end
      item
        FieldName = 'bdIdVendedor'
      end>
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    EmbedFontsIfProtected = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 272
    Top = 208
  end
end
