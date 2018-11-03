
module standoff_with_base_fillet(stud_dia, stud_height, fillet_radius) {
  difference() {
    cylinder(d=stud_dia + 2 * fillet_radius, h=fillet_radius);
    translate([0, 0, fillet_radius]) rotate_extrude() translate([fillet_radius + stud_dia / 2, 0, 0]) circle(r=fillet_radius);
  }
  cylinder(d=stud_dia, h=stud_height);
}
