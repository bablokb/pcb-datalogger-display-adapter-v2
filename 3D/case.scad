// ---------------------------------------------------------------------------
// 3D-Model (OpenSCAD): Case for display.
//
// Author: Bernhard Bablok
// License: GPL3
//
// https://github.com/bablokb/pcb-datalogger-display-adapter-v2
// ---------------------------------------------------------------------------

include <BOSL2/std.scad>
include <modules/dimensions.scad>
include <modules/threaded_case.scad>

// dimensions
X_PCB  = 70;
Y_PCB  = 38;
Z_CASE = 10.4;
R_CASE = 10;        // inner rim

// cutout connector
X_CONN = 22;
Y_CONN =  4;
XO_CONN = 23.03;
YO_CONN = -15.7;

module case() {
  difference() {
    case_threaded(X_PCB, Y_PCB, z_case=Z_CASE, ruthex=false, screws=[1,1,0,1]);
    // cutout rim
    zmove(-FUZZ)
      cuboid([X_PCB-2*R_CASE,Y_PCB-2*R_CASE,BT+2*FUZZ], anchor=BOTTOM+CENTER);
    // cutout connector
    move([XO_CONN,YO_CONN,-FUZZ])
      cuboid([X_CONN,Y_CONN,BT+2*FUZZ], anchor=BOTTOM+CENTER);
  }
}

case();
