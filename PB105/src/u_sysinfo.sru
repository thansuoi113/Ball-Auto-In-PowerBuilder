$PBExportHeader$u_sysinfo.sru
forward
global type u_sysinfo from userobject
end type
type ole_2 from olecustomcontrol within u_sysinfo
end type
type ole_1 from olecustomcontrol within u_sysinfo
end type
type lb_1 from listbox within u_sysinfo
end type
type ws_info from structure within u_sysinfo
end type
type ws_memory from structure within u_sysinfo
end type
type ws_cpuinfo from structure within u_sysinfo
end type
end forward

type ws_info from structure
	unsignedlong		dwoemid
	unsignedlong		dwpagesize
	unsignedlong		lpminappaddress
	unsignedlong		lpmaxappaddress
	unsignedlong		dwactiveprocessormask
	unsignedlong		dwnumberofprocessors
	unsignedlong		dwprocessortype
	unsignedlong		dwallocationgranularity
	unsignedlong		dwreserved
end type

type ws_memory from structure
	long		dlength
	long		dmemoryload
	long		dtotalphys
	long		davailphys
	long		dtotalpagefile
	long		davailpagefile
	long		dtotalvirtual
	long		davailvirtual
end type

type ws_cpuinfo from structure
	string		cpuid
	string		cpuprovider
end type

global type u_sysinfo from userobject
integer width = 142
integer height = 116
boolean border = true
long backcolor = 67108864
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
ole_2 ole_2
ole_1 ole_1
lb_1 lb_1
end type
global u_sysinfo u_sysinfo

type prototypes
Public Function ULong GetComputerName(Ref String lpBuffer,Ref ULong nSize) Library "kernel32.dll" Alias For "GetComputerNameA;Ansi"
Public Function ULong GetDriveType(String nDrive) Library "kernel32.dll" Alias For "GetDriveTypeA;Ansi"
Function ULong GetDiskFreeSpace(Ref String lpRootPathName,Ref ULong  lpSectorsPerCluster,Ref ULong lpBytesPerSector,Ref ULong  lpNumberOfFreeClusters,Ref ULong lpTtoalNumberOfClusters) Library "kernel32.dll" Alias For "GetDiskFreeSpaceA;Ansi"
Public Function ULong GetTickCount() Library "kernel32.dll"
Public Subroutine GetSystemInfo(Ref ws_info lpSystemInfo) Library "kernel32.dll" Alias For "GetSystemInfo;Ansi"
Public Function ULong waveOutGetNumDevs() Library "winmm.dll"
Public Function ULong WNetGetUser(Ref String lpName,Ref String lpUserName,Ref ULong lpnLength) Library "mpr" Alias For "WNetGetUserA;Ansi"
Public Function ULong GetSystemMetrics(ULong nIndex) Library "user32.dll"
Public Function ULong GetWindowsDirectory(Ref String lpBuffer,ULong nSize) Library "kernel32.dll" Alias For "GetWindowsDirectoryA;Ansi"
Public Function ULong GetSystemDirectory(Ref String lpBuffer,ULong nSize) Library "kernel32.dll" Alias For "GetSystemDirectoryA;Ansi"
Public Function ULong GetTempPath(ULong nBufferLength,Ref String lpBuffer) Library "kernel32.dll" Alias For "GetTempPathA;Ansi"
Public Function ULong GetKeyboardType(ULong nTypeFlag) Library "user32.dll"
Public Function ULong QueryPerformanceFrequency(Ref Double lpFrequency) Library "kernel32.dll"
Public Function ULong QueryPerformanceCounter(Ref ULong lpPerformanceCount) Library "kernel32.dll"

