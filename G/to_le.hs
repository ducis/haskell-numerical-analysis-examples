main = interact $ show.build.read
build_le (pts,addons) = zipWith (normal_eq (4*(length pts-1)) pts) [0..]
normal_eq width (x,fx) i = 
	
