using Plots
using Images
using ImageView:imshow
using Colors, ColorSchemes
using Statistics:mean
using Pluto
outer(v,u)=[x*y for x in v, y in u]
# plot(outer_product)#折线图
# histogram([u for u in 1:10],bins=10)#直方图
# imshow(outer_product)
w=50
# imshow(outer([1; 0.4; 10*rand(50)], rand(w)))
# M=1
# get.(Ref(ColorSchemes.rainbow), M ./ maximum(M))
# typeof(Ref(ColorSchemes.rainbow))
# typeof(ColorSchemes.rainbow)
# sizeof(ColorSchemes.rainbow)
# ColorSchemes.rainbow

begin
	show_image(M) = get.(Ref(ColorSchemes.rainbow), M ./ maximum(M))
	show_image(x::AbstractVector) = show_image(x')
end

# show_image(outer([1,2],[1,3]))

image=outer([0.5;0.2;rand(20)],rand(w)); #image is a rank-1 matrix
show_image(image)
#sizeof 用于string  size用于数组

noise_para=0.03
noise_image=image.+noise_para.*randn.();
# noise_image2=image .+ noise_para.* randn.();
show_image(noise_image)

# show_image(image[1:2,:])
xx=image[1,:]
yy=image[2,:]

xs=noise_image[1,:]
ys=noise_image[2,:]

gr()
scatter(xs, ys, label="noisy", m=:., alpha=0.3, ms=4, ratio=1)
scatter!(xx,yy,label="pure")

#de meaning
xs_centered=xs .- mean(xs);
ys_centered=ys .- mean(ys);

scatter(xs_centered,ys_centered,ms=5, alpha=0.5, ratio=1, leg=false, framestyle=:origin)
#ms: size of dots   #alpha :transpracy of dots #ratio: step ratio of y-axis/x-axis   
scatter!(xs_centered,zero(ys_centered))
for i in 1:length(xs_centered)
	plot!([xs_centered[i],xs_centered[i]],[ys_centered[i],0],leg=false,framestyle=:origin,ls=:dash,c=:black,
	alpha=0.7);
end
#leg: legend
#framestyle

plot!()
# plot([0.5,0.3],[0,0.1])

σ_x=√(mean(xs_centered.^2))
σ_y=√(mean(ys_centered.^2))

M=[xs_centered,ys_centered]'
using Statistics:cov

scatter(xs_centered,ys_centered,framestyle=:origin,grid=false)
vline!([2*σ_x,-2*σ_x],ls=:dash,lw=0.5,linecolor=:blue,linealpha=:0.5,leg=false)
hline!([2*σ_y,-2*σ_y],lineshape=:dash,linewidth=0.5,linecolor=:blue,linealpha=:0.5,leg=false)
#lineshape 不好使 ls 好使
annotate!()

