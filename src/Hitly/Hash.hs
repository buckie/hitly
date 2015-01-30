{- LANGUAGE BangPatterns -}

module Hitly.Hash (createReturn) where

import Crypto.Hash.SHA1 (hash)
import Data.Text.Lazy.Encoding
import Data.Text.Lazy
import qualified Data.Text as T
import           Data.ByteString.Lazy.Builder
import           Data.ByteString.Lazy.Builder.ASCII
import qualified Data.ByteString.Char8 as S8

import Hitly.Types

viaBuilder :: S8.ByteString -> Text
viaBuilder = decodeUtf8 . toLazyByteString . byteStringHexFixed

mkHash :: S8.ByteString -> T.Text
mkHash = toStrict . viaBuilder . hash

createReturn :: S8.ByteString -> HitlyReturn
createReturn = HitlyReturn . mkHash