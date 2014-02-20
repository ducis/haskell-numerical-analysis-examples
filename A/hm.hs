import Data.Array
ts = [0,3,5,8,13]::[Double]
xs = [0,225,385,623,993]
x's= [75,77,80,74,72]
[t,x,x'] = [(listArray (0,4) l!) | l<-[ts,xs,x's]]

l::Int->(Int->Double)->Int->Double->Double
l n xs k x = product [(x-xs i)/(xs k-xs i)|i<-[0..(k-1)]++[(k+1)..n]]

alpha n xs j x = (1-2*(x-xs j)*sum[1/(xs j-xs k)|k<-filter (/=j) [0..n]])*(l n xs j x)^2::Double
beta n xs j x = (x-xs j)*(l n xs j x)^2::Double
h::Int->(Int->Double)->(Int->Double)->(Int->Double)->Double->Double
h n is os ms x = sum [os j*(alpha n is j x)+ms j*(beta n is j x)|j<-[0..n]]
