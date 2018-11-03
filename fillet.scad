
module fillet(radius, length, center = false) {
  translate([(center ? -length/2 : 0), 0, 0]) intersection() {
    difference() {
      cube([length, radius * 2, radius * 2]);
      translate([-1, radius, radius]) rotate([0, 90, 0]) cylinder(r=radius, h=length + 2);
    }
    cube([length, radius, radius]);
  }
}
/*fillet(10, 50);*/

module fillet_x(radius, length, center = false) {
  fillet(radius, length, center);
}
/*fillet_x(10, 50);*/

module fillet_y(radius, length, center = false) {
  rotate(-90) mirror([1, 0, 0]) fillet(radius, length, center);
}
/*fillet_y(10, 50);*/

module inside_fillet_for_cube(cube_size, fillet_radius, center = false, center_x = false, center_y = false) {
  translate([(center || center_x ? -cube_size[0] / 2 : 0), (center || center_y ? -cube_size[1] / 2 : 0), 0]) {
    for (my = [0, 1]) translate([0, (my == 1 ? cube_size[1] : 0)]) mirror([0, my, 0]) fillet(fillet_radius, cube_size[0]);
    for (mx = [0, 1]) translate([(mx == 1 ? cube_size[0] : 0), 0, 0]) mirror([mx, 0, 0]) fillet_y(fillet_radius, cube_size[1]);
  }
}
/*inside_fillet_for_cube([100, 60], 5);*/
/*inside_fillet_for_cube([100, 60], 5, center_x = true);*/

module rounded_corner_inside_fillet(corner_radius, fillet_radius) {
  intersection() {
    difference() {
      cylinder(r=corner_radius, h=fillet_radius);
      /*translate([0, 0, fillet_radius]) !scale([1, 1, fillet_radius / corner_radius]) sphere(r=corner_radius);*/
      translate([0, 0, fillet_radius]) hull() rotate_extrude() intersection() {
	translate([corner_radius - fillet_radius, 0, 0]) circle(r=fillet_radius);
	translate([0, -fillet_radius, 0]) square(2 * fillet_radius);
      }
      translate([0, 0, -1]) cylinder(r=corner_radius - fillet_radius, h=fillet_radius);
    }
    cube([corner_radius, corner_radius, fillet_radius]);
  }
}
/*rounded_corner_inside_fillet(10, 5);*/
/*rounded_corner_inside_fillet(10, 8);*/

module inside_fillet_for_cube_with_rounded_corners(cube_size, corner_radius, fillet_radius, center = false, center_x = false, center_y = false) {
  translate([(center || center_x ? -cube_size[0] / 2 : 0), (center || center_y ? -cube_size[1] / 2 : 0), 0]) {
    for (my = [0, 1]) translate([0, (my == 1 ? cube_size[1] : 0)]) mirror([0, my, 0]) {
      translate([corner_radius, corner_radius, 0]) rotate(180) rounded_corner_inside_fillet(corner_radius, fillet_radius);
      translate([cube_size[0] - corner_radius, corner_radius, 0]) rotate(-90) rounded_corner_inside_fillet(corner_radius, fillet_radius);
      translate([corner_radius, 0, 0]) fillet_x(fillet_radius, cube_size[0] - 2 * corner_radius);
    }
    for (mx = [0, 1]) translate([(mx == 1 ? cube_size[0] : 0), 0, 0]) mirror([mx, 0, 0]) translate([0, corner_radius, 0]) fillet_y(fillet_radius, cube_size[1] - 2 * corner_radius);
  }
}
/*inside_fillet_for_cube_with_rounded_corners([100, 60], 10, 5);*/
/*inside_fillet_for_cube_with_rounded_corners([100, 60], 10, 5, center = true);*/

module rounded_corner_outside_fillet(corner_radius, fillet_radius) {
  intersection() {
    difference() {
      cylinder(r=corner_radius + fillet_radius, h=fillet_radius);
      translate([0, 0, -1]) cylinder(r=corner_radius, h=fillet_radius + 2);
      translate([0, 0, fillet_radius]) rotate_extrude() translate([corner_radius + fillet_radius, 0, 0]) circle(r=fillet_radius);
    }
    cube([corner_radius + fillet_radius, corner_radius + fillet_radius, fillet_radius]);
  }
}
/*rounded_corner_outside_fillet(10, 5);*/
/*rounded_corner_outside_fillet(10, 8);*/

module outside_fillet_for_cube_with_rounded_corners(cube_size, corner_radius, fillet_radius, center = false, center_x = false, center_y = false) {
  translate([(center || center_x ? -cube_size[0] / 2 : 0), (center || center_y ? -cube_size[1] / 2 : 0), 0]) {
    for (my = [0, 1]) translate([0, (my == 1 ? cube_size[1] : 0)]) mirror([0, my, 0]) {
      translate([corner_radius, corner_radius, 0]) rotate(180) rounded_corner_outside_fillet(corner_radius, fillet_radius);
      translate([cube_size[0] - corner_radius, corner_radius, 0]) rotate(-90) rounded_corner_outside_fillet(corner_radius, fillet_radius);
      translate([corner_radius, 0, 0]) mirror([0, 1, 0]) fillet_x(fillet_radius, cube_size[0] - 2 * corner_radius);
    }
    for (mx = [0, 1]) translate([(mx == 1 ? 0 : cube_size[0]), 0, 0]) mirror([mx, 0, 0]) translate([0, corner_radius, 0]) fillet_y(fillet_radius, cube_size[1] - 2 * corner_radius);
  }
}
/*outside_fillet_for_cube_with_rounded_corners([100, 60], 10, 5);*/
/*outside_fillet_for_cube_with_rounded_corners([100, 60], 10, 5, center = true);*/
