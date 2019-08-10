#!/bin/bash
function high_performance() {
    on_cpu 0
    on_cpu 1
    on_cpu 2
    on_cpu 3
    on_cpu 4
    on_cpu 5
    on_cpu 6
    on_cpu 7
    on_cpu 8
    on_cpu 9
    on_cpu 10
    on_cpu 11
}

function on_cpu() {
    local cpu=$1
    local cpufreq=`cpufreq-info -c ${cpu} -fm`
    if [ "${cpufreq}" != "4.80 GHz" ]; then
        sudo cpufreq-set -f 4.80GHz -c ${cpu}
        echo "Set CPU${cpu} to "  `cpufreq-info -c ${cpu} -fm`
    fi
}

high_performance
