// CodeGear C++Builder
// Copyright (c) 1995, 2009 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Dbgridehimpexp.pas' rev: 21.00

#ifndef DbgridehimpexpHPP
#define DbgridehimpexpHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <Sysinit.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Sysutils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Gridseh.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <Ehlibvcl.hpp>	// Pascal unit
#include <Dbgrideh.hpp>	// Pascal unit
#include <Db.hpp>	// Pascal unit
#include <Clipbrd.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Dbgridehimpexp
{
//-- type declarations -------------------------------------------------------
typedef DynamicArray<System::Currency> TFooterValues;

class DELPHICLASS TDBGridEhExport;
class PASCALIMPLEMENTATION TDBGridEhExport : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	Dbgrideh::TColCellParamsEh* FColCellParamsEh;
	Dbgrideh::TCustomDBGridEh* FDBGridEh;
	Dbgrideh::TColumnsEhList* FExpCols;
	Classes::TStream* FStream;
	System::UnicodeString __fastcall GetFooterValue(int Row, int Col);
	void __fastcall CalcFooterValues(void);
	
protected:
	TFooterValues FooterValues;
	virtual void __fastcall WritePrefix(void);
	virtual void __fastcall WriteSuffix(void);
	virtual void __fastcall WriteTitle(Dbgrideh::TColumnsEhList* ColumnsList);
	virtual void __fastcall WriteRecord(Dbgrideh::TColumnsEhList* ColumnsList);
	virtual void __fastcall WriteDataCell(Dbgrideh::TColumnEh* Column, Dbgrideh::TColCellParamsEh* FColCellParamsEh);
	virtual void __fastcall WriteFooter(Dbgrideh::TColumnsEhList* ColumnsList, int FooterNo);
	virtual void __fastcall WriteFooterCell(int DataCol, int Row, Dbgrideh::TColumnEh* Column, Graphics::TFont* AFont, Graphics::TColor Background, Classes::TAlignment Alignment, System::UnicodeString Text);
	__property Classes::TStream* Stream = {read=FStream, write=FStream};
	__property Dbgrideh::TColumnsEhList* ExpCols = {read=FExpCols, write=FExpCols};
	
public:
	__fastcall virtual TDBGridEhExport(void);
	__fastcall virtual ~TDBGridEhExport(void);
	virtual void __fastcall ExportToStream(Classes::TStream* AStream, bool IsExportAll);
	virtual void __fastcall ExportToFile(System::UnicodeString FileName, bool IsExportAll);
	__property Dbgrideh::TCustomDBGridEh* DBGridEh = {read=FDBGridEh, write=FDBGridEh};
};


typedef TMetaClass* TDBGridEhExportClass;

class DELPHICLASS TDBGridEhExportAsText;
class PASCALIMPLEMENTATION TDBGridEhExportAsText : public TDBGridEhExport
{
	typedef TDBGridEhExport inherited;
	
private:
	bool FirstRec;
	bool FirstCell;
	
protected:
	virtual void __fastcall CheckFirstRec(void);
	virtual void __fastcall CheckFirstCell(void);
	virtual void __fastcall WritePrefix(void);
	virtual void __fastcall WriteSuffix(void);
	virtual void __fastcall WriteTitle(Dbgrideh::TColumnsEhList* ColumnsList);
	virtual void __fastcall WriteFooter(Dbgrideh::TColumnsEhList* ColumnsList, int FooterNo);
	virtual void __fastcall WriteRecord(Dbgrideh::TColumnsEhList* ColumnsList);
	virtual void __fastcall WriteDataCell(Dbgrideh::TColumnEh* Column, Dbgrideh::TColCellParamsEh* FColCellParamsEh);
	virtual void __fastcall WriteFooterCell(int DataCol, int Row, Dbgrideh::TColumnEh* Column, Graphics::TFont* AFont, Graphics::TColor Background, Classes::TAlignment Alignment, System::UnicodeString Text);
	
public:
	virtual void __fastcall ExportToStream(Classes::TStream* Stream, bool IsExportAll);
public:
	/* TDBGridEhExport.Create */ inline __fastcall virtual TDBGridEhExportAsText(void) : TDBGridEhExport() { }
	/* TDBGridEhExport.Destroy */ inline __fastcall virtual ~TDBGridEhExportAsText(void) { }
	
};


