#!/bin/bash
# - Additionally check on how to disable intel_pstate new driver, and switch back to the acpi-cpufreq instead 
#   (could be the reason temperature above threshold error in the dmesg): https://unix.stackexchange.com/questions/153693/cant-use-userspace-cpufreq-governor-and-set-cpu-frequency
# - Another resource on how to set/fix the value for the governor policy for the intel_pstate driver: https://wiki.debian.org/HowTo/CpuFrequencyScaling
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
        sudo cpufreq-set -g performance -c ${cpu}
        echo "Set CPU${cpu} to "  `cpufreq-info -c ${cpu} -fm`
    fi
}

high_performance
