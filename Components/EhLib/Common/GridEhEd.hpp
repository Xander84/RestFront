// CodeGear C++Builder
// Copyright (c) 1995, 2009 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Gridehed.pas' rev: 21.00

#ifndef GridehedHPP
#define GridehedHPP

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
#include <Colnedit.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <Designeditors.hpp>	// Pascal unit
#include <Designintf.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Imglist.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Actnlist.hpp>	// Pascal unit
#include <Extctrls.hpp>	// Pascal unit
#include <Comctrls.hpp>	// Pascal unit
#include <Dbgrideh.hpp>	// Pascal unit
#include <Dblookupeh.hpp>	// Pascal unit
#include <Ehlibvcl.hpp>	// Pascal unit
#include <Toolwin.hpp>	// Pascal unit
#include <Toolctrlseh.hpp>	// Pascal unit
#include <Gridseh.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Toolwnds.hpp>	// Pascal unit
#include <Designwindows.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Gridehed
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TDBGridEhColumnsEditor;
class PASCALIMPLEMENTATION TDBGridEhColumnsEditor : public Colnedit::TCollectionEditor
{
	typedef Colnedit::TCollectionEditor inherited;
	
__published:
	Menus::TMenuItem* N1;
	Menus::TMenuItem* AddAllFields1;
	Menus::TMenuItem* RestoreDefaults1;
	Comctrls::TToolButton* ToolButton6;
	Comctrls::TToolButton* ToolButton7;
	Comctrls::TToolButton* ToolButton8;
	Actnlist::TAction* AddAllFieldsCmd;
	Actnlist::TAction* RestoreDefaultsCmd;
	void __fastcall AddAllFieldsCmdExecute(System::TObject* Sender);
	void __fastcall RestoreDefaultsCmdExecute(System::TObject* Sender);
	void __fastcall AddAllFieldsCmdUpdate(System::TObject* Sender);
	void __fastcall RestoreDefaultsCmdUpdate(System::TObject* Sender);
	
protected:
	virtual bool __fastcall CanAdd(int Index);
public:
	/* TDesignWindow.Create */ inline __fastcall virtual TDBGridEhColumnsEditor(Classes::TComponent* AOwner) : Colnedit::TCollectionEditor(AOwner) { }
	/* TDesignWindow.Destroy */ inline __fastcall virtual ~TDBGridEhColumnsEditor(void) { }
	
public:
	/* TCustomForm.CreateNew */ inline __fastcall virtual TDBGridEhColumnsEditor(Classes::TComponent* AOwner, int Dummy) : Colnedit::TCollectionEditor(AOwner, Dummy) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TDBGridEhColumnsEditor(HWND ParentWindow) : Colnedit::TCollectionEditor(ParentWindow) { }
	
};


class DELPHICLASS TDBGridEhColumnsProperty;
class PASCALIMPLEMENTATION TDBGridEhColumnsProperty : public Designeditors::TPropertyEditor
{
	typedef Designeditors::TPropertyEditor inherited;
	
public:
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
	virtual System::UnicodeString __fastcall GetValue(void);
	virtual void __fastcall Edit(void);
public:
	/* TPropertyEditor.Create */ inline __fastcall virtual TDBGridEhColumnsProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TPropertyEditor(ADesigner, APropCount) { }
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TDBGridEhColumnsProperty(void) { }
	
};


class DELPHICLASS TDBGridEhEditor;
class PASCALIMPLEMENTATION TDBGridEhEditor : public Designeditors::TComponentEditor
{
	typedef Designeditors::TComponentEditor inherited;
	
public:
	virtual void __fastcall ExecuteVerb(int Index);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual int __fastcall GetVerbCount(void);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TDBGridEhEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : Designeditors::TComponentEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TDBGridEhEditor(void) { }
	
};