//PUBLIC FUNCTION ulong EnumPrinterDrivers(ref string pName,ref string pEnvironment,ulong Level,ref Byte pDriverInfo,ulong cdBuf,ref ulong pcbNeeded,ref ulong pcRetruned) LIBRARY "winspool.drv" ALIAS FOR "EnumPrinterDriversA"
Public Subroutine GlobalMemoryStatus(Ref ws_memory lpBuffer) Library "kernel32.dll" Alias For "GlobalMemoryStatus;Ansi"
//FUNCTIONon ulong GlobalReAlloc(ulong hMem,ulong dwBytes,ulong wFlags) LIBRARY "kernel32.dll"
Public Function ULong RegOpenKey(ULong hKey,Ref String lpSubKey,Ref ULong phkResult) Library "advapi32.dll" Alias For "RegOpenKeyA;Ansi"
Public Function ULong RegCloseKey(ULong hKey) Library "advapi32.dll"
Public Function ULong RegQueryValueEx(ULong hKey,Ref String lpValueName,ULong lpReserved,Ref ULong lpType,Ref Long lpData,Ref ULong lpcbData) Library "advapi32.dll" Alias For "RegQueryValueExA;Ansi"
Function ULong EnumDisplaySettingsA(ULong xx,ULong modenum,Ref DEVMODE lpdevmode)Library"kernel32.dll" Alias For "EnumDisplaySettingsA;Ansi"
Public Function ULong DeviceCapabilities(Ref String lpDeviceName,Ref String lpPort,ULong iIndex,Ref String lpOutput,Ref DEVMODE lpdevmode) Library "winspool.drv" Alias For "DeviceCapabilitiesA;Ansi"
Public Function ULong GetVolumeInformation(String lpRootPathName,Ref String lpVolumeNameBuffer,ULong nVolumeNameSize,Ref ULong lpVolumeSerialNumber,Ref ULong lpMaximumComponentLength,Ref ULong lpFileSystemFlags,Ref String lpFileSystemNameBuffer,ULong nFileSystemNameSize) Library "kernel32.dll" Alias For "GetVolumeInformationA;Ansi"
//
Function Long GetMACAddress(Long lana,Ref Long addr[6]) Library "utils.dll"
Function Long GetLanaID(Ref Long lana[254]) Library "utils.dll"
Function ULong GetMHZ()Library"mydll.dll"

end prototypes

type variables
Public:
String cpuid,cpuprovider
String filesystem,volumename
ULong VolumeSerialNumber,MaxComponentLength,FileSystemFlags
Long dlength,dmemoryload,dtotalphys,davailphys,dtotalpagefile,davailpagefile,dtotalvirtual,davailvirtual
ULong dwoemid,dwpagesize,lpminappaddress,lpmaxappaddress,dwactiveprocessormask,dwnumberofprocessors,dwprocessortype,dwallocationgranularity,dwreserved
ULong sectorspercluster,bytespersector,numberoffreeclusters,totalnumberofclusters
ULong mbtotal,mbfree

end variables

forward prototypes
public function string of_computername ()
public function ws_info of_getsysteminfo ()
public function string of_gettickcount ()
public function integer of_getwavedevice ()
public function string of_getloginid ()
public function string of_getwindowmode ()
public function string of_getwindowdir ()
public function string of_getsystemdir ()
public function string of_gettemppath ()
public function long of_getcpustatus ()
public function string of_getosversion ()
public function string of_getservicepack ()
public subroutine of_getcpuinfo ()
public function string of_getdrivetype (string a_drivename)
public subroutine of_getvolumeinfo (string as_drive)
public function string of_getmacaddress ()
public function string of_getipaddress ()
public subroutine of_getmemory ()
public function unsignedlong of_getmhz ()
public function integer of_getkeyboardtype ()
public function string of_getnetcard ()
public subroutine of_getdiskvolume (string as_driver)
end prototypes

public function string of_computername ();ULong ll_comsize
ULong ll_flag
String ls_computerName

ll_comsize = 256
ll_flag = GetComputerName(ls_computerName,ll_comsize)
If ll_flag <> 1 Then
	Return "Get Computer Failure"
Else
	Return ls_computerName
End If

end function

public function ws_info of_getsysteminfo ();ws_info lstr_1
GetSystemInfo(lstr_1)

dwoemid = lstr_1.dwoemid
dwpagesize = lstr_1.dwpagesize
lpminappaddress = lstr_1.lpminappaddress
lpmaxappaddress = lstr_1.lpmaxappaddress
dwactiveprocessormask = lstr_1.dwactiveprocessormask
dwnumberofprocessors = lstr_1.dwnumberofprocessors
dwprocessortype = lstr_1.dwprocessortype
dwallocationgranularity = lstr_1.dwallocationgranularity
dwreserved = lstr_1.dwreserved

Return lstr_1

end function

public function string of_gettickcount ();ULong lul_runtime
Integer li_Hour,li_Minute,li_Second
String ls_rtn

