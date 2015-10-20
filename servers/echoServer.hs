import Control.Monad (forever)
import System.IO (hGetContents)
import Network (listenOn, accept, PortID(..), Socket)
--simple echo server. single threaded
main = do
  sock <- listenOn $ PortNumber 9999
  putStrLn $ "Listening on 9999"
  forever $ accept' sock

accept' :: Socket -> IO ()
accept' sock = do
  (handle, _, _) <- accept sock
  cont <- hGetContents handle
  putStrLn ("received:")
  putStrLn cont
