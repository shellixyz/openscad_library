
module arc(angle, length, width, radius, square_ends=false, center=false, n=100) {
    translate([(center ? -radius : 0), 0, 0]) if (length != undef) {
        alpha = 360 * (length - (square_ends ? 0 : width)) / (2 * PI * radius);
        difference() {
            for (i = [0:n]) rotate(i * alpha / n - alpha / 2) translate([radius, 0, 0]) circle(d=width);
            if (square_ends) {
                rotate(-alpha / 2) translate([radius - width / 2 - 1, 0, 0]) mirror([0, 1, 0]) square([width + 2, width + 2]);
                rotate(alpha / 2) translate([radius - width / 2 - 1, 0, 0]) square([width + 2, width + 2]);
            }
        }
    } else if (angle != undef) {
        difference() {
            for (i = [0:n]) rotate(i * angle / n - angle / 2) translate([radius, 0, 0]) circle(d=width);
            if (square_ends) {
                rotate(-angle / 2) translate([radius - width / 2 - 1, 0, 0]) mirror([0, 1, 0]) square([width + 2, width + 2]);
                rotate(angle / 2) translate([radius - width / 2 - 1, 0, 0]) square([width + 2, width + 2]);
            }
        }
    } else echo("arc: parms error");
}
/*arc(length=20, width=5, radius=10);*/
/*arc(length=20, width=5, radius=10, square_ends=true);*/
/*arc(angle=180, width=5, radius=10);*/
/*arc(angle=90, width=5, radius=10, square_ends=true);*/
