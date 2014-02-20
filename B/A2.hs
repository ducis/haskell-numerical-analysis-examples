import Text.Printf
import Data.List
t = ([0,3,5,8,13]!!)
y = ([0,225,385,623,993]!!)
z = ([75,77,80,74,72]!!)
main = p my>>p mz where
	p = mapM_ (\l->putStrLn (concat $ intersperse "\t\t" $ map show l))
	my = [ [ (t j)^i |i<-[0..9]] |j<-[0..4]]
	mz = [ 0:[ i*(t j)^(i-1) |i<-[1..9]] |j<-[0..4]]
