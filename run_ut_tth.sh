#!/usr/bin/bash
exec > >(tee results_tth.log) 2>&1

run_threshold() {
    threshold=$1
    echo "Threshold: $threshold"
    python3 -m nkululeko.ensemble cocosda_2024/exp_tth_hubert.ini cocosda_2024/exp_tth_audmodel.ini --method uncertainty_threshold --threshold $threshold | grep "UAR" | awk '{print $NF}'
}

export -f run_threshold

parallel run_threshold ::: $(seq 0.11 0.01 0.99)

awk '/Threshold:/{t=$2} /uncertainty_threshold: UAR:/{if($5>max){max=$5; max_acc=$7; thresh=t}} END{print "Maximum UAR:", max, "Max ACC:", max_acc, "at threshold", thresh}' results_tth.log



