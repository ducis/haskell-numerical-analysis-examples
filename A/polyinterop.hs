import Text.Printf


f x = 1/(1+x^2)

pts::Int->[Double]
pts n = [fromIntegral i/fromIntegral n*10-5|i<-[0..n]]

l::Int->(Int->Double)->Int->Double->Double
l n xs k x = product [(x-xs i)/(xs k-xs i)|i<-[0..(k-1)]++[(k+1)..n]]

l'::Int->Double->(Int->Double)->(Int->Double)->Double
l' n x xs ys = sum [ys k*l n xs k x|k<-[0..n]]


p::Int->Double->Double
p n x = l' n x xs ys where 
	xs = (pts n!!)
	ys = f.xs

main = putStrLn $ unlines [test (n::Int)|n<-[4,8,16]] where
	testxs = pts 32::[Double]
	test n = printf "N=%d\n" n ++ unlines [concat (map prt [x, p n x, f x])|x<-testxs]
--		[ concat [prt x|x<-testxs] , concat [prt (p n x)|x<-testxs], concat [prt (f x)|x<-testxs] ] 
	prt = printf "%.3f\t"
