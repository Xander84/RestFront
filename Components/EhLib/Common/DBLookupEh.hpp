// CodeGear C++Builder
// Copyright (c) 1995, 2009 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Dblookupeh.pas' rev: 21.00

#ifndef DblookupehHPP
#define DblookupehHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <Sysinit.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Sysutils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <Stdctrls.hpp>	// Pascal unit
#include <Mask.hpp>	// Pascal unit
#include <Db.hpp>	// Pascal unit
#include <Dbctrls.hpp>	// Pascal unit
#include <Buttons.hpp>	// Pascal unit
#include <Dbctrlseh.hpp>	// Pascal unit
#include <Toolctrlseh.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Ehlibvcl.hpp>	// Pascal unit
#include <Dblookupgridseh.hpp>	// Pascal unit
#include <Dbgrideh.hpp>	// Pascal unit
#include <Imglist.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Dblookupeh
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TLookupComboboxDropDownBoxEh;
class PASCALIMPLEMENTATION TLookupComboboxDropDownBoxEh : public Dbgrideh::TColumnDropDownBoxEh
{
	typedef Dbgrideh::TColumnDropDownBoxEh inherited;
	
__published:
	__property Align = {default=0};
	__property AutoDrop = {default=0};
	__property Rows = {default=7};
	__property ShowTitles = {default=0};
	__property Sizable = {default=0};
	__property SpecRow;
	__property Width = {default=0};
public:
	/* TColumnDropDownBoxEh.Create */ inline __fastcall TLookupComboboxDropDownBoxEh(Classes::TPersistent* Owner) : Dbgrideh::TColumnDropDownBoxEh(Owner) { }
	/* TColumnDropDownBoxEh.Destroy */ inline __fastcall virtual ~TLookupComboboxDropDownBoxEh(void) { }
	
};


class DELPHICLASS TDataSourceLinkEh;
class DELPHICLASS TCustomDBLookupComboboxEh;
class PASCALIMPLEMENTATION TDataSourceLinkEh : public Dbctrlseh::TFieldDataLinkEh
{
	typedef Dbctrlseh::TFieldDataLinkEh inherited;
	
private:
	bool FDataIndependentValueAsText;
	TCustomDBLookupComboboxEh* FDBLookupControl;
	
protected:
	__fastcall TDataSourceLinkEh(void);
	virtual void __fastcall RecordChanged(Db::TField* Field);
	virtual void __fastcall LayoutChanged(void);
public:
	/* TDataLink.Destroy */ inline __fastcall virtual ~TDataSourceLinkEh(void) { }
	
};


class DELPHICLASS TListSourceLinkEh;
class PASCALIMPLEMENTATION TListSourceLinkEh : public Db::TDataLink
{
	typedef Db::TDataLink inherited;
	
private:
	TCustomDBLookupComboboxEh* FDBLookupControl;
	
protected:
	virtual void __fastcall ActiveChanged(void);
	virtual void __fastcall DataSetChanged(void);
	virtual void __fastcall LayoutChanged(void);
	
public:
	__fastcall TListSourceLinkEh(void);
public:
	/* TDataLink.Destroy */ inline __fastcall virtual ~TListSourceLinkEh(void) { }
	
};


#pragma option push -b-
enum TDBLookupComboboxEhStyle { csDropDownListEh, csDropDownEh };
#pragma option pop

