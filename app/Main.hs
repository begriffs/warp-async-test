{-# LANGUAGE OverloadedStrings #-}

import Control.Concurrent (threadDelay)
import Network.Wai (responseLBS, Application)
import Network.Wai.Handler.Warp (run)
import Network.HTTP.Types (status200)
import Network.HTTP.Types.Header (hContentType)

main = do
    let port = 3000
    putStrLn $ "Listening on port " ++ show port
    run port app

app :: Application
app req f = do
  threadDelay 10000000
  f $ responseLBS status200
    [(hContentType, "text/plain")] "Oh, you woke me up!"
