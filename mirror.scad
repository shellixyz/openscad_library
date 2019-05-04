
module mirror_x(do_it = true) {
  mirror([(do_it ? 1 : 0), 0, 0]) children();
}

module mirror_y(do_it = true) {
  mirror([0, (do_it ? 1 : 0), 0]) children();
}

module mirror_z(do_it = true) {
  mirror([0, 0, (do_it ? 1 : 0)]) children();
}

module mirror_xy(do_it = true) {
  mirror([(do_it ? 1 : 0), 0, 0]) mirror([0, (do_it ? 1 : 0), 0]) children();
}

module mirror_copy_x() {
    for (mx = [0, 1]) mirror([mx, 0, 0]) children();
}

module mirror_copy_y() {
    for (my = [0, 1]) mirror([0, my, 0]) children();
}

module mirror_copy_z() {
    for (mz = [0, 1]) mirror([0, 0, mz]) children();
}

module mirror_copy_xy() {
    for (mx = [0, 1]) mirror([mx, 0, 0]) for (my = [0, 1]) mirror([0, my, 0]) children();
}

module mirror_copy_center_xy() {
    for (m = [0, 1]) mirror([m, 0, 0]) mirror([0, m, 0]) children();
}