class PASCALIMPLEMENTATION TCustomDBLookupComboboxEh : public Dbctrlseh::TCustomDBEditEh
{
	typedef Dbctrlseh::TCustomDBEditEh inherited;
	
private:
	Toolctrlseh::TFieldsArrEh FDataFields;
	System::UnicodeString FDataFieldName;
	bool FDataFieldsUpdating;
	Dblookupgridseh::TPopupDataGridEh* FDataList;
	TLookupComboboxDropDownBoxEh* FDropDownBox;
	bool FInternalTextSetting;
	Toolctrlseh::TFieldsArrEh FKeyFields;
	System::UnicodeString FKeyFieldName;
	bool FKeyTextIndependent;
	System::Variant FKeyValue;
	bool FListActive;
	bool FListColumnMothed;
	Db::TField* FListField;
	int FListFieldIndex;
	System::UnicodeString FListFieldName;
	Classes::TList* FListFields;
	TListSourceLinkEh* FListLink;
	Db::TDataSource* FListSource;
	bool FListVisible;
	bool FLockUpdateKeyTextIndependent;
	bool FLookupMode;
	Db::TDataSource* FLookupSource;
	Toolctrlseh::TFieldsArrEh FMasterFields;
	System::UnicodeString FMasterFieldNames;
	Toolctrlseh::TCloseUpEventEh FOnCloseUp;
	Classes::TNotifyEvent FOnDropDown;
	Classes::TNotifyEvent FOnKeyValueChanged;
	Toolctrlseh::TNotInListEventEh FOnNotInList;
	TDBLookupComboboxEhStyle FStyle;
	bool FTextBeenChanged;
	TDataSourceLinkEh* __fastcall GetDataLink(void);
	System::UnicodeString __fastcall GetKeyFieldName(void);
	Db::TDataSource* __fastcall GetListSource(void);
	Toolctrlseh::TButtonClickEventEh __fastcall GetOnButtonClick(void);
	Toolctrlseh::TButtonDownEventEh __fastcall GetOnButtonDown(void);
	Dbgrideh::TCheckTitleEhBtnEvent __fastcall GetOnDropDownBoxCheckButton(void);
	Dbgrideh::TDrawColumnEhCellEvent __fastcall GetOnDropDownBoxDrawColumnCell(void);
	Dbgrideh::TGetCellEhParamsEvent __fastcall GetOnDropDownBoxGetCellParams(void);
	Classes::TNotifyEvent __fastcall GetOnDropDownBoxSortMarkingChanged(void);
	Dbgrideh::TTitleEhClickEvent __fastcall GetOnDropDownBoxTitleBtnClick(void);
	void __fastcall CheckNotCircular(void);
	void __fastcall CheckNotLookup(void);
	HIDESBASE MESSAGE void __fastcall CMCancelMode(Controls::TCMCancelMode &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseWheel(Controls::TCMMouseWheel &Message);
	HIDESBASE MESSAGE void __fastcall CMWantSpecialKey(Messages::TWMKey &Message);
	void __fastcall DataListKeyValueChanged(System::TObject* Sender);
	MESSAGE void __fastcall EMReplacesel(Messages::TMessage &Message);
	void __fastcall ListMouseCloseUp(System::TObject* Sender, bool Accept);
	void __fastcall ListColumnMoved(System::TObject* Sender, int FromIndex, int ToIndex);
	void __fastcall SetDataFieldName(const System::UnicodeString Value);
	void __fastcall SetDropDownBox(const TLookupComboboxDropDownBoxEh* Value);
	void __fastcall SetKeyFieldName(const System::UnicodeString Value);
	void __fastcall SetKeyValue(const System::Variant &Value);
	void __fastcall SetListFieldName(const System::UnicodeString Value);
	void __fastcall SetListSource(Db::TDataSource* Value);
	void __fastcall SetLookupMode(bool Value);
	void __fastcall SetOnButtonClick(const Toolctrlseh::TButtonClickEventEh Value);
	void __fastcall SetOnButtonDown(const Toolctrlseh::TButtonDownEventEh Value);
	void __fastcall SetOnDropDownBoxCheckButton(const Dbgrideh::TCheckTitleEhBtnEvent Value);
	void __fastcall SetOnDropDownBoxDrawColumnCell(const Dbgrideh::TDrawColumnEhCellEvent Value);
	void __fastcall SetOnDropDownBoxGetCellParams(const Dbgrideh::TGetCellEhParamsEvent Value);
	void __fastcall SetOnDropDownBoxSortMarkingChanged(const Classes::TNotifyEvent Value);
	void __fastcall SetOnDropDownBoxTitleBtnClick(const Dbgrideh::TTitleEhClickEvent Value);
	void __fastcall SetStyle(const TDBLookupComboboxEhStyle Value);
	void __fastcall UpdateKeyTextIndependent(void);
	void __fastcall UpdateReadOnly(void);
	HIDESBASE MESSAGE void __fastcall WMChar(Messages::TWMKey &Message);
	HIDESBASE MESSAGE void __fastcall WMCut(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMKeyDown(Messages::TWMKey &Message);
	HIDESBASE MESSAGE void __fastcall WMKillFocus(Messages::TWMKillFocus &Message);
	HIDESBASE MESSAGE void __fastcall WMPaste(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMSetCursor(Messages::TWMSetCursor &Message);
	
protected:
	virtual bool __fastcall ButtonEnabled(void);
	virtual bool __fastcall CanModify(bool TryEdit);
	virtual Dbctrlseh::TFieldDataLinkEh* __fastcall CreateDataLink(void);
	virtual Toolctrlseh::TEditButtonEh* __fastcall CreateEditButton(void);
	virtual bool __fastcall CompatibleVarValue(Toolctrlseh::TFieldsArrEh AFieldsArr, const System::Variant &AVlaue);
	virtual Classes::TAlignment __fastcall DefaultAlignment(void);
	DYNAMIC bool __fastcall DoMouseWheelDown(Classes::TShiftState Shift, const Types::TPoint &MousePos);
	DYNAMIC bool __fastcall DoMouseWheelUp(Classes::TShiftState Shift, const Types::TPoint &MousePos);
	HIDESBASE Db::TField* __fastcall GetDataField(void);
	System::UnicodeString __fastcall GetDisplayText(Db::TField* Field);
	virtual System::UnicodeString __fastcall GetDisplayTextForPaintCopy(void);
	virtual int __fastcall GetListFieldsWidth(void);
	virtual System::Variant __fastcall GetVariantValue(void);
	virtual bool __fastcall IsValidChar(System::WideChar InputChar);
	virtual bool __fastcall LocateStr(System::UnicodeString Str, bool PartialKey);
	virtual bool __fastcall LocateDataSourceKey(Db::TDataSource* DataSource);
	virtual bool __fastcall SpecListMode(void);
	Db::TDataSource* __fastcall FullListSource(void);
	bool __fastcall TraceMouseMoveForPopupListbox(System::TObject* Sender, Classes::TShiftState Shift, int X, int Y);
	Db::TDataSource* __fastcall UsedListSource(void);
	virtual void __fastcall ActiveChanged(void);
	virtual void __fastcall ButtonDown(bool IsDownButton);
	DYNAMIC void __fastcall Click(void);
	virtual void __fastcall DataChanged(void);
	virtual void __fastcall EditButtonMouseMove(System::TObject* Sender, Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall InternalSetText(System::UnicodeString AText);
	virtual void __fastcall InternalSetValue(const System::Variant &AValue);
	void __fastcall HookOnChangeEvent(System::TObject* Sender);
	DYNAMIC void __fastcall KeyDown(System::Word &Key, Classes::TShiftState Shift);
	DYNAMIC void __fastcall KeyPress(System::WideChar &Key);
	virtual void __fastcall KeyValueChanged(void);
	DYNAMIC void __fastcall KeyUp(System::Word &Key, Classes::TShiftState Shift);
	virtual void __fastcall ListLinkDataChanged(void);
	virtual void __fastcall Loaded(void);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual void __fastcall ProcessSearchStr(System::UnicodeString Str);
	virtual void __fastcall SelectKeyValue(const System::Variant &Value);
	HIDESBASE void __fastcall SetEditText(System::UnicodeString Value);
	virtual void __fastcall SetFocused(bool Value);
	virtual void __fastcall SpecRowChanged(System::TObject* Sender);
	virtual void __fastcall UpdateDataFields(void);
	virtual void __fastcall UpdateListFields(void);
	virtual void __fastcall UpdateListLinkDataSource(void);
	__property TDataSourceLinkEh* DataLink = {read=GetDataLink};
	__property bool ListActive = {read=FListActive, nodefault};
	__property Classes::TList* ListFields = {read=FListFields};
	__property TListSourceLinkEh* ListLink = {read=FListLink};
	__property Toolctrlseh::TButtonClickEventEh OnButtonClick = {read=GetOnButtonClick, write=SetOnButtonClick};
	__property Toolctrlseh::TButtonDownEventEh OnButtonDown = {read=GetOnButtonDown, write=SetOnButtonDown};
	void __fastcall SetDropDownBoxListSource(Db::TDataSource* AListSource);
	Dbgrideh::TCustomDBGridEh* __fastcall GetLookupGrid(void);
	Dbgrideh::TDBLookupGridEhOptions __fastcall GetOptions(void);
	void __fastcall SetOptions(Dbgrideh::TDBLookupGridEhOptions Value);
	
public:
	__fastcall virtual TCustomDBLookupComboboxEh(Classes::TComponent* AOwner);
	__fastcall virtual ~TCustomDBLookupComboboxEh(void);
	virtual bool __fastcall LocateKey(void);
	void __fastcall ClearDataProps(void);
	virtual void __fastcall CloseUp(bool Accept);
	virtual void __fastcall DefaultHandler(void *Message);
	virtual void __fastcall DropDown(void);
	HIDESBASE virtual void __fastcall SelectAll(void);
	void __fastcall SelectNextValue(bool IsPrior);
	virtual void __fastcall UpdateData(void);
	__property System::UnicodeString DataField = {read=FDataFieldName, write=SetDataFieldName};
	__property Dblookupgridseh::TPopupDataGridEh* DataList = {read=FDataList};
	__property TLookupComboboxDropDownBoxEh* DropDownBox = {read=FDropDownBox, write=SetDropDownBox};
	__property Db::TField* Field = {read=GetDataField};
	__property System::UnicodeString KeyField = {read=GetKeyFieldName, write=SetKeyFieldName};
	__property System::Variant KeyValue = {read=FKeyValue, write=SelectKeyValue};
	__property System::UnicodeString ListField = {read=FListFieldName, write=SetListFieldName};
	__property int ListFieldIndex = {read=FListFieldIndex, write=FListFieldIndex, default=0};
	__property Db::TDataSource* ListSource = {read=GetListSource, write=SetListSource};
	__property bool ListVisible = {read=FListVisible, nodefault};
	__property TDBLookupComboboxEhStyle Style = {read=FStyle, write=SetStyle, default=0};
	__property Text;
	__property Toolctrlseh::TCloseUpEventEh OnCloseUp = {read=FOnCloseUp, write=FOnCloseUp};
	__property Classes::TNotifyEvent OnDropDown = {read=FOnDropDown, write=FOnDropDown};
	__property Classes::TNotifyEvent OnKeyValueChanged = {read=FOnKeyValueChanged, write=FOnKeyValueChanged};
	__property Toolctrlseh::TNotInListEventEh OnNotInList = {read=FOnNotInList, write=FOnNotInList};
	__property Dbgrideh::TCheckTitleEhBtnEvent OnDropDownBoxCheckButton = {read=GetOnDropDownBoxCheckButton, write=SetOnDropDownBoxCheckButton};
	__property Dbgrideh::TDrawColumnEhCellEvent OnDropDownBoxDrawColumnCell = {read=GetOnDropDownBoxDrawColumnCell, write=SetOnDropDownBoxDrawColumnCell};
	__property Dbgrideh::TGetCellEhParamsEvent OnDropDownBoxGetCellParams = {read=GetOnDropDownBoxGetCellParams, write=SetOnDropDownBoxGetCellParams};
	__property Classes::TNotifyEvent OnDropDownBoxSortMarkingChanged = {read=GetOnDropDownBoxSortMarkingChanged, write=SetOnDropDownBoxSortMarkingChanged};
	__property Dbgrideh::TTitleEhClickEvent OnDropDownBoxTitleBtnClick = {read=GetOnDropDownBoxTitleBtnClick, write=SetOnDropDownBoxTitleBtnClick};
public:
	/* TWinControl.CreateParented */ inline __fastcall TCustomDBLookupComboboxEh(HWND ParentWindow) : Dbctrlseh::TCustomDBEditEh(ParentWindow) { }
	
private:
	void *__ILookupGridOwner;	/* Dbgrideh::ILookupGridOwner */
	
public:
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Dbgrideh::_di_ILookupGridOwner()
	{
		Dbgrideh::_di_ILookupGridOwner intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator ILookupGridOwner*(void) { return (ILookupGridOwner*)&__ILookupGridOwner; }
	#endif
	
};


class DELPHICLASS TDBLookupComboboxEh;
class PASCALIMPLEMENTATION TDBLookupComboboxEh : public TCustomDBLookupComboboxEh
{
	typedef TCustomDBLookupComboboxEh inherited;
	
__published:
	__property Alignment;
	__property AlwaysShowBorder = {default=0};
	__property AutoSelect = {default=1};
	__property AutoSize = {default=1};
	__property BorderStyle = {default=1};
	__property Anchors = {default=3};
	__property BiDiMode;
	__property Constraints;
	__property DragKind = {default=0};
	__property Images;
	__property ParentBiDiMode = {default=1};
	__property OnEndDock;
	__property OnStartDock;
	__property Color = {default=-16777211};
	__property Ctl3D;
	__property DataField;
	__property DataSource;
	__property DragCursor = {default=-12};
	__property DragMode = {default=0};
	__property DropDownBox;
	__property Enabled = {default=1};
	__property EditButton;
	__property EditButtons;
	__property Font;
	__property Flat = {default=0};
	__property HighlightRequired = {default=0};
	__property ImeMode = {default=3};
	__property ImeName;
	__property KeyField;
	__property ListField;
	__property ListFieldIndex = {default=0};
	__property ListSource;
	__property ParentColor = {default=0};
	__property ParentCtl3D = {default=1};
	__property ParentFont = {default=1};
	__property ParentShowHint = {default=1};
	__property PopupMenu;
	__property ReadOnly = {default=0};
	__property ShowHint = {default=0};
	__property Style = {default=0};
	__property TabOrder = {default=-1};
	__property TabStop = {default=1};
	__property Tooltips = {default=0};
	__property Visible;
	__property WordWrap = {default=0};
	__property OnButtonClick;
	__property OnButtonDown;
	__property OnChange;
	__property OnClick;
	__property OnCloseUp;
	__property OnCheckDrawRequiredState;
	__property OnContextPopup;
	__property OnDblClick;
	__property OnDragDrop;
	__property OnDragOver;
	__property OnDropDown;
	__property OnDropDownBoxCheckButton;
	__property OnDropDownBoxDrawColumnCell;
	__property OnDropDownBoxGetCellParams;
	__property OnDropDownBoxSortMarkingChanged;
	__property OnDropDownBoxTitleBtnClick;
	__property OnEndDrag;
	__property OnEnter;
	__property OnExit;
	__property OnGetImageIndex;
	__property OnKeyDown;
	__property OnKeyPress;
	__property OnKeyUp;
	__property OnKeyValueChanged;
	__property OnMouseDown;
	__property OnMouseMove;
	__property OnMouseUp;
	__property OnNotInList;
	__property OnUpdateData;
	__property OnStartDrag;
public:
	/* TCustomDBLookupComboboxEh.Create */ inline __fastcall virtual TDBLookupComboboxEh(Classes::TComponent* AOwner) : TCustomDBLookupComboboxEh(AOwner) { }
	/* TCustomDBLookupComboboxEh.Destroy */ inline __fastcall virtual ~TDBLookupComboboxEh(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TDBLookupComboboxEh(HWND ParentWindow) : TCustomDBLookupComboboxEh(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Dblookupeh */
using namespace Dblookupeh;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// DblookupehHPP
