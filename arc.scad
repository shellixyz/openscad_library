
module arc(length, width, radius, n=100) {
    alpha = 360 * (length - width) / (2 * PI * radius);
    for (i = [0:n]) rotate(i * alpha / n - alpha / 2) translate([radius, 0, 0]) circle(d=width);
}
/*arc(20, 5, 10);*/
