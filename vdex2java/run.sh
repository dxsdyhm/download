#!/bin/bash
function vdex2dex(){
    filename="$1"
    len=${#filename}
    dirname=out/${filename:0:(len-5)}
    echo $dirname
    if [ ! -d $dirname ];
    then
        mkdir -p $dirname
    fi
    sh vdexExtractor/tools/deodex/run.sh -i $filename -o $dirname
}

function dex2java(){
    filename="$1"
    outdir=java/${filename#*/}
    if [ ! -d $outdir ];
    then
        mkdir -p $outdir
    fi
    sh /Users/duanxuesong/Downloads/softer/jadx/jadx-1.0.0/bin/jadx $filename -d $outdir
}

function getdir(){
    for element in `ls $1`
    do
        dir_or_file=$1"/"$element
        if [ -d $dir_or_file ]
        then
            getdir $dir_or_file
        else
            if [[ $dir_or_file == *.vdex ]]
            then
                vdex2dex $dir_or_file
            elif [[ $dir_or_file == *.dex ]]
            then
                dex2java $dir_or_file
            fi
        fi
    done
}
root_dir="$1"
getdir $root_dir
getdir out
