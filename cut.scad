
cut_max_size = 10000;

use <cube.scad>;
use <mirror.scad>;

module cut_x(pos_x = 0, negative = true) {
    intersection() {
        children();
        translate([pos_x, 0, 0]) mirror_x(negative) cube2([cut_max_size, cut_max_size, cut_max_size], center_y = true, center_z = true);
    }
}

module cut_y(pos_y = 0, negative = true) {
    intersection() {
        children();
        translate([0, pos_y, 0]) mirror_y(negative) cube2([cut_max_size, cut_max_size, cut_max_size], center_x = true, center_z = true);
    }
}

module cut_z(pos_z = 0, negative = true) {
    intersection() {
        children();
        translate([0, 0, pos_z]) mirror_z(negative) cube2([cut_max_size, cut_max_size, cut_max_size], center_x = true, center_y = true);
    }
}

