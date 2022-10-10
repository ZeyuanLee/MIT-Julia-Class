
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

#Section 3

#functions: Long term,short term,annoynomous term

#Long term:
function f₁(x;α=2)
    return x.^α
end
f₁([1,2,3])

#Short term
f₂(x;α=2)=x.^α
f₂([1,3,5];α=5)

#annoynomous term
((x;α=2) -> x.^α)(3;α=4) 

#annoynomous term with a name
f₃=((x;α=2) -> x.^α)
f₃(5)


#AutoDiff for univariate
using ForwardDiff: derivative
derivative(f₃,5)


#Scalar Valued Multivariate Functions
begin
    f(v::Array)=sin(v[1]+v[2])-cos(v[3]) #function of a vector
    f(x,y,z::Integer)=sin(x+y)-cos(z) #function of 3 arguments
end
f([1,2,3])
f(1,2,3)

methods(f)

#Scalar valued multivariate functions
using ForwardDiff:gradient
gradient(f,[1,2,3])


#congruent parallelograms 全等的平行四边形

#vector valued multivariate transformations
using ForwardDiff:jacobian
trans(β::Integer=3) = ((x,y),) -> [β*(x+y),x-y]
trans()([1,2])
jacobian(trans(3),[1,2])

function trans₂((x,y);β=2)
    return [β*(x+y),x-y]
end
trans₂([1,2])
jacobian(trans₂,[1,2])

function trans4(γ=2)
    ((x,y),) -> begin
        [γ*x,y]
    end
end
jacobian(trans4(),[2,3])

scalex(α) = ((x,y),) -> [α*x, y]
scalex(5)([1,2])
matA=jacobian(scalex(5),[1,2])

using LinearAlgebra:det
det(matA)