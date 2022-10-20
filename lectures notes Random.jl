
rand(1:6)#a random number from the collection
rand('a':'z')
using Colors:distinguishable_colors
rand(distinguishable_colors(5))


#several random objects from a collection
[rand(1:6) for i in 1:10]#equivalance to the next row
rand(1:6,10)
rand(1:6,5,5)

#percolatin theory渗透理论 droplet小滴 hover 悬停 徘徊

using StatsBase:countmap
chars=rand('a':'c',10)
dic=countmap(chars)
dic['a']
'd' => 8#a pair
typeof('d' => 8)#dictionary are collections of "pairs"
dic['d']=8#add a new pair into the dictionary
dic

counts=[count(chars .== i) for i in 'a':'c']


#tossing a weighted coin 
f=rand(1:10)<7 ? "head" : "tails"

using Plots:bar,histogram
bar('a':'c',counts)
histogram(counts,alpha=0.5,norm=false,bins=10)

#roll dices 
n=10#the number of dices
one_exp(n)=sum(rand(1:6,n))
one_exp(n)

exper_times=10000
out_come=[one_exp(n) for i in 1:exper_times]
histogram(out_come,norm=true)
normal_out_come=(out_come.-mean(out_come))./std(out_come)
# histogram(normal_out_come,norm=true)

#center limit law