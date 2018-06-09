{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Mirror where

import Import
import qualified Data.Text as T

getMirrorR :: Handler Html
getMirrorR = do
  defaultLayout $ do
    setTitle "You kek"
    $(widgetFile "mirror")

postMirrorR :: Handler Html
postMirrorR = do
  postedText <- runInputPost $ ireq textField "content"
  defaultLayout $(widgetFile "posted")
