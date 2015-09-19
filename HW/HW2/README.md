# Homework 2
## Adder
### Test bench results
| A | B | C<sub>in</sub> | S | C<sub>out</sub> | Expected Output|
|---|---|---|---|---|---|
| 0 | 0 | 0 | 0 | 0 | Both 0|
| 1 | 0 | 0 | 1 | 0 | S=1, C<sub>out</sub>=0|
| 0 | 1 | 0 | 1 | 0 | S=1, C<sub>out</sub>=0|
| 1 | 1 | 0 | 0 | 1 | S=0, C<sub>out</sub>=1|
| 0 | 0 | 1 | 1 | 0 | S=1, C<sub>out</sub>=0|
| 1 | 0 | 1 | 0 | 1 | S=0, C<sub>out</sub>=1|
| 0 | 1 | 1 | 0 | 1 | S=0, C<sub>out</sub>=1|
| 1 | 1 | 1 | 1 | 1 | Both 1|

### Waveforms
Behavioral:
![Alt](outputs/adder_behavioralWaveform.JPG?raw=true "Waveform for behavioral adder")
Structural:
![Alt](outputs/adder_structuralWaveform.JPG?raw=true "Waveform for structural adder")

## Decoder
### Test bench results
| En| A0 | A1 | O0 | O1 | O2 | O3 | Expected Output |
|---|---|---|---|---|---|---|---|
| 0 | 0 | 0 | 0 | 0 | 0 | 0 | All false |
| 0 | 1 | 0 | 0 | 0 | 0 | 0 | All false |
| 0 | 0 | 1 | 0 | 0 | 0 | 0 | All false |
| 0 | 1 | 1 | 0 | 0 | 0 | 0 | All false |
| 1 | 0 | 0 | 1 | 0 | 0 | 0 | O0 Only |
| 1 | 1 | 0 | 0 | 1 | 0 | 0 | O1 Only |
| 1 | 0 | 1 | 0 | 0 | 1 | 0 | O2 Only |
| 1 | 1 | 1 | 0 | 0 | 0 | 1 | O3 Only |

### Waveforms
Behavioral:
![Alt](outputs/decoder_behavioralWaveform.JPG?raw=true "Waveform for behavioral decoder")
Structural:
![Alt](outputs/decoder_structuralWaveform.JPG?raw=true "Waveform for structural decoder")

## Multiplexer
### Test bench results
| Addr | Input | Out | Expected Output |
|---|---|---|---|
| 00 | 0000 | 0 | 0 |
| 00 | 0001 | 1 | 1 |
| 10 | 0000 | 0 | 0 |
| 10 | 0010 | 1 | 1 |
| 01 | 0000 | 0 | 0 |
| 01 | 0100 | 1 | 1 |
| 11 | 0000 | 0 | 0 |
| 11 | 1000 | 1 | 1 |

### Waveforms
Behavioral:
![Alt](outputs/multiplexer_behavioralWaveform.JPG?raw=true "Waveform for behavioral multiplexer")
Structural:
![Alt](outputs/multiplexer_structuralWaveform.JPG?raw=true "Waveform for structural multiplexer")
