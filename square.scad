
module square2(size, center = false, center_xy = false, center_x = false, center_y = false) {
  translate([(center || center_x || center_xy ? -size[0]/2 : 0), (center || center_y || center_xy ? -size[1]/2 : 0)]) square(size);
}
/*!square2([5, 7]);*/
/*!square2([5, 7], center_x = true, center_y = false, center_z = true);*/
/*!square2([5, 7], center = true);*/