class DELPHICLASS TDBGridEhExportAsUnicodeText;
class PASCALIMPLEMENTATION TDBGridEhExportAsUnicodeText : public TDBGridEhExport
{
	typedef TDBGridEhExport inherited;
	
private:
	bool FirstRec;
	bool FirstCell;
	
protected:
	virtual void __fastcall CheckFirstRec(void);
	virtual void __fastcall CheckFirstCell(void);
	virtual void __fastcall WritePrefix(void);
	virtual void __fastcall WriteSuffix(void);
	virtual void __fastcall WriteTitle(Dbgrideh::TColumnsEhList* ColumnsList);
	virtual void __fastcall WriteFooter(Dbgrideh::TColumnsEhList* ColumnsList, int FooterNo);
	virtual void __fastcall WriteRecord(Dbgrideh::TColumnsEhList* ColumnsList);
	virtual void __fastcall WriteDataCell(Dbgrideh::TColumnEh* Column, Dbgrideh::TColCellParamsEh* FColCellParamsEh);
	virtual void __fastcall WriteFooterCell(int DataCol, int Row, Dbgrideh::TColumnEh* Column, Graphics::TFont* AFont, Graphics::TColor Background, Classes::TAlignment Alignment, System::UnicodeString Text);
	
public:
	virtual void __fastcall ExportToStream(Classes::TStream* Stream, bool IsExportAll);
public:
	/* TDBGridEhExport.Create */ inline __fastcall virtual TDBGridEhExportAsUnicodeText(void) : TDBGridEhExport() { }
	/* TDBGridEhExport.Destroy */ inline __fastcall virtual ~TDBGridEhExportAsUnicodeText(void) { }
	
};


class DELPHICLASS TDBGridEhExportAsCSV;
class PASCALIMPLEMENTATION TDBGridEhExportAsCSV : public TDBGridEhExportAsText
{
	typedef TDBGridEhExportAsText inherited;
	
private:
	char FSeparator;
	
protected:
	virtual void __fastcall CheckFirstCell(void);
	virtual void __fastcall WriteTitle(Dbgrideh::TColumnsEhList* ColumnsList);
	virtual void __fastcall WriteDataCell(Dbgrideh::TColumnEh* Column, Dbgrideh::TColCellParamsEh* FColCellParamsEh);
	virtual void __fastcall WriteFooterCell(int DataCol, int Row, Dbgrideh::TColumnEh* Column, Graphics::TFont* AFont, Graphics::TColor Background, Classes::TAlignment Alignment, System::UnicodeString Text);
	
public:
	__fastcall virtual TDBGridEhExportAsCSV(void);
	__property char Separator = {read=FSeparator, write=FSeparator, nodefault};
public:
	/* TDBGridEhExport.Destroy */ inline __fastcall virtual ~TDBGridEhExportAsCSV(void) { }
	
};


class DELPHICLASS TDBGridEhExportAsHTML;
class PASCALIMPLEMENTATION TDBGridEhExportAsHTML : public TDBGridEhExport
{
	typedef TDBGridEhExport inherited;
	
private:
	System::UnicodeString __fastcall GetAlignment(Classes::TAlignment Alignment);
	System::UnicodeString __fastcall GetColor(Graphics::TColor Color);
	void __fastcall PutText(Graphics::TFont* Font, System::UnicodeString Text);
	void __fastcall Put(System::UnicodeString Text);
	void __fastcall PutL(System::UnicodeString Text);
	
protected:
	virtual void __fastcall WritePrefix(void);
	virtual void __fastcall WriteSuffix(void);
	virtual void __fastcall WriteTitle(Dbgrideh::TColumnsEhList* ColumnsList);
	virtual void __fastcall WriteRecord(Dbgrideh::TColumnsEhList* ColumnsList);
	virtual void __fastcall WriteDataCell(Dbgrideh::TColumnEh* Column, Dbgrideh::TColCellParamsEh* FColCellParamsEh);
	virtual void __fastcall WriteFooter(Dbgrideh::TColumnsEhList* ColumnsList, int FooterNo);
	virtual void __fastcall WriteFooterCell(int DataCol, int Row, Dbgrideh::TColumnEh* Column, Graphics::TFont* AFont, Graphics::TColor Background, Classes::TAlignment Alignment, System::UnicodeString Text);
public:
	/* TDBGridEhExport.Create */ inline __fastcall virtual TDBGridEhExportAsHTML(void) : TDBGridEhExport() { }
	/* TDBGridEhExport.Destroy */ inline __fastcall virtual ~TDBGridEhExportAsHTML(void) { }
	
};