lul_runtime = GetTickCount()
li_Hour = (lul_runtime/1000)/3600
li_Minute = (lul_runtime/1000 - 3600*li_Hour)/60
li_Second = lul_runtime/1000 - 3600*li_Hour - li_Minute*60
ls_rtn = String(li_Hour)+" H "+String(li_Minute)+" M "+String(li_Second)+" S"
Return ls_rtn


end function

public function integer of_getwavedevice ();Integer ll_length

ll_length = waveOutGetNumDevs()
If ll_length > 0 Then
	Return ll_length
Else
	Return 0
End If

end function

public function string of_getloginid ();String ls_username,ls_cmpname
ULong ll_length,lul_runtime

ls_cmpname = ""
ls_username = Space(64)
ll_length = 64

lul_runtime = WNetGetUser(ls_cmpname,ls_username,ll_length)
If lul_runtime = 0 Then
	Return ls_username
Else
	Return "Error"
End If

end function

public function string of_getwindowmode ();ULong ll_length

ll_length = GetSystemMetrics(67)
Choose Case ll_length
	Case 1
		Return "Safe Mode"
	Case 2
		Return "Safe Mode With NetSupport"
	Case Else
		Return "Normal Mode"
End Choose


end function

public function string of_getwindowdir ();ULong ll_length
String ls_username

ll_length = 64
ls_username = Space(64)
GetWindowsDirectory(ls_username,ll_length)
Return Trim(ls_username)

end function

public function string of_getsystemdir ();ULong ll_length
String ls_username

ll_length = 64
ls_username = Space(64)
GetSystemDirectory(ls_username,ll_length)
Return Trim(ls_username)

end function

public function string of_gettemppath ();ULong ll_length
String ls_username

ll_length = 64
ls_username = Space(64)
GetTempPath(ll_length,ls_username)
Return Trim(ls_username)

end function

public function long of_getcpustatus ();ULong ls_username,lpcbData,lpType
ULong phkResult
String lbSubkey
Long lpData
String lpValueName

lpcbData = 4
lpType = 4
ls_username = 0
lbSubkey = "PerfStats\StatData"
ls_username =  RegOpenKey(16*16*16*16*16*16*16*8+6,lbSubkey,phkResult) //The first parameters is HKEY_DYN_DATA = &80000006(HANDLE)
lpValueName = "KERNEL\CPUUsage"
ls_username = RegQueryValueEx(phkResult,lpValueName,0,lpType,lpData,lpcbData)
ls_username = RegCloseKey(phkResult)
Return lpData

end function

public function string of_getosversion ();Environment l_env
GetEnvironment(l_env)
String ls_osver

Choose Case l_env.OSType
	Case Macintosh!
		ls_osver = "Macintosh "+String(l_env.OSMajorRevision)+"."+String(l_env.OSMinorRevision)
	Case aix!
		ls_osver = "Aix "+String(l_env.OSMajorRevision)+"."+String(l_env.OSMinorRevision)
	Case Windows!
		If l_env.OSMajorRevision >= 4 And l_env.OSMinorRevision > 0 Then
			ls_osver = "Windows 98"
		Else
			ls_osver = "Windows 95"
		End If
	Case WindowsNT!
		RegistryGet("HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\ProductOptions","ProductType",RegString!,ls_osver)
		If ls_osver = "WinNT" Then
			ls_osver = "Windows NT WorkStation"
		ElseIf ls_osver = "ServerNT" Then
			ls_osver = "Windows NT Server"
		Else
			ls_osver = "Windows NT Domain Controler"
		End If
	Case Else
		ls_osver = "Unknown OS"
End Choose
Return ls_osver

end function

public function string of_getservicepack ();String ls_username
Long ll_rtn

ll_rtn = RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion","CSDVersion",RegString!,ls_username)
If ll_rtn = -1 Then
	ls_username = "ERROR"
End If
Return ls_username

end function

public subroutine of_getcpuinfo ();ws_cpuinfo lstr_cpu
String ls_temp

