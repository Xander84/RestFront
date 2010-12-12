// CodeGear C++Builder
// Copyright (c) 1995, 2009 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Dbgrideh.pas' rev: 21.00

#ifndef DbgridehHPP
#define DbgridehHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <Sysinit.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Sysutils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Stdctrls.hpp>	// Pascal unit
#include <Contnrs.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <Types.hpp>	// Pascal unit
#include <Ehlibvcl.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Gridseh.hpp>	// Pascal unit
#include <Dbctrls.hpp>	// Pascal unit
#include <Db.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Registry.hpp>	// Pascal unit
#include <Dbsumlst.hpp>	// Pascal unit
#include <Dbctrlseh.hpp>	// Pascal unit
#include <Inifiles.hpp>	// Pascal unit
#include <Toolctrlseh.hpp>	// Pascal unit
#include <Imglist.hpp>	// Pascal unit
#include <Stdactns.hpp>	// Pascal unit
#include <Propfilereh.hpp>	// Pascal unit
#include <Actnlist.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Dbgrideh
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TDBGridColumnsState { csDefault, csCustomized };
#pragma option pop

typedef void __fastcall (__closure *TDrawDataCellEvent)(System::TObject* Sender, const Types::TRect &Rect, Db::TField* Field, Gridseh::TGridDrawState State);

#pragma option push -b-
enum TDBGridOption { dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect };
#pragma option pop

typedef Set<TDBGridOption, dgEditing, dgMultiSelect>  TDBGridOptions;

#pragma option push -b-
enum TColumnEhValue { cvColor, cvWidth, cvFont, cvAlignment, cvReadOnly, cvTitleColor, cvTitleCaption, cvTitleAlignment, cvTitleFont, cvTitleButton, cvTitleEndEllipsis, cvTitleToolTips, cvTitleOrientation, cvImeMode, cvImeName, cvWordWrap, cvLookupDisplayFields, cvCheckboxes, cvAlwaysShowEditButton, cvEndEllipsis, cvAutoDropDown, cvDblClickNextVal, cvToolTips, cvDropDownSizing, cvDropDownShowTitles, cvLayout, cvHighlightRequired, cvBiDiMode, cvTextEditing };
#pragma option pop

typedef Set<TColumnEhValue, cvColor, cvTextEditing>  TColumnEhValues;

#pragma option push -b-
enum TColumnFooterEhValue { cvFooterAlignment, cvFooterFont, cvFooterColor, cvFooterToolTips };
#pragma option pop

typedef Set<TColumnFooterEhValue, cvFooterAlignment, cvFooterToolTips>  TColumnFooterValues;

#pragma option push -b-
enum TColumnEhRestoreParam { crpColIndexEh, crpColWidthsEh, crpSortMarkerEh, crpColVisibleEh, crpDropDownRowsEh, crpDropDownWidthEh };
#pragma option pop

typedef Set<TColumnEhRestoreParam, crpColIndexEh, crpDropDownWidthEh>  TColumnEhRestoreParams;

#pragma option push -b-
enum TDBGridEhRestoreParam { grpColIndexEh, grpColWidthsEh, grpSortMarkerEh, grpColVisibleEh, grpRowHeightEh, grpDropDownRowsEh, grpDropDownWidthEh };
#pragma option pop

typedef Set<TDBGridEhRestoreParam, grpColIndexEh, grpDropDownWidthEh>  TDBGridEhRestoreParams;

#pragma option push -b-
enum TDBLookupGridEhOption { dlgColumnResizeEh, dlgColLinesEh, dlgRowLinesEh, dlgAutoSortMarkingEh, dlgMultiSortMarkingEh };
#pragma option pop

typedef Set<TDBLookupGridEhOption, dlgColumnResizeEh, dlgMultiSortMarkingEh>  TDBLookupGridEhOptions;

class DELPHICLASS TColumnEh;
typedef void __fastcall (__closure *TCheckTitleEhBtnEvent)(System::TObject* Sender, int ACol, TColumnEh* Column, bool &Enabled);

typedef void __fastcall (__closure *TDrawColumnEhCellEvent)(System::TObject* Sender, const Types::TRect &Rect, int DataCol, TColumnEh* Column, Gridseh::TGridDrawState State);

typedef void __fastcall (__closure *TGetCellEhParamsEvent)(System::TObject* Sender, TColumnEh* Column, Graphics::TFont* AFont, Graphics::TColor &Background, Gridseh::TGridDrawState State);

typedef void __fastcall (__closure *TTitleEhClickEvent)(System::TObject* Sender, int ACol, TColumnEh* Column);

typedef void __fastcall (__closure *TOnColumnCheckDrawRequiredStateEventEh)(System::TObject* Sender, System::UnicodeString Text, bool &DrawState);

typedef bool __fastcall (__closure *TGridMoveRecordsEventEh)(System::TObject* Sender, Toolctrlseh::TBMListEh* BookmarkList, int ToRecNo, int TreeLevel, bool CheckOnly);

class DELPHICLASS TCustomDBGridEh;
typedef void __fastcall (__closure *TDBGridEhBuildIndicatorTitleMenu)(TCustomDBGridEh* Grid, Menus::TPopupMenu* &PopupMenu);

__interface ILookupGridOwner;
typedef System::DelphiInterface<ILookupGridOwner> _di_ILookupGridOwner;
__interface  INTERFACE_UUID("{2A1F4552-15C3-4359-ADAB-F2F6719FAA97}") ILookupGridOwner  : public System::IInterface 
{
	
public:
	virtual void __fastcall SetListSource(Db::TDataSource* AListSource) = 0 ;
	virtual TCustomDBGridEh* __fastcall GetLookupGrid(void) = 0 ;
	virtual TDBLookupGridEhOptions __fastcall GetOptions(void) = 0 ;
	virtual void __fastcall SetOptions(TDBLookupGridEhOptions Value) = 0 ;
	__property TDBLookupGridEhOptions Options = {read=GetOptions, write=SetOptions};
};

#pragma option push -b-
enum TSortMarkerEh { smNoneEh, smDownEh, smUpEh };
#pragma option pop

#pragma option push -b-
enum TTextOrientationEh { tohHorizontal, tohVertical };
#pragma option pop

