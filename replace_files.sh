#!/bin/sh

helpFunction()
{
   echo ""
   echo "Usage: $0 -t type"
   echo -t "\ttype of flow - orig/onnx"
   exit 1 # Exit script after printing help
}

while getopts "t:" opt
do
   case "$opt" in
      t ) parameterA="$OPTARG" ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done


# Print helpFunction in case parameters are empty
if [ -z "$parameterA" ] 
then
   echo "Some or all of the parameters are empty";
   helpFunction
fi


f1="yolact"
f2="eval"
f3="layers/functions/detection"

cp $f1-$parameterA.py $f1.py 
cp $f2-$parameterA.py $f2.py 
cp $f3-$parameterA.py $f3.py 
