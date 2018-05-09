COCOVTIO.D     SET       1


********************************************************************
* VTIODefs - Video Terminal I/O Definitions for CoCo 1/2
*
* $Id$
*
* Edt/Rev  YYYY/MM/DD  Modified by
* Comment
* ------------------------------------------------------------------
*          2004/11/29  P.Harvey-Smith.
* Added symbolic defines for bits in V.CoLoad.
*
*          2004/12/02  P.Harvey-Smith.
* Moved over all variables from co51.asm
*
*          2005/04/09  P.Harvey-Smith.
* Decoded rest of the CoHR memory locations.
*
*	       2005/04/24  P.Harvey-Smith.
* Added variables for cursor flash, currently only implemented in co51
*
               NAM       VTIODefs  
               TTL       Video Terminal I/O Definitions for CoCo 1/2

********************
* VTIO Static Memory
*
               ORG       V.SCF
V.ScrnA        RMB       2                   (2) screen start address in system memory
V.ScrnE        RMB       2                   (2) address of end of screen
V.CrsrA        RMB       1                   (2) cursor address
V.CrsAL        RMB       1                   cursor address low
V.CChar        RMB       1                   value of character under cursor
V.Mode         RMB       1                   mode: 0=256x192 x2, 1=128x192 x4
V.NGChr        RMB       1                   number of additional characters to get
V.RTAdd        RMB       2                   (2) return address after getting characters
V.NChar        RMB       1                   character to process
V.NChr2        RMB       1                   and the next one
               RMB       1