class DELPHICLASS TDBGridEhExportAsRTF;
class PASCALIMPLEMENTATION TDBGridEhExportAsRTF : public TDBGridEhExport
{
	typedef TDBGridEhExport inherited;
	
private:
	Ehlibvcl::TMemoryStreamEh* FCacheStream;
	Classes::TStrings* ColorTblList;
	Classes::TStrings* FontTblList;
	int __fastcall GetFontIndex(System::UnicodeString FontName);
	int __fastcall GetColorIndex(Graphics::TColor Color);
	System::UnicodeString __fastcall GetAlignment(Classes::TAlignment Alignment);
	Graphics::TColor __fastcall GetDataCellColor(Dbgrideh::TColumnsEhList* ColumnsList, int ColIndex);
	Graphics::TColor __fastcall GetFooterCellColor(Dbgrideh::TColumnsEhList* ColumnsList, int ColIndex, int FooterNo);
	void __fastcall PutText(Graphics::TFont* Font, System::UnicodeString Text, Graphics::TColor Background);
	void __fastcall Put(System::UnicodeString Text);
	void __fastcall PutL(System::UnicodeString Text);
	
protected:
	void __fastcall WriteCellBorder(bool LeftBorder, bool TopBorder, bool BottomBorder, bool RightBorder);
	virtual void __fastcall WritePrefix(void);
	virtual void __fastcall WriteSuffix(void);
	virtual void __fastcall WriteTitle(Dbgrideh::TColumnsEhList* ColumnsList);
	virtual void __fastcall WriteRecord(Dbgrideh::TColumnsEhList* ColumnsList);
	virtual void __fastcall WriteDataCell(Dbgrideh::TColumnEh* Column, Dbgrideh::TColCellParamsEh* FColCellParamsEh);
	virtual void __fastcall WriteFooter(Dbgrideh::TColumnsEhList* ColumnsList, int FooterNo);
	virtual void __fastcall WriteFooterCell(int DataCol, int Row, Dbgrideh::TColumnEh* Column, Graphics::TFont* AFont, Graphics::TColor Background, Classes::TAlignment Alignment, System::UnicodeString Text);
	
public:
	virtual void __fastcall ExportToStream(Classes::TStream* AStream, bool IsExportAll);
public:
	/* TDBGridEhExport.Create */ inline __fastcall virtual TDBGridEhExportAsRTF(void) : TDBGridEhExport() { }
	/* TDBGridEhExport.Destroy */ inline __fastcall virtual ~TDBGridEhExportAsRTF(void) { }
	
};


class DELPHICLASS TDBGridEhExportAsXLS;
class PASCALIMPLEMENTATION TDBGridEhExportAsXLS : public TDBGridEhExport
{
	typedef TDBGridEhExport inherited;
	
private:
	System::Word FCol;
	System::Word FRow;
	void __fastcall WriteBlankCell(void);
	void __fastcall WriteIntegerCell(const int AValue);
	void __fastcall WriteFloatCell(const double AValue);
	void __fastcall WriteStringCell(const System::UnicodeString AValue);
	void __fastcall IncColRow(void);
	
protected:
	virtual void __fastcall WritePrefix(void);
	virtual void __fastcall WriteSuffix(void);
	virtual void __fastcall WriteTitle(Dbgrideh::TColumnsEhList* ColumnsList);
	virtual void __fastcall WriteDataCell(Dbgrideh::TColumnEh* Column, Dbgrideh::TColCellParamsEh* FColCellParamsEh);
	virtual void __fastcall WriteFooterCell(int DataCol, int Row, Dbgrideh::TColumnEh* Column, Graphics::TFont* AFont, Graphics::TColor Background, Classes::TAlignment Alignment, System::UnicodeString Text);
	
public:
	virtual void __fastcall ExportToStream(Classes::TStream* AStream, bool IsExportAll);
public:
	/* TDBGridEhExport.Create */ inline __fastcall virtual TDBGridEhExportAsXLS(void) : TDBGridEhExport() { }
	/* TDBGridEhExport.Destroy */ inline __fastcall virtual ~TDBGridEhExportAsXLS(void) { }
	
};


#pragma pack(push,1)
struct TVCLDBIF_BOF
{
	
public:
	StaticArray<char, 7> Signatura;
	System::Byte Version;
	int ColCount;
};
#pragma pack(pop)


#pragma pack(push,1)
struct TVCLDBIF_INTEGER32
{
	
public:
	System::Byte AType;
	int Value;
};
#pragma pack(pop)


#pragma pack(push,1)
struct TVCLDBIF_FLOAT64
{
	
public:
	System::Byte AType;
	double Value;
};
#pragma pack(pop)


#pragma pack(push,1)
struct TVCLDBIF_ANSI_STRING
{
	
public:
	System::Byte AType;
	int Size;
};
#pragma pack(pop)


