
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

module tapered_tube(id1, id2, od1, od2, thickness, h, center = false) {
  if ((id1 != undef) && (id2 != undef)) {
    difference() {
        cylinder(d1=id1+2*thickness, d2=id2+2*thickness, h=h, center=center);
        translate([0, 0, (center ? 0 : -1)]) cylinder(d1=id1, d2=id2, h=h+2, center=center);
    }
  } else if ((od1 != undef) && (od2 != undef)) {
    difference() {
        cylinder(d1=od1, d2=od2, h=h, center=center);
        translate([0, 0, (center ? 0 : -1)]) cylinder(d1=od1-2*thickness, d2=od2-2*thickness, h=h+2, center=center);
    }
  } else echo("tapered_tube: parms error");
}
/*tapered_tube(id1=10, id2=20, thickness=2, h=50, center=true);*/
/*tapered_tube(od1=14, od2=24, thickness=2, h=50, center=true);*/
