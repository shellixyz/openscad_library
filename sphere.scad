
use <cube.scad>

module half_sphere(d, r) {
  if (d == undef) {
    d = 2 * r;
    intersection() {
      sphere(r=r);
      cube2([d, d, d], center_xy = true);
    }
  } else {
    intersection() {
      sphere(d=d);
      cube2([d, d, d], center_xy = true);
    }
  }
}
/*half_sphere(r=3);*/
/*half_sphere(d=6);*/

module half_sphere_shell(d, r, thickness)
{
    difference() {
        half_sphere(d, r);
        if (d == undef) {
          sphere(r=r-thickness);
        } else {
          sphere(d=d-2*thickness);
        }
    }
}
/*half_sphere_shell(d=10, thickness=1);*/

module ellipsoid(x, y, z) {
  scale([1, y / x, z / x]) sphere(d=x);
}
/*ellipsoid(10, 20, 30);*/

module half_ellipsoid(x, y, z) {
  intersection() {
    sphere2(x, y, z);
    cube2([x, y, z], center_xy = true);
  }
}
/*half_ellipsoid(10, 20, 30);*/
