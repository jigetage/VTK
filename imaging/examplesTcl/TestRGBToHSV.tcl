# Use the painter to draw using colors.
# This is not a pipeline object.  It will support pipeline objects.
# Please do not use this object directly.

catch {load vtktcl}
if { [catch {set VTK_TCL $env(VTK_TCL)}] != 0} { set VTK_TCL "../../examplesTcl" }
if { [catch {set VTK_DATA $env(VTK_DATA)}] != 0} { set VTK_DATA "../../../vtkdata" }


source vtkImageInclude.tcl

vtkImageCanvasSource2D imageCanvas
imageCanvas SetNumberOfScalarComponents 3
imageCanvas SetScalarType $VTK_UNSIGNED_CHAR
imageCanvas SetExtent 0 320 0 320 0 0
imageCanvas SetDrawColor 0 0 0
imageCanvas FillBox 0 511 0 511

# r, g, b
imageCanvas SetDrawColor 255 0 0
imageCanvas FillBox 0 50 0 100
imageCanvas SetDrawColor 128 128 0
imageCanvas FillBox 50 100 0 100
imageCanvas SetDrawColor 0 255 0
imageCanvas FillBox 100 150 0 100
imageCanvas SetDrawColor 0 128 128
imageCanvas FillBox 150 200 0 100
imageCanvas SetDrawColor 0 0 255
imageCanvas FillBox 200 250 0 100
imageCanvas SetDrawColor 128 0 128
imageCanvas FillBox 250 300 0 100

# intensity scale
imageCanvas SetDrawColor 5 5 5
imageCanvas FillBox 0 50 110 210
imageCanvas SetDrawColor 55 55 55
imageCanvas FillBox 50 100 110 210
imageCanvas SetDrawColor 105 105 105
imageCanvas FillBox 100 150 110 210
imageCanvas SetDrawColor 155 155 155
imageCanvas FillBox 150 200 110 210
imageCanvas SetDrawColor 205 205 205
imageCanvas FillBox 200 250 110 210
imageCanvas SetDrawColor 255 255 255
imageCanvas FillBox 250 300 110 210

# saturation scale
imageCanvas SetDrawColor 245 0 0
imageCanvas FillBox 0 50 220 320
imageCanvas SetDrawColor 213 16 16
imageCanvas FillBox 50 100 220 320
imageCanvas SetDrawColor 181 32 32
imageCanvas FillBox 100 150 220 320
imageCanvas SetDrawColor 149 48 48
imageCanvas FillBox 150 200 220 320
imageCanvas SetDrawColor 117 64 64
imageCanvas FillBox 200 250 220 320
imageCanvas SetDrawColor 85 80 80
imageCanvas FillBox 250 300 220 320


vtkImageRGBToHSV convert
convert SetInput [imageCanvas GetOutput]

vtkImageExtractComponents extract
extract SetInput [convert GetOutput]
extract SetComponents 2

vtkImageViewer viewer
viewer SetInput [extract GetOutput]
viewer SetColorWindow 256
viewer SetColorLevel 127.5
#viewer SetInput [imageCanvas GetOutput]

# make interface
source WindowLevelInterface.tcl





