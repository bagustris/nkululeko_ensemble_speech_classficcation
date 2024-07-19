#!/usr/bin/bash
exec > >(tee results_turev.txt) 2>&1

run_threshold() {
    threshold=$1
    echo "Threshold: $threshold"
    python3 -m nkululeko.ensemble exp_ococosda_2024/exp_turev_hubert.ini exp_ococosda_2024/exp_turev_audmodel.ini exp_ococosda_2024/exp_turev_wavlm.ini --method uncertainty_threshold --threshold $threshold | grep "UAR" | awk '{print $NF}'
}

export -f run_threshold

parallel run_threshold ::: $(seq 0.11 0.01 0.99)

awk '/Threshold:/{t=$2} /uncertainty_threshold: UAR:/{if($5>max){max=$5; max_acc=$7; thresh=t}} END{print "Maximum UAR:", max, "Max ACC:", max_acc, "at threshold", thresh}' results_turev.txt
