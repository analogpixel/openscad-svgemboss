_emboss_f=false;
_emboss_m=false;
_tab=true;
_file="dragon2.svg";
_offset=1;
_size=60; // square size that it sits in
height=2; // how tall is the part seems like shorter might be better
thick=2; // how thick is the part
$fn=100;

module render_emboss_f() {

  difference() {
    linear_extrude(height + thick, convexity=10) square(_size+4, center=true);
    color("blue") translate([0,0,-1]) resize([_size,_size,0]) linear_extrude(height+thick+100, convexity = 10) offset(delta=_offset) import(_file, center=true);
  }
}

module render_emboss_m() {
  union() {
    linear_extrude(thick, convexity=10 ) square(_size+4, center=true);
    linear_extrude(thick+height, convexity=10) resize([_size,_size,0]) import(_file, center=true);
  }
}

if ( _emboss_m ) { 
  if (_tab) {
    union(){
      render_emboss_m(); 
      translate([(_size+_size/2),_size/2-5,0]) cylinder(r=2, h=height+thick+5);
      translate([(_size+_size/2),-_size/2+5,0]) cylinder(r=2, h=height+thick+5);
      linear_extrude(thick) translate([(_size+4)/2,-(_size+4)/2,0]) square(_size+4);
    }
  } else {
    render_emboss_m(); 
  }
}

if ( _emboss_f ) { 
  if (_tab) {

    difference() {    
      union(){
        render_emboss_f(); 
        linear_extrude(thick+height) translate([(_size+4)/2,-(_size+4)/2,0]) square(_size+4);
      }

      union()  {
        translate([(_size+_size/2),_size/2-5,0]) cylinder(r=2, h=height+thick+5);
        translate([(_size+_size/2),-_size/2+5,0]) cylinder(r=2, h=height+thick+5);
      }


    }
  } else {
    render_emboss_f(); 
  }
}