class DELPHICLASS TDBGridEhFieldProperty;
class PASCALIMPLEMENTATION TDBGridEhFieldProperty : public Designeditors::TStringProperty
{
	typedef Designeditors::TStringProperty inherited;
	
public:
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
	virtual void __fastcall GetValueList(Classes::TStrings* List);
	virtual void __fastcall GetValues(Classes::TGetStrProc Proc);
public:
	/* TPropertyEditor.Create */ inline __fastcall virtual TDBGridEhFieldProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TStringProperty(ADesigner, APropCount) { }
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TDBGridEhFieldProperty(void) { }
	
};


class DELPHICLASS TDBGridEhFieldAggProperty;
class PASCALIMPLEMENTATION TDBGridEhFieldAggProperty : public TDBGridEhFieldProperty
{
	typedef TDBGridEhFieldProperty inherited;
	
public:
	virtual void __fastcall GetValueList(Classes::TStrings* List);
public:
	/* TPropertyEditor.Create */ inline __fastcall virtual TDBGridEhFieldAggProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : TDBGridEhFieldProperty(ADesigner, APropCount) { }
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TDBGridEhFieldAggProperty(void) { }
	
};


class DELPHICLASS TDBLookupComboboxEhEditor;
class PASCALIMPLEMENTATION TDBLookupComboboxEhEditor : public Designeditors::TComponentEditor
{
	typedef Designeditors::TComponentEditor inherited;
	
public:
	virtual void __fastcall ExecuteVerb(int Index);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual int __fastcall GetVerbCount(void);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TDBLookupComboboxEhEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : Designeditors::TComponentEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TDBLookupComboboxEhEditor(void) { }
	
};


class DELPHICLASS TDBGridEhDesignControler;
class PASCALIMPLEMENTATION TDBGridEhDesignControler : public Toolctrlseh::TDesignControlerEh
{
	typedef Toolctrlseh::TDesignControlerEh inherited;
	
private:
	Classes::TList* FGridList;
	
protected:
	void __fastcall ItemDeleted(const Designintf::_di_IDesigner ADesigner, Classes::TPersistent* AItem);
	void __fastcall ItemInserted(const Designintf::_di_IDesigner ADesigner, Classes::TPersistent* AItem);
	void __fastcall ItemsModified(const Designintf::_di_IDesigner ADesigner);
	void __fastcall SelectionChanged(const Designintf::_di_IDesigner ADesigner, const Designintf::_di_IDesignerSelections ASelection);
	void __fastcall DesignerOpened(const Designintf::_di_IDesigner ADesigner, bool AResurrecting);
	void __fastcall DesignerClosed(const Designintf::_di_IDesigner ADesigner, bool AGoingDormant);
	
public:
	__fastcall TDBGridEhDesignControler(void);
	__fastcall virtual ~TDBGridEhDesignControler(void);
	virtual bool __fastcall IsDesignHitTest(Classes::TPersistent* Control, int X, int Y, Classes::TShiftState AShift);
	virtual bool __fastcall ControlIsObjInspSelected(Classes::TPersistent* Control);
	virtual Classes::TPersistent* __fastcall GetObjInspSelectedControl(Classes::TPersistent* BaseControl);
	virtual void __fastcall DesignMouseDown(Classes::TPersistent* Control, int X, int Y, Classes::TShiftState AShift);
	virtual void __fastcall RegisterChangeSelectedNotification(Classes::TPersistent* Control);
	virtual void __fastcall UnregisterChangeSelectedNotification(Classes::TPersistent* Control);
private:
	void *__IDesignNotification;	/* Designintf::IDesignNotification */
	
public:
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Designintf::_di_IDesignNotification()
	{
		Designintf::_di_IDesignNotification intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IDesignNotification*(void) { return (IDesignNotification*)&__IDesignNotification; }
	#endif
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE TDBGridEhColumnsEditor* DBGridEhColumnsEditor;

}	/* namespace Gridehed */
using namespace Gridehed;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// GridehedHPP