#pragma pack(push,1)
struct TVCLDBIF_WIDE_STRING
{
	
public:
	System::Byte AType;
	int Size;
};
#pragma pack(pop)


#pragma pack(push,1)
struct TVCLDBIF_BINARY_DATA
{
	
public:
	System::Byte AType;
	int Size;
};
#pragma pack(pop)


class DELPHICLASS TDBGridEhExportAsVCLDBIF;
class PASCALIMPLEMENTATION TDBGridEhExportAsVCLDBIF : public TDBGridEhExport
{
	typedef TDBGridEhExport inherited;
	
private:
	void __fastcall WriteUnassigned(void);
	void __fastcall WriteNull(void);
	void __fastcall WriteInteger(int AValue);
	void __fastcall WriteFloat(double AValue);
	void __fastcall WriteAnsiString(System::AnsiString AValue);
	void __fastcall WriteWideString(System::WideString AValue);
	void __fastcall WriteBinaryData(System::AnsiString AValue);
	
protected:
	virtual void __fastcall WritePrefix(void);
	virtual void __fastcall WriteSuffix(void);
	virtual void __fastcall WriteDataCell(Dbgrideh::TColumnEh* Column, Dbgrideh::TColCellParamsEh* FColCellParamsEh);
public:
	/* TDBGridEhExport.Create */ inline __fastcall virtual TDBGridEhExportAsVCLDBIF(void) : TDBGridEhExport() { }
	/* TDBGridEhExport.Destroy */ inline __fastcall virtual ~TDBGridEhExportAsVCLDBIF(void) { }
	
};


class DELPHICLASS TDBGridEhImport;
class PASCALIMPLEMENTATION TDBGridEhImport : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	Dbgrideh::TCustomDBGridEh* FDBGridEh;
	Classes::TStream* FStream;
	Dbgrideh::TColumnsEhList* FImpCols;
	
protected:
	bool Eos;
	virtual void __fastcall ReadPrefix(void);
	virtual void __fastcall ReadSuffix(void);
	virtual void __fastcall ReadRecord(Dbgrideh::TColumnsEhList* ColumnsList);
	virtual void __fastcall ReadDataCell(Dbgrideh::TColumnEh* Column);
	__property Classes::TStream* Stream = {read=FStream, write=FStream};
	__property Dbgrideh::TColumnsEhList* ImpCols = {read=FImpCols, write=FImpCols};
	
public:
	__fastcall virtual TDBGridEhImport(void);
	virtual void __fastcall ImportFromStream(Classes::TStream* AStream, bool IsImportAll);
	virtual void __fastcall ImportFromFile(System::UnicodeString FileName, bool IsImportAll);
	__property Dbgrideh::TCustomDBGridEh* DBGridEh = {read=FDBGridEh, write=FDBGridEh};
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TDBGridEhImport(void) { }
	
};


typedef TMetaClass* TDBGridEhImportClass;

#pragma option push -b-
enum TImportTextSreamState { itssChar, itssTab, itssNewLine, itssEof };
#pragma option pop

