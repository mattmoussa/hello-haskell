import System.Environment

main :: IO ()
main = getArgs >>= print . haqify . head

haqify = ("Haq! " ++)
