
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

#Section 4
using LinearAlgebra:inv
A=[1 2; 3 4]
B=rand(2,2)
v=[1,2]

multi_A = v -> A*v
multi_B = v -> B*v
(multi_A∘multi_B)(v) ≈ A*B*v

inv(A)
A*inv(A) == [1 0; 0 1]

#section 5
using Symbolics
using ForwardDiff:derivative

@variables x y ϵ
f(x)= x^3-5
df(x)=derivative(testfun,x)
expand(df)
f(y)
df(y)
expand(f(y+ϵ))

function newton1d(f::Function,x₀)
    f′(x)=derivative(f,x)
    x=x₀
    for i ∈ 1:10
        x=x-f(x)/f′(x)
    end
    return x
end

f(y)
typeof(f(y))

typeof(f(x))
typeof(f)
newton1d(x -> x^3-3x-3,2)
root=newton1d(f,3)
f(root)

#lecture 1.9 structure
using PlutoUI
with_terminal()do #with terminial with PlutoUI.jl
    dump(A)
end

#store different numbers when using different structure
#Diagonal 
using LinearAlgebra:Diagonal
dense_D=[2 0 0;0 5 0; 0 0 7]
dump(dense_D)

diag_D=Diagonal(dense_D)
dump(diag_D)
supertypes(Diagonal)

Diagonal([1,2,3])

#---Sparse Matrix
using SparseArrays:sparse
testD_=[5 0 0;0 0 0; 0 0 20]
spar_D=sparse(testD_)
dump(spar_D)

rands_num=rand(1:10,50)
[sum(rands_num.==i) for i in 1:5]

#Julia: Exceptions are thrown (generated) using error

if rands_num[1]!= 1 
    error("The first number is not 1")
end