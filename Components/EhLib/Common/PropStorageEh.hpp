// CodeGear C++Builder
// Copyright (c) 1995, 2009 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Propstorageeh.pas' rev: 21.00

#ifndef PropstorageehHPP
#define PropstorageehHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <Sysinit.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Registry.hpp>	// Pascal unit
#include <Propfilereh.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Sysutils.hpp>	// Pascal unit
#include <Ehlibvcl.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Inifiles.hpp>	// Pascal unit
#include <Typinfo.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Propstorageeh
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TPropStorageManagerEh;
class DELPHICLASS TPropStorageEh;
class PASCALIMPLEMENTATION TPropStorageManagerEh : public Classes::TComponent
{
	typedef Classes::TComponent inherited;
	
private:
	bool FWriteAsText;
	
protected:
	__property bool WriteAsText = {read=FWriteAsText, write=FWriteAsText, default=1};
	
public:
	__fastcall virtual TPropStorageManagerEh(Classes::TComponent* AOwner);
	virtual void __fastcall ReadProperties(TPropStorageEh* PropStorage);
	virtual void __fastcall ReadPropertiesStream(Classes::TStream* Stream, TPropStorageEh* PropStorage);
	virtual void __fastcall WriteProperties(TPropStorageEh* PropStorage);
	virtual void __fastcall WritePropertiesStream(TPropStorageEh* PropStorage, Classes::TStream* Stream);
	virtual void __fastcall WritePropertiesText(TPropStorageEh* PropStorage, System::UnicodeString Text);
public:
	/* TComponent.Destroy */ inline __fastcall virtual ~TPropStorageManagerEh(void) { }
	
};


class DELPHICLASS TIniPropStorageManEh;
class PASCALIMPLEMENTATION TIniPropStorageManEh : public TPropStorageManagerEh
{
	typedef TPropStorageManagerEh inherited;
	
private:
	System::UnicodeString FIniFileName;
	
public:
	virtual void __fastcall ReadProperties(TPropStorageEh* PropStorage);
	virtual void __fastcall WritePropertiesStream(TPropStorageEh* PropStorage, Classes::TStream* Stream);
	virtual void __fastcall WritePropertiesText(TPropStorageEh* PropStorage, System::UnicodeString Text);
	
__published:
	__property System::UnicodeString IniFileName = {read=FIniFileName, write=FIniFileName};
	__property WriteAsText = {default=1};
public:
	/* TPropStorageManagerEh.Create */ inline __fastcall virtual TIniPropStorageManEh(Classes::TComponent* AOwner) : TPropStorageManagerEh(AOwner) { }
	
public:
	/* TComponent.Destroy */ inline __fastcall virtual ~TIniPropStorageManEh(void) { }
	
};


#pragma option push -b-
enum TRegistryKeyEh { rkClassesRootEh, rkCurrentUserEh, rkLocalMachineEh, rkUsersEh, rkPerformanceDataEh, rkCurrentConfigEh, rkDynDataEh, rkCustomRegistryKeyEh };
#pragma option pop

class DELPHICLASS TRegPropStorageManEh;
class PASCALIMPLEMENTATION TRegPropStorageManEh : public TPropStorageManagerEh
{
	typedef TPropStorageManagerEh inherited;
	
private:
	HKEY FKey;
	System::UnicodeString FPath;
	TRegistryKeyEh FRegistryKey;
	void __fastcall SerRegistryKey(const TRegistryKeyEh Value);
	void __fastcall SetKey(const HKEY Value);
	void __fastcall ReadPropertiesOld(TPropStorageEh* PropStorage);
	
public:
	__fastcall virtual TRegPropStorageManEh(Classes::TComponent* AOwner);
	__fastcall virtual ~TRegPropStorageManEh(void);
	virtual void __fastcall ReadProperties(TPropStorageEh* PropStorage);
	virtual void __fastcall WritePropertiesStream(TPropStorageEh* PropStorage, Classes::TStream* Stream);
	virtual void __fastcall WritePropertiesText(TPropStorageEh* PropStorage, System::UnicodeString Text);
	__property HKEY Key = {read=FKey, write=SetKey, default=-2147483647};
	
__published:
	__property TRegistryKeyEh RegistryKey = {read=FRegistryKey, write=SerRegistryKey, default=1};
	__property System::UnicodeString Path = {read=FPath, write=FPath};
	__property WriteAsText = {default=1};
};


typedef void __fastcall (__closure *TWriteCustomPropsEventEh)(System::TObject* Sender, Propfilereh::TPropWriterEh* Writer);

typedef void __fastcall (__closure *TReadPropEventEh)(System::TObject* Sender, Propfilereh::TPropReaderEh* Reader, System::UnicodeString PropName, bool &Processed);

class DELPHICLASS TPropertyNamesEh;
class PASCALIMPLEMENTATION TPropStorageEh : public Classes::TComponent
{
	typedef Classes::TComponent inherited;
	
private:
	bool FActive;
	Classes::TNotifyEvent FAfterLoadProps;
	Classes::TNotifyEvent FAfterSaveProps;
	Classes::TNotifyEvent FBeforeLoadProps;
	Classes::TNotifyEvent FBeforeSaveProps;
	bool FDestroying;
	TReadPropEventEh FOnReadProp;
	TWriteCustomPropsEventEh FOnWriteCustomProps;
	Classes::TNotifyEvent FOnSavePlacement;
	bool FSaved;
	Forms::TCloseQueryEvent FSaveFormCloseQuery;
	Classes::TNotifyEvent FSaveFormDestroy;
	Classes::TNotifyEvent FSaveFormShow;
	System::UnicodeString FSection;
	TPropStorageManagerEh* FStorageManager;
	TPropertyNamesEh* FStoredProps;
	Forms::TForm* __fastcall GetForm(void);
	System::UnicodeString __fastcall GetSection(void);
	void __fastcall FormCloseQuery(System::TObject* Sender, bool &CanClose);
	void __fastcall FormDestroy(System::TObject* Sender);
	void __fastcall FormShow(System::TObject* Sender);
	void __fastcall RestoreEvents(void);
	void __fastcall SetEvents(void);
	void __fastcall SetSection(const System::UnicodeString Value);
	void __fastcall SetStorageManager(const TPropStorageManagerEh* Value);
	void __fastcall SetStoredProps(const TPropertyNamesEh* Value);
	
protected:
	virtual void __fastcall Loaded(void);
	DYNAMIC void __fastcall Save(void);
	__property Forms::TForm* Form = {read=GetForm};
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	void __fastcall ReadProp(Propfilereh::TPropReaderEh* Reader, System::UnicodeString PropName, bool &Processed);
	void __fastcall WriteCustomProps(Propfilereh::TPropWriterEh* Writer);
	
public:
	__fastcall virtual TPropStorageEh(Classes::TComponent* AOwner);
	__fastcall virtual ~TPropStorageEh(void);
	void __fastcall LoadProperties(void);
	void __fastcall ReadPropValues(Classes::TStream* Stream);
	void __fastcall SaveProperties(void);
	void __fastcall WritePropValues(Classes::TStream* Stream);
	
__published:
	__property bool Active = {read=FActive, write=FActive, default=1};
	__property System::UnicodeString Section = {read=GetSection, write=SetSection};
	__property TPropStorageManagerEh* StorageManager = {read=FStorageManager, write=SetStorageManager};
	__property TPropertyNamesEh* StoredProps = {read=FStoredProps, write=SetStoredProps};
	__property Classes::TNotifyEvent AfterLoadProps = {read=FAfterLoadProps, write=FAfterLoadProps};
	__property Classes::TNotifyEvent AfterSaveProps = {read=FAfterSaveProps, write=FAfterSaveProps};
	__property Classes::TNotifyEvent BeforeLoadProps = {read=FBeforeLoadProps, write=FBeforeLoadProps};
	__property Classes::TNotifyEvent BeforeSaveProps = {read=FBeforeSaveProps, write=FBeforeSaveProps};
	__property TWriteCustomPropsEventEh OnWriteCustomProps = {read=FOnWriteCustomProps, write=FOnWriteCustomProps};
	__property TReadPropEventEh OnReadProp = {read=FOnReadProp, write=FOnReadProp};
};


class PASCALIMPLEMENTATION TPropertyNamesEh : public Classes::TStringList
{
	typedef Classes::TStringList inherited;
	
private:
	Classes::TComponent* FRoot;
	void __fastcall SetRoot(const Classes::TComponent* Value);
	
protected:
	virtual int __fastcall CompareStrings(const System::UnicodeString S1, const System::UnicodeString S2);
	bool __fastcall CheckPropertyPath(System::UnicodeString Path);
	bool __fastcall CheckObjectPropertyPath(System::TObject* Instance, System::UnicodeString PropPath);
	void __fastcall CheckPropertyNames(void);
	
public:
	virtual int __fastcall Add(const System::UnicodeString S);
	__property Classes::TComponent* Root = {read=FRoot, write=SetRoot};
public:
	/* TStringList.Create */ inline __fastcall TPropertyNamesEh(void)/* overload */ : Classes::TStringList() { }
	/* TStringList.Destroy */ inline __fastcall virtual ~TPropertyNamesEh(void) { }
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE void __fastcall GetDefinePropertyList(Classes::TPersistent* AObject, Classes::TStrings* sl);
extern PACKAGE TPropStorageManagerEh* __fastcall DefaultPropStorageManager(void);
extern PACKAGE TPropStorageManagerEh* __fastcall SetDefaultPropStorageManager(TPropStorageManagerEh* NewStorageManager);
extern PACKAGE bool __fastcall RegistryKeyToIdent(int RootKey, System::UnicodeString &Ident);
extern PACKAGE bool __fastcall IdentToRegistryKey(const System::UnicodeString Ident, int &RootKey);
extern PACKAGE void __fastcall GetRegistryKeyValues(Classes::TGetStrProc Proc);

}	/* namespace Propstorageeh */
using namespace Propstorageeh;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// PropstorageehHPP
