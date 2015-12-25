#!/bin/bash
function high_performance() {
    on_cpu 0
    on_cpu 1
}

function on_cpu() {
    local cpu=$1
    local cpufreq=`cpufreq-info -c ${cpu} -fm`
    if [ "${cpufreq}" == "800 MHz" ]; then
        sudo cpufreq-set -f 2.40GHz -c ${cpu}
        echo "Set CPU${cpu} to "  `cpufreq-info -c ${cpu} -fm`
    fi
}

high_performance
