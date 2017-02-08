{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_haq (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\Matt\\Desktop\\Stuff\\porf\\hello-haskell\\.cabal-sandbox\\bin"
libdir     = "C:\\Users\\Matt\\Desktop\\Stuff\\porf\\hello-haskell\\.cabal-sandbox\\x86_64-windows-ghc-8.0.2\\haq-0.1.0.0-51zT1YF7PusI6Xj0VNDLQF"
dynlibdir  = "C:\\Users\\Matt\\Desktop\\Stuff\\porf\\hello-haskell\\.cabal-sandbox\\x86_64-windows-ghc-8.0.2"
datadir    = "C:\\Users\\Matt\\Desktop\\Stuff\\porf\\hello-haskell\\.cabal-sandbox\\x86_64-windows-ghc-8.0.2\\haq-0.1.0.0"
libexecdir = "C:\\Users\\Matt\\Desktop\\Stuff\\porf\\hello-haskell\\.cabal-sandbox\\haq-0.1.0.0-51zT1YF7PusI6Xj0VNDLQF"
sysconfdir = "C:\\Users\\Matt\\Desktop\\Stuff\\porf\\hello-haskell\\.cabal-sandbox\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "haq_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "haq_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "haq_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "haq_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "haq_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "haq_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
