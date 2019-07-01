
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

module arc_ir_or(angle, length, ir, or, square_ends=false, center=false, n=100) {
    width = or - ir;
    radius = ir + width / 2;
    arc(angle=angle, length=length, width=width, radius=radius, square_ends=square_ends, center=center, n=n);
}
/*arc_ir_or(length=20, ir=7.5, or=12.5);*/
/*arc_ir_or(angle=180, ir=7.5, or=12.5);*/
/*arc_ir_or(angle=180, ir=7.5, or=12.5, square_ends=true);*/
