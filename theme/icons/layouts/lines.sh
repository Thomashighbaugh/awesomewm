#!/usr/bin/env bash


for i in *.svg; do
                name=${i##*/}
                base=${name%.svg}
                echo  'l_'${base} = layouts .. \'${name}\',
            done

