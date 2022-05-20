#!/system/bin/sh
if [ "$1" == "0" -o "$1" == "1" ]; then
    setprop audio.runin.output.selected $1
    result=`getprop audio.runin.output.selected`
    if [ "$result" == "$1" ]; then
        echo 1
    else
        echo 0
    fi
else
    echo 0
fi
