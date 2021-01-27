bin=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD
fn=emboss.scad

define create-part
	$(bin) -o $(@).stl $(fn)
endef

open:
	$(bin) $(fn) &

emboss_f:
	$(create-part) -D "_emboss_f=true"

emboss_m:
	$(create-part) -D "_emboss_m=true"

all: emboss_f emboss_m

clean:
	rm *.stl