V.Chr1         RMB       1                   same as under cursor character
V.CColr        RMB       1                   cursor color
V.Col          RMB       1                   number of columns for this screen
V.Row          RMB       1                   number of rows
V.Alpha        RMB       1                   0 when in alpha mode
V.PIA1         RMB       1                   PIA1Base value
V.Rdy          RMB       1                   device ready (see SS.DStat 0=not ready)
V.CFlg1        RMB       1                   VDG display code values
V.SBAdd        RMB       2                   (2) address of block screen is in
V.GBuff        RMB       2                   allocation for graphics buffers (block#)
V.AGBuf        RMB       4                   (2) additional graphics buffer
V.FFMem        RMB       2                   Flood fill alloc'ed mem
V.FFSPt        RMB       2                   Flood fill current stack pointer
V.FFSTp        RMB       1                   Flood fill stack top
V.FF6          RMB       1                   flood fill flag
V.FFFlag       RMB       1                   ??
V.MTabl        RMB       2                   (2) address of mask table for pixels in byte
V.PixBt        RMB       1                   bit mask for modes (0=$07, 1=$03 )#pixels/byte
V.GCrsX        RMB       1                   graphics cursor X value
V.GCrsY        RMB       1                   graphics cursor Y
V.Msk1         RMB       1                   mask byte 1
V.Msk2         RMB       1                   mask byte 2 (00,55,AA,FF)
V.MCol         RMB       1                   color? (C003,8001)
V.4A           RMB       1
V.PMask        RMB       1                   pixel mask for colors (i.e. $55, $CC etc)
V.4C           RMB       1
V.4D           RMB       1
V.4E           RMB       1
V.4F           RMB       1
V.Caps         RMB       1                   caps lock info: $00=lower $FF=upper
V.ClkCnt       RMB       1                   clock count ??
V.WrChr        RMB       1                   character to write
V.CurCo        RMB       1                   current CO-module in use
* start of CoWP-specific static memory
V.Co80X        RMB       1                   V.54
V.Co80Y        RMB       1                   V.55
V.ColPtr       RMB       1                   V.56
V.RowPtr       RMB       1                   V.57
V.C80X         RMB       1                   CoWP X position
V.C80Y         RMB       1                   CoWP Y position
V.Invers       RMB       1
* end of CoWP-specific static memory
V.DspVct       RMB       2                   vector to display screen
V.CnvVct       RMB       2                   vector to X/Y to address conversion
V.LKeyCd       RMB       1                   last key code
V.2Key1        RMB       1                   2nd Key 1
V.2Key2        RMB       1                   2nd Key 2
V.2Key3        RMB       1                   2nd Key 3
V.Key1         RMB       1                   Key 1
V.Key2         RMB       1                   Key 2
V.Key3         RMB       1                   Key 3
V.ShftDn       RMB       1                   SHIFT/CTRL state
V.CtrlDn       RMB       1                   CTRL key down
V.KeyFlg       RMB       1                   key flag
V.AltDwn       RMB       1                   ALT key down
V.KySns        RMB       1                   key sense flags
V.KySame       RMB       1                   key same as last flag
V.KySnsF       RMB       1                   key sense flag
V.Spcl         RMB       1
V.KTblLC       RMB       1                   key table entry #
V.6F           RMB       1                   ???
V.COLoad       RMB       1                   CO-module loaded flags
V.CFlag        RMB       1                   true lowercase flag $10=true, $00=false
V.GrfDrvE      RMB       2                   GrfDrv entry point
V.CoVDGE       RMB       2                   CoVDG entry point
V.CoWPE        RMB       2                   CoWP entry point
V.CoHRE        RMB       2                   CoHR entry point
V.Co42E        RMB       2                   Co42 entry point

V.Flash        RMB       2                   Cursor flash routine address.
v.FlashCount   RMB       1                   Cursor flash count
V.NoFlash      RMB       1                   When this is non-zero do not flash cursor

* CoHR vars

V.51ScrnA      RMB       2                   * Screen address.
V.51XPos       RMB       1                   * X co-ordinate
V.51YPos       RMB       1                   * Y co-ordinate
V.51EscSeq     RMB       1                   * In escape sequence
V.51ReverseFlag RMB       1                   * Reverse video flag
V.51UnderlineFlag RMB       1                   * Underline flag
V.51CtrlDispatch RMB       2                   * Ctrl char dispatch address, currently processing
V.51BytePixOffset RMB       1                   * byte offset in screen line, of character X position        
V.51OldCursorPosX RMB       1                   * Position of old cursor before update        
V.51OldCursorPosY RMB       1
V.51CursorChanged RMB       1                   * Has cursor position changed ? 1=yes,0=no
V.51CursorOn   RMB       1                   * Is cursor on ? 1=yes 0=no		         
V.51XORFlag    RMB       1                   * and data to screen (0) or Xor (1)  		       
V.51ScreenMask1 RMB       1                   * screen masks for drawing characters on screen         
V.51ScreenMask2 RMB       1
* End of CoHR vars
**** Note these have to come at the end of the defs, or the keyboard ****
**** code can clobber variables defined after these !                ****
V.IBufH        RMB       1                   input buffer head
V.IBufT        RMB       1                   input buffer tail
V.InBuf        RMB       1                   input buffer ptr
V.51End        RMB       1
               RMB       250-.
V.Last         EQU       .


* Unknown for now
*VD.FFMem rmb   2  (2) bottom of stack for flood fill
*VD.FFSPt rmb   2  (2) flood fill stack pointer
*VD.FFSTp rmb   2  (2) flood fill stack top pointer
*VD.FF6   rmb   1   flood fill flag
*VD.MCol2 rmb   1  color
*VD.FF1   rmb   1  data for flood fill
*VD.FF2   rmb   1  data for flood fill
*VD.FFMsk rmb   1  flood fill mask
*VD.FFFlg rmb   1  flood fill flag
*VD.Palet rmb   16 (16) current palette values
*VD.PlFlg rmb   1  initialized to $08 by L00DB, and then unused!

*
* Defs for V.COLoad flags.
* 

ModCoVDG       EQU       %00000010           CoVDG, Built-in VDG 32x16.
ModCoWP        EQU       %00000100           CoWP, WordPak, 80x25
ModCoHR        EQU       %00001000           CoHR, PMODE 4 51x25 text
ModCo42        EQU       %00010000           Co42, PMODE 4 42x25 text

*
* Defs for cursor flash counter
*

CFlash50hz     EQU       25                  * 50Hz flash counter
CFlash60Hz     EQU       30                  * 60Hz flash counter

               
********************************************************************
* VTIODefs - Video Terminal I/O Definitions for CoCo 3
*
* $Id$
*
* Edt/Rev  YYYY/MM/DD  Modified by
* Comment
* ------------------------------------------------------------------
*          2004/07/18  Boisy G. Pitre
* Started from systype


****************
* Window Devices
*

**********************************
* Pointer Device Packet Definition
*

**************************
* window regions for mouse
*

*************************************
* Standard system get/put buffer defs
*
*
* system group numbers
*
*
* font buffer numbers
*
*
* pattern buffer numbers
*
*
* pointer buffer numbers
*

**********************
* KeyDrv Entry Points

**********************
* JoyDrv Entry Points

**********************
* SndDrv Entry Points

********************************
* Window/Menu Bar Data Structure
*
* To be used in SS.WnSet SETSTAT to set up a Framed Window
* for use in the high level windowing package.
*
*
* Menu Item Descriptor : (MN.ITEMS)
* one required for each item within the menu
*
*
* Menu Descriptor :
* one for each menu on the manu bar
* each is pointed to by MB.MPTR below
*
*
* Window Descriptor:
* one required for each application in a framed window
*

*************************
* Window Type Definitions
*
* To be used in setting up the border of the window in
* the SS.WnSel SETSTAT
*

*************************************
* Pre-Defined Menu IDs for the system
*


******************************************************************************
******************************************************************************
**                                                                          **
** NitrOS-9 Windowing system Global data definitions                        **
**                                                                          **
******************************************************************************
******************************************************************************
**                                                                          **
** System memory block 0 layout:                                            **
**                                                                          **
** $0000-$0001 : FHL/Isted WD 1002-05 - interface base address              **
** $0002       : FHL/Isted WD 1002-05 - boot device physical drive #        **
** $0008       : Bruce Isted Serial mouse - button counter & rx count       **
** $0009-$000B : Bruce Isted Serial mouse - RX buffer                       **
** $000C-$000D : Bruce Isted Serial mouse - Current X position              **
** $000E-$000F : Bruce Isted Serial mouse - Current Y position              **
** $0010-$001F : unused (User definable)                                    **
** $0020-$00FF : system direct page & some IRQ vectors                      **
** $0100-$011F : Task usage table                                           **
** $0120-$01FF : Virtual DAT tasks (pointed to by <D.TskIPt)                **
** $0200-$02FF : memory block usage map ($80=Not RAM,$01=in use,$02=module) **
** $0300-$03FF : system's system call dispatch table                        **
** $0400-$04FF : user's sysem call dispatch table                           **
** $0500-$05FF : process descriptor pointer table                           **
** $0600-$07FF : System task (Task 0, ID 1) process descriptor              **
** $0800-$08FF : System's stack space (initial ptr is $0900)                **
** $0900-$09FF : SMAP table ($01=in used, $80=NOT RAM)                      **
** $0A00-$0FFF : module directory DAT Images (8 bytes each)                 **
** $1000-$10FF : System Global memory (pointed to by D.CCMem)               **
** $1100-$11FF : GRFDRV global memory (DP=$11 in GRFDRV)                    **
** $1200-$1247 : shared buffer between Grf/WindInt & GRFDRV (GP buffers)    **
** $1248-$127F : ????                                                       **
** $1280-$1A7F : the window tables (32 of $40 bytes each)                   **
** $1A80-$1C7F : the screen tables (16 of $20 bytes each)                   **
** $1C80-$2000 : the CC3 global mem stack (for windowing)                   **
**                                                                          **
******************************************************************************
******************************************************************************

* User settable values for VTIO/TC9IO/GrfInt/WindInt & GrfDrv



* Global definitions

*****************************************************************************
* Static memory area for each window (VTIO/TC9IO)
* Should set up a write buffer (using parm area?) between SCF, VTIO & Grfdrv
* so we can 'burst mode' text output (copy up to 48 chars to Grfdrv's parm
* area, and have grfdrv loop through & write all 48 chars to screen in 1 loop
* May have to have smaller limit for text to gfx screens, as it will run much
* slower, unless GrfDrv is made Partially/Fully Re-Entrant
*
* STRONG CAUTION:  scfdefs MUST be included first before this file if
* V.SCF is to be resolved properly in pass 1!!

*****************************************************************************
* GrfInt/WindInt global memory area
* This area sits in system block 0 from $1000 to $10ff
*g0003    rmb   2          NEW: UNUSED
*                           Parms have been moved to Dev Mem)
*                           0=We are not on our device
*                           1=We are the current device
*                           (Used by comod (GRF/WIND/VDGInt) to determine
*                           whether or not to update GIME regs themselves
*                           If not current device, they don't.)
*                           00000010 : VDGInt found
*                           10000000 : GrfDrv found
*         IFEQ  TC9-true
*CurLght  rmb   1          current keyboard light settings
*         ELSE  
*         ENDC  
* A secondary 3 key table (same format as g002D below)
* Up to 3 keys can be registerd at once, and they are stored here. If more
* than 3 are hit, the last key is overwritten with the very last key down that
* was checked. Format for all three is the same as the PIA column/row byte @
* KeyFlag below.
*                           %00000111-Column # (Output, 0-7)
*                           %00111000-Row # (Input, 0-6)
*         IFEQ  TC9-true
*KeyParm  rmb   1          keyboard command parameter byte
*         ELSE  
*         ENDC  

*****************************************************************************
* GrfDrv global memory data definitions
* This area sits in system block 0 from $1100 to $119E
*                             overlay width has been copied
* In ARC, 97-98 is the width of the clip line in pixels (after scaling)
* In ARC, 99-9A is the height of the clip line in pixels (after scaling)
* In ARC A1-A2 is the vector to the proper clipping routine
*gr00B3   rmb    256-.       ??? UNUSED
* GPLoad buffer - $1200 in system block 0

*****************************************************************************
* Window table entry structure
* These tables sit in system block 0 and there is 1 for every window init'd
* including any overlay windows.
* NOTE: The following default settings are what the window was initialized
*       with, and thus are the MAXIMUM start/size the window can handle
*       until it is restarted (DWEnd & DWSet)
*       They also appear to be used in WindInt to determine the coords &
*       sizes for control+content regions

*****************************************************************************
* Screen table entrys
* These tables sit in system block 0 base=$1A80

* NOTE: SHOULD USE ONE OF THESE UNUSED BYTES TO KEEP THE # OF DEVICE WINDOW
* TABLES THAT ARE USING THIS SCREEN TABLE. DWSET & DWEND WOULD KEEP TRACK OF
* THESE, AND THE WINDINT TITLE BAR ROUTINE WOULD CHECK IT. IF IT IS ONLY 1,
* IT WON'T BOTHER CHANGING THE TITLE BAR WHEN SELECTING WINDOWS

*****************************************************************************
* Graphics buffer tables
* They contain a 20 byte header (shown below), followed by the raw pixel
* data.

*****************************************************************************
* GFX tables (1 for each window, 18 ($12) bytes each) pointed to by
* $1075-$0176
* GRFINT only uses gt0001-gt0004, the rest is exclusive to WINDINT

*****************************************************************************
* This table is located in the graphics table memory and is offset from
* graphics table pointer stored at $1075-$1076. This is used exclusively by
* WindInt.
* NOTE: USING UNUSED BYTES IN CC3 GLOBAL MEM, SET UP SEPARATE PTRS FOR EACH
*  OF THE BELOW SO WE CAN SPEED UP ACCESS BY NOT HAVING TO DO A LOAD/LEAx
*  COMBINATION EVERY TIME

*****************************************************************************
* WindInt menu handling table entry definition

*****************************************************************************
* Character binary switches

*****************************************************************************
* Screen types (high bit set=hardware text, else graphics) in GRFDRV
*         equ   1          640x200x2
*         equ   2          320x200x4
*         equ   3          640x200x4
*         equ   4          320x200x16
*         equ   $85        80 column text
*         equ   $86        40 column text

*************************************
* Window default palette color codes
*

