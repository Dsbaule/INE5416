module Main (main) where

import WriteContact, ShowContacts

callprogram :: String
callprogram 'w' = (writeContact) (main)
callprogram 's' = (showContacts) (main)
callprogram 's' = (print "Saindo")
callprogram _ = (main)

main = do
    input <- getLine
    (callprogram input)
