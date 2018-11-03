
module tube_idod(id, od, h, center=false) {
  difference() {
    cylinder(d=od, h=h, center=center);
    translate([0, 0, (center ? 0 : -1)]) cylinder(d=id, h=h+2, center=center);
  }
}
/*tube_idod(5, 6, 10);*/
/*tube_idod(5, 6, 10, center=true);*/

module tube(id, od, thickness, h, center = false) {
  if ((id != undef) && (od != undef)) {
    tube_idod(id, od, h, center);
  } else if ((id != undef) && (thickness != undef)) {
    tube_idod(id, id + 2 * thickness, h, center);
  } else if ((od != undef) && (thickness != undef)) {
    tube_idod(od - 2 * thickness, od, h, center);
  } else echo("tube: parms error");
}
/*tube(id = 5, od = 6, h = 10);*/
/*tube(id = 5, thickness = 0.5, h = 10);*/
/*tube(od = 6, thickness = 0.5, h = 10);*/

