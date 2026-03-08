$fs = 0.01;

module spooncut(

    size,
    radius


) {

  width = size[0];
  length = size[1];
  height = size[2];


  module roundCut1() {
        translate([0, 0, 0])
      difference() {
        translate([0, 0, 0])
          cube([2*radius, 2*radius, length]);
        translate([2*radius, 2*radius, 0]) {
          cylinder(h = length, r = 2*radius);

        }
      }
    ;
  }

  module roundCut2() {
    translate([-2*radius, 0, 0])
      difference() {
        translate([2*radius, 0, 0])
          cube([2*radius, 2*radius, length]);
        translate([2*radius, 2*radius, 0]) {
          cylinder(h = length, r = 2*radius, );

        }
      }
    ;
  }

  module roundCut3() {
    translate([0, -2*radius, 0])
      difference() {
        translate([0, 2*radius, 0])
          cube([2*radius, 2*radius, length]);
        translate([2*radius, 2*radius, 0]) {
          cylinder(h = length, r = 2*radius, );

        }
      }
    ;
  }

  module roundCut4() {
    translate([-2*radius, -2*radius, 0])
      difference() {
        translate([2*radius, 2*radius, 0])
          cube([2*radius, 2*radius, length]);
        translate([2*radius, 2*radius, 0]) {
          cylinder(h = length, r = 2*radius, );

        }
      }
    ;
  }
    
  translate([-width/2, length/2, 0 ])  {
    rotate([90,0,0])  {
        translate([2*radius, 0, 0 ])  
            union() {
                difference() {
                cube([width - 4*radius, height, length]);
                roundCut1();
                translate([width - 4*radius - 2*radius, 0, 0])
                    roundCut2();

                }

                translate([width - 4*radius, height - 2*radius, 0])
                roundCut3();

                translate([-2*radius, height - 2*radius, 0])
                roundCut4();
            }
    }

  }

}


// spooncut([120, 60, 30], 5);
