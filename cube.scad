
module cube2(size, center = false, center_xy = false, center_x = false, center_y = false, center_z = false) {
  translate([(center || center_x || center_xy ? -size[0]/2 : 0), (center || center_y || center_xy ? -size[1]/2 : 0), (center || center_z ? -size[2]/2 : 0)]) cube(size);
}
/*!cube2([5, 7, 10]);*/
/*!cube2([5, 7, 10], center_x = true, center_y = false, center_z = true);*/
/*!cube2([5, 7, 10], center = true);*/

module cube_rounded_corners(size, corner_radius, center = false, center_xy = false, center_x = false, center_y = false, center_z = false) {
  base_size = [ for (c = size) c - 2 * corner_radius ];
  /*for (c = base_size) assert(c > 0); // XXX need 2017 openscad*/ 
  translate([(center || center_x || center_xy ? -size[0]/2 : 0) + corner_radius, (center || center_y || center_xy ? -size[1]/2 : 0) + corner_radius, (center || center_z ? -size[2]/2 : 0) + corner_radius]) minkowski() {
    cube(base_size);
    sphere(r=corner_radius);
  }
}
/*!cube_rounded_corners([5, 7, 10], corner_radius = 2, center_x = true, center_y = false, center_z = true);*/
/*!cube_rounded_corners([5, 7, 10], corner_radius = 2, center = true);*/

module cube_rounded_top_corners(size, corner_radius, center = false, center_xy = false, center_x = false, center_y = false, center_z = false) {
    intersection() {
        translate([0, 0, -corner_radius]) cube_rounded_corners([size[0], size[1], size[2] + corner_radius], corner_radius, center, center_xy, center_x, center_y, center_z);
        cube2(size, center, center_xy, center_x, center_y, center_z);
    }
}

module cube_rounded_vertical_edges(size, corner_radius, center_xy = false, center = false, center_x = false, center_y = false, center_z = false) {
  base_size = [ size[0] - 2 * corner_radius, size[1] - 2 * corner_radius, size[2] - 0.1 ];
  /*for (c = base_size) assert(c > 0); // XXX need 2017 openscad*/ 
  translate([(center || center_x || center_xy ? -size[0]/2 : 0) + corner_radius, (center || center_y || center_xy ? -size[1]/2 : 0) + corner_radius, (center || center_z ? -size[2]/2 : 0)]) minkowski() {
    cube(base_size);
    cylinder(r=corner_radius, h=0.1);
  }
}
module cube_rounded_z_edges(size, corner_radius, center_xy = false, center = false, center_x = false, center_y = false, center_z = false) { cube_rounded_vertical_edges(size, corner_radius, center_xy, center, center_x, center_y, center_z); }
/*!cube_rounded_z_edges([5, 7, 10], 2);*/
/*!cube_rounded_vertical_edges([5, 7, 10], 2);*/
/*!cube_rounded_vertical_edges([5, 7, 10], corner_radius = 2, center_x = true, center_y = false, center_z = true);*/
/*!cube_rounded_vertical_edges([5, 7, 10], corner_radius = 2, center = true);*/

module cube_rounded_x_edges(size, corner_radius, center_xy = false, center = false, center_x = false, center_y = false, center_z = false) {
  base_size = [ size[0] - 0.1, size[1] - 2 * corner_radius, size[2] - 2 * corner_radius];
  /*for (c = base_size) assert(c > 0); // XXX need 2017 openscad*/ 
  translate([(center || center_x || center_xy ? -size[0]/2 : 0), (center || center_y || center_xy ? -size[1]/2 : 0) + corner_radius, (center || center_z ? -size[2]/2 : 0) + corner_radius]) minkowski() {
    cube(base_size);
    rotate([0, 90, 0]) cylinder(r=corner_radius, h=0.1);
  }
}
!cube_rounded_x_edges([5, 7, 10], 2);
/*!cube_rounded_x_edges([5, 7, 10], corner_radius = 2, center_x = true, center_y = false, center_z = true);*/
/*!cube_rounded_x_edges([5, 7, 10], corner_radius = 2, center = true);*/

module cube_rounded_y_edges(size, corner_radius, center_xy = false, center = false, center_x = false, center_y = false, center_z = false) {
  base_size = [ size[0] - 2 * corner_radius, size[1] - 0.1, size[2] - 2 * corner_radius];
  /*for (c = base_size) assert(c > 0); // XXX need 2017 openscad*/ 
  translate([(center || center_x || center_xy ? -size[0]/2 : 0) + corner_radius, (center || center_y || center_xy ? -size[1]/2 : 0), (center || center_z ? -size[2]/2 : 0) + corner_radius]) minkowski() {
    cube(base_size);
    rotate([90, 0, 0]) cylinder(r=corner_radius, h=0.1);
  }
}
/*!cube_rounded_y_edges([5, 7, 10], 2);*/
/*!cube_rounded_y_edges([5, 7, 10], corner_radius = 2, center_x = true, center_y = false, center_z = true);*/
/*!cube_rounded_y_edges([5, 7, 10], corner_radius = 2, center = true);*/
