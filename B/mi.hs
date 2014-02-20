jacobi n a b xprev = (\i->1/a i i*(b i-sum [a i j*xprev j|j<-filter (/=i)[1..n]]))

gaussSeidel n a b xprev = xnow 
	where xnow i = 1/a i i*(b i-sum [a i j*xnow j|j<-[1..i-1]]-sum [a i j*xprev j|j<-[i+1..n]])

case1 = (a,b,n) where
	n = 3
	a = listArray ((1,1),(n,n)) [
		2,	-1,	1,
		2,	2,	2,
		-1,	-1,	2
		] !
	b = listArray (1,n) [-1,4,-5] !


