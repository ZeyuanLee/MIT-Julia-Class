
#So let's suppose that n times a day, a proportion p fail.Then the number remaining 
#after k days is:
#Nₖ=N₀(1-p/n)^(nk)
#N₀ is the initial number

N₀=100
T=20 #days

using Plots
begin
    N₀=100
    T=20 #days
    p=0.4
    N=[N₀*(1-p)^t for t in 0:T]
    plot(0:T,N,alpha=0.5,ms=3,label="once a day",lw=2,m=:'*')

    n=4
    N=[N₀*(1-p/(2^n))^(t) for t in 0:(2^n)*T]
    plot!(0:1/(2^n):T,N,alpha=0.5,ms=3,c=:green,label="$(2^n) times a day",lw=2,m=:'*')

    xlabel!("days")
    ylabel!("functioning amount")

    plot!(t -> N₀*exp(-p*t),c=:red,lw=2,label="continuous")
end


#agents can be susceptible (S) and infectious (I),recovery (R)
#That person will be chosen at random from the total population of size N
#the infection attempt is successful, with probability b
#recovery with probability c
 
# \begin{align}
# s_{t+1} &= s_t - b \, s_t \, i_t \\
# i_{t+1} &= i_t + b \, s_t \, i_t - c \, i_t\\
# r_{t+1} &= r_t + c \, i_t
# \end{align}

function discrete_SIR(T;s₀=0.99,i₀=.01,r₀=0.0,b=0.1,c=0.01)
    ss=s₀
    ii=i₀
    rr=r₀

    results=[(ss=ss,ii=ii,rr=rr)]#具名元组的向量Vector{NamedTuple{(:ss, :ii, :rr), Tuple{Float64, Float64, Float64}}}
    for day in 1:T
        new_s=ss-b*ss*ii
        new_i=ii+b*ss*ii-c*ii
        new_r=rr+c*ii

        push!(results,(ss=new_s,ii=new_i,rr=new_r))

        ss=new_s
        ii=new_i
        rr=new_r
    end

    results
end
T=500
infection_results=discrete_SIR(T)

begin
    day=0:T
    plot(day,[x.ss for x in infection_results],c=:purple)
    plot!(day,[x.ii for x in infection_results],c=:red)
    plot!(day,[x.rr for x in infection_results],c=:green)
	xlims!(0, 500)

end
