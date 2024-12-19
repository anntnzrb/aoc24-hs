module Main where

import Data.List (sort, transpose)
import Data.Text qualified as T
import Data.Text.IO qualified as T
import Text.Printf

type LocationID = Int
type LocationList = [LocationID]
type LocationPair = (LocationList, LocationList)

parseInput :: T.Text -> LocationPair
parseInput s = case transpose parsed of
    [xs, ys] -> (sort xs, sort ys)
    _ -> error "Invalid. Expected exactly 2 lists."
  where
    notEmptyText = not . T.null
    text2Int = read . T.unpack
    parsed = map text2Int . filter notEmptyText . T.splitOn " " <$> T.lines s

calcDistance :: LocationPair -> Int
calcDistance (xs, ys) = sum $ zipWith diff xs ys
  where
    diff x y = abs $ x - y

solve :: LocationPair -> Int
solve = calcDistance

main :: IO ()
main = do
    input <- parseInput <$> T.readFile "./inputs/day01.in"
    printf "Part 1: %d\n" $ solve input
