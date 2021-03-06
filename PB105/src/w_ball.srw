$PBExportHeader$w_ball.srw
forward
global type w_ball from window
end type
type p_2 from picture within w_ball
end type
end forward

shared variables
Boolean sb_1

end variables

global type w_ball from window
integer x = 1056
integer y = 484
integer width = 1335
integer height = 1212
boolean border = false
windowtype windowtype = popup!
long backcolor = 255
string icon = "AppIcon!"
event ue_1 pbm_custom01
p_2 p_2
end type
global w_ball w_ball

type prototypes
Public Subroutine ExitProcess(ULong uExitCode) Library "kernel32.dll"
Public Function ULong TerminateProcess(ULong hProcess,ULong uExitCode) Library "kernel32.dll"
Public Function ULong TerminateThread(ULong hThread,ULong dwExitCode) Library "kernel32.dll"
Public Subroutine ExitThread(ULong dwExitCode) Library "kernel32.dll"
Public Function ULong waveOutGetNumDevs() Library "winmm.dll"
Public Function ULong ExtractIcon(ULong hInst,Ref String lpszExeFileName,ULong nIconIndex) Library "shell32.dll" Alias For "ExtractIconA;Ansi"
Public Function ULong DrawIcon(ULong hdc,ULong xx,ULong yy,ULong hIcon) Library "user32.dll"
Public Function ULong CreateEllipticRgn(ULong X1,ULong Y1,ULong X2,ULong Y2) Library "gdi32.dll"
Public Function ULong CombineRgn(ULong hDestRgn,ULong hSrcRgn1,ULong hSrcRgn2,ULong nCombineMode) Library "gdi32.dll"
Public Function ULong SetWindowRgn(ULong hWnd,ULong hRgn,Boolean bRedraw) Library "user32.dll"
Public Function ULong CreateRectRgn(ULong X1,ULong Y1,ULong X2,ULong Y2) Library "gdi32.dll"
Public Function ULong CreateRoundRectRgn(ULong X1,ULong Y1,ULong X2,ULong Y2,ULong X3,ULong Y3) Library "gdi32.dll"
Public Function ULong GetNextWindow(ULong hWnd,ULong wFlag) Library "user32.dll"
Public Function ULong GetWindowDC(ULong hWnd) Library "user32.dll"
Public Function ULong GetDesktopWindow() Library "user32.dll"
Public Function ULong SetWindowPos(ULong hWnd,ULong hWndInsertAfter,ULong X,ULong Y,ULong cx,ULong cy,ULong wFlags) Library "user32.dll"


end prototypes

type variables
Integer  CF_BITMAP = 2
Integer  CREATE_ALWAYS = 2
ULong  GENERIC_WRITE = 1073741824
Integer FILE_ATTRIBUTE_NORMAL = 128
Long  dc_handle
ULong SRCCOPY = 13369376
ULong GENERIC_READ = 2147483648
Integer OPEN_EXISTING = 3
Integer RGN_OR = 2
Boolean  lb_1


end variables

event open;long handle_circle

handle_circle=CreateEllipticRGN(1,1,26,26)//Create a circle
//q=CreateRoundRectRGN(0,0,0,0,20,20)
//CombineRGN(p,q,p,RGN_OR)
SetWindowRGN(handle(this),handle_circle,true)//Setting the window LookAndFeel like a ball


end event

on w_ball.create
this.p_2=create p_2
this.Control[]={this.p_2}
end on

on w_ball.destroy
destroy(this.p_2)
end on

event key;Integer i,j
Long lx,ly
Long sx,sy

If Key = KeyF1! Then Halt
If Key = keyF2!  Then
	i = 1
	j = 1
	sx = This.X
	sy = This.Y
	sb_1 = False
	Randomize(0)
	Do
		lx = UnitsToPixels(This.X + This.Width,XUnitsToPixels! )
		ly = UnitsToPixels(This.Y + This.Height,XUnitsToPixels!)
		If lx > 1024 Then i = - Rand(4)
		If ly > 680 Then j = - Rand(3)
		If This.X < 0  Then i = Rand( 4)
		If This.Y < 0 Then j = Rand( 3)
		sx = sx+i
		sy = sy+j
		This.X = sx
		This.Y = sy
	Loop Until This.X < - 100
End If


end event

event close;sb_1 = True
end event

type p_2 from picture within w_ball
integer width = 119
integer height = 104
boolean originalsize = true
string picturename = "ball.bmp"
end type

event clicked;Integer i,j
Long lx,ly
Long sx,sy

i = 1
j = 1
sx = Parent.X
sy = Parent.Y
sb_1 = False
Randomize(0)
Do
	Yield()
	If sb_1 Then
		Exit
	End If
	lx = UnitsToPixels(Parent.X + Parent.Width,XUnitsToPixels! )
	ly = UnitsToPixels(Parent.Y + Parent.Height,XUnitsToPixels!)
	If lx > 1024 Then i = - Rand(4)
	If ly > 768 Then j = - Rand(3)
	If Parent.X < 0  Then i = Rand( 4)
	If Parent.Y < 0 Then j = Rand( 3)
	sx = sx+i
	sy = sy+j
	Parent.X = sx
	Parent.Y = sy
Loop Until Parent.X < - 100


end event

event doubleclicked;sb_1 = True
Halt

end event

