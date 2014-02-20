coeffs<-(readFile "b.txt" >>= return.map read.lines :: IO [Double])
pts <- readFile "test">>=return.map (map (read::String->Double)).map words.take 21.drop 1.lines
zipWith (\[x,y] [a,b,c,d] -> (a+b*x+c*x^2+d*x^3-y)/y) (tail pts) cs
