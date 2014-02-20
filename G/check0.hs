main = do
	coeffs<-(readFile "b.txt" >>= return.map read.lines :: IO [Double])
	pts <- readFile "test">>=return.map (map (read::String->Double)).map words.take 21.drop 1.lines
	print $ zipWith3 (\[x0,y0] [x1,y1] [ai,bi,ci,di] -> ((ai-y0)/y0,(ai+bi*(x1-x0)+ci*(x1-x0)^2+di*(x1-x0)^3-y1)/y1)) pts (tail pts) (g4 coeffs)

g4 (a:b:c:d:r) = [a,b,c,d]:g4 r
g4 [] = [];
