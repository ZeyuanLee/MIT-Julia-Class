N=6

function simulate(N::Int=6,p::Float64=0.1)
    v=fill(0,N,N)

    t=0
    while t < 10
        for i in 1:N, j in 1:N
            if rand()<p && v[i,j]==0
             v[i,j]=t
            end
        end
        t+=1
    end
    
    return v
end
simulation=simulate(10,0.5)


rectangle(w,h,x,y)= (x .+ [0,w,w,0], y .+ [0,0,h,h])# 给出矩形的四个顶点
circle(r,x,y)=(θ=LinRange(0,2π,30);(x.+r.*cos.(θ),y.+r.*sin.(θ)))

plot(ratio=1, legend=false, axis=false, ticks=false)

tt=5
begin
    w=.9
    h=.9
    c=[RGB(0,1,0), RGB(1,0,0), :purple][1 .+ (simulation .< tt) .+ (simulation .<  (tt.-1))]#hvcat?

    for i in 1:N,j in 1:N
        plot!(rectangle(w,h,i,j),fill=true,alpha=1,c=:green)
        plot!(circle(0.3,i+0.45,j+0.45),fill=true,alpha=0.5,c=:red)
        annotate!
    end
end
plot!(lims=(0.5, N+1.1), title="time = $(tt-1);  failed count: $(sum(simulation.<tt))")

repeat("<br>",5)
"<br>"^5


#create a new type
struct Bernoulli
    p::Float64
end

BB=Bernoulli(0.2)
Base.rand(x::Bernoulli)=Int(rand()< x.p)
rand(BB)
