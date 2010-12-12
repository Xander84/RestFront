// CodeGear C++Builder
// Copyright (c) 1995, 2009 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Designconnectionlisteh.pas' rev: 21.00

#ifndef DesignconnectionlistehHPP
#define DesignconnectionlistehHPP

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
#include <Stdctrls.hpp>	// Pascal unit
#include <Db.hpp>	// Pascal unit
#include <Memtableeh.hpp>	// Pascal unit
#include <Extctrls.hpp>	// Pascal unit
#include <Dbgrideh.hpp>	// Pascal unit
#include <Sqldriverediteh.hpp>	// Pascal unit
#include <Ehlibvcl.hpp>	// Pascal unit
#include <Variants.hpp>	// Pascal unit
#include <Gridseh.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Designconnectionlisteh
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TfDesignConnectionListEh;
class PASCALIMPLEMENTATION TfDesignConnectionListEh : public Forms::TForm
{
	typedef Forms::TForm inherited;
	
__published:
	Dbgrideh::TDBGridEh* DBGridEh1;
	Extctrls::TPanel* Panel1;
	Db::TDataSource* DataSource1;
	Memtableeh::TMemTableEh* MemTableEh1;
	Db::TStringField* MemTableEh1ConnectionName;
	Db::TStringField* MemTableEh1Engine;
	Db::TStringField* MemTableEh1ServerType;
	Db::TBooleanField* MemTableEh1Connected;
	Stdctrls::TButton* bSelect;
	Stdctrls::TButton* bNew;
	Stdctrls::TButton* bDelete;
	Stdctrls::TButton* bCancel;
	Stdctrls::TButton* bEdit;
	Memtableeh::TRefObjectField* MemTableEh1RefObject;
	void __fastcall bEditClick(System::TObject* Sender);
	void __fastcall DataSource1DataChange(System::TObject* Sender, Db::TField* Field);
	void __fastcall bNewClick(System::TObject* Sender);
	void __fastcall bDeleteClick(System::TObject* Sender);
	void __fastcall bSelectClick(System::TObject* Sender);
	
public:
	System::TObject* FDesignDataBase;
	void __fastcall PrepareList(Classes::TList* DesignDataBaseList);
	Sqldriverediteh::TDesignDataBaseEh* __fastcall CurrentDesignDataBase(void);
public:
	/* TCustomForm.Create */ inline __fastcall virtual TfDesignConnectionListEh(Classes::TComponent* AOwner) : Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TfDesignConnectionListEh(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TfDesignConnectionListEh(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TfDesignConnectionListEh(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE TfDesignConnectionListEh* fDesignConnectionListEh;
extern PACKAGE Sqldriverediteh::TDesignDataBaseEh* __fastcall SelectDesignConnectionListEh(Classes::TList* DesignDataBaseList);

}	/* namespace Designconnectionlisteh */
using namespace Designconnectionlisteh;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// DesignconnectionlistehHPP
