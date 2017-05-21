#!/usr/bin/env bash

export i=0

function iMustBeGreaterThan5 {

    i=$(( $i + 1))

    [[ "$i" > 5 ]]
}


logAndWait() {
    local performCheck=${1?Specify a command or function to run which can check if the async process is completed}

    echo -n "Waiting for TAG to finish startup process"

    waitForCondition() {
        for i in {1..4}; do
            $performCheck && return 0;

            echo -n " ."
            sleep 1
        done
        return 1;
    }

    waitForCondition &&
    echo success ||
    echo failure
}

logAndWait iMustBeGreaterThan5