class DELPHICLASS TDBGridEhImportAsText;
class PASCALIMPLEMENTATION TDBGridEhImportAsText : public TDBGridEhImport
{
	typedef TDBGridEhImport inherited;
	
private:
	char FLastChar;
	TImportTextSreamState FLastState;
	System::AnsiString FLastString;
	bool FIgnoreAll;
	bool __fastcall GetChar(char &ch);
	TImportTextSreamState __fastcall CheckState(void);
	TImportTextSreamState __fastcall GetString(System::AnsiString &Value);
	
protected:
	virtual void __fastcall ReadPrefix(void);
	virtual void __fastcall ReadRecord(Dbgrideh::TColumnsEhList* ColumnsList);
	virtual void __fastcall ReadDataCell(Dbgrideh::TColumnEh* Column);
	
public:
	virtual void __fastcall ImportFromStream(Classes::TStream* AStream, bool IsImportAll);
public:
	/* TDBGridEhImport.Create */ inline __fastcall virtual TDBGridEhImportAsText(void) : TDBGridEhImport() { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TDBGridEhImportAsText(void) { }
	
};


class DELPHICLASS TDBGridEhImportAsUnicodeText;
class PASCALIMPLEMENTATION TDBGridEhImportAsUnicodeText : public TDBGridEhImport
{
	typedef TDBGridEhImport inherited;
	
private:
	System::WideChar FLastChar;
	TImportTextSreamState FLastState;
	System::WideString FLastString;
	bool FIgnoreAll;
	bool __fastcall GetChar(System::WideChar &ch);
	TImportTextSreamState __fastcall CheckState(void);
	TImportTextSreamState __fastcall GetString(System::WideString &Value);
	
protected:
	virtual void __fastcall ReadPrefix(void);
	virtual void __fastcall ReadRecord(Dbgrideh::TColumnsEhList* ColumnsList);
	virtual void __fastcall ReadDataCell(Dbgrideh::TColumnEh* Column);
	
public:
	virtual void __fastcall ImportFromStream(Classes::TStream* AStream, bool IsImportAll);
public:
	/* TDBGridEhImport.Create */ inline __fastcall virtual TDBGridEhImportAsUnicodeText(void) : TDBGridEhImport() { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TDBGridEhImportAsUnicodeText(void) { }
	
};


class DELPHICLASS TDBGridEhImportAsVCLDBIF;
class PASCALIMPLEMENTATION TDBGridEhImportAsVCLDBIF : public TDBGridEhImport
{
	typedef TDBGridEhImport inherited;
	
private:
	TVCLDBIF_BOF Prefix;
	bool FIgnoreAll;
	System::Variant LastValue;
	Classes::TStringList* FieldNames;
	bool UseFieldNames;
	void __fastcall ReadValue(void);
	
protected:
	virtual void __fastcall ReadPrefix(void);
	virtual void __fastcall ReadRecord(Dbgrideh::TColumnsEhList* ColumnsList);
	virtual void __fastcall ReadDataCell(Dbgrideh::TColumnEh* Column);
	
public:
	virtual void __fastcall ImportFromStream(Classes::TStream* AStream, bool IsImportAll);
public:
	/* TDBGridEhImport.Create */ inline __fastcall virtual TDBGridEhImportAsVCLDBIF(void) : TDBGridEhImport() { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TDBGridEhImportAsVCLDBIF(void) { }
	
};


//-- var, const, procedure ---------------------------------------------------
static const ShortInt TVCLDBIF_TYPE_EOF = 0x0;
static const ShortInt TVCLDBIF_TYPE_UNASSIGNED = 0x1;
static const ShortInt TVCLDBIF_TYPE_NULL = 0x2;
static const ShortInt TVCLDBIF_TYPE_INTEGER32 = 0x3;
static const ShortInt TVCLDBIF_TYPE_FLOAT64 = 0x4;
static const ShortInt TVCLDBIF_TYPE_ANSI_STRING = 0x5;
static const ShortInt TVCLDBIF_TYPE_BINARY_DATA = 0x6;
static const ShortInt TVCLDBIF_TYPE_WIDE_STRING = 0x7;
extern PACKAGE System::Word CF_VCLDBIF;
extern PACKAGE bool ExtendedVCLDBIFImpExpRowSelect;
extern PACKAGE System::WideChar DBGridEhImpExpCsvSeparator;
extern PACKAGE void __fastcall WriteDBGridEhToExportStream(TDBGridEhExportClass ExportClass, Dbgrideh::TCustomDBGridEh* DBGridEh, Classes::TStream* Stream, bool IsSaveAll);
extern PACKAGE void __fastcall SaveDBGridEhToExportFile(TDBGridEhExportClass ExportClass, Dbgrideh::TCustomDBGridEh* DBGridEh, const System::UnicodeString FileName, bool IsSaveAll);
extern PACKAGE void __fastcall LoadDBGridEhFromImportFile(TDBGridEhImportClass ImportClass, Dbgrideh::TCustomDBGridEh* DBGridEh, const System::UnicodeString FileName, bool IsLoadToAll);
extern PACKAGE void __fastcall ReadDBGridEhFromImportStream(TDBGridEhImportClass ImportClass, Dbgrideh::TCustomDBGridEh* DBGridEh, Classes::TStream* Stream, bool IsLoadToAll);
extern PACKAGE void __fastcall DBGridEh_DoCutAction(Dbgrideh::TCustomDBGridEh* DBGridEh, bool ForWholeGrid);
extern PACKAGE void __fastcall DBGridEh_DoDeleteAction(Dbgrideh::TCustomDBGridEh* DBGridEh, bool ForWholeGrid);
extern PACKAGE void __fastcall DBGridEh_DoCopyAction(Dbgrideh::TCustomDBGridEh* DBGridEh, bool ForWholeGrid);
extern PACKAGE void __fastcall DBGridEh_DoPasteAction(Dbgrideh::TCustomDBGridEh* DBGridEh, bool ForWholeGrid);

}	/* namespace Dbgridehimpexp */
using namespace Dbgridehimpexp;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// DbgridehimpexpHPP
