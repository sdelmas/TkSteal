/* 
 * tkAppInit.c --
 *
 *	Provides a default version of the Tcl_AppInit procedure for
 *	use in wish and similar Tk-based applications.
 *
 * Copyright (c) 1993 by Sven Delmas
 * All rights reserved.
 * See the file COPYRIGHT for the copyright notes.
 *
 * Copyright (c) 1993 The Regents of the University of California.
 * Copyright (c) 1994 Sun Microsystems, Inc.
 *
 * See the file "license.terms" for information on usage and redistribution
 * of this file, and for a DISCLAIMER OF ALL WARRANTIES. This file is
 * part of the Tk distribution and is included in the file COPYRIGHT.
 */

#ifndef lint
static char sccsid[] = "@(#) tkAppInit.c 1.12 94/12/17 16:30:56";
#endif /* not lint */

#if defined(TK_EXTENDED)
#include "tclExtend.h"
#else
#include "tcl.h"
#endif
#include "tk.h"
#include <math.h>

#if defined(USE_LOAD)
Tcl_CmdProc Tcl_LoadCmd;
#endif

#if defined(USE_TCL_DP)
#include "dp.h"
#endif

#if defined(USE_ITCL)
#include "itcl.h"
#endif

#if defined(USE_EXPECT)
#include "expect_tcl.h"
#endif

#if defined(USE_XACCESS)
#include "tkXAccess.h"
#endif

#if defined(USE_MEGAWIDGET)
#include "tkMegaWidget.h"
#endif

#if defined(USE_TKICON)
#include "tkIcon.h"
#endif

#if defined(USE_MOBAL)
#include "tkMobalExt.h"
#endif

#if defined(USE_CB)
#include "tkCBExt.h"
#endif

/*
 * The following variable is a special hack that is needed in order for
 * Sun shared libraries to be used for Tcl.
 */

#ifdef NEED_MATHERR
extern int matherr();
int *tclDummyMathPtr = (int *) matherr;
#endif

/*
 *----------------------------------------------------------------------
 *
 * main --
 *
 *	This is the main program for the application.
 *
 * Results:
 *	None: Tk_Main never returns here, so this procedure never
 *	returns either.
 *
 * Side effects:
 *	Whatever the application does.
 *
 *----------------------------------------------------------------------
 */

int
main(argc, argv)
    int argc;			/* Number of command-line arguments. */
    char **argv;		/* Values of command-line arguments. */
{
    Tk_Main(argc, argv, Tcl_AppInit);
    return 0;			/* Needed only to prevent compiler warning. */
}

/*
 *----------------------------------------------------------------------
 *
 * Tcl_AppInit --
 *
 *	This procedure performs application-specific initialization.
 *	Most applications, especially those that incorporate additional
 *	packages, will have their own version of this procedure.
 *
 * Results:
 *	Returns a standard Tcl completion code, and leaves an error
 *	message in interp->result if an error occurs.
 *
 * Side effects:
 *	Depends on the startup script.
 *
 *----------------------------------------------------------------------
 */

int
Tcl_AppInit(interp)
    Tcl_Interp *interp;		/* Interpreter for application. */
{
    Tk_Window main;

    main = Tk_MainWindow(interp);

#if defined(TK_EXTENDED)
    if(TclX_Init(interp) == TCL_ERROR)
	return TCL_ERROR;
    if(TkX_Init(interp) == TCL_ERROR)
	return TCL_ERROR;
#else
    if (Tcl_Init(interp) == TCL_ERROR)
	return TCL_ERROR;
    if (Tk_Init(interp) == TCL_ERROR)
	return TCL_ERROR;
#endif

    /*
     * Call the init procedures for included packages.  Each call should
     * look like this:
     *
     * if (Mod_Init(interp) == TCL_ERROR) {
     *     return TCL_ERROR;
     * }
     *
     * where "Mod" is the name of the module.
     */
    
#if defined(USE_LOAD)
    Tcl_CreateCommand(interp, "load", Tcl_LoadCmd,
		      (ClientData) NULL, (Tcl_CmdDeleteProc *) NULL);
#else
    
#if defined(USE_TCL_DP)
    if (Tdp_Init(interp) == TCL_ERROR)
	return TCL_ERROR;
#endif
    
#if defined(USE_BLT)
    if (Blt_Init(interp) == TCL_ERROR)
	return TCL_ERROR;
#endif
    
#if defined(USE_ITCL)
    if (Itcl_Init(interp) == TCL_ERROR)
	return TCL_ERROR;
#endif
    
#if defined(USE_EXPECT)
    if (Exp_Init(interp) == TCL_ERROR)
	return TCL_ERROR;
#endif
    
#if defined(USE_TIX)
    if (Tix_Init(interp) == TCL_ERROR)
	return TCL_ERROR;
#endif
    
#if defined(USE_TURNDIAL)
    if (Turndial_Init(interp) == TCL_ERROR)
        return TCL_ERROR;
#endif
    
#if defined(USE_XACCESS)
    if (TkSteal_Init(interp) == TCL_ERROR)
	return TCL_ERROR;
#endif
    
#if defined(USE_MEGAWIDGET)
    if (TkMegaWidget_Init(interp) == TCL_ERROR)
	return TCL_ERROR;
#endif
    
#if defined(USE_TKICON)
    if (TkIcon_Init(interp) == TCL_ERROR)
	return TCL_ERROR;
#endif
    
#if defined(USE_MOBAL)
    if (TkMobalExt_Init(interp) == TCL_ERROR)
	return TCL_ERROR;
#endif

#if defined(USE_CB)
    if (TkCBExt_Init(interp) == TCL_ERROR)
	return TCL_ERROR;
#endif
#endif

    /*
     * Call Tcl_CreateCommand for application-specific commands, if
     * they weren't already created by the init procedures called above.
     */

    /*
     * Specify a user-specific startup file to invoke if the application
     * is run interactively.  Typically the startup file is "~/.apprc"
     * where "app" is the name of the application.  If this line is deleted
     * then no user-specific startup file will be run under any conditions.
     */

    tcl_RcFileName = "~/.wishrc";
    return TCL_OK;
}

/* eof */

