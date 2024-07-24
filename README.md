# Uncertainty-based ensemble learning for speech classification

Nkululeko toolkit: [github.com/felixbur/nkululeko](https://github.com/felixbur/nkululeko)

## Example for SR (speaker recognition using RAVDESS dataset) ensemble  

```bash
# mean
python3 -m nkululeko.ensemble exp_ococosda_2024/exp_speaker_os.ini exp_ococosda_2024/exp_speaker_praat.ini
# max
python3 -m nkululeko.ensemble exp_ococosda_2024/exp_speaker_os.ini exp_ococosda_2024/exp_speaker_praat.ini --method max
# uncertainty_lowest
python3 -m nkululeko.ensemble exp_ococosda_2024/exp_speaker_os.ini exp_ococosda_2024/exp_speaker_praat.ini --method uncertainty_threshold
# unertaitnty_threshold
./rut_ut_speaker.sh
# uncertainty_weighted
python3 -m nkululeko.ensemble exp_ococosda_2024/exp_speaker_os.ini exp_ococosda_2024/exp_speaker_praat.ini --method uncertainty_weighted
# confidence_weighted
python3 -m nkululeko.ensemble exp_ococosda_2024/exp_speaker_os.ini exp_ococosda_2024/exp_speaker_praat.ini --method confidence_weighted
```