class DELPHICLASS TColumnTitleEh;
class PASCALIMPLEMENTATION TColumnTitleEh : public Classes::TPersistent
{
	typedef Classes::TPersistent inherited;
	
private:
	Classes::TAlignment FAlignment;
	System::UnicodeString FCaption;
	Graphics::TColor FColor;
	TColumnEh* FColumn;
	bool FEndEllipsis;
	Graphics::TFont* FFont;
	System::UnicodeString FHint;
	int FImageIndex;
	TTextOrientationEh FOrientation;
	int FSortIndex;
	bool FToolTips;
	Classes::TAlignment __fastcall GetAlignment(void);
	System::UnicodeString __fastcall GetCaption(void);
	Graphics::TColor __fastcall GetColor(void);
	bool __fastcall GetEndEllipsis(void);
	Graphics::TFont* __fastcall GetFont(void);
	TTextOrientationEh __fastcall GetOrientation(void);
	bool __fastcall GetTitleButton(void);
	bool __fastcall GetToolTips(void);
	bool __fastcall IsAlignmentStored(void);
	bool __fastcall IsCaptionStored(void);
	bool __fastcall IsColorStored(void);
	bool __fastcall IsEndEllipsisStored(void);
	bool __fastcall IsFontStored(void);
	bool __fastcall IsOrientationStored(void);
	bool __fastcall IsTitleButtonStored(void);
	bool __fastcall IsToolTipsStored(void);
	void __fastcall FontChanged(System::TObject* Sender);
	void __fastcall SetAlignment(Classes::TAlignment Value);
	virtual void __fastcall SetCaption(const System::UnicodeString Value);
	void __fastcall SetColor(Graphics::TColor Value);
	void __fastcall SetEndEllipsis(const bool Value);
	void __fastcall SetFont(Graphics::TFont* Value);
	void __fastcall SetImageIndex(const int Value);
	void __fastcall SetOrientation(const TTextOrientationEh Value);
	void __fastcall SetSortIndex(int Value);
	void __fastcall SetToolTips(const bool Value);
	
protected:
	TSortMarkerEh FSortMarker;
	bool FTitleButton;
	int __fastcall GetSortMarkingWidth(void);
	void __fastcall RefreshDefaultFont(void);
	void __fastcall SetSortMarker(TSortMarkerEh Value);
	void __fastcall SetTitleButton(bool Value);
	
public:
	__fastcall TColumnTitleEh(TColumnEh* Column);
	__fastcall virtual ~TColumnTitleEh(void);
	Classes::TAlignment __fastcall DefaultAlignment(void);
	System::UnicodeString __fastcall DefaultCaption(void);
	Graphics::TColor __fastcall DefaultColor(void);
	bool __fastcall DefaultEndEllipsis(void);
	Graphics::TFont* __fastcall DefaultFont(void);
	TTextOrientationEh __fastcall DefaultOrientation(void);
	bool __fastcall DefaultTitleButton(void);
	bool __fastcall DefaultToolTips(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall RestoreDefaults(void);
	void __fastcall SetNextSortMarkerValue(bool KeepMulti);
	__property TColumnEh* Column = {read=FColumn};
	
__published:
	__property Classes::TAlignment Alignment = {read=GetAlignment, write=SetAlignment, stored=IsAlignmentStored, nodefault};
	__property System::UnicodeString Caption = {read=GetCaption, write=SetCaption, stored=IsCaptionStored};
	__property Graphics::TColor Color = {read=GetColor, write=SetColor, stored=IsColorStored, nodefault};
	__property bool EndEllipsis = {read=GetEndEllipsis, write=SetEndEllipsis, stored=IsEndEllipsisStored, nodefault};
	__property Graphics::TFont* Font = {read=GetFont, write=SetFont, stored=IsFontStored};
	__property System::UnicodeString Hint = {read=FHint, write=FHint};
	__property int ImageIndex = {read=FImageIndex, write=SetImageIndex, default=-1};
	__property TTextOrientationEh Orientation = {read=GetOrientation, write=SetOrientation, stored=IsOrientationStored, nodefault};
	__property int SortIndex = {read=FSortIndex, write=SetSortIndex, default=0};
	__property TSortMarkerEh SortMarker = {read=FSortMarker, write=SetSortMarker, default=0};
	__property bool TitleButton = {read=GetTitleButton, write=SetTitleButton, stored=IsTitleButtonStored, nodefault};
	__property bool ToolTips = {read=GetToolTips, write=SetToolTips, stored=IsToolTipsStored, nodefault};
};


#pragma option push -b-
enum TFooterValueType { fvtNon, fvtSum, fvtAvg, fvtCount, fvtFieldValue, fvtStaticText };
#pragma option pop

class DELPHICLASS TColumnFooterEh;
class PASCALIMPLEMENTATION TColumnFooterEh : public Classes::TCollectionItem
{
	typedef Classes::TCollectionItem inherited;
	
private:
	Classes::TAlignment FAlignment;
	TColumnFooterValues FAssignedValues;
	Graphics::TColor FColor;
	TColumnEh* FColumn;
	System::UnicodeString FDisplayFormat;
	bool FEndEllipsis;
	System::UnicodeString FFieldName;
	Graphics::TFont* FFont;
	bool FToolTips;
	System::UnicodeString FValue;
	TFooterValueType FValueType;
	bool FWordWrap;
	Classes::TAlignment __fastcall GetAlignment(void);
	Graphics::TColor __fastcall GetColor(void);
	Graphics::TFont* __fastcall GetFont(void);
	System::Variant __fastcall GetSumValue(void);
	bool __fastcall GetToolTips(void);
	bool __fastcall IsAlignmentStored(void);
	bool __fastcall IsColorStored(void);
	bool __fastcall IsFontStored(void);
	bool __fastcall IsToolTipsStored(void);
	void __fastcall FontChanged(System::TObject* Sender);
	void __fastcall SetAlignment(Classes::TAlignment Value);
	void __fastcall SetColor(Graphics::TColor Value);
	void __fastcall SetDisplayFormat(const System::UnicodeString Value);
	void __fastcall SetEndEllipsis(const bool Value);
	void __fastcall SetFieldName(const System::UnicodeString Value);
	void __fastcall SetFont(Graphics::TFont* Value);
	void __fastcall SetToolTips(const bool Value);
	void __fastcall SetValue(const System::UnicodeString Value);
	void __fastcall SetValueType(const TFooterValueType Value);
	void __fastcall SetWordWrap(const bool Value);
	
protected:
	Dbsumlst::TDBSum* FDBSum;
	void __fastcall RefreshDefaultFont(void);
	
public:
	__fastcall virtual TColumnFooterEh(Classes::TCollection* Collection);
	__fastcall TColumnFooterEh(TColumnEh* Column);
	__fastcall virtual ~TColumnFooterEh(void);
	Classes::TAlignment __fastcall DefaultAlignment(void);
	Graphics::TColor __fastcall DefaultColor(void);
	Graphics::TFont* __fastcall DefaultFont(void);
	bool __fastcall DefaultToolTips(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	void __fastcall EnsureSumValue(void);
	virtual void __fastcall RestoreDefaults(void);
	__property TColumnFooterValues AssignedValues = {read=FAssignedValues, nodefault};
	__property TColumnEh* Column = {read=FColumn};
	__property System::Variant SumValue = {read=GetSumValue};
	
__published:
	__property Classes::TAlignment Alignment = {read=GetAlignment, write=SetAlignment, stored=IsAlignmentStored, nodefault};
	__property Graphics::TColor Color = {read=GetColor, write=SetColor, stored=IsColorStored, nodefault};
	__property System::UnicodeString DisplayFormat = {read=FDisplayFormat, write=SetDisplayFormat};
	__property bool EndEllipsis = {read=FEndEllipsis, write=SetEndEllipsis, default=0};
	__property System::UnicodeString FieldName = {read=FFieldName, write=SetFieldName};
	__property Graphics::TFont* Font = {read=GetFont, write=SetFont, stored=IsFontStored};
	__property bool ToolTips = {read=GetToolTips, write=SetToolTips, stored=IsToolTipsStored, nodefault};
	__property System::UnicodeString Value = {read=FValue, write=SetValue};
	__property TFooterValueType ValueType = {read=FValueType, write=SetValueType, default=0};
	__property bool WordWrap = {read=FWordWrap, write=SetWordWrap, default=0};
};


typedef TMetaClass* TColumnFooterEhClass;

class DELPHICLASS TColumnFootersEh;
class PASCALIMPLEMENTATION TColumnFootersEh : public Classes::TCollection
{
	typedef Classes::TCollection inherited;
	
public:
	TColumnFooterEh* operator[](int Index) { return Items[Index]; }
	
private:
	TColumnEh* FColumn;
	TColumnFooterEh* __fastcall GetFooter(int Index);
	void __fastcall SetFooter(int Index, TColumnFooterEh* Value);
	
protected:
	DYNAMIC Classes::TPersistent* __fastcall GetOwner(void);
	virtual void __fastcall Update(Classes::TCollectionItem* Item);
	
public:
	__fastcall TColumnFootersEh(TColumnEh* Column, TColumnFooterEhClass FooterClass);
	HIDESBASE TColumnFooterEh* __fastcall Add(void);
	__property TColumnEh* Column = {read=FColumn};
	__property TColumnFooterEh* Items[int Index] = {read=GetFooter, write=SetFooter/*, default*/};
public:
	/* TCollection.Destroy */ inline __fastcall virtual ~TColumnFootersEh(void) { }
	
};


#pragma option push -b-
enum TColumnEhType { ctCommon, ctPickList, ctLookupField, ctKeyPickList, ctKeyImageList, ctCheckboxes, ctGraphicData };
#pragma option pop

#pragma option push -b-
enum TColumnButtonStyleEh { cbsAuto, cbsEllipsis, cbsNone, cbsUpDown, cbsDropDown };
#pragma option pop

#pragma option push -b-
enum TColumnTitleDefValuesEhValue { cvdpTitleColorEh, cvdpTitleAlignmentEh };
#pragma option pop

typedef Set<TColumnTitleDefValuesEhValue, cvdpTitleColorEh, cvdpTitleAlignmentEh>  TColumnTitleDefValuesEhValues;

class DELPHICLASS TColumnTitleDefValuesEh;
class DELPHICLASS TColumnDefValuesEh;
class PASCALIMPLEMENTATION TColumnTitleDefValuesEh : public Classes::TPersistent
{
	typedef Classes::TPersistent inherited;
	
private:
	Classes::TAlignment FAlignment;
	TColumnTitleDefValuesEhValues FAssignedValues;
	Graphics::TColor FColor;
	TColumnDefValuesEh* FColumnDefValues;
	bool FEndEllipsis;
	TTextOrientationEh FOrientation;
	bool FTitleButton;
	bool FToolTips;
	Classes::TAlignment __fastcall DefaultAlignment(void);
	Graphics::TColor __fastcall DefaultColor(void);
	Classes::TAlignment __fastcall GetAlignment(void);
	Graphics::TColor __fastcall GetColor(void);
	bool __fastcall IsAlignmentStored(void);
	bool __fastcall IsColorStored(void);
	void __fastcall SetAlignment(const Classes::TAlignment Value);
	void __fastcall SetColor(const Graphics::TColor Value);
	void __fastcall SetEndEllipsis(const bool Value);
	void __fastcall SetOrientation(const TTextOrientationEh Value);
	
public:
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	__property TColumnTitleDefValuesEhValues AssignedValues = {read=FAssignedValues, nodefault};
	
__published:
	__fastcall TColumnTitleDefValuesEh(TColumnDefValuesEh* ColumnDefValues);
	__property Classes::TAlignment Alignment = {read=GetAlignment, write=SetAlignment, stored=IsAlignmentStored, nodefault};
	__property Graphics::TColor Color = {read=GetColor, write=SetColor, stored=IsColorStored, nodefault};
	__property bool EndEllipsis = {read=FEndEllipsis, write=SetEndEllipsis, default=0};
	__property TTextOrientationEh Orientation = {read=FOrientation, write=SetOrientation, default=0};
	__property bool TitleButton = {read=FTitleButton, write=FTitleButton, default=0};
	__property bool ToolTips = {read=FToolTips, write=FToolTips, default=0};
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~TColumnTitleDefValuesEh(void) { }
	
};


class DELPHICLASS TColumnFooterDefValuesEh;
class PASCALIMPLEMENTATION TColumnFooterDefValuesEh : public Classes::TPersistent
{
	typedef Classes::TPersistent inherited;
	
private:
	bool FToolTips;
	
public:
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	
__published:
	__property bool ToolTips = {read=FToolTips, write=FToolTips, default=0};
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~TColumnFooterDefValuesEh(void) { }
	
public:
	/* TObject.Create */ inline __fastcall TColumnFooterDefValuesEh(void) : Classes::TPersistent() { }
	
};


class PASCALIMPLEMENTATION TColumnDefValuesEh : public Classes::TPersistent
{
	typedef Classes::TPersistent inherited;
	
private:
	bool FAlwaysShowEditButton;
	bool FAutoDropDown;
	bool FDblClickNextVal;
	bool FDropDownShowTitles;
	bool FDropDownSizing;
	bool FEndEllipsis;
	Stdctrls::TTextLayout FLayout;
	bool FHighlightRequired;
	TCustomDBGridEh* FGrid;
	TColumnTitleDefValuesEh* FTitle;
	TColumnFooterDefValuesEh* FFooter;
	bool FToolTips;
	void __fastcall SetAlwaysShowEditButton(const bool Value);
	void __fastcall SetEndEllipsis(const bool Value);
	void __fastcall SetFooter(const TColumnFooterDefValuesEh* Value);
	void __fastcall SetHighlightRequired(bool Value);
	void __fastcall SetLayout(Stdctrls::TTextLayout Value);
	void __fastcall SetTitle(const TColumnTitleDefValuesEh* Value);
	
public:
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	__fastcall TColumnDefValuesEh(TCustomDBGridEh* Grid);
	__fastcall virtual ~TColumnDefValuesEh(void);
	__property bool AlwaysShowEditButton = {read=FAlwaysShowEditButton, write=SetAlwaysShowEditButton, default=0};
	__property bool AutoDropDown = {read=FAutoDropDown, write=FAutoDropDown, default=0};
	__property bool DblClickNextVal = {read=FDblClickNextVal, write=FDblClickNextVal, default=0};
	__property bool DropDownShowTitles = {read=FDropDownShowTitles, write=FDropDownShowTitles, default=0};
	__property bool DropDownSizing = {read=FDropDownSizing, write=FDropDownSizing, default=0};
	__property bool EndEllipsis = {read=FEndEllipsis, write=SetEndEllipsis, default=0};
	__property TColumnFooterDefValuesEh* Footer = {read=FFooter, write=SetFooter};
	__property bool HighlightRequired = {read=FHighlightRequired, write=SetHighlightRequired, default=0};
	__property Stdctrls::TTextLayout Layout = {read=FLayout, write=SetLayout, default=0};
	__property TColumnTitleDefValuesEh* Title = {read=FTitle, write=SetTitle};
	__property bool ToolTips = {read=FToolTips, write=FToolTips, default=0};
};


class DELPHICLASS TDBGridEhColumnDefValuesEh;
class PASCALIMPLEMENTATION TDBGridEhColumnDefValuesEh : public TColumnDefValuesEh
{
	typedef TColumnDefValuesEh inherited;
	
__published:
	__property AlwaysShowEditButton = {default=0};
	__property AutoDropDown = {default=0};
	__property DblClickNextVal = {default=0};
	__property DropDownShowTitles = {default=0};
	__property DropDownSizing = {default=0};
	__property EndEllipsis = {default=0};
	__property Footer;
	__property HighlightRequired = {default=0};
	__property Layout = {default=0};
	__property Title;
	__property ToolTips = {default=0};
public:
	/* TColumnDefValuesEh.Create */ inline __fastcall TDBGridEhColumnDefValuesEh(TCustomDBGridEh* Grid) : TColumnDefValuesEh(Grid) { }
	/* TColumnDefValuesEh.Destroy */ inline __fastcall virtual ~TDBGridEhColumnDefValuesEh(void) { }
	
};


#pragma option push -b-
enum TSTFilterOperatorEh { foNon, foEqual, foNotEqual, foGreaterThan, foLessThan, foGreaterOrEqual, foLessOrEqual, foLike, foNotLike, foIn, foNotIn, foNull, foNotNull, foAND, foOR, foValue };
#pragma option pop

#pragma option push -b-
enum TSTOperandTypeEh { botNon, botString, botNumber, botDateTime, botBoolean };
#pragma option pop

struct TSTFilterExpressionEh
{
	
public:
	TSTOperandTypeEh ExpressionType;
	TSTFilterOperatorEh Operator1;
	System::Variant Operand1;
	TSTFilterOperatorEh Relation;
	TSTFilterOperatorEh Operator2;
	System::Variant Operand2;
};


class DELPHICLASS TSTColumnFilterEh;
class PASCALIMPLEMENTATION TSTColumnFilterEh : public Classes::TPersistent
{
	typedef Classes::TPersistent inherited;
	
private:
	TColumnEh* FColumn;
	System::UnicodeString FDataField;
	System::UnicodeString FKeyCommaText;
	System::UnicodeString FKeyField;
	Classes::TStrings* FKeys;
	System::Variant FKeyValues;
	Classes::TStrings* FList;
	System::UnicodeString FListField;
	Dbctrls::TFieldDataLink* FListLink;
	bool FVisible;
	int FDropDownListWidth;
	int FDropDownListRows;
	TSTFilterExpressionEh __fastcall GetExpression(void);
	TCustomDBGridEh* __fastcall GetGrid(void);
	Db::TDataSource* __fastcall GetListSource(void);
	System::UnicodeString __fastcall ParseExpression(System::UnicodeString Exp);
	void __fastcall ListLinkActiveChange(System::TObject* Sender);
	void __fastcall SetExpression(const TSTFilterExpressionEh &Value);
	void __fastcall SetExpressionStr(const System::UnicodeString Value);
	void __fastcall SetListSource(const Db::TDataSource* Value);
	void __fastcall SetVisible(const bool Value);
	
protected:
	TSTFilterExpressionEh FExpression;
	System::UnicodeString FExpressionStr;
	virtual System::UnicodeString __fastcall GetExpressionAsString(void);
	virtual bool __fastcall DropDownButtonVisible(void);
	void __fastcall InternalSetExpressionStr(const System::UnicodeString Value);
	virtual void __fastcall CheckRecodeKeyList(TSTFilterExpressionEh &FExpression);
	
public:
	__fastcall TSTColumnFilterEh(TColumnEh* AColumn);
	__fastcall virtual ~TSTColumnFilterEh(void);
	Toolctrlseh::_di_IMemTableDataFieldValueListEh __fastcall GetFieldValueList(void);
	virtual System::UnicodeString __fastcall GetFilterFieldName(void);
	virtual System::Variant __fastcall GetOperand1(void);
	virtual System::Variant __fastcall GetOperand2(void);
	System::UnicodeString __fastcall CurrentKeyField(void);
	System::UnicodeString __fastcall CurrentDataField(void);
	Db::TDataSet* __fastcall CurrentListDataSet(void);
	System::UnicodeString __fastcall CurrentListField(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	void __fastcall Clear(void);
	void __fastcall SetKeyListValues(System::UnicodeString AText, const System::Variant &KeyVals);
	void __fastcall SetKeysFromListValues(Classes::TStrings* ss);
	__property int DropDownListWidth = {read=FDropDownListWidth, write=FDropDownListWidth, default=0};
	__property int DropDownListRows = {read=FDropDownListRows, write=FDropDownListRows, default=0};
	__property TColumnEh* Column = {read=FColumn};
	__property TSTFilterExpressionEh Expression = {read=GetExpression, write=SetExpression};
	__property System::UnicodeString ExpressionStr = {read=FExpressionStr, write=SetExpressionStr};
	__property TCustomDBGridEh* Grid = {read=GetGrid};
	__property System::UnicodeString KeyCommaText = {read=FKeyCommaText, write=FKeyCommaText};
	
__published:
	__property System::UnicodeString DataField = {read=FDataField, write=FDataField};
	__property System::UnicodeString KeyField = {read=FKeyField, write=FKeyField};
	__property System::UnicodeString ListField = {read=FListField, write=FListField};
	__property Db::TDataSource* ListSource = {read=GetListSource, write=SetListSource};
	__property bool Visible = {read=FVisible, write=SetVisible, default=1};
};


class DELPHICLASS TColCellParamsEh;
class PASCALIMPLEMENTATION TColCellParamsEh : public System::TObject
{
	typedef System::TObject inherited;
	
protected:
	Classes::TAlignment FAlignment;
	bool FBlankCell;
	Graphics::TColor FBackground;
	bool FSuppressActiveCellColor;
	Stdctrls::TCheckBoxState FCheckboxState;
	int FCol;
	Graphics::TFont* FFont;
	int FImageIndex;
	bool FReadOnly;
	int FRow;
	Gridseh::TGridDrawState FState;
	System::UnicodeString FText;
	bool FTextEditing;
	Types::TRect FCellRect;
	
public:
	__property Classes::TAlignment Alignment = {read=FAlignment, write=FAlignment, nodefault};
	__property Graphics::TColor Background = {read=FBackground, write=FBackground, nodefault};
	__property bool BlankCell = {read=FBlankCell, write=FBlankCell, nodefault};
	__property bool SuppressActiveCellColor = {read=FSuppressActiveCellColor, write=FSuppressActiveCellColor, nodefault};
	__property Stdctrls::TCheckBoxState CheckboxState = {read=FCheckboxState, write=FCheckboxState, nodefault};
	__property int Col = {read=FCol, write=FCol, nodefault};
	__property Types::TRect CellRect = {read=FCellRect};
	__property Graphics::TFont* Font = {read=FFont, write=FFont};
	__property int ImageIndex = {read=FImageIndex, write=FImageIndex, nodefault};
	__property bool ReadOnly = {read=FReadOnly, write=FReadOnly, nodefault};
	__property int Row = {read=FRow, write=FRow, nodefault};
	__property Gridseh::TGridDrawState State = {read=FState, write=FState, nodefault};
	__property System::UnicodeString Text = {read=FText, write=FText};
	__property bool TextEditing = {read=FTextEditing, write=FTextEditing, nodefault};
public:
	/* TObject.Create */ inline __fastcall TColCellParamsEh(void) : System::TObject() { }
	/* TObject.Destroy */ inline __fastcall virtual ~TColCellParamsEh(void) { }
	
};


struct TDBGridEhDataHintParams
{
	
public:
	Types::TPoint HintPos;
	int HintMaxWidth;
	Graphics::TColor HintColor;
	Graphics::TFont* HintFont;
	Types::TRect CursorRect;
	int ReshowTimeout;
	int HideTimeout;
	System::UnicodeString HintStr;
};


typedef void __fastcall (__closure *TGetColCellParamsEventEh)(System::TObject* Sender, bool EditMode, TColCellParamsEh* Params);

typedef void __fastcall (__closure *TColCellUpdateDataEventEh)(System::TObject* Sender, System::UnicodeString &Text, System::Variant &Value, bool &UseText, bool &Handled);

typedef void __fastcall (__closure *TDBGridEhHintShowPauseEvent)(TCustomDBGridEh* Sender, const Types::TPoint &CursorPos, const Gridseh::TGridCoord &Cell, const Types::TPoint &InCellCursorPos, TColumnEh* Column, int &HintPause, bool &Processed);

typedef void __fastcall (__closure *TDBGridEhDataHintShowEvent)(TCustomDBGridEh* Sender, const Types::TPoint &CursorPos, const Gridseh::TGridCoord &Cell, const Types::TPoint &InCellCursorPos, TColumnEh* Column, TDBGridEhDataHintParams &Params, bool &Processed);

typedef void __fastcall (__closure *TDBGridEhAdvDrawColumnDataEvent)(TCustomDBGridEh* Sender, const Gridseh::TGridCoord &Cell, const Gridseh::TGridCoord &AreaCell, TColumnEh* Column, const Types::TRect &ARect, TColCellParamsEh* &Params, bool &Processed);

class DELPHICLASS TColumnDropDownBoxEh;
class PASCALIMPLEMENTATION TColumnEh : public Classes::TCollectionItem
{
	typedef Classes::TCollectionItem inherited;
	
private:
	typedef DynamicArray<bool> _TColumnEh__1;
	
	
private:
	Classes::TAlignment FAlignment;
	TColumnEhValues FAssignedValues;
	Classes::TBiDiMode FBiDiMode;
	TColumnButtonStyleEh FButtonStyle;
	bool FCheckboxes;
	_TColumnEh__1 FCheckedDuplicates;
	Graphics::TColor FColor;
	bool FDblClickNextVal;
	System::UnicodeString FDisplayFormat;
	TColumnDropDownBoxEh* FDropDownBox;
	unsigned FDropDownRows;
	bool FDropDownShowTitles;
	bool FDropDownSizing;
	Toolctrlseh::TSpecRowEh* FDropDownSpecRow;
	Toolctrlseh::TEditButtonsEh* FEditButtons;
	System::UnicodeString FEditMask;
	Db::TField* FField;
	System::UnicodeString FFieldName;
	Graphics::TFont* FFont;
	TColumnFooterEh* FFooter;
	TColumnFootersEh* FFooters;
	bool FHideDuplicates;
	bool FHighlightRequired;
	Imglist::TCustomImageList* FImageList;
	Imglist::TChangeLink* FImageChangeLink;
	Controls::TImeMode FImeMode;
	Controls::TImeName FImeName;
	System::Extended FIncrement;
	Stdctrls::TTextLayout FLayout;
	Classes::TStrings* FKeyList;
	int FMaxWidth;
	int FMinWidth;
	Toolctrlseh::TMRUListEh* FMRUList;
	int FNotInKeyListIndex;
	bool FNotInWidthRange;
	Toolctrlseh::TButtonClickEventEh FOnButtonClick;
	Toolctrlseh::TButtonDownEventEh FOnButtonDown;
	TGetColCellParamsEventEh FOnGetCellParams;
	Toolctrlseh::TNotInListEventEh FOnNotInList;
	Classes::TStrings* FPickList;
	Menus::TPopupMenu* FPopupMenu;
	bool FReadonly;
	bool FStored;
	bool FShowImageAndText;
	int FTag;
	bool FTextEditing;
	TColumnTitleEh* FTitle;
	bool FToolTips;
	TColCellUpdateDataEventEh FUpdateData;
	bool FVisible;
	int FWidth;
	TSTColumnFilterEh* FSTFilter;
	Toolctrlseh::_di_IMemTableDataFieldValueListEh FFieldValueList;
	TDBGridEhAdvDrawColumnDataEvent FOnAdvDrawDataCell;
	TOnColumnCheckDrawRequiredStateEventEh FOnCheckDrawRequiredState;
	TDBGridEhHintShowPauseEvent FOnHintShowPause;
	TDBGridEhDataHintShowEvent FOnDataHintShow;
	bool __fastcall DefaultCheckboxes(void);
	Classes::TAlignment __fastcall GetAlignment(void);
	bool __fastcall GetAlwaysShowEditButton(void);
	bool __fastcall GetAutoDropDown(void);
	Classes::TBiDiMode __fastcall GetBiDiMode(void);
	bool __fastcall GetCheckboxes(void);
	Stdctrls::TCheckBoxState __fastcall GetCheckboxState(void);
	Graphics::TColor __fastcall GetColor(void);
	TCustomDBGridEh* __fastcall GetDataList(void);
	bool __fastcall GetDblClickNextVal(void);
	bool __fastcall GetDropDownShowTitles(void);
	bool __fastcall GetDropDownSizing(void);
	bool __fastcall GetEndEllipsis(void);
	Db::TField* __fastcall GetField(void);
	Graphics::TFont* __fastcall GetFont(void);
	Controls::TImeMode __fastcall GetImeMode(void);
	Controls::TImeName __fastcall GetImeName(void);
	bool __fastcall GetHighlightRequired(void);
	Classes::TStrings* __fastcall GetKeykList(void);
	Stdctrls::TTextLayout __fastcall GetLayout(void);
	TCheckTitleEhBtnEvent __fastcall GetOnDropDownBoxCheckButton(void);
	TDrawColumnEhCellEvent __fastcall GetOnDropDownBoxDrawColumnCell(void);
	TGetCellEhParamsEvent __fastcall GetOnDropDownBoxGetCellParams(void);
	Classes::TNotifyEvent __fastcall GetOnDropDownBoxSortMarkingChanged(void);
	TTitleEhClickEvent __fastcall GetOnDropDownBoxTitleBtnClick(void);
	Classes::TStrings* __fastcall GetPickList(void);
	bool __fastcall GetReadOnly(void);
	bool __fastcall GetShowImageAndText(void);
	bool __fastcall GetToolTips(void);
	bool __fastcall GetTextEditing(void);
	int __fastcall GetWidth(void);
	bool __fastcall IsAlignmentStored(void);
	bool __fastcall IsAlwaysShowEditButtonStored(void);
	bool __fastcall IsAutoDropDownStored(void);
	bool __fastcall IsBiDiModeStored(void);
	bool __fastcall IsCheckboxesStored(void);
	bool __fastcall IsColorStored(void);
	bool __fastcall IsDblClickNextValStored(void);
	bool __fastcall IsDropDownShowTitlesStored(void);
	bool __fastcall IsDropDownSizingStored(void);
	bool __fastcall IsEndEllipsisStored(void);
	bool __fastcall IsFontStored(void);
	bool __fastcall IsImeModeStored(void);
	bool __fastcall IsImeNameStored(void);
	bool __fastcall IsIncrementStored(void);
	bool __fastcall IsReadOnlyStored(void);
	bool __fastcall IsTextEditingStored(void);
	bool __fastcall IsToolTipsStored(void);
	bool __fastcall IsWidthStored(void);
	void __fastcall EditButtonChanged(System::TObject* Sender);
	void __fastcall ImageListChange(System::TObject* Sender);
	void __fastcall FontChanged(System::TObject* Sender);
	void __fastcall SetBiDiMode(Classes::TBiDiMode Value);
	void __fastcall SetButtonStyle(TColumnButtonStyleEh Value);
	void __fastcall SetCheckboxes(const bool Value);
	void __fastcall SetCheckboxState(const Stdctrls::TCheckBoxState Value);
	void __fastcall SetColor(Graphics::TColor Value);
	void __fastcall SetDblClickNextVal(const bool Value);
	void __fastcall SetDisplayFormat(const System::UnicodeString Value);
	void __fastcall SetDropDownBox(const TColumnDropDownBoxEh* Value);
	void __fastcall SetDropDownShowTitles(const bool Value);
	void __fastcall SetDropDownSizing(const bool Value);
	void __fastcall SetDropDownSpecRow(const Toolctrlseh::TSpecRowEh* Value);
	void __fastcall SetEditButtons(const Toolctrlseh::TEditButtonsEh* Value);
	void __fastcall SetEditMask(const System::UnicodeString Value);
	void __fastcall SetFieldName(const System::UnicodeString Value);
	void __fastcall SetFont(Graphics::TFont* Value);
	void __fastcall SetFooter(const TColumnFooterEh* Value);
	void __fastcall SetFooters(const TColumnFootersEh* Value);
	void __fastcall SetImageList(const Imglist::TCustomImageList* Value);
	void __fastcall SetKeykList(const Classes::TStrings* Value);
	void __fastcall SetLayout(Stdctrls::TTextLayout Value);
	void __fastcall SetMaxWidth(const int Value);
	void __fastcall SetMinWidth(const int Value);
	void __fastcall SetMRUList(const Toolctrlseh::TMRUListEh* Value);
	void __fastcall SetNotInKeyListIndex(const int Value);
	void __fastcall SetOnDropDownBoxCheckButton(const TCheckTitleEhBtnEvent Value);
	void __fastcall SetOnDropDownBoxDrawColumnCell(const TDrawColumnEhCellEvent Value);
	void __fastcall SetOnDropDownBoxGetCellParams(const TGetCellEhParamsEvent Value);
	void __fastcall SetOnDropDownBoxSortMarkingChanged(const Classes::TNotifyEvent Value);
	void __fastcall SetOnDropDownBoxTitleBtnClick(const TTitleEhClickEvent Value);
	void __fastcall SetOnGetCellParams(const TGetColCellParamsEventEh Value);
	void __fastcall SetPickList(Classes::TStrings* Value);
	void __fastcall SetPopupMenu(Menus::TPopupMenu* Value);
	void __fastcall SetShowImageAndText(const bool Value);
	void __fastcall SetSTFilter(const TSTColumnFilterEh* Value);
	void __fastcall SetTextEditing(const bool Value);
	void __fastcall SetTitle(TColumnTitleEh* Value);
	void __fastcall SetToolTips(const bool Value);
	void __fastcall SetVisible(const bool Value);
	
protected:
	bool FAlwaysShowEditButton;
	bool FAutoDropDown;
	bool FAutoFitColWidth;
	TCustomDBGridEh* FDataList;
	int FDropDownWidth;
	Db::TDataSource* FDTListSource;
	bool FEndEllipsis;
	int FInitWidth;
	System::UnicodeString FLookupDisplayFields;
	bool FWordWrap;
	int __fastcall AllowableWidth(int TryWidth);
	bool __fastcall CanEditShow(void);
	virtual Toolctrlseh::TEditButtonsEh* __fastcall CreateEditButtons(void);
	virtual TColumnFooterEh* __fastcall CreateFooter(void);
	virtual TColumnFootersEh* __fastcall CreateFooters(void);
	virtual TSTColumnFilterEh* __fastcall CreateSTFilter(void);
	virtual TColumnTitleEh* __fastcall CreateTitle(void);
	bool __fastcall DefaultAlwaysShowEditButton(void);
	bool __fastcall DefaultAutoDropDown(void);
	bool __fastcall DefaultDblClickNextVal(void);
	bool __fastcall DefaultDropDownShowTitles(void);
	bool __fastcall DefaultDropDownSizing(void);
	bool __fastcall DefaultEndEllipsis(void);
	bool __fastcall DefaultHighlightRequired(void);
	Stdctrls::TTextLayout __fastcall DefaultLayout(void);
	System::UnicodeString __fastcall DefaultLookupDisplayFields(void);
	bool __fastcall DefaultTextEditing(void);
	bool __fastcall DefaultToolTips(void);
	bool __fastcall DefaultWordWrap(void);
	bool __fastcall GetAutoFitColWidth(void);
	virtual System::UnicodeString __fastcall GetDisplayName(void);
	TCustomDBGridEh* __fastcall GetGrid(void);
	System::UnicodeString __fastcall GetLookupDisplayFields(void);
	bool __fastcall GetWordWrap(void);
	bool __fastcall IsHighlightRequiredStored(void);
	bool __fastcall IsLayoutStored(void);
	bool __fastcall IsLookupDisplayFieldsStored(void);
	bool __fastcall IsWordWrapStored(void);
	virtual bool __fastcall SeenPassthrough(void);
	Db::TDataSet* __fastcall UsedLookupDataSet(void);
	HIDESBASE void __fastcall Changed(bool AllItems);
	Db::TDataSet* __fastcall FullListDataSet(void);
	void __fastcall EnsureSumValue(void);
	void __fastcall RefreshDefaultFont(void);
	virtual void __fastcall SetAlignment(Classes::TAlignment Value);
	void __fastcall SetAlwaysShowEditButton(bool Value);
	void __fastcall SetAutoDropDown(bool Value);
	virtual void __fastcall SetAutoFitColWidth(bool Value);
	void __fastcall SetDropDownWidth(int Value);
	void __fastcall SetEndEllipsis(const bool Value);
	virtual void __fastcall SetField(Db::TField* Value);
	virtual void __fastcall SetHideDuplicates(bool Value);
	virtual void __fastcall SetHighlightRequired(bool Value);
	virtual void __fastcall SetImeMode(Controls::TImeMode Value);
	virtual void __fastcall SetImeName(Controls::TImeName Value);
	virtual void __fastcall SetIndex(int Value);
	virtual void __fastcall SetLookupDisplayFields(System::UnicodeString Value);
	void __fastcall SetNextFieldValue(System::Extended Increment);
	virtual void __fastcall SetReadOnly(bool Value);
	virtual void __fastcall SetWidth(int Value);
	virtual void __fastcall SetWordWrap(bool Value);
	virtual void __fastcall SpecRowChanged(System::TObject* Sender);
	void __fastcall UpdateDataValues(System::UnicodeString Text, const System::Variant &Value, bool UseText);
	__property bool IsStored = {read=FStored, write=FStored, default=1};
	__property Toolctrlseh::_di_IMemTableDataFieldValueListEh FieldValueList = {read=FFieldValueList, write=FFieldValueList};
	void __fastcall SetDropDownBoxListSource(Db::TDataSource* AListSource);
	TCustomDBGridEh* __fastcall GetLookupGrid(void);
	TDBLookupGridEhOptions __fastcall GetOptions(void);
	void __fastcall SetOptions(TDBLookupGridEhOptions Value);
	virtual HRESULT __stdcall QueryInterface(const GUID &IID, /* out */ void *Obj);
	int __stdcall _AddRef(void);
	int __stdcall _Release(void);
	
public:
	__fastcall virtual TColumnEh(Classes::TCollection* Collection);
	__fastcall virtual ~TColumnEh(void);
	bool __fastcall CanEditAcceptKey(System::WideChar Key);
	bool __fastcall CanModify(bool TryEdit);
	Classes::TAlignment __fastcall DefaultAlignment(void);
	Graphics::TColor __fastcall DefaultColor(void);
	Graphics::TFont* __fastcall DefaultFont(void);
	Controls::TImeMode __fastcall DefaultImeMode(void);
	Controls::TImeName __fastcall DefaultImeName(void);
	bool __fastcall DefaultReadOnly(void);
	int __fastcall DefaultWidth(void);
	System::UnicodeString __fastcall DisplayText(void);
	int __fastcall DrawTextBiDiModeFlagsReadingOnly(void);
	System::UnicodeString __fastcall GetAcceptableEditText(System::UnicodeString InputEditText);
	virtual bool __fastcall UseRightToLeftAlignment(void);
	bool __fastcall UseRightToLeftReading(void);
	bool __fastcall UseRightToLeftScrollBar(void);
	int __fastcall EditButtonsWidth(void);
	TColumnEhType __fastcall GetColumnType(void);
	int __fastcall GetImageIndex(void);
	TColumnFooterEh* __fastcall UsedFooter(int Index);
	int __fastcall CalcRowHeight(void);
	bool __fastcall CurLineWordWrap(int RowHeight);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	void __fastcall DropDown(void);
	void __fastcall FillColCellParams(TColCellParamsEh* ColCellParamsEh);
	virtual void __fastcall GetColCellParams(bool EditMode, TColCellParamsEh* ColCellParamsEh);
	virtual void __fastcall OptimizeWidth(void);
	virtual void __fastcall RestoreDefaults(void);
	__property TColumnEhValues AssignedValues = {read=FAssignedValues, nodefault};
	__property Stdctrls::TCheckBoxState CheckboxState = {read=GetCheckboxState, write=SetCheckboxState, nodefault};
	__property TCustomDBGridEh* DataList = {read=GetDataList};
	__property Db::TField* Field = {read=GetField, write=SetField};
	__property TCustomDBGridEh* Grid = {read=GetGrid};
	__property Classes::TAlignment Alignment = {read=GetAlignment, write=SetAlignment, stored=IsAlignmentStored, nodefault};
	__property bool AlwaysShowEditButton = {read=GetAlwaysShowEditButton, write=SetAlwaysShowEditButton, stored=IsAlwaysShowEditButtonStored, nodefault};
	__property bool AutoDropDown = {read=GetAutoDropDown, write=SetAutoDropDown, stored=IsAutoDropDownStored, nodefault};
	__property bool AutoFitColWidth = {read=GetAutoFitColWidth, write=SetAutoFitColWidth, default=1};
	__property TColumnButtonStyleEh ButtonStyle = {read=FButtonStyle, write=SetButtonStyle, default=0};
	__property bool Checkboxes = {read=GetCheckboxes, write=SetCheckboxes, stored=IsCheckboxesStored, nodefault};
	__property Graphics::TColor Color = {read=GetColor, write=SetColor, stored=IsColorStored, nodefault};
	__property Classes::TBiDiMode BiDiMode = {read=GetBiDiMode, write=SetBiDiMode, stored=IsBiDiModeStored, nodefault};
	__property bool DblClickNextVal = {read=GetDblClickNextVal, write=SetDblClickNextVal, stored=IsDblClickNextValStored, nodefault};
	__property System::UnicodeString DisplayFormat = {read=FDisplayFormat, write=SetDisplayFormat};
	__property TColumnDropDownBoxEh* DropDownBox = {read=FDropDownBox, write=SetDropDownBox};
	__property unsigned DropDownRows = {read=FDropDownRows, write=FDropDownRows, default=7};
	__property bool DropDownShowTitles = {read=GetDropDownShowTitles, write=SetDropDownShowTitles, stored=IsDropDownShowTitlesStored, nodefault};
	__property bool DropDownSizing = {read=GetDropDownSizing, write=SetDropDownSizing, stored=IsDropDownSizingStored, nodefault};
	__property Toolctrlseh::TSpecRowEh* DropDownSpecRow = {read=FDropDownSpecRow, write=SetDropDownSpecRow};
	__property int DropDownWidth = {read=FDropDownWidth, write=SetDropDownWidth, default=0};
	__property Toolctrlseh::TEditButtonsEh* EditButtons = {read=FEditButtons, write=SetEditButtons};
	__property System::UnicodeString EditMask = {read=FEditMask, write=SetEditMask};
	__property bool EndEllipsis = {read=GetEndEllipsis, write=SetEndEllipsis, stored=IsEndEllipsisStored, nodefault};
	__property System::UnicodeString FieldName = {read=FFieldName, write=SetFieldName};
	__property Graphics::TFont* Font = {read=GetFont, write=SetFont, stored=IsFontStored};
	__property TColumnFooterEh* Footer = {read=FFooter, write=SetFooter};
	__property TColumnFootersEh* Footers = {read=FFooters, write=SetFooters};
	__property bool HideDuplicates = {read=FHideDuplicates, write=SetHideDuplicates, default=0};
	__property bool HighlightRequired = {read=GetHighlightRequired, write=SetHighlightRequired, stored=IsHighlightRequiredStored, nodefault};
	__property Imglist::TCustomImageList* ImageList = {read=FImageList, write=SetImageList};
	__property Controls::TImeMode ImeMode = {read=GetImeMode, write=SetImeMode, stored=IsImeModeStored, nodefault};
	__property Controls::TImeName ImeName = {read=GetImeName, write=SetImeName, stored=IsImeNameStored};
	__property System::Extended Increment = {read=FIncrement, write=FIncrement, stored=IsIncrementStored};
	__property Classes::TStrings* KeyList = {read=GetKeykList, write=SetKeykList};
	__property System::UnicodeString LookupDisplayFields = {read=GetLookupDisplayFields, write=SetLookupDisplayFields, stored=IsLookupDisplayFieldsStored};
	__property Stdctrls::TTextLayout Layout = {read=GetLayout, write=SetLayout, stored=IsLayoutStored, nodefault};
	__property int MaxWidth = {read=FMaxWidth, write=SetMaxWidth, default=0};
	__property int MinWidth = {read=FMinWidth, write=SetMinWidth, default=0};
	__property Toolctrlseh::TMRUListEh* MRUList = {read=FMRUList, write=SetMRUList};
	__property int NotInKeyListIndex = {read=FNotInKeyListIndex, write=SetNotInKeyListIndex, default=-1};
	__property Classes::TStrings* PickList = {read=GetPickList, write=SetPickList};
	__property Menus::TPopupMenu* PopupMenu = {read=FPopupMenu, write=SetPopupMenu};
	__property bool ReadOnly = {read=GetReadOnly, write=SetReadOnly, stored=IsReadOnlyStored, nodefault};
	__property TSTColumnFilterEh* STFilter = {read=FSTFilter, write=SetSTFilter};
	__property bool ShowImageAndText = {read=GetShowImageAndText, write=SetShowImageAndText, default=0};
	__property int Tag = {read=FTag, write=FTag, default=0};
	__property bool TextEditing = {read=GetTextEditing, write=SetTextEditing, stored=IsTextEditingStored, nodefault};
	__property TColumnTitleEh* Title = {read=FTitle, write=SetTitle};
	__property bool ToolTips = {read=GetToolTips, write=SetToolTips, stored=IsToolTipsStored, nodefault};
	__property bool Visible = {read=FVisible, write=SetVisible, default=1};
	__property int Width = {read=GetWidth, write=SetWidth, stored=IsWidthStored, nodefault};
	__property bool WordWrap = {read=GetWordWrap, write=SetWordWrap, stored=IsWordWrapStored, nodefault};
	__property TOnColumnCheckDrawRequiredStateEventEh OnCheckDrawRequiredState = {read=FOnCheckDrawRequiredState, write=FOnCheckDrawRequiredState};
	__property TCheckTitleEhBtnEvent OnDropDownBoxCheckButton = {read=GetOnDropDownBoxCheckButton, write=SetOnDropDownBoxCheckButton};
	__property TDrawColumnEhCellEvent OnDropDownBoxDrawColumnCell = {read=GetOnDropDownBoxDrawColumnCell, write=SetOnDropDownBoxDrawColumnCell};
	__property TGetCellEhParamsEvent OnDropDownBoxGetCellParams = {read=GetOnDropDownBoxGetCellParams, write=SetOnDropDownBoxGetCellParams};
	__property Classes::TNotifyEvent OnDropDownBoxSortMarkingChanged = {read=GetOnDropDownBoxSortMarkingChanged, write=SetOnDropDownBoxSortMarkingChanged};
	__property TTitleEhClickEvent OnDropDownBoxTitleBtnClick = {read=GetOnDropDownBoxTitleBtnClick, write=SetOnDropDownBoxTitleBtnClick};
	__property Toolctrlseh::TButtonClickEventEh OnEditButtonClick = {read=FOnButtonClick, write=FOnButtonClick};
	__property Toolctrlseh::TButtonDownEventEh OnEditButtonDown = {read=FOnButtonDown, write=FOnButtonDown};
	__property TGetColCellParamsEventEh OnGetCellParams = {read=FOnGetCellParams, write=SetOnGetCellParams};
	__property Toolctrlseh::TNotInListEventEh OnNotInList = {read=FOnNotInList, write=FOnNotInList};
	__property TColCellUpdateDataEventEh OnUpdateData = {read=FUpdateData, write=FUpdateData};
	__property TDBGridEhHintShowPauseEvent OnHintShowPause = {read=FOnHintShowPause, write=FOnHintShowPause};
	__property TDBGridEhDataHintShowEvent OnDataHintShow = {read=FOnDataHintShow, write=FOnDataHintShow};
	__property TDBGridEhAdvDrawColumnDataEvent OnAdvDrawDataCell = {read=FOnAdvDrawDataCell, write=FOnAdvDrawDataCell};
private:
	void *__IInterface;	/* System::IInterface */
	void *__ILookupGridOwner;	/* ILookupGridOwner */
	
public:
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator System::_di_IInterface()
	{
		System::_di_IInterface intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IInterface*(void) { return (IInterface*)&__IInterface; }
	#endif
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator _di_ILookupGridOwner()
	{
		_di_ILookupGridOwner intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator ILookupGridOwner*(void) { return (ILookupGridOwner*)&__ILookupGridOwner; }
	#endif
	
};


typedef TMetaClass* TColumnEhClass;

class DELPHICLASS TDBGridColumnEh;
class PASCALIMPLEMENTATION TDBGridColumnEh : public TColumnEh
{
	typedef TColumnEh inherited;
	
__published:
	__property Alignment;
	__property AlwaysShowEditButton;
	__property AutoDropDown;
	__property AutoFitColWidth = {default=1};
	__property BiDiMode;
	__property ButtonStyle = {default=0};
	__property Checkboxes;
	__property Color;
	__property DblClickNextVal;
	__property DisplayFormat;
	__property DropDownBox;
	__property DropDownRows = {default=7};
	__property DropDownShowTitles;
	__property DropDownSizing;
	__property DropDownSpecRow;
	__property DropDownWidth = {default=0};
	__property EditButtons;
	__property EditMask;
	__property EndEllipsis;
	__property FieldName;
	__property Font;
	__property Footer;
	__property Footers;
	__property HideDuplicates = {default=0};
	__property HighlightRequired;
	__property ImageList;
	__property ImeMode;
	__property ImeName;
	__property Increment;
	__property KeyList;
	__property Layout;
	__property LookupDisplayFields;
	__property MaxWidth = {default=0};
	__property MinWidth = {default=0};
	__property MRUList;
	__property NotInKeyListIndex = {default=-1};
	__property PickList;
	__property PopupMenu;
	__property ReadOnly;
	__property ShowImageAndText = {default=0};
	__property STFilter;
	__property Tag = {default=0};
	__property TextEditing;
	__property Title;
	__property ToolTips;
	__property Visible = {default=1};
	__property Width;
	__property WordWrap;
	__property OnCheckDrawRequiredState;
	__property OnDataHintShow;
	__property OnAdvDrawDataCell;
	__property OnDropDownBoxCheckButton;
	__property OnDropDownBoxDrawColumnCell;
	__property OnDropDownBoxGetCellParams;
	__property OnDropDownBoxSortMarkingChanged;
	__property OnDropDownBoxTitleBtnClick;
	__property OnEditButtonClick;
	__property OnEditButtonDown;
	__property OnGetCellParams;
	__property OnNotInList;
	__property OnHintShowPause;
	__property OnUpdateData;
public:
	/* TColumnEh.Create */ inline __fastcall virtual TDBGridColumnEh(Classes::TCollection* Collection) : TColumnEh(Collection) { }
	/* TColumnEh.Destroy */ inline __fastcall virtual ~TDBGridColumnEh(void) { }
	
};


class DELPHICLASS TDBGridColumnsEh;
class PASCALIMPLEMENTATION TDBGridColumnsEh : public Classes::TCollection
{
	typedef Classes::TCollection inherited;
	
public:
	TColumnEh* operator[](int Index) { return Items[Index]; }
	
private:
	TCustomDBGridEh* FGrid;
	TColumnEh* __fastcall GetColumn(int Index);
	TDBGridColumnsState __fastcall GetState(void);
	TColumnEh* __fastcall InternalAdd(void);
	void __fastcall SetColumn(int Index, TColumnEh* Value);
	void __fastcall SetState(TDBGridColumnsState NewState);
	
protected:
	int __fastcall GetUpdateCount(void);
	DYNAMIC Classes::TPersistent* __fastcall GetOwner(void);
	virtual void __fastcall Update(Classes::TCollectionItem* Item);
	__property int UpdateCount = {read=GetUpdateCount, nodefault};
	
public:
	__fastcall TDBGridColumnsEh(TCustomDBGridEh* Grid, TColumnEhClass ColumnClass);
	HIDESBASE TColumnEh* __fastcall Add(void);
	bool __fastcall ExistFooterValueType(TFooterValueType AFooterValueType);
	void __fastcall AddAllColumns(bool DeleteExisting);
	void __fastcall ActiveChanged(void);
	void __fastcall LoadFromFile(const System::UnicodeString Filename);
	void __fastcall LoadFromStream(Classes::TStream* S);
	void __fastcall RebuildColumns(void);
	void __fastcall RestoreDefaults(void);
	void __fastcall SaveToFile(const System::UnicodeString Filename);
	void __fastcall SaveToStream(Classes::TStream* S);
	__property TCustomDBGridEh* Grid = {read=FGrid};
	__property TColumnEh* Items[int Index] = {read=GetColumn, write=SetColumn/*, default*/};
	__property TDBGridColumnsState State = {read=GetState, write=SetState, nodefault};
public:
	/* TCollection.Destroy */ inline __fastcall virtual ~TDBGridColumnsEh(void) { }
	
};


class DELPHICLASS TColumnsEhList;
class PASCALIMPLEMENTATION TColumnsEhList : public Contnrs::TObjectList
{
	typedef Contnrs::TObjectList inherited;
	
public:
	TColumnEh* operator[](int Index) { return Items[Index]; }
	
private:
	TColumnEh* __fastcall GetColumn(int Index);
	void __fastcall SetColumn(int Index, const TColumnEh* Value);
	
public:
	__fastcall TColumnsEhList(void)/* overload */;
	__property TColumnEh* Items[int Index] = {read=GetColumn, write=SetColumn/*, default*/};
public:
	/* TList.Destroy */ inline __fastcall virtual ~TColumnsEhList(void) { }
	
};


class DELPHICLASS TGridDataLinkEh;
class PASCALIMPLEMENTATION TGridDataLinkEh : public Db::TDataLink
{
	typedef Db::TDataLink inherited;
	
private:
	typedef DynamicArray<int> _TGridDataLinkEh__1;
	
	
private:
	int FFieldCount;
	_TGridDataLinkEh__1 FFieldMap;
	int FFieldMapSize;
	TCustomDBGridEh* FGrid;
	bool FInUpdateData;
	bool FModified;
	bool FSparseMap;
	bool __fastcall GetDefaultFields(void);
	Db::TField* __fastcall GetFields(int I);
	
protected:
	int __fastcall GetMappedIndex(int ColIndex);
	virtual int __fastcall MoveBy(int Distance);
	virtual void __fastcall ActiveChanged(void);
	virtual void __fastcall DataEvent(Db::TDataEvent Event, int Info);
	virtual void __fastcall DataSetChanged(void);
	virtual void __fastcall DataSetScrolled(int Distance);
	virtual void __fastcall EditingChanged(void);
	virtual void __fastcall FocusControl(Db::TFieldRef Field);
	virtual void __fastcall LayoutChanged(void);
	virtual void __fastcall RecordChanged(Db::TField* Field);
	virtual void __fastcall UpdateData(void);
	
public:
	__fastcall TGridDataLinkEh(TCustomDBGridEh* AGrid);
	__fastcall virtual ~TGridDataLinkEh(void);
	bool __fastcall AddMapping(const System::UnicodeString FieldName);
	void __fastcall ClearMapping(void);
	void __fastcall Modified(void);
	void __fastcall Reset(void);
	__property bool DefaultFields = {read=GetDefaultFields, nodefault};
	__property int FieldCount = {read=FFieldCount, nodefault};
	__property Db::TField* Fields[int I] = {read=GetFields};
	__property bool SparseMap = {read=FSparseMap, write=FSparseMap, nodefault};
};


class DELPHICLASS TBookmarkListEh;
class PASCALIMPLEMENTATION TBookmarkListEh : public Toolctrlseh::TBMListEh
{
	typedef Toolctrlseh::TBMListEh inherited;
	
private:
	TCustomDBGridEh* FGrid;
	
protected:
	virtual Db::TDataSet* __fastcall GetDataSet(void);
	virtual void __fastcall Invalidate(void);
	virtual void __fastcall SetCurrentRowSelected(bool Value);
	virtual void __fastcall UpdateState(void);
	virtual void __fastcall DataChanged(System::TObject* Sender);
	
public:
	__fastcall TBookmarkListEh(TCustomDBGridEh* AGrid);
	Types::TRect __fastcall SelectionToGridRect(void);
	virtual void __fastcall Clear(void);
public:
	/* TBMListEh.Destroy */ inline __fastcall virtual ~TBookmarkListEh(void) { }
	
};


class DELPHICLASS THeadTreeNode;
struct LeafCol
{
	
public:
	THeadTreeNode* FLeaf;
	TColumnEh* FColumn;
};


typedef LeafCol *PLeafCol;

typedef StaticArray<LeafCol, 134217727> TLeafCol;

typedef DynamicArray<LeafCol> PTLeafCol;

typedef void __fastcall (__closure *THeadTreeProc)(THeadTreeNode* node);

class PASCALIMPLEMENTATION THeadTreeNode : public System::TObject
{
	typedef System::TObject inherited;
	
public:
	THeadTreeNode* Child;
	TColumnEh* Column;
	bool Drawed;
	int Height;
	int HeightPrn;
	THeadTreeNode* Host;
	THeadTreeNode* Next;
	System::UnicodeString Text;
	int VLineWidth;
	int Width;
	int WidthPrn;
	int WIndent;
	__fastcall THeadTreeNode(void);
	__fastcall THeadTreeNode(System::UnicodeString AText, int AHeight, int AWidth);
	__fastcall virtual ~THeadTreeNode(void);
	THeadTreeNode* __fastcall Add(THeadTreeNode* AAfter, System::UnicodeString AText, int AHeight, int AWidth);
	THeadTreeNode* __fastcall AddChild(THeadTreeNode* ANode, System::UnicodeString AText, int AHeight, int AWidth);
	bool __fastcall Find(THeadTreeNode* ANode);
	int __fastcall GetLevel(void);
	void __fastcall CreateFieldTree(TCustomDBGridEh* AGrid);
	void __fastcall DoForAllNode(THeadTreeProc proc);
	void __fastcall FreeAllChild(void);
	void __fastcall Union(THeadTreeNode* AFrom, THeadTreeNode* ATo, System::UnicodeString AText, int AHeight);
};


class DELPHICLASS TDBGridEhSumList;
class PASCALIMPLEMENTATION TDBGridEhSumList : public Dbsumlst::TDBSumListProducer
{
	typedef Dbsumlst::TDBSumListProducer inherited;
	
private:
	bool __fastcall GetActive(void);
	HIDESBASE void __fastcall SetActive(const bool Value);
	
protected:
	virtual void __fastcall ReturnEvents(void);
	
public:
	__fastcall TDBGridEhSumList(Classes::TComponent* AOwner);
	virtual void __fastcall SetDataSetEvents(void);
	
__published:
	__property bool Active = {read=GetActive, write=SetActive, default=0};
	__property ExternalRecalc = {default=0};
	__property OnRecalcAll;
	__property OnAfterRecalcAll;
	__property SumListChanged;
	__property VirtualRecords = {default=0};
public:
	/* TDBSumListProducer.Destroy */ inline __fastcall virtual ~TDBGridEhSumList(void) { }
	
};


#pragma option push -b-
enum TScrollBarVisibleModeEh { sbAlwaysShowEh, sbNeverShowEh, sbAutoShowEh };
#pragma option pop

class DELPHICLASS TDBGridEhScrollBar;
class PASCALIMPLEMENTATION TDBGridEhScrollBar : public Classes::TPersistent
{
	typedef Classes::TPersistent inherited;
	
private:
	TCustomDBGridEh* FDBGridEh;
	Stdctrls::TScrollBar* FExtScrollBar;
	Forms::TScrollBarKind FKind;
	bool FTracking;
	TScrollBarVisibleModeEh FVisibleMode;
	bool __fastcall GetVisible(void);
	void __fastcall ExtScrollWindowProc(Messages::TMessage &Message);
	void __fastcall SetExtScrollBar(const Stdctrls::TScrollBar* Value);
	void __fastcall SetVisible(bool Value);
	void __fastcall SetVisibleMode(const TScrollBarVisibleModeEh Value);
	
public:
	__fastcall TDBGridEhScrollBar(TCustomDBGridEh* AGrid, Forms::TScrollBarKind AKind);
	__fastcall virtual ~TDBGridEhScrollBar(void);
	bool __fastcall GetScrollInfo(tagSCROLLINFO &ScrollInfo);
	bool __fastcall IsScrollBarVisible(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	void __fastcall UpdateExtScrollBar(void);
	__property Forms::TScrollBarKind Kind = {read=FKind, nodefault};
	__property TScrollBarVisibleModeEh VisibleMode = {read=FVisibleMode, write=SetVisibleMode, default=2};
	
__published:
	__property Stdctrls::TScrollBar* ExtScrollBar = {read=FExtScrollBar, write=SetExtScrollBar};
	__property bool Tracking = {read=FTracking, write=FTracking, default=0};
	__property bool Visible = {read=GetVisible, write=SetVisible, default=1};
};


class DELPHICLASS TVertDBGridEhScrollBar;
class PASCALIMPLEMENTATION TVertDBGridEhScrollBar : public TDBGridEhScrollBar
{
	typedef TDBGridEhScrollBar inherited;
	
__published:
	__property Visible = {stored=false, default=1};
	__property VisibleMode = {default=2};
public:
	/* TDBGridEhScrollBar.Create */ inline __fastcall TVertDBGridEhScrollBar(TCustomDBGridEh* AGrid, Forms::TScrollBarKind AKind) : TDBGridEhScrollBar(AGrid, AKind) { }
	/* TDBGridEhScrollBar.Destroy */ inline __fastcall virtual ~TVertDBGridEhScrollBar(void) { }
	
};


#pragma option push -b-
enum TDBGridEhSelectionType { gstNon, gstRecordBookmarks, gstRectangle, gstColumns, gstAll };
#pragma option pop

typedef TDBGridEhSelectionType TDBGridEhAllowedSelection;

typedef Set<TDBGridEhAllowedSelection, gstRecordBookmarks, gstAll>  TDBGridEhAllowedSelections;

struct TDBCell
{
	
public:
	int Col;
	Sysutils::TBytes Row;
};


class DELPHICLASS TDBGridEhIndicatorTitle;
class PASCALIMPLEMENTATION TDBGridEhIndicatorTitle : public Classes::TPersistent
{
	typedef Classes::TPersistent inherited;
	
private:
	bool FDown;
	Menus::TPopupMenu* FDropdownMenu;
	bool FShowDropDownSign;
	bool FTitleButton;
	bool FUseGlobalMenu;
	TCustomDBGridEh* FGrid;
	void __fastcall SetShowDropDownSign(const bool Value);
	
public:
	__property bool Down = {read=FDown, nodefault};
	__fastcall TDBGridEhIndicatorTitle(TCustomDBGridEh* AGrid);
	
__published:
	__property Menus::TPopupMenu* DropdownMenu = {read=FDropdownMenu, write=FDropdownMenu};
	__property bool ShowDropDownSign = {read=FShowDropDownSign, write=SetShowDropDownSign, default=0};
	__property bool TitleButton = {read=FTitleButton, write=FTitleButton, default=0};
	__property bool UseGlobalMenu = {read=FUseGlobalMenu, write=FUseGlobalMenu, default=1};
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~TDBGridEhIndicatorTitle(void) { }
	
};


class DELPHICLASS TDBGridEhSelectionRect;
class PASCALIMPLEMENTATION TDBGridEhSelectionRect : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	TDBCell FAnchor;
	TCustomDBGridEh* FGrid;
	TDBCell FShiftCell;
	Types::TRect __fastcall BoxRect(int ALeft, Sysutils::TBytes ATop, int ARight, Sysutils::TBytes ABottom);
	bool __fastcall CheckState(void);
	Sysutils::TBytes __fastcall GetBottomRow(void);
	int __fastcall GetLeftCol(void);
	int __fastcall GetRightCol(void);
	Sysutils::TBytes __fastcall GetTopRow(void);
	
public:
	__fastcall TDBGridEhSelectionRect(TCustomDBGridEh* AGrid);
	bool __fastcall DataCellSelected(int DataCol, Sysutils::TBytes DataRow);
	Types::TRect __fastcall SelectionToGridRect(void);
	void __fastcall Clear(void);
	void __fastcall Select(int ACol, Sysutils::TBytes ARow, bool AddSel);
	__property Sysutils::TBytes BottomRow = {read=GetBottomRow};
	__property int LeftCol = {read=GetLeftCol, nodefault};
	__property int RightCol = {read=GetRightCol, nodefault};
	__property Sysutils::TBytes TopRow = {read=GetTopRow};
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TDBGridEhSelectionRect(void) { }
	
};


class DELPHICLASS TDBGridEhSelectionCols;
class PASCALIMPLEMENTATION TDBGridEhSelectionCols : public TColumnsEhList
{
	typedef TColumnsEhList inherited;
	
private:
	TColumnEh* FAnchor;
	TCustomDBGridEh* FGrid;
	TColumnEh* FShiftCol;
	TColumnsEhList* FShiftSelectedCols;
	HIDESBASE void __fastcall Add(TColumnEh* ACol);
	
public:
	__fastcall TDBGridEhSelectionCols(TCustomDBGridEh* AGrid);
	__fastcall virtual ~TDBGridEhSelectionCols(void);
	Types::TRect __fastcall SelectionToGridRect(void);
	virtual void __fastcall Clear(void);
	void __fastcall InvertSelect(TColumnEh* ACol);
	void __fastcall Refresh(void);
	void __fastcall Select(TColumnEh* ACol, bool AddSel);
	void __fastcall SelectShift(TColumnEh* ACol);
};


class DELPHICLASS TDBGridEhSelection;
class PASCALIMPLEMENTATION TDBGridEhSelection : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	TDBGridEhSelectionCols* FColumns;
	TCustomDBGridEh* FGrid;
	TDBGridEhSelectionRect* FRect;
	TDBGridEhSelectionType FSelectionType;
	TBookmarkListEh* __fastcall GetRows(void);
	void __fastcall LinkActive(bool Value);
	void __fastcall SetSelectionType(TDBGridEhSelectionType ASelType);
	
protected:
	virtual void __fastcall SelectionChanged(void);
	
public:
	__fastcall TDBGridEhSelection(TCustomDBGridEh* AGrid);
	__fastcall virtual ~TDBGridEhSelection(void);
	bool __fastcall DataCellSelected(int DataCol, Sysutils::TBytes DataRow);
	Types::TRect __fastcall SelectionToGridRect(void);
	void __fastcall Clear(void);
	void __fastcall Refresh(void);
	void __fastcall SelectAll(void);
	void __fastcall UpdateState(void);
	__property TDBGridEhSelectionCols* Columns = {read=FColumns};
	__property TDBGridEhSelectionRect* Rect = {read=FRect};
	__property TBookmarkListEh* Rows = {read=GetRows};
	__property TDBGridEhSelectionType SelectionType = {read=FSelectionType, nodefault};
};


class DELPHICLASS TSTDBGridEhFilter;
class PASCALIMPLEMENTATION TSTDBGridEhFilter : public Classes::TPersistent
{
	typedef Classes::TPersistent inherited;
	
private:
	TCustomDBGridEh* FGrid;
	bool FLocal;
	int FUpateCount;
	bool FVisible;
	void __fastcall SetLocal(const bool Value);
	void __fastcall SetVisible(const bool Value);
	
public:
	__fastcall TSTDBGridEhFilter(TCustomDBGridEh* AGrid);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	void __fastcall BeginUpdate(void);
	void __fastcall EndUpdate(void);
	__property int UpdateCount = {read=FUpateCount, nodefault};
	
__published:
	__property bool Local = {read=FLocal, write=SetLocal, default=0};
	__property bool Visible = {read=FVisible, write=SetVisible, default=0};
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~TSTDBGridEhFilter(void) { }
	
};


#pragma option push -b-
enum TDBGridEhRowIndicatorTypeEh { giNormalArrowEh, giSelectedArrowEh, giEditEh, giInsertEh, giInplaceSearch };
#pragma option pop

#pragma option push -b-
enum THorzCellAreaTypeEh { hctIndicatorEh, hctDataEh };
#pragma option pop

#pragma option push -b-
enum TVertCellAreaTypeEh { vctTitleEh, vctSubTitleEh, vctDataEh, vctAboveFooterEh, vctFooterEh };
#pragma option pop

struct TCellAreaTypeEh
{
	
public:
	THorzCellAreaTypeEh HorzType;
	TVertCellAreaTypeEh VertType;
};


#pragma option push -b-
enum TDBGridEhOption { dghFixed3D, dghFrozen3D, dghFooter3D, dghData3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghAutoSortMarking, dghMultiSortMarking, dghEnterAsTab, dghTraceColSizing, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDblClickOptimizeColWidth, dghDialogFind, dghRecordMoving, dghShowRecNo, dghColumnResize, dghColumnMove, dghAutoFitRowHeight };
#pragma option pop

typedef Set<TDBGridEhOption, dghFixed3D, dghAutoFitRowHeight>  TDBGridEhOptions;

#pragma option push -b-
enum TDBGridEhState { dgsNormal, dgsRowSelecting, dgsColSelecting, dgsRectSelecting, dgsPosTracing, dgsTitleDown, dgsColSizing, dgsRowMoving };
#pragma option pop

#pragma option push -b-
enum TDBGridEhAllowedOperation { alopInsertEh, alopUpdateEh, alopDeleteEh, alopAppendEh };
#pragma option pop

typedef Set<TDBGridEhAllowedOperation, alopInsertEh, alopAppendEh>  TDBGridEhAllowedOperations;

#pragma option push -b-
enum TDBGridEhEditAction { geaCutEh, geaCopyEh, geaPasteEh, geaDeleteEh, geaSelectAllEh };
#pragma option pop

typedef Set<TDBGridEhEditAction, geaCutEh, geaSelectAllEh>  TDBGridEhEditActions;

typedef void __fastcall (__closure *TDBGridEhClickEvent)(TColumnEh* Column);

typedef void __fastcall (__closure *TDrawFooterCellEvent)(System::TObject* Sender, int DataCol, int Row, TColumnEh* Column, const Types::TRect &Rect, Gridseh::TGridDrawState State);

typedef void __fastcall (__closure *TGetFooterParamsEvent)(System::TObject* Sender, int DataCol, int Row, TColumnEh* Column, Graphics::TFont* AFont, Graphics::TColor &Background, Classes::TAlignment &Alignment, Gridseh::TGridDrawState State, System::UnicodeString &Text);

typedef void __fastcall (__closure *TGetBtnEhParamsEvent)(System::TObject* Sender, TColumnEh* Column, Graphics::TFont* AFont, Graphics::TColor &Background, TSortMarkerEh &SortMarker, bool IsDown);

typedef void __fastcall (__closure *TGetDBGridEhRowHeightEvent)(System::TObject* Sender, int &RowHeight);

class DELPHICLASS TDBGridEhCenter;
class DELPHICLASS TDBGridEhStyle;
class PASCALIMPLEMENTATION TCustomDBGridEh : public Gridseh::TCustomGridEh
{
	typedef Gridseh::TCustomGridEh inherited;
	
public:
	TColumnEh* operator[](const System::UnicodeString FieldName) { return FieldColumns[FieldName]; }
	
private:
	TDBGridEhAllowedOperations FAllowedOperations;
	TDBGridEhAllowedSelections FAllowedSelections;
	bool FAutoDrag;
	bool FSelectedCellPressed;
	TBookmarkListEh* FBookmarks;
	bool FCanvasHandleAllocated;
	TDBGridEhCenter* FCenter;
	TColumnDefValuesEh* FColumnDefValues;
	TDBGridColumnsEh* FColumns;
	System::UnicodeString FCompleteKeyPress;
	TGridDataLinkEh* FDataLink;
	bool FDefaultDrawing;
	TDBGridEhEditActions FEditActions;
	System::Variant FEditKeyValue;
	System::UnicodeString FEditText;
	Graphics::TColor FFooterColor;
	Graphics::TFont* FFooterFont;
	Graphics::TFont* FHintFont;
	TDBGridEhScrollBar* FHorzScrollBar;
	bool FInColExit;
	TDBGridEhIndicatorTitle* FIndicatorTitle;
	int FInterlinear;
	bool FLayoutFromDataset;
	System::Byte FLayoutLock;
	TDBGridEhAdvDrawColumnDataEvent FOnAdvDrawDataCell;
	TDBGridEhBuildIndicatorTitleMenu FOnBuildIndicatorTitleMenu;
	TDBGridEhClickEvent FOnCellClick;
	Classes::TNotifyEvent FOnColEnter;
	Classes::TNotifyEvent FOnColExit;
	Gridseh::TMovedEvent FOnColumnMoved;
	Classes::TNotifyEvent FOnColWidthsChanged;
	TDBGridEhDataHintShowEvent FOnDataHintShow;
	TDrawColumnEhCellEvent FOnDrawColumnCell;
	TDrawDataCellEvent FOnDrawDataCell;
	Classes::TNotifyEvent FOnEditButtonClick;
	TGetCellEhParamsEvent FOnGetCellParams;
	TGetFooterParamsEvent FOnGetFooterParams;
	TDBGridEhHintShowPauseEvent FOnHintShowPause;
	Gridseh::TGridEhCellMouseEvent FOnIndicatorTitleMouseDown;
	Classes::TNotifyEvent FOnSelectionChanged;
	Classes::TNotifyEvent FOnSortMarkingChanged;
	Classes::TNotifyEvent FOnSumListAfterRecalcAll;
	Classes::TNotifyEvent FOnSumListRecalcAll;
	TDBGridEhClickEvent FOnTitleClick;
	TDBGridOptions FOptions;
	TDBGridEhOptions FOptionsEh;
	Controls::TImeMode FOriginalImeMode;
	Controls::TImeName FOriginalImeName;
	bool FReadOnly;
	bool FSelecting;
	TDBGridEhSelection* FSelection;
	Sysutils::TBytes FSelectionAnchor;
	bool FSelfChangingFooterFont;
	bool FSelfChangingTitleFont;
	int FSelRow;
	int FSizingIndex;
	int FSizingPos;
	int FSizingOfs;
	bool FSortLocal;
	bool FSortMarking;
	TDBGridEhStyle* FStyle;
	bool FSumListRecalcing;
	bool FThumbTracked;
	Graphics::TFont* FTitleFont;
	Imglist::TCustomImageList* FTitleImages;
	Imglist::TChangeLink* FTitleImageChangeLink;
	System::Byte FTitleOffset;
	System::Byte FIndicatorOffset;
	bool FTopLeftVisible;
	System::Byte FUpdateLock;
	bool FUserChange;
	TDBGridEhScrollBar* FVertScrollBar;
	Toolctrlseh::_di_IMemTableEh FIntMemTable;
	int FOldActiveRecord;
	bool FLockAutoShowCurCell;
	bool FFetchingRecords;
	bool FTryUseMemTableInt;
	TSTDBGridEhFilter* FSTFilter;
	int FFilterCol;
	bool FFilterEditMode;
	Dbctrlseh::TCustomDBEditEh* FFilterEdit;
	Classes::TNotifyEvent FOnApplyFilter;
	int FDownMouseMessageTime;
	bool FBufferedPaint;
	bool FSizeChanged;
	bool FEvenRowColorStored;
	bool FOddRowColorStored;
	Graphics::TColor FEvenRowColor;
	Graphics::TColor FOddRowColor;
	int FContraColCount;
	Graphics::TFont* FDummiFont;
	int FRecNoTextWidth;
	TGetDBGridEhRowHeightEvent FOnGetRowHeight;
	void __fastcall CheckIMemTable(void);
	void __fastcall MTUpdateRowCount(void);
	void __fastcall MTScroll(int Distance);
	bool __fastcall IsCurrentRow(int DataRowNum);
	void __fastcall FetchRecordsInView(void);
	void __fastcall InstantReadRecordEnter(int DataRowNum);
	void __fastcall InstantReadRecordLeave(void);
	int __fastcall InstantReadRecordCount(void);
	void __fastcall MTUpdateVertScrollBar(void);
	void __fastcall MTUpdateTopRow(void);
	void __fastcall MTWMVScroll(Messages::TWMScroll &Message);
	int __fastcall GetCol(void);
	int __fastcall GetContraColCount(void);
	Db::TDataSource* __fastcall GetDataSource(void);
	Graphics::TColor __fastcall GetEvenRowColor(void);
	TColumnEh* __fastcall GetFieldColumns(const System::UnicodeString FieldName);
	int __fastcall GetFieldCount(void);
	Db::TField* __fastcall GetFields(int FieldIndex);
	Graphics::TColor __fastcall GetOddRowColor(void);
	Db::TField* __fastcall GetSelectedField(void);
	int __fastcall GetSelectedIndex(void);
	System::Byte __fastcall GetTopDataOffset(void);
	bool __fastcall IsEvenRowColorStored(void);
	bool __fastcall IsOddRowColorStored(void);
	HIDESBASE void __fastcall ChangeGridOrientation(bool RightToLeftOrientation);
	void __fastcall ClearSelection(void);
	void __fastcall CheckClearSelection(void);
	HIDESBASE MESSAGE void __fastcall CMCancelMode(Controls::TCMCancelMode &Message);
	MESSAGE void __fastcall CMDeferLayout(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMDesignHitTest(Messages::TWMMouse &Msg);
	HIDESBASE MESSAGE void __fastcall CMFontChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMHintShow(Controls::TCMHintShow &Message);
	MESSAGE void __fastcall CMHintsShowPause(Forms::TCMHintShowPause &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseWheel(Controls::TCMMouseWheel &Message);
	HIDESBASE MESSAGE void __fastcall CMParentColorChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMParentFontChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMSysColorChange(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMWantSpecialKey(Messages::TWMKey &Msg);
	void __fastcall DoSelection(bool Select, int Direction, bool MaxDirection, bool RowOnly);
	HIDESBASE void __fastcall DrawEdgeEh(Graphics::TCanvas* ACanvas, const Types::TRect &qrc, bool IsDown, bool IsSelected, bool NeedLeft, bool NeedRight);
	void __fastcall EditingChanged(void);
	void __fastcall FooterFontChanged(System::TObject* Sender);
	void __fastcall InternalLayout(void);
	void __fastcall MoveCol(int RawCol, int Direction, bool Select);
	void __fastcall ReadColumns(Classes::TReader* Reader);
	void __fastcall RecordChanged(Db::TField* Field);
	void __fastcall SetAllowedSelections(const TDBGridEhAllowedSelections Value);
	void __fastcall SetCenter(const TDBGridEhCenter* Value);
	HIDESBASE void __fastcall SetCol(int Value);
	void __fastcall SetColumnDefValues(const TColumnDefValuesEh* Value);
	void __fastcall SetColumns(TDBGridColumnsEh* Value);
	HIDESBASE void __fastcall SetContraColCount(const int Value);
	void __fastcall SetDataSource(Db::TDataSource* Value);
	void __fastcall SetDrawGraphicData(const bool Value);
	void __fastcall SetDrawMemoText(const bool Value);
	void __fastcall SetEvenRowColor(const Graphics::TColor Value);
	void __fastcall SetFilterEditMode(const bool Value);
	void __fastcall SetFooterColor(Graphics::TColor Value);
	void __fastcall SetFooterFont(Graphics::TFont* Value);
	void __fastcall SetHorzScrollBar(const TDBGridEhScrollBar* Value);
	HIDESBASE void __fastcall SetIme(void);
	void __fastcall SetOddRowColor(const Graphics::TColor Value);
	HIDESBASE void __fastcall SetOptions(TDBGridOptions Value);
	void __fastcall SetOptionsEh(const TDBGridEhOptions Value);
	void __fastcall SetReadOnly(const bool Value);
	void __fastcall SetSelectedField(Db::TField* Value);
	void __fastcall SetSelectedIndex(int Value);
	void __fastcall SetSTFilter(const TSTDBGridEhFilter* Value);
	void __fastcall SetStyle(const TDBGridEhStyle* Value);
	void __fastcall SetSumList(const TDBGridEhSumList* Value);
	void __fastcall SetTitleFont(Graphics::TFont* Value);
	void __fastcall SetTitleImages(const Imglist::TCustomImageList* Value);
	void __fastcall SetVertScrollBar(const TDBGridEhScrollBar* Value);
	void __fastcall TitleFontChanged(System::TObject* Sender);
	void __fastcall TitleImageListChange(System::TObject* Sender);
	void __fastcall UpdateIme(void);
	void __fastcall UpdateColumnResizeOptions(const TDBGridOptions NewOptions, const TDBGridEhOptions NewOptionsEh);
	HIDESBASE MESSAGE void __fastcall WMCancelMode(Messages::TWMNoParams &Message);
	HIDESBASE MESSAGE void __fastcall WMChar(Messages::TWMKey &Message);
	HIDESBASE MESSAGE void __fastcall WMCommand(Messages::TWMCommand &Message);
	HIDESBASE MESSAGE void __fastcall WMEraseBkgnd(Messages::TWMEraseBkgnd &Message);
	HIDESBASE MESSAGE void __fastcall WMGetDlgCode(Messages::TWMNoParams &Msg);
	HIDESBASE MESSAGE void __fastcall WMHScroll(Messages::TWMScroll &Message);
	HIDESBASE MESSAGE void __fastcall WMIMEStartComp(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMKillFocus(Messages::TWMKillFocus &Message);
	HIDESBASE MESSAGE void __fastcall WMLButtonDown(Messages::TWMMouse &Message);
	HIDESBASE MESSAGE void __fastcall WMNCCalcSize(Messages::TWMNCCalcSize &Message);
	HIDESBASE MESSAGE void __fastcall WMNCPaint(Messages::TWMNCPaint &Message);
	HIDESBASE MESSAGE void __fastcall WMPaint(Messages::TWMPaint &Message);
	HIDESBASE MESSAGE void __fastcall WMRButtonDown(Messages::TWMMouse &Message);
	HIDESBASE MESSAGE void __fastcall WMSetCursor(Messages::TWMSetCursor &Msg);
	HIDESBASE MESSAGE void __fastcall WMSetFocus(Messages::TWMSetFocus &Message);
	HIDESBASE MESSAGE void __fastcall WMSize(Messages::TWMSize &Message);
	HIDESBASE MESSAGE void __fastcall WMTimer(Messages::TWMTimer &Message);
	HIDESBASE MESSAGE void __fastcall WMVScroll(Messages::TWMScroll &Message);
	void __fastcall WriteColumns(Classes::TWriter* Writer);
	void __fastcall PaintInplaceButton(TColumnEh* Column, Graphics::TCanvas* Canvas, Toolctrlseh::TEditButtonStyleEh ButtonStyle, const Types::TRect &Rect, const Types::TRect &ClipRect, int DownButton, bool Active, bool Flat, bool Enabled, Graphics::TColor ParentColor, Graphics::TBitmap* Bitmap);
	
protected:
	bool __fastcall InplaceEditCanModify(Controls::TWinControl* Control);
	void __fastcall GetMouseDownInfo(Types::TPoint &Pos, int &Time);
	void __fastcall InplaceEditKeyDown(Controls::TWinControl* Control, System::Word &Key, Classes::TShiftState Shift);
	void __fastcall InplaceEditKeyPress(Controls::TWinControl* Control, System::WideChar &Key);
	void __fastcall InplaceEditKeyUp(Controls::TWinControl* Control, System::Word &Key, Classes::TShiftState Shift);
	void __fastcall InplaceEditWndProc(Controls::TWinControl* Control, Messages::TMessage &Message);
	void __fastcall MTViewDataEvent(int RowNum, Toolctrlseh::TMTViewEventTypeEh Event, int OldRowNum);
	bool FAcquireFocus;
	bool FAllowWordWrap;
	bool FAntiSelection;
	bool FAutoFitColWidths;
	int FBorderWidth;
	TColCellParamsEh* FColCellParamsEh;
	bool FDataTracking;
	TDBGridEhState FDBGridEhState;
	bool FDefaultRowChanged;
	Types::TPoint FDownMousePos;
	bool FDrawMemoText;
	bool FDrawGraphicData;
	int FFooterRowCount;
	int FFrozenCols;
	THeadTreeNode* FHeadTree;
	int FHTitleMargin;
	bool FIndicatorPressed;
	int FInplaceEditorButtonHeight;
	int FInplaceEditorButtonWidth;
	bool FInplaceSearching;
	bool FInplaceSearchingInProcess;
	System::UnicodeString FInplaceSearchText;
	int FInplaceSearchTimeOut;
	bool FInplaceSearchTimerActive;
	PTLeafCol FLeafFieldArr;
	Sysutils::TBytes FLockedBookmark;
	int FLookedOffset;
	int FMinAutoFitWidth;
	Classes::TShiftState FMouseShift;
	Types::TPoint FMoveMousePos;
	int FNewRowHeight;
	TCheckTitleEhBtnEvent FOnCheckButton;
	TDrawFooterCellEvent FOnDrawFooterCell;
	TGetBtnEhParamsEvent FOnGetBtnParams;
	TGridMoveRecordsEventEh FOnMoveRecords;
	TTitleEhClickEvent FOnTitleBtnClick;
	Classes::TNotifyEvent FOnTopLeftChanged;
	bool FPressed;
	Gridseh::TGridCoord FPressedCell;
	int FPressedCol;
	int FRowLines;
	bool FRowSizingAllowed;
	bool FSelectionActive;
	bool FSelectionAnchorSelected;
	TColumnsEhList* FSortMarkedColumns;
	TDBGridEhSumList* FSumList;
	bool FSwapButtons;
	bool FTimerActive;
	int FTimerInterval;
	int FTitleHeight;
	int FTitleHeightFull;
	int FTitleLines;
	bool FTracking;
	bool FUpdateFields;
	bool FUseMultiTitle;
	TScrollBarVisibleModeEh FVertScrollBarVisibleMode;
	TColumnsEhList* FVisibleColumns;
	int FVTitleMargin;
	int FMoveRowSour;
	Sysutils::TBytes FMoveBookmarkSour;
	int FMoveRowDest;
	int FMoveRowSourLevel;
	int FMoveRowDestLevel;
	int FMoveRowLeftBounds;
	int FDataRowMoveLeftBoundary;
	int FDataRowMoveRightBoundary;
	bool FDataRowMoveVisible;
	Gridseh::TGridCoord FOldTopLeft;
	int FTitleRowHeight;
	int FStdDefaultRowHeight;
	bool FColWidthsChanged;
	virtual bool __fastcall AcquireFocus(void);
	bool __fastcall AcquireLayoutLock(void);
	bool __fastcall AllowedOperationUpdate(void);
	virtual bool __fastcall BeginDataRowDrag(int &Origin, int &Destination, const Types::TPoint &MousePt);
	HIDESBASE Types::TRect __fastcall BoxRect(int ALeft, int ATop, int ARight, int ABottom);
	virtual int __fastcall CalcLeftMoveLine(int ARow, const Types::TPoint &MousePt, int &TreeLevel);
	virtual bool __fastcall CanDrawFocusRowRect(void);
	DYNAMIC bool __fastcall CanEditAcceptKey(System::WideChar Key);
	DYNAMIC bool __fastcall CanEditModify(void);
	bool __fastcall CanEditModifyColumn(int Index);
	bool __fastcall CanEditModifyText(void);
	virtual bool __fastcall CanEditorMode(void);
	virtual bool __fastcall CanEditShow(void);
	bool __fastcall CanFilterCol(int DCol);
	virtual bool __fastcall CanFilterEditShow(void);
	bool __fastcall CanSelectType(const TDBGridEhSelectionType Value);
	virtual bool __fastcall CellHave3DRect(int ACol, int ARow, const Types::TRect &ARect, Gridseh::TGridDrawState AState);
	virtual bool __fastcall CellIsMultiSelected(int ACol, int ARow, int DataCol, Sysutils::TBytes DataRowBkmrk);
	virtual bool __fastcall CellTreeElementMouseDown(int MouseX, int MouseY, bool CheckInOnly);
	virtual bool __fastcall CheckBeginRowMoving(int MouseX, int MouseY, bool CheckInOnly);
	bool __fastcall CheckCellFilter(int ACol, int ARow, const Types::TPoint &P);
	DYNAMIC TColumnDefValuesEh* __fastcall CreateColumnDefValues(void);
	DYNAMIC TDBGridColumnsEh* __fastcall CreateColumns(void);
	virtual Gridseh::TInplaceEdit* __fastcall CreateEditor(void);
	virtual Dbctrlseh::TCustomDBEditEh* __fastcall CreateFilterEditor(void);
	DYNAMIC TDBGridEhScrollBar* __fastcall CreateScrollBar(Forms::TScrollBarKind AKind);
	int __fastcall DataToRawColumn(int ACol);
	bool __fastcall DataCellSelected(int DataCol, Sysutils::TBytes DataRow);
	DYNAMIC bool __fastcall DoMouseWheelDown(Classes::TShiftState Shift, const Types::TPoint &MousePos);
	DYNAMIC bool __fastcall DoMouseWheelUp(Classes::TShiftState Shift, const Types::TPoint &MousePos);
	bool __fastcall DrawTitleByThemes(void);
	virtual bool __fastcall IsDrawCellByThemes(int ACol, int ARow, int AreaCol, int AreaRow, Gridseh::TGridDrawState AState, TCellAreaTypeEh CellAreaType, bool Cell3D);
	bool __fastcall FrozenSizing(int X, int Y);
	TCellAreaTypeEh __fastcall GetCellAreaType(int ACol, int ARow, int &AreaCol, int &AreaRow);
	Db::TField* __fastcall GetColField(int DataCol);
	HIDESBASE int __fastcall GetColWidths(int Index);
	DYNAMIC int __fastcall GetEditLimit(void);
	DYNAMIC System::UnicodeString __fastcall GetEditMask(int ACol, int ARow);
	DYNAMIC System::UnicodeString __fastcall GetEditText(int ACol, int ARow);
	System::UnicodeString __fastcall GetFieldValue(int ACol);
	System::UnicodeString __fastcall GetFilterValue(int DCol);
	int __fastcall GetFooterRowCount(void);
	int __fastcall GetRowHeight(void);
	int __fastcall GetRowLines(void);
	int __fastcall GetSubTitleRowHeights(int ASubTitleRow);
	virtual int __fastcall GetSubTitleRows(void);
	virtual int __fastcall GetTitleRows(void);
	bool __fastcall HaveHideDuplicates(void);
	virtual bool __fastcall HighlightNoDataCellColor(int ACol, int ARow, int DataCol, int DataRow, TCellAreaTypeEh CellType, Gridseh::TGridDrawState AState, bool InMultiSelect, Graphics::TColor &AColor, Graphics::TFont* AFont);
	bool __fastcall InplaceEditorVisible(void);
	virtual bool __fastcall IndicatorColVisible(void);
	virtual bool __fastcall IsSelectionActive(void);
	bool __fastcall MemTableSupport(void);
	virtual bool __fastcall MoveDataRows(Toolctrlseh::TBMListEh* BookmarkList, int ToIndex, int TreeLevel, bool CheckOnly);
	virtual bool __fastcall MoveSelectedDataRows(int ToIndex, int TreeLevel, bool CheckOnly);
	virtual bool __fastcall NeedBufferedPaint(void);
	bool __fastcall ViewScroll(void);
	int __fastcall RawToDataColumn(int ACol);
	int __fastcall ReadTitleHeight(void);
	int __fastcall ReadTitleLines(void);
	int __fastcall SetChildTreeHeight(THeadTreeNode* ANode);
	int __fastcall CalcStdDefaultRowHeight(void);
	bool __fastcall StoreColumns(void);
	int __fastcall VisibleDataRowCount(void);
	void __fastcall BeginLayout(void);
	void __fastcall BeginUpdate(void);
	void __fastcall BuildIndicatorTitleMenu(Menus::TPopupMenu* &PopupMenu);
	void __fastcall CalcFrozenSizingState(int X, int Y, TDBGridEhState &State, int &Index, int &SizingPos, int &SizingOfs);
	virtual void __fastcall CalcSizingState(int X, int Y, Gridseh::TGridState &State, int &Index, int &SizingPos, int &SizingOfs, Gridseh::TGridDrawInfoEh &FixedInfo);
	void __fastcall CancelLayout(void);
	DYNAMIC void __fastcall CellClick(TColumnEh* Column);
	DYNAMIC void __fastcall ChangeScale(int M, int D);
	DYNAMIC void __fastcall CheckTitleButton(int ACol, bool &Enabled);
	void __fastcall ClearPainted(THeadTreeNode* node);
	DYNAMIC void __fastcall ColEnter(void);
	DYNAMIC void __fastcall ColExit(void);
	DYNAMIC void __fastcall ColumnMoved(int FromIndex, int ToIndex);
	DYNAMIC void __fastcall ColWidthsChanged(void);
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	virtual void __fastcall CreateWnd(void);
	virtual void __fastcall DataChanged(void);
	void __fastcall DeferLayout(void);
	virtual void __fastcall DefineFieldMap(void);
	virtual void __fastcall DefineProperties(Classes::TFiler* Filer);
	DYNAMIC void __fastcall DoExit(void);
	virtual void __fastcall DoAfterSizeChanged(void);
	DYNAMIC void __fastcall DoSortMarkingChanged(void);
	DYNAMIC void __fastcall DoTitleClick(int ACol, TColumnEh* AColumn);
	virtual void __fastcall DrawBorder(void);
	virtual void __fastcall DrawCell(int ACol, int ARow, const Types::TRect &ARect, Gridseh::TGridDrawState AState);
	virtual void __fastcall DrawTitleCell(int ACol, int ARow, int AreaCol, int AreaRow, const Types::TRect &ARect, Gridseh::TGridDrawState AState, TCellAreaTypeEh CellAreaType);
	virtual void __fastcall DrawIndicatorCell(int ACol, int ARow, int AreaCol, int AreaRow, const Types::TRect &ARect, Gridseh::TGridDrawState AState, TCellAreaTypeEh CellAreaType);
	virtual void __fastcall DrawDataCell(int ACol, int ARow, int AreaCol, int AreaRow, const Types::TRect &ARect, Gridseh::TGridDrawState AState, TCellAreaTypeEh CellAreaType);
	virtual void __fastcall DrawFooterCell(int ACol, int ARow, int AreaCol, int AreaRow, const Types::TRect &ARect, Gridseh::TGridDrawState AState, TCellAreaTypeEh CellAreaType);
	void __fastcall FillCellRect(bool DrawByThemes, const Types::TRect &ARect, bool IsDown, bool IsSelected, const Types::TRect &ClipRect, bool Cell3D);
	virtual void __fastcall DrawCellTreeArea(int DataCol, int DataRow, Gridseh::TGridDrawState AState, const Types::TRect &ARect, bool Draw3DRect);
	void __fastcall DrawDataRowMove(int LeftBoundary, int RightBoundary);
	void __fastcall DrawTreeArea(Graphics::TCanvas* Canvas, const Types::TRect &ARect, bool IsDrawEdge);
	DYNAMIC void __fastcall DrawColumnCell(const Types::TRect &Rect, int DataCol, TColumnEh* Column, Gridseh::TGridDrawState State);
	DYNAMIC void __fastcall OldDrawDataCell(const Types::TRect &Rect, Db::TField* Field, Gridseh::TGridDrawState State);
	virtual void __fastcall DrawSubTitleCell(int ACol, int ARow, int DataCol, int DataRow, TCellAreaTypeEh CellType, const Types::TRect &ARect, Gridseh::TGridDrawState AState, bool &Highlighted);
	HIDESBASE void __fastcall DrawSizingLine(int HorzGridBoundary, int VertGridBoundary);
	virtual void __fastcall DrawRowIndicator(int ACol, int ARow, const Types::TRect &ARect, int XOffset, int YOffset, TDBGridEhRowIndicatorTypeEh IndicatorType);
	virtual void __fastcall DrawIndicatorDropDownSign(int ACol, int ARow, const Types::TRect &ARect, bool Selected);
	virtual void __fastcall DrawGraphicCell(TColumnEh* Column, const Types::TRect &ARect, Graphics::TColor Background);
	DYNAMIC void __fastcall EditButtonClick(void);
	void __fastcall EndLayout(void);
	virtual void __fastcall EndRowMoving(int MouseX, int MouseY, bool Accept);
	void __fastcall EndUpdate(void);
	void __fastcall ExecuteFindDialog(System::UnicodeString Text, System::UnicodeString FieldName, bool Modal);
	void __fastcall FilterButtonClick(System::TObject* Sender, bool &Handled);
	void __fastcall FilterExit(System::TObject* Sender);
	virtual void __fastcall FlatChanged(void);
	DYNAMIC void __fastcall GetCellParams(TColumnEh* Column, Graphics::TFont* AFont, Graphics::TColor &Background, Gridseh::TGridDrawState State);
	virtual void __fastcall GetDatasetFieldList(Classes::TList* FieldList);
	DYNAMIC void __fastcall GetFooterParams(int DataCol, int Row, TColumnEh* Column, Graphics::TFont* AFont, Graphics::TColor &Background, Classes::TAlignment &Alignment, Gridseh::TGridDrawState State, System::UnicodeString &Text);
	void __fastcall HideFilterEdit(void);
	void __fastcall HideDataRowMove(void);
	void __fastcall IndicatorTitleMouseDown(const Gridseh::TGridCoord &Cell, Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	HIDESBASE void __fastcall InvalidateCol(int ACol);
	HIDESBASE void __fastcall InvalidateRow(int ARow);
	HIDESBASE void __fastcall InvalidateCell(int ACol, int ARow);
	HIDESBASE void __fastcall InvalidateEditor(void);
	void __fastcall InvalidateGridRect(const Types::TRect &ARect);
	DYNAMIC void __fastcall KeyDown(System::Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall KeyPress(System::WideChar &Key);
	DYNAMIC void __fastcall KeyUp(System::Word &Key, Classes::TShiftState Shift);
	virtual void __fastcall LayoutChanged(void);
	virtual void __fastcall LinkActive(bool Value);
	virtual void __fastcall Loaded(void);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall MoveDataRowAndScroll(int Mouse, int CellHit, Gridseh::TGridDrawInfoEh &DrawInfo, Gridseh::TGridAxisDrawInfoEh &Axis, int ScrollBar, const Types::TPoint &MousePt);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	void __fastcall OnFilterChange(System::TObject* Sender);
	void __fastcall OnFilterCloseUp(System::TObject* Sender, bool Accept);
	void __fastcall OnFilterClosingUp(System::TObject* Sender, bool &Accept);
	void __fastcall OnFilterEditButtonClick(System::TObject* Sender, bool &Handled);
	void __fastcall OnFilterGetItemsList(System::TObject* Sender);
	void __fastcall OnFilterKeyPress(System::TObject* Sender, System::WideChar &Key);
	void __fastcall OptimizeColsWidth(TColumnsEhList* ColumnsList);
	void __fastcall OptimizeSelectedColsWidth(TColumnEh* WithColumn);
	virtual void __fastcall Paint(void);
	void __fastcall PaintButtonControl(HDC DC, const Types::TRect &ARect, Graphics::TColor ParentColor, Toolctrlseh::TDrawButtonControlStyleEh Style, int DownButton, bool Flat, bool Active, bool Enabled, Stdctrls::TCheckBoxState State);
	void __fastcall RegetDefaultStyle(void);
	void __fastcall ResetTimer(int Interval);
	void __fastcall RestoreColumnsLayoutProducer(System::TObject* ARegIni, System::UnicodeString Section, TColumnEhRestoreParams RestoreParams);
	void __fastcall RestoreGridLayoutProducer(System::TObject* ARegIni, System::UnicodeString Section, TDBGridEhRestoreParams RestoreParams);
	DYNAMIC void __fastcall RowHeightsChanged(void);
	void __fastcall SaveColumnsLayoutProducer(System::TObject* ARegIni, System::UnicodeString Section, bool DeleteSection);
	void __fastcall SaveGridLayoutProducer(System::TObject* ARegIni, System::UnicodeString Section, bool DeleteSection);
	virtual void __fastcall Scroll(int Distance);
	virtual void __fastcall SelectionActiveChanged(void);
	virtual void __fastcall SetColumnAttributes(void);
	HIDESBASE void __fastcall SetColWidths(int Index, int Value);
	DYNAMIC void __fastcall SetEditText(int ACol, int ARow, const System::UnicodeString Value);
	void __fastcall SetDataFilter(void);
	virtual void __fastcall SetFilterValue(int DCol);
	void __fastcall SetFooterRowCount(int Value);
	void __fastcall SetFrozenCols(int Value);
	HIDESBASE void __fastcall SetRowCount(int NewRowCount);
	void __fastcall SetRowHeight(int Value);
	void __fastcall SetRowLines(int Value);
	void __fastcall SetRowSizingAllowed(bool Value);
	HIDESBASE virtual void __fastcall ShowEditor(void);
	void __fastcall ShowFilterEditorChar(System::WideChar Ch);
	void __fastcall StartEditFilter(int DCol);
	void __fastcall StartInplaceSearchTimer(void);
	void __fastcall StopEditFilter(void);
	void __fastcall StopInplaceSearchTimer(void);
	void __fastcall StopTimer(void);
	void __fastcall StopTracking(void);
	void __fastcall StyleEhChanged(void);
	void __fastcall SumListAfterRecalcAll(System::TObject* Sender);
	void __fastcall SumListChanged(System::TObject* Sender);
	void __fastcall SumListRecalcAll(System::TObject* Sender);
	DYNAMIC void __fastcall TimedScroll(Gridseh::TGridScrollDirection Direction);
	virtual void __fastcall TimerScroll(void);
	DYNAMIC void __fastcall TitleClick(TColumnEh* Column);
	DYNAMIC void __fastcall TopLeftChanged(void);
	void __fastcall TrackButton(int X, int Y);
	virtual void __fastcall UpdateActive(void);
	void __fastcall UpdateEditorMode(void);
	void __fastcall UpdateFilterEdit(bool UpdateData);
	virtual void __fastcall UpdateFilterEditProps(int DataCol);
	virtual void __fastcall UpdateHorzExtScrollBar(void);
	virtual void __fastcall UpdateRowCount(void);
	virtual void __fastcall UpdateScrollBar(void);
	virtual void __fastcall UpdateDataRowHeight(int DataRowNum);
	virtual void __fastcall WndProc(Messages::TMessage &Message);
	void __fastcall WriteAutoFitColWidths(bool Value);
	void __fastcall WriteCellText(TColumnEh* Column, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool FillRect, int DX, int DY, System::UnicodeString Text, Classes::TAlignment Alignment, Stdctrls::TTextLayout Layout, bool MultyL, bool EndEllipsis, int LeftMarg, int RightMarg);
	void __fastcall WriteHTitleMargin(int Value);
	void __fastcall WriteMinAutoFitWidth(int Value);
	void __fastcall WriteTitleHeight(int th);
	void __fastcall WriteTitleLines(int tl);
	void __fastcall WriteUseMultiTitle(bool Value);
	void __fastcall WriteVTitleMargin(int Value);
	__property ColCount = {default=5};
	__property Color = {default=-16777211};
	__property ColWidths;
	__property TGridDataLinkEh* DataLink = {read=FDataLink};
	__property DefaultColWidth = {default=64};
	__property bool DefaultDrawing = {read=FDefaultDrawing, write=FDefaultDrawing, default=1};
	__property Dbctrlseh::TCustomDBEditEh* FilterEdit = {read=FFilterEdit};
	__property bool FilterEditMode = {read=FFilterEditMode, write=SetFilterEditMode, nodefault};
	__property Graphics::TColor FooterColor = {read=FFooterColor, write=SetFooterColor, nodefault};
	__property Graphics::TFont* FooterFont = {read=FFooterFont, write=SetFooterFont};
	__property ImeMode = {default=3};
	__property ImeName;
	__property System::Byte LayoutLock = {read=FLayoutLock, nodefault};
	__property Classes::TNotifyEvent OnApplyFilter = {read=FOnApplyFilter, write=FOnApplyFilter};
	__property TDBGridEhClickEvent OnCellClick = {read=FOnCellClick, write=FOnCellClick};
	__property Classes::TNotifyEvent OnColEnter = {read=FOnColEnter, write=FOnColEnter};
	__property Classes::TNotifyEvent OnColExit = {read=FOnColExit, write=FOnColExit};
	__property Gridseh::TMovedEvent OnColumnMoved = {read=FOnColumnMoved, write=FOnColumnMoved};
	__property TDrawColumnEhCellEvent OnDrawColumnCell = {read=FOnDrawColumnCell, write=FOnDrawColumnCell};
	__property TDrawDataCellEvent OnDrawDataCell = {read=FOnDrawDataCell, write=FOnDrawDataCell};
	__property Classes::TNotifyEvent OnEditButtonClick = {read=FOnEditButtonClick, write=FOnEditButtonClick};
	__property TDBGridEhClickEvent OnTitleClick = {read=FOnTitleClick, write=FOnTitleClick};
	__property ParentColor = {default=0};
	__property bool ReadOnly = {read=FReadOnly, write=SetReadOnly, default=0};
	__property RowCount = {default=5};
	__property RowHeights;
	__property TBookmarkListEh* SelectedRows = {read=FBookmarks};
	__property TSTDBGridEhFilter* STFilter = {read=FSTFilter, write=SetSTFilter};
	__property TopRow;
	__property System::Byte UpdateLock = {read=FUpdateLock, nodefault};
	__property int ContraColCount = {read=GetContraColCount, write=SetContraColCount, default=0};
	
public:
	__fastcall virtual TCustomDBGridEh(Classes::TComponent* AOwner);
	__fastcall virtual ~TCustomDBGridEh(void);
	int __fastcall CalcIndicatorColWidth(void);
	HIDESBASE Types::TRect __fastcall CellRect(int ACol, int ARow);
	bool __fastcall CheckCopyAction(void);
	bool __fastcall CheckCutAction(void);
	bool __fastcall CheckDeleteAction(void);
	bool __fastcall CheckPasteAction(void);
	bool __fastcall CheckSelectAllAction(void);
	Types::TRect __fastcall DataBox(void);
	Types::TRect __fastcall DataRect(void);
	int __fastcall DataRowCount(void);
	int __fastcall DataRowToRecNo(int DataRow);
	virtual bool __fastcall DefaultMoveDataRows(Toolctrlseh::TBMListEh* BookmarkList, int ToRecNo, int TreeLevel, bool CheckOnly);
	DYNAMIC bool __fastcall ExecuteAction(Classes::TBasicAction* Action);
	virtual bool __fastcall LocateText(TCustomDBGridEh* AGrid, const System::UnicodeString FieldName, const System::UnicodeString Text, Toolctrlseh::TLocateTextOptionsEh Options, Toolctrlseh::TLocateTextDirectionEh Direction, Toolctrlseh::TLocateTextMatchingEh Matching, Toolctrlseh::TLocateTextTreeFindRangeEh TreeFindRange);
	int __fastcall GetCellTreeElmentsAreaWidth(void);
	System::UnicodeString __fastcall GetCompleteKeyPress(void);
	virtual System::UnicodeString __fastcall GetFooterValue(int Row, TColumnEh* Column);
	virtual bool __fastcall HighlightDataCellColor(int DataCol, int DataRow, const System::UnicodeString Value, Gridseh::TGridDrawState AState, Graphics::TColor &AColor, Graphics::TFont* AFont);
	int __fastcall SafeMoveTop(int ATop, bool CheckOnly = false);
	virtual bool __fastcall UpdateAction(Classes::TBasicAction* Action);
	bool __fastcall ValidFieldIndex(int FieldIndex);
	virtual bool __fastcall IsFindDialogShowAsModal(void);
	void __fastcall ApplyFilter(void);
	void __fastcall ClearFilter(void);
	virtual void __fastcall DefaultApplyFilter(void);
	virtual void __fastcall DefaultApplySorting(void);
	virtual void __fastcall DefaultBuildIndicatorTitleMenu(Menus::TPopupMenu* &PopupMenu);
	virtual void __fastcall DefaultCellMouseClick(const Gridseh::TGridCoord &Cell, Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	void __fastcall DefaultDrawColumnCell(const Types::TRect &Rect, int DataCol, TColumnEh* Column, Gridseh::TGridDrawState State);
	void __fastcall DefaultDrawDataCell(const Types::TRect &Rect, Db::TField* Field, Gridseh::TGridDrawState State);
	void __fastcall DefaultDrawColumnDataCell(const Gridseh::TGridCoord &Cell, const Gridseh::TGridCoord &AreaCell, TColumnEh* Column, const Types::TRect &AreaRect, TColCellParamsEh* &Params);
	void __fastcall DefaultDrawFooterCell(const Types::TRect &Rect, int DataCol, int Row, TColumnEh* Column, Gridseh::TGridDrawState State);
	void __fastcall DefaultFillDataHintShowInfo(const Types::TPoint &CursorPos, const Gridseh::TGridCoord &Cell, TColumnEh* Column, TDBGridEhDataHintParams &Params);
	virtual void __fastcall DefaultHandler(void *Message);
	virtual void __fastcall DefaultIndicatorTitleMouseDown(const Gridseh::TGridCoord &Cell, Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	void __fastcall InvalidateFooter(void);
	void __fastcall InvalidateTitle(void);
	void __fastcall RestoreBookmark(void);
	void __fastcall RestoreColumnsLayout(Inifiles::TCustomIniFile* ACustIni, System::UnicodeString Section, TColumnEhRestoreParams RestoreParams)/* overload */;
	void __fastcall RestoreColumnsLayout(Registry::TRegIniFile* ARegIni, TColumnEhRestoreParams RestoreParams)/* overload */;
	void __fastcall RestoreColumnsLayoutIni(System::UnicodeString IniFileName, System::UnicodeString Section, TColumnEhRestoreParams RestoreParams);
	void __fastcall RestoreGridLayout(Inifiles::TCustomIniFile* ARegIni, System::UnicodeString Section, TDBGridEhRestoreParams RestoreParams)/* overload */;
	void __fastcall RestoreGridLayout(Registry::TRegIniFile* ARegIni, TDBGridEhRestoreParams RestoreParams)/* overload */;
	void __fastcall RestoreGridLayoutIni(System::UnicodeString IniFileName, System::UnicodeString Section, TDBGridEhRestoreParams RestoreParams);
	void __fastcall SaveBookmark(void);
	void __fastcall SaveColumnsLayout(Inifiles::TCustomIniFile* ACustIni, System::UnicodeString Section)/* overload */;
	void __fastcall SaveColumnsLayout(Registry::TRegIniFile* ARegIni)/* overload */;
	void __fastcall SaveColumnsLayoutIni(System::UnicodeString IniFileName, System::UnicodeString Section, bool DeleteSection);
	void __fastcall SaveGridLayout(Inifiles::TCustomIniFile* ACustIni, System::UnicodeString Section)/* overload */;
	void __fastcall SaveGridLayout(Registry::TRegIniFile* ARegIni)/* overload */;
	void __fastcall SaveGridLayoutIni(System::UnicodeString IniFileName, System::UnicodeString Section, bool DeleteSection);
	void __fastcall SetSortMarkedColumns(void);
	void __fastcall SetValueFromPrevRecord(void);
	void __fastcall StartInplaceSearch(System::UnicodeString ss, int TimeOut, Toolctrlseh::TLocateTextDirectionEh InpsDirection);
	void __fastcall StopInplaceSearch(void);
	void __fastcall UpdateData(void);
	virtual void __fastcall UpdateAllDataRowHeights(void);
	__property TDBGridEhAllowedOperations AllowedOperations = {read=FAllowedOperations, write=FAllowedOperations, default=15};
	__property TDBGridEhAllowedSelections AllowedSelections = {read=FAllowedSelections, write=SetAllowedSelections, default=30};
	__property bool AutoFitColWidths = {read=FAutoFitColWidths, write=WriteAutoFitColWidths, default=0};
	__property bool BufferedPaint = {read=FBufferedPaint, write=FBufferedPaint, nodefault};
	__property Canvas;
	__property TDBGridEhCenter* Center = {read=FCenter, write=SetCenter};
	__property Col = {read=GetCol, write=SetCol};
	__property TColumnDefValuesEh* ColumnDefValues = {read=FColumnDefValues, write=SetColumnDefValues};
	__property TDBGridColumnsEh* Columns = {read=FColumns, write=SetColumns};
	__property Ctl3D;
	__property Db::TDataSource* DataSource = {read=GetDataSource, write=SetDataSource};
	__property bool DrawGraphicData = {read=FDrawGraphicData, write=SetDrawGraphicData, default=0};
	__property bool DrawMemoText = {read=FDrawMemoText, write=SetDrawMemoText, default=0};
	__property Graphics::TColor EvenRowColor = {read=GetEvenRowColor, write=SetEvenRowColor, stored=IsEvenRowColorStored, nodefault};
	__property TDBGridEhEditActions EditActions = {read=FEditActions, write=FEditActions, default=0};
	__property EditorMode;
	__property TColumnEh* FieldColumns[const System::UnicodeString FieldName] = {read=GetFieldColumns/*, default*/};
	__property int FieldCount = {read=GetFieldCount, nodefault};
	__property Db::TField* Fields[int FieldIndex] = {read=GetFields};
	__property FixedColor = {default=-16777201};
	__property Font;
	__property int FooterRowCount = {read=GetFooterRowCount, write=SetFooterRowCount, default=0};
	__property int FrozenCols = {read=FFrozenCols, write=SetFrozenCols, default=0};
	__property THeadTreeNode* HeadTree = {read=FHeadTree};
	__property TDBGridEhScrollBar* HorzScrollBar = {read=FHorzScrollBar, write=SetHorzScrollBar};
	__property System::Byte IndicatorOffset = {read=FIndicatorOffset, nodefault};
	__property TDBGridEhIndicatorTitle* IndicatorTitle = {read=FIndicatorTitle, write=FIndicatorTitle};
	__property InplaceEditor;
	__property bool InplaceSearching = {read=FInplaceSearching, nodefault};
	__property PTLeafCol LeafFieldArr = {read=FLeafFieldArr};
	__property LeftCol;
	__property int MinAutoFitWidth = {read=FMinAutoFitWidth, write=WriteMinAutoFitWidth, default=0};
	__property TDBGridEhAdvDrawColumnDataEvent OnAdvDrawDataCell = {read=FOnAdvDrawDataCell, write=FOnAdvDrawDataCell};
	__property TDBGridEhBuildIndicatorTitleMenu OnBuildIndicatorTitleMenu = {read=FOnBuildIndicatorTitleMenu, write=FOnBuildIndicatorTitleMenu};
	__property TCheckTitleEhBtnEvent OnCheckButton = {read=FOnCheckButton, write=FOnCheckButton};
	__property Classes::TNotifyEvent OnColWidthsChanged = {read=FOnColWidthsChanged, write=FOnColWidthsChanged};
	__property TDrawFooterCellEvent OnDrawFooterCell = {read=FOnDrawFooterCell, write=FOnDrawFooterCell};
	__property TGetBtnEhParamsEvent OnGetBtnParams = {read=FOnGetBtnParams, write=FOnGetBtnParams};
	__property TGetCellEhParamsEvent OnGetCellParams = {read=FOnGetCellParams, write=FOnGetCellParams};
	__property TGetFooterParamsEvent OnGetFooterParams = {read=FOnGetFooterParams, write=FOnGetFooterParams};
	__property Gridseh::TGridEhCellMouseEvent OnIndicatorTitleMouseDown = {read=FOnIndicatorTitleMouseDown, write=FOnIndicatorTitleMouseDown};
	__property Classes::TNotifyEvent OnSelectionChanged = {read=FOnSelectionChanged, write=FOnSelectionChanged};
	__property Classes::TNotifyEvent OnSortMarkingChanged = {read=FOnSortMarkingChanged, write=FOnSortMarkingChanged};
	__property Classes::TNotifyEvent OnSumListAfterRecalcAll = {read=FOnSumListAfterRecalcAll, write=FOnSumListAfterRecalcAll};
	__property Classes::TNotifyEvent OnSumListRecalcAll = {read=FOnSumListRecalcAll, write=FOnSumListRecalcAll};
	__property TTitleEhClickEvent OnTitleBtnClick = {read=FOnTitleBtnClick, write=FOnTitleBtnClick};
	__property Classes::TNotifyEvent OnTopLeftChanged = {read=FOnTopLeftChanged, write=FOnTopLeftChanged};
	__property TGridMoveRecordsEventEh OnMoveRecords = {read=FOnMoveRecords, write=FOnMoveRecords};
	__property TGetDBGridEhRowHeightEvent OnGetRowHeight = {read=FOnGetRowHeight, write=FOnGetRowHeight};
	__property TDBGridEhHintShowPauseEvent OnHintShowPause = {read=FOnHintShowPause, write=FOnHintShowPause};
	__property TDBGridEhDataHintShowEvent OnDataHintShow = {read=FOnDataHintShow, write=FOnDataHintShow};
	__property TDBGridOptions Options = {read=FOptions, write=SetOptions, default=3325};
	__property TDBGridEhOptions OptionsEh = {read=FOptionsEh, write=SetOptionsEh, default=1638497};
	__property Graphics::TColor OddRowColor = {read=GetOddRowColor, write=SetOddRowColor, stored=IsOddRowColorStored, nodefault};
	__property Row;
	__property int RowHeight = {read=GetRowHeight, write=SetRowHeight, default=0};
	__property int RowLines = {read=GetRowLines, write=SetRowLines, default=0};
	__property bool RowSizingAllowed = {read=FRowSizingAllowed, write=SetRowSizingAllowed, default=0};
	__property Db::TField* SelectedField = {read=GetSelectedField, write=SetSelectedField};
	__property int SelectedIndex = {read=GetSelectedIndex, write=SetSelectedIndex, nodefault};
	__property TDBGridEhSelection* Selection = {read=FSelection};
	__property bool SortLocal = {read=FSortLocal, write=FSortLocal, default=0};
	__property TColumnsEhList* SortMarkedColumns = {read=FSortMarkedColumns, write=FSortMarkedColumns};
	__property TDBGridEhStyle* Style = {read=FStyle, write=SetStyle};
	__property TDBGridEhSumList* SumList = {read=FSumList, write=SetSumList};
	__property bool TimerActive = {read=FTimerActive, nodefault};
	__property Graphics::TFont* TitleFont = {read=FTitleFont, write=SetTitleFont};
	__property int TitleHeight = {read=ReadTitleHeight, write=WriteTitleHeight, default=0};
	__property Imglist::TCustomImageList* TitleImages = {read=FTitleImages, write=SetTitleImages};
	__property int TitleLines = {read=ReadTitleLines, write=WriteTitleLines, default=0};
	__property System::Byte TitleOffset = {read=FTitleOffset, nodefault};
	__property System::Byte TopDataOffset = {read=GetTopDataOffset, nodefault};
	__property bool TryUseMemTableInt = {read=FTryUseMemTableInt, write=FTryUseMemTableInt, nodefault};
	__property bool UseMultiTitle = {read=FUseMultiTitle, write=WriteUseMultiTitle, default=0};
	__property TDBGridEhScrollBar* VertScrollBar = {read=FVertScrollBar, write=SetVertScrollBar};
	__property VisibleColCount;
	__property TColumnsEhList* VisibleColumns = {read=FVisibleColumns, write=FVisibleColumns};
	__property VisibleRowCount;
	__property int VTitleMargin = {read=FVTitleMargin, write=WriteVTitleMargin, default=10};
	__property GridLineColors;
public:
	/* TWinControl.CreateParented */ inline __fastcall TCustomDBGridEh(HWND ParentWindow) : Gridseh::TCustomGridEh(ParentWindow) { }
	
private:
	void *__IInplaceEditHolderEh;	/* Dbctrlseh::IInplaceEditHolderEh */
	void *__IMTEventReceiverEh;	/* Toolctrlseh::IMTEventReceiverEh */
	
public:
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator System::_di_IInterface()
	{
		System::_di_IInterface intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IInterface*(void) { return (IInterface*)&__IInplaceEditHolderEh; }
	#endif
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Dbctrlseh::_di_IInplaceEditHolderEh()
	{
		Dbctrlseh::_di_IInplaceEditHolderEh intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IInplaceEditHolderEh*(void) { return (IInplaceEditHolderEh*)&__IInplaceEditHolderEh; }
	#endif
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Toolctrlseh::_di_IMTEventReceiverEh()
	{
		Toolctrlseh::_di_IMTEventReceiverEh intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IMTEventReceiverEh*(void) { return (IMTEventReceiverEh*)&__IMTEventReceiverEh; }
	#endif
	
};


class DELPHICLASS TDBGridEh;
class PASCALIMPLEMENTATION TDBGridEh : public TCustomDBGridEh
{
	typedef TCustomDBGridEh inherited;
	
public:
	__property Canvas;
	__property GridHeight;
	__property RowCount = {default=5};
	__property SelectedRows;
	__property TopRow;
	
__published:
	__property Align = {default=0};
	__property AllowedOperations = {default=15};
	__property AllowedSelections = {default=30};
	__property Anchors = {default=3};
	__property AutoFitColWidths = {default=0};
	__property BiDiMode;
	__property BorderStyle = {default=1};
	__property Color = {default=-16777211};
	__property ColumnDefValues;
	__property Columns = {stored=false};
	__property Constraints;
	__property ContraColCount = {default=0};
	__property Ctl3D;
	__property DataSource;
	__property DefaultDrawing = {default=1};
	__property DragCursor = {default=-12};
	__property DragKind = {default=0};
	__property DragMode = {default=0};
	__property DrawGraphicData = {default=0};
	__property DrawMemoText = {default=0};
	__property EditActions = {default=0};
	__property Enabled = {default=1};
	__property EvenRowColor;
	__property FixedColor = {default=-16777201};
	__property Flat;
	__property Font;
	__property FooterColor;
	__property FooterFont;
	__property FooterRowCount = {default=0};
	__property FrozenCols = {default=0};
	__property HorzScrollBar;
	__property ImeMode = {default=3};
	__property ImeName;
	__property IndicatorTitle;
	__property MinAutoFitWidth = {default=0};
	__property OddRowColor;
	__property Options = {default=3325};
	__property OptionsEh = {default=1638497};
	__property ParentBiDiMode = {default=1};
	__property ParentCtl3D = {default=1};
	__property ParentColor = {default=0};
	__property ParentFont = {default=1};
	__property ParentShowHint = {default=1};
	__property PopupMenu;
	__property ReadOnly = {default=0};
	__property RowHeight = {default=0};
	__property RowLines = {default=0};
	__property RowSizingAllowed = {default=0};
	__property ShowHint;
	__property SortLocal = {default=0};
	__property STFilter;
	__property SumList;
	__property TabOrder = {default=-1};
	__property TabStop = {default=1};
	__property TitleFont;
	__property TitleHeight = {default=0};
	__property TitleImages;
	__property TitleLines = {default=0};
	__property UseMultiTitle = {default=0};
	__property VertScrollBar;
	__property Visible = {default=1};
	__property VTitleMargin = {default=10};
	__property OnAdvDrawDataCell;
	__property OnApplyFilter;
	__property OnBuildIndicatorTitleMenu;
	__property OnCellClick;
	__property OnCellMouseClick;
	__property OnCheckButton;
	__property OnColEnter;
	__property OnColExit;
	__property OnColumnMoved;
	__property OnColWidthsChanged;
	__property OnContextPopup;
	__property OnDblClick;
	__property OnDragDrop;
	__property OnDragOver;
	__property OnDrawColumnCell;
	__property OnDrawDataCell;
	__property OnDrawFooterCell;
	__property OnDataHintShow;
	__property OnEditButtonClick;
	__property OnEndDock;
	__property OnEndDrag;
	__property OnEnter;
	__property OnExit;
	__property OnGetBtnParams;
	__property OnGetCellParams;
	__property OnGetFooterParams;
	__property OnGetRowHeight;
	__property OnIndicatorTitleMouseDown;
	__property OnKeyDown;
	__property OnKeyPress;
	__property OnKeyUp;
	__property OnMouseDown;
	__property OnMouseMove;
	__property OnMouseUp;
	__property OnMoveRecords;
	__property OnSelectionChanged;
	__property OnHintShowPause;
	__property OnSortMarkingChanged;
	__property OnStartDock;
	__property OnStartDrag;
	__property OnSumListAfterRecalcAll;
	__property OnSumListRecalcAll;
	__property OnTitleBtnClick;
	__property OnTitleClick;
public:
	/* TCustomDBGridEh.Create */ inline __fastcall virtual TDBGridEh(Classes::TComponent* AOwner) : TCustomDBGridEh(AOwner) { }
	/* TCustomDBGridEh.Destroy */ inline __fastcall virtual ~TDBGridEh(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TDBGridEh(HWND ParentWindow) : TCustomDBGridEh(ParentWindow) { }
	
};


class PASCALIMPLEMENTATION TColumnDropDownBoxEh : public Classes::TPersistent
{
	typedef Classes::TPersistent inherited;
	
private:
	Dbctrls::TDropDownAlign FAlign;
	bool FAutoDrop;
	bool FAutoFitColWidths;
	Db::TDataSource* FListSource;
	Classes::TPersistent* FOwner;
	int FRows;
	bool FShowTitles;
	bool FSizable;
	Toolctrlseh::TSpecRowEh* FSpecRow;
	bool FUseMultiTitle;
	int FWidth;
	bool __fastcall GetAutoFitColWidths(void);
	TColumnDefValuesEh* __fastcall GetColumnDefValues(void);
	TDBGridColumnsEh* __fastcall GetColumns(void);
	Db::TDataSource* __fastcall GetListSource(void);
	TDBLookupGridEhOptions __fastcall GetOptions(void);
	bool __fastcall GetSortLocal(void);
	bool __fastcall StoreColumns(void);
	void __fastcall SetAutoFitColWidths(const bool Value);
	void __fastcall SetColumnDefValues(const TColumnDefValuesEh* Value);
	void __fastcall SetColumns(const TDBGridColumnsEh* Value);
	void __fastcall SetListSource(const Db::TDataSource* Value);
	void __fastcall SetOptions(const TDBLookupGridEhOptions Value);
	void __fastcall SetSpecRow(const Toolctrlseh::TSpecRowEh* Value);
	void __fastcall SetSortLocal(const bool Value);
	
protected:
	__property Dbctrls::TDropDownAlign Align = {read=FAlign, write=FAlign, default=0};
	__property bool AutoDrop = {read=FAutoDrop, write=FAutoDrop, default=0};
	__property int Rows = {read=FRows, write=FRows, default=7};
	__property bool ShowTitles = {read=FShowTitles, write=FShowTitles, default=0};
	__property bool Sizable = {read=FSizable, write=FSizable, default=0};
	__property Toolctrlseh::TSpecRowEh* SpecRow = {read=FSpecRow, write=SetSpecRow};
	__property int Width = {read=FWidth, write=FWidth, default=0};
	
public:
	__fastcall TColumnDropDownBoxEh(Classes::TPersistent* Owner);
	__fastcall virtual ~TColumnDropDownBoxEh(void);
	DYNAMIC Classes::TPersistent* __fastcall GetOwner(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	
__published:
	__property bool AutoFitColWidths = {read=GetAutoFitColWidths, write=SetAutoFitColWidths, default=1};
	__property TColumnDefValuesEh* ColumnDefValues = {read=GetColumnDefValues, write=SetColumnDefValues};
	__property TDBGridColumnsEh* Columns = {read=GetColumns, write=SetColumns, stored=StoreColumns};
	__property Db::TDataSource* ListSource = {read=GetListSource, write=SetListSource};
	__property TDBLookupGridEhOptions Options = {read=GetOptions, write=SetOptions, default=2};
	__property bool SortLocal = {read=GetSortLocal, write=SetSortLocal, default=0};
	__property bool UseMultiTitle = {read=FUseMultiTitle, write=FUseMultiTitle, default=0};
};


#pragma option push -b-
enum TDBGridEhStyleIndicatorTitleMenuEh { itmVisibleColumnsEh, itmCut, itmCopy, itmPaste, itmDelete, itmSelectAll };
#pragma option pop

typedef Set<TDBGridEhStyleIndicatorTitleMenuEh, itmVisibleColumnsEh, itmSelectAll>  TDBGridEhStyleIndicatorTitleMenusEh;

class DELPHICLASS TColumnEhMenuItem;
class PASCALIMPLEMENTATION TColumnEhMenuItem : public Menus::TMenuItem
{
	typedef Menus::TMenuItem inherited;
	
public:
	TColumnEh* ColumnEh;
public:
	/* TMenuItem.Create */ inline __fastcall virtual TColumnEhMenuItem(Classes::TComponent* AOwner) : Menus::TMenuItem(AOwner) { }
	/* TMenuItem.Destroy */ inline __fastcall virtual ~TColumnEhMenuItem(void) { }
	
};


class DELPHICLASS TDBGridEhMenuItem;
class PASCALIMPLEMENTATION TDBGridEhMenuItem : public Menus::TMenuItem
{
	typedef Menus::TMenuItem inherited;
	
public:
	TCustomDBGridEh* Grid;
	TDBGridEhStyleIndicatorTitleMenuEh TitleMenu;
public:
	/* TMenuItem.Create */ inline __fastcall virtual TDBGridEhMenuItem(Classes::TComponent* AOwner) : Menus::TMenuItem(AOwner) { }
	/* TMenuItem.Destroy */ inline __fastcall virtual ~TDBGridEhMenuItem(void) { }
	
};


class PASCALIMPLEMENTATION TDBGridEhStyle : public Classes::TPersistent
{
	typedef Classes::TPersistent inherited;
	
private:
	Contnrs::TObjectList* FGrids;
	bool FLuminateSelection;
	int FScreenNumColors;
	HWND FWindowHandle;
	bool FIsDrawFocusRect;
	void __fastcall SetLuminateSelection(const bool Value);
	
protected:
	virtual bool __fastcall HighlightDataCellColor(TCustomDBGridEh* AGrid, int ACol, int ARow, int DataCol, int DataRow, const System::UnicodeString Value, Gridseh::TGridDrawState AState, bool InMultiSelect, Graphics::TColor &AColor, Graphics::TFont* AFont);
	virtual bool __fastcall HighlightNoDataCellColor(TCustomDBGridEh* AGrid, int ACol, int ARow, int DataCol, int DataRow, TCellAreaTypeEh CellType, Gridseh::TGridDrawState AState, bool InMultiSelect, Graphics::TColor &AColor, Graphics::TFont* AFont);
	void __fastcall RemoveAllChangeNotification(void);
	virtual void __fastcall StyleWndProc(Messages::TMessage &Msg);
	virtual void __fastcall SysColorChanged(void);
	
public:
	__fastcall TDBGridEhStyle(void);
	__fastcall virtual ~TDBGridEhStyle(void);
	bool __fastcall GridInChangeNotification(TCustomDBGridEh* Grid);
	Graphics::TColor __fastcall LightenColor(Graphics::TColor AColor, Graphics::TColor GlassColor, bool Ungray);
	void __fastcall AddChangeNotification(TCustomDBGridEh* Grid);
	void __fastcall Changed(void);
	void __fastcall RemoveChangeNotification(TCustomDBGridEh* Grid);
	__property bool LuminateSelection = {read=FLuminateSelection, write=SetLuminateSelection, default=1};
	__property bool IsDrawFocusRect = {read=FIsDrawFocusRect, write=FIsDrawFocusRect, default=1};
};


class PASCALIMPLEMENTATION TDBGridEhCenter : public Classes::TPersistent
{
	typedef Classes::TPersistent inherited;
	
private:
	bool FFilterEditCloseUpApplyFilter;
	Contnrs::TObjectList* FGrids;
	TDBGridEhStyleIndicatorTitleMenusEh FIndicatorTitleMenus;
	Classes::TNotifyEvent FOnApplyFilter;
	Classes::TNotifyEvent FOnApplySorting;
	TDBGridEhBuildIndicatorTitleMenu FOnBuildIndicatorTitleMenu;
	Gridseh::TGridEhCellMouseEvent FOnCellMouseClick;
	Gridseh::TGridEhCellMouseEvent FOnIndicatorTitleMouseDown;
	Toolctrlseh::TLocateTextEventEh FOnLocateText;
	
protected:
	virtual bool __fastcall DefaultLocateText(TCustomDBGridEh* AGrid, const System::UnicodeString FieldName, const System::UnicodeString Text, Toolctrlseh::TLocateTextOptionsEh Options, Toolctrlseh::TLocateTextDirectionEh Direction, Toolctrlseh::TLocateTextMatchingEh Matching, Toolctrlseh::TLocateTextTreeFindRangeEh TreeFindRange);
	virtual bool __fastcall DefaultMoveRecords(TCustomDBGridEh* AGrid, Toolctrlseh::TBMListEh* BookmarkList, int ToRecNo, bool CheckOnly);
	virtual bool __fastcall LocateText(TCustomDBGridEh* AGrid, const System::UnicodeString FieldName, const System::UnicodeString Text, Toolctrlseh::TLocateTextOptionsEh Options, Toolctrlseh::TLocateTextDirectionEh Direction, Toolctrlseh::TLocateTextMatchingEh Matching, Toolctrlseh::TLocateTextTreeFindRangeEh TreeFindRange);
	virtual bool __fastcall MoveRecords(TCustomDBGridEh* AGrid, Toolctrlseh::TBMListEh* BookmarkList, int ToRecNo, bool CheckOnly);
	virtual void __fastcall ApplyFilter(TCustomDBGridEh* AGrid);
	virtual void __fastcall ApplySorting(TCustomDBGridEh* AGrid);
	virtual void __fastcall ExecuteFindDialog(TCustomDBGridEh* AGrid, System::UnicodeString Text, System::UnicodeString FieldName, bool Modal);
	void __fastcall MenuEditClick(System::TObject* Sender);
	void __fastcall MenuVisibleColumnClick(System::TObject* Sender);
	void __fastcall RemoveAllChangeNotification(void);
	
public:
	__fastcall TDBGridEhCenter(void);
	__fastcall virtual ~TDBGridEhCenter(void);
	bool __fastcall GridInChangeNotification(TCustomDBGridEh* Grid);
	void __fastcall AddChangeNotification(TCustomDBGridEh* Grid);
	void __fastcall BuildIndicatorTitleMenu(TCustomDBGridEh* Grid, Menus::TPopupMenu* &PopupMenu);
	void __fastcall CellMouseClick(TCustomDBGridEh* Grid, const Gridseh::TGridCoord &Cell, Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall IndicatorTitleMouseDown(TCustomDBGridEh* Grid, const Gridseh::TGridCoord &Cell, Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	void __fastcall Changed(void);
	virtual void __fastcall DefaultApplyFilter(TCustomDBGridEh* AGrid);
	virtual void __fastcall DefaultApplySorting(TCustomDBGridEh* AGrid);
	virtual void __fastcall DefaultBuildIndicatorTitleMenu(TCustomDBGridEh* Grid, Menus::TPopupMenu* &PopupMenu);
	virtual void __fastcall DefaultCellMouseClick(TCustomDBGridEh* Grid, const Gridseh::TGridCoord &Cell, Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall DefaultIndicatorTitleMouseDown(TCustomDBGridEh* Grid, const Gridseh::TGridCoord &Cell, Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	void __fastcall RemoveChangeNotification(TCustomDBGridEh* Grid);
	__property bool FilterEditCloseUpApplyFilter = {read=FFilterEditCloseUpApplyFilter, write=FFilterEditCloseUpApplyFilter, default=0};
	__property TDBGridEhStyleIndicatorTitleMenusEh IndicatorTitleMenus = {read=FIndicatorTitleMenus, write=FIndicatorTitleMenus, nodefault};
	__property Classes::TNotifyEvent OnApplyFilter = {read=FOnApplyFilter, write=FOnApplyFilter};
	__property Classes::TNotifyEvent OnApplySorting = {read=FOnApplySorting, write=FOnApplySorting};
	__property TDBGridEhBuildIndicatorTitleMenu OnBuildIndicatorTitleMenu = {read=FOnBuildIndicatorTitleMenu, write=FOnBuildIndicatorTitleMenu};
	__property Gridseh::TGridEhCellMouseEvent OnCellMouseClick = {read=FOnCellMouseClick, write=FOnCellMouseClick};
	__property Gridseh::TGridEhCellMouseEvent OnIndicatorTitleMouseDown = {read=FOnIndicatorTitleMouseDown, write=FOnIndicatorTitleMouseDown};
	__property Toolctrlseh::TLocateTextEventEh OnLocateText = {read=FOnLocateText, write=FOnLocateText};
};


//-- var, const, procedure ---------------------------------------------------
static const Word cm_DeferLayout = 0x464;
static const ShortInt IndicatorWidth = 0xb;
#define ColumnEhTitleValues (Set<TColumnEhValue, cvColor, cvTextEditing> () << cvTitleColor << cvTitleCaption << cvTitleAlignment << cvTitleFont << cvTitleButton << cvTitleEndEllipsis << cvTitleToolTips << cvTitleOrientation )
#define ColumnEhFooterValues (Set<TColumnFooterEhValue, cvFooterAlignment, cvFooterToolTips> () << cvFooterAlignment << cvFooterFont << cvFooterColor )
extern PACKAGE Graphics::TFont* SortMarkerFont;
extern PACKAGE Controls::TImageList* DBGridEhIndicators;
extern PACKAGE Controls::TImageList* DBGridEhSortMarkerImages;
extern PACKAGE Classes::TShortCut DBGridEhInplaceSearchKey;
extern PACKAGE Classes::TShortCut DBGridEhInplaceSearchNextKey;
extern PACKAGE Classes::TShortCut DBGridEhInplaceSearchPriorKey;
extern PACKAGE int DBGridEhInplaceSearchTimeOut;
extern PACKAGE Graphics::TColor DBGridEhInplaceSearchColor;
extern PACKAGE Graphics::TColor DBGridEhInplaceSearchTextColor;
extern PACKAGE Classes::TShortCut DBGridEhSetValueFromPrevRecordKey;
extern PACKAGE Classes::TShortCut DBGridEhFindDialogKey;
extern PACKAGE bool DBGridEhDebugDraw;
extern PACKAGE Menus::TPopupMenu* DBGridEhIndicatorTitlePopupMenu;
extern PACKAGE TDBGridEhMenuItem* DBGridEhVisibleColumnsIndicatorMenuItem;
extern PACKAGE TDBGridEhMenuItem* DBGridEhCutIndicatorMenuItem;
extern PACKAGE TDBGridEhMenuItem* DBGridEhCopyIndicatorMenuItem;
extern PACKAGE TDBGridEhMenuItem* DBGridEhPasteIndicatorMenuItem;
extern PACKAGE TDBGridEhMenuItem* DBGridEhDeleteIndicatorMenuItem;
extern PACKAGE TDBGridEhMenuItem* DBGridEhSelectAllIndicatorMenuItem;
extern PACKAGE Toolctrlseh::TDesignControlerEh* DBGridEhDesigntControler;
extern PACKAGE int ColSelectionAreaHeight;
extern PACKAGE TDBGridEhStyle* __fastcall SetDBGridEhDefaultStyle(TDBGridEhStyle* NewGridDefaultStyle);
extern PACKAGE TDBGridEhStyle* __fastcall DBGridEhDefaultStyle(void);
extern PACKAGE TDBGridEhCenter* __fastcall SetDBGridEhCenter(TDBGridEhCenter* NewGridCenter);
extern PACKAGE TDBGridEhCenter* __fastcall DBGridEhCenter(void);
extern PACKAGE void __fastcall WriteTextEh(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool FillRect, int DX, int DY, System::UnicodeString Text, Classes::TAlignment Alignment, Stdctrls::TTextLayout Layout, bool MultyL, bool EndEllipsis, int LeftMarg, int RightMarg, bool RightToLeftReading);
extern PACKAGE int __fastcall WriteTextVerticalEh(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool FillRect, int DX, int DY, System::UnicodeString Text, Classes::TAlignment Alignment, Stdctrls::TTextLayout Layout, bool EndEllipsis, bool CalcTextExtent);
extern PACKAGE void __fastcall RecreateInplaceSearchIndicator(void);

}	/* namespace Dbgrideh */
using namespace Dbgrideh;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// DbgridehHPP