RegistryGet("HKEY_LOCAL_MACHINE\Hardware\Description\System\CentralProcessor\0","Identifier",RegString!,ls_temp)
lstr_cpu.cpuid = ls_temp
cpuid = ls_temp
RegistryGet("HKEY_LOCAL_MACHINE\Hardware\Description\System\CentralProcessor\0","VendorIdentifier",RegString!,ls_temp)
lstr_cpu.cpuprovider = ls_temp
cpuprovider = ls_temp

end subroutine

public function string of_getdrivetype (string a_drivename);ULong ul_drivetype
String ls_drive

ul_drivetype = GetDriveType(a_drivename)
Choose Case ul_drivetype
	Case	0
		ls_drive = "Unknown Driver"
	Case 1
		ls_drive = "Drive Does Not exist"
	Case 2
		ls_drive = "Floppy driver"
	Case 3
		ls_drive = "HardDisk driver"
	Case 4
		ls_drive = "Network driver"
	Case 5
		ls_drive = "CD-ROM driver"
	Case 6
		ls_drive = "RAM driver"
End Choose
Return ls_drive


end function

public subroutine of_getvolumeinfo (string as_drive);String lpVolumeNameBuffer
String lpFileSystemNameBuffer
ULong nVolumeNameSize
ULong lpVolumeSerialNumber
ULong lpMaximumComponentLength
ULong lpFileSystemFlags
ULong nFileSystemNameSize

lpVolumeNameBuffer = Space(64)
lpFileSystemNameBuffer = Space(64)
nVolumeNameSize = Len(lpVolumeNameBuffer)
nFileSystemNameSize = Len(lpFileSystemNameBuffer)

GetVolumeInformation(as_drive,lpVolumeNameBuffer,nVolumeNameSize, lpVolumeSerialNumber,lpMaximumComponentLength,lpFileSystemFlags,lpFileSystemNameBuffer,nFileSystemNameSize)

FileSystem = lpFileSystemNameBuffer
VolumeName = lpVolumeNameBuffer
VolumeSerialNumber = lpVolumeSerialNumber
MaxComponentLength = lpMaximumComponentLength
FileSystemFlags = lpFileSystemFlags


end subroutine

public function string of_getmacaddress ();Long lana[254],ll_lananum,mac[6]
Long i,j
String ls_macaddress[254]
String ls_return

If Not FileExists("utils.dll") Then
	MessageBox("error","cannot find utils.dll file")
	Return ""
End If

j = 1
ll_lananum = GetLanaID(lana)
For i = 1 To ll_lananum
	If GetMacAddress(lana[i],mac) = 0 Then
		ls_macaddress[j] = 	String(mac[1])+"," +String(mac[2])+"," +  String(mac[3])+"," + String(mac[4])+"," + String(mac[5])+"," + String(mac[6])
		j++
	End If
Next

For i = 1 To j
	If ls_macaddress[i] = "" Then Exit
	ls_return = ls_return+ls_macaddress[i]+"|"
Next
Return ls_return

end function

public function string of_getipaddress ();Return ole_1.Object.localip

end function

public subroutine of_getmemory ();ws_memory str_memory

GlobalMemoryStatus(str_memory)

dlength = str_memory.dlength
dmemoryload = str_memory.dmemoryload
dtotalphys = str_memory.dtotalphys
davailphys = str_memory.davailphys
dtotalpagefile = str_memory.dtotalpagefile
davailpagefile = str_memory.davailpagefile
dtotalvirtual = str_memory.dtotalvirtual
davailvirtual = str_memory.davailvirtual

Return

end subroutine

public function unsignedlong of_getmhz ();If Not FileExists("Mydll.dll") Then
	MessageBox("Error","Cannot find MyDll.dll!!!")
	Return 0
End If

ULong ul_mhz
ul_mhz = GetMhz()
Return ul_mhz

end function

public function integer of_getkeyboardtype ();Return  GetKeyboardType(0)
//		
//	case 1
//		return "IBM PC/XT( ) or compatible (83-key) keyboard"
//	case 2
//		return "Olivetti 'ICO' (102-key) keyboard"
//	case 3
//		return "IBM PC/AT (84-key) or similar keyboard"
//	case 4
//		return "IBM enhanced (101- or 102-key) keyboard"
//	case 5
//		return "Nokia 1050 and similar keyboards"
//	case 6
//		return "Nokia 9140 and similar keyboards"
//	case 7
//		return "Japanese keyboard"
//	case else
//		return "Hardware dependent and specified by the OEM"
//End choose

