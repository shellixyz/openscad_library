
module elliptic_prism(r_x, r_y, height, center=false) {
  scale([1, r_y / r_x, 1]) cylinder(r=r_x, h=height, center=center);
}
/*elliptic_prism(10, 20, 5);*/
/*elliptic_prism(10, 20, 5, center=true);*/
