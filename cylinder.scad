
module elliptic_prism(r_x, r_y, height, center=false) {
  scale([1, r_y / r_x, 1]) cylinder(r=r_x, h=height, center=center);
}
/*elliptic_prism(10, 20, 5);*/
/*elliptic_prism(10, 20, 5, center=true);*/

module cylinder_rounded_edges(r, d, h, edges_radius, center=false) {
    translate([0, 0, (center ? 0 : edges_radius)]) minkowski() {
        if (r != undef)
            cylinder(r=r - edges_radius, h=h - 2 * edges_radius, center=center);
        else
            cylinder(d=d - 2 * edges_radius, h=h - 2 * edges_radius, center=center);
        sphere(r=edges_radius);
    }
}
/*cylinder_rounded_edges(d=10, h=10, edges_radius=3);*/
/*cylinder_rounded_edges(r=5, h=10, edges_radius=3);*/
/*cylinder_rounded_edges(d=10, h=10, edges_radius=3, center=true);*/
