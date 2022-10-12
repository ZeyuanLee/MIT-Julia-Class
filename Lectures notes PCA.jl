using Plots
using Images
using ImageView:imshow
outer(v,u)=[x*y for x in v, y in u]
# plot(outer_product)#折线图
# histogram([u for u in 1:10],bins=10)#直方图
# imshow(outer_product)
w=100
imshow(outer([1; 0.4; 10*rand(50)], rand(w)))
M=1
get.(Ref(ColorSchemes.rainbow), M ./ maximum(M))
typeof(Ref(ColorSchemes.rainbow))
typeof(ColorSchemes.rainbow)
sizeof(ColorSchemes.rainbow)
ColorSchemes.rainbow

begin
	show_image(M) = get.(Ref(ColorSchemes.rainbow), M ./ maximum(M))
	show_image(x::AbstractVector) = show_image(x')
end

show_image(outer([1,2],[1,3]))