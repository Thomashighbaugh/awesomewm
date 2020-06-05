#!/usr/bin/env bash


for i in *.svg; do
                name=${i##*/}
                base=${name%.svg}
                echo  ${base} = dir .. \'${name}\',
                echo
            done

