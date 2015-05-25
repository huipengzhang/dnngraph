{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Gen.Caffe.ContrastiveLossParameter  where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
 
import Language.Haskell.TH.Syntax
import Control.Lens
data ContrastiveLossParameter = ContrastiveLossParameter{margin :: !(P'.Maybe P'.Float), legacy_version :: !(P'.Maybe P'.Bool)}
                              deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

makeLensesWith (lensRules & lensField .~ \_ _ name -> [TopName (mkName Prelude'.$ "_" Prelude'.++ nameBase name)]) ''ContrastiveLossParameter

 
instance P'.Mergeable ContrastiveLossParameter where
  mergeAppend (ContrastiveLossParameter x'1 x'2) (ContrastiveLossParameter y'1 y'2)
   = ContrastiveLossParameter (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)
 
instance P'.Default ContrastiveLossParameter where
  defaultValue = ContrastiveLossParameter (Prelude'.Just 1.0) (Prelude'.Just Prelude'.False)
 
instance P'.Wire ContrastiveLossParameter where
  wireSize ft' self'@(ContrastiveLossParameter x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 2 x'1 + P'.wireSizeOpt 1 8 x'2)
  wirePut ft' self'@(ContrastiveLossParameter x'1 x'2)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutOpt 13 2 x'1
             P'.wirePutOpt 16 8 x'2
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             13 -> Prelude'.fmap (\ !new'Field -> old'Self{margin = Prelude'.Just new'Field}) (P'.wireGet 2)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{legacy_version = Prelude'.Just new'Field}) (P'.wireGet 8)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> ContrastiveLossParameter) ContrastiveLossParameter where
  getVal m' f' = f' m'
 
instance P'.GPB ContrastiveLossParameter
 
instance P'.ReflectDescriptor ContrastiveLossParameter where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [13, 16])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.ContrastiveLossParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"ContrastiveLossParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"ContrastiveLossParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ContrastiveLossParameter.margin\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ContrastiveLossParameter\"], baseName' = FName \"margin\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 13}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Just \"1.0\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (1 % 1)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ContrastiveLossParameter.legacy_version\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ContrastiveLossParameter\"], baseName' = FName \"legacy_version\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"false\", hsDefault = Just (HsDef'Bool False)}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"