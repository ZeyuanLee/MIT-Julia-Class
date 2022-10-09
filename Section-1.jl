
dump(1:10)
#dump(x; maxdepth=8)
#Show every part of the representation of a value. The depth of the output is truncated at maxdepth.
collect(1:10)

using Colors: RGB
RGB(0.5,0.4,0.3)


using Pluto
using PlutoUI 
using Colors, ColorVectorSpace, ImageShow, FileIO, ImageIO
using Unitful 
using ImageFiltering
using OffsetArrays
using Plots

