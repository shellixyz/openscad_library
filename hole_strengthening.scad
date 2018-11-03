
use <tube.scad>;

// used with 3D printing to print more walls for a particular hole, tested with slic3r
// should make the slicer produce 1 more wall per multiplier unit
module hole_strengthening(d, h, printer_wall_thickness, multiplier = 1, center = false) {
  for (i = [ 1 : multiplier ]) tube(id=d + 2 * i * printer_wall_thickness + 2 * (i-1) * 0.1, thickness = 0.1, h=h, center = center);
}