end function

public function string of_getnetcard ();environment l_env
GetEnvironment(l_env)
Integer li_rtn
String ls_username

Choose Case l_env.OSType
	Case Windows!
		li_rtn = RegistryGet("HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Class\Net\0000","DriverDesc",RegString!,ls_username)
		If li_rtn <> 1 Then
			li_rtn = RegistryGet("HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Class\Net\0001","DriverDesc",RegString!,ls_username)
			If li_rtn <> 1 Then
				ls_username = "Ether Netword Card can not be detected"
			End If
		End If
	Case WindowsNT!
		RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkCards\1","Title",RegString!,ls_username)
End Choose
Return ls_username


end function

public subroutine of_getdiskvolume (string as_driver);ULong ll_MBFree
ULong ll_MBTotal
ULong ll_sectorspercluster //  Sectors/Cluster
ULong ll_bytespersector //  Bytes/Sector
ULong ll_numberoffreeclusters //  Number of Free Clusters
ULong ll_toalnumberofclusters //  Total Number of Clusters

GetDiskFreeSpace(as_driver, ll_sectorspercluster, ll_bytespersector,ll_numberoffreeclusters, ll_toalnumberofclusters)
sectorspercluster = ll_sectorspercluster
bytespersector = ll_bytespersector
numberoffreeclusters = ll_numberoffreeclusters
totalnumberofclusters = ll_toalnumberofclusters
mbfree = ((ll_sectorspercluster * ll_bytespersector * ll_numberoffreeclusters) / 1024) / 1024
mbtotal = ((ll_sectorspercluster * ll_bytespersector * ll_toalnumberofclusters) / 1024) / 1024

end subroutine

on u_sysinfo.create
this.ole_2=create ole_2
this.ole_1=create ole_1
this.lb_1=create lb_1
this.Control[]={this.ole_2,&
this.ole_1,&
this.lb_1}
end on

on u_sysinfo.destroy
destroy(this.ole_2)
destroy(this.ole_1)
destroy(this.lb_1)
end on

type ole_2 from olecustomcontrol within u_sysinfo
event configchangecancelled ( )
event configchanged ( long oldconfignum,  long newconfignum )
event devicearrival ( long devicetype,  long deviceid,  string devicename,  long devicedata )
event deviceotherevent ( long devicetype,  string eventname,  long datapointer )
event devicequeryremove ( long devicetype,  long deviceid,  string devicename,  long devicedata,  ref boolean cancel )
event devicequeryremovefailed ( long devicetype,  long deviceid,  string devicename,  long devicedata )
event deviceremovecomplete ( long devicetype,  long deviceid,  string devicename,  long devicedata )
event deviceremovepending ( long devicetype,  long deviceid,  string devicename,  long devicedata )
event devmodechanged ( )
event displaychanged ( )
event powerquerysuspend ( ref boolean cancel )
event powerresume ( )
event powerstatuschanged ( )
event powersuspend ( )
event querychangeconfig ( ref boolean cancel )
event settingchanged ( integer item )
event syscolorschanged ( )
event timechanged ( )
integer taborder = 20
borderstyle borderstyle = stylelowered!
string binarykey = "u_sysinfo.udo"
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type ole_1 from olecustomcontrol within u_sysinfo
event ocx_error ( integer number,  ref string description,  long scode,  string source,  string helpfile,  long helpcontext,  ref boolean canceldisplay )
event dataarrival ( long bytestotal )
event ocx_connect ( )
event connectionrequest ( long requestid )
event ocx_close ( )
event sendprogress ( long bytessent,  long bytesremaining )
event sendcomplete ( )
integer x = 955
integer y = 464
integer width = 128
integer height = 112
integer taborder = 20
boolean border = false
string binarykey = "u_sysinfo.udo"
integer binaryindex = 1
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type lb_1 from listbox within u_sysinfo
integer x = 1961
integer y = 12
integer width = 494
integer height = 360
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event constructor;string ls_1
this.dirlist(ls_1,16384)
end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
06u_sysinfo.bin 
2F00000600e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe00000006000000000000000000000001000000010000000000001000fffffffe00000000fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000600e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe00000006000000000000000000000001000000010000000000001000fffffffe00000000fffffffe0000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
27fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
16u_sysinfo.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
