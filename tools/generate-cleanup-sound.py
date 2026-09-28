"""Reproduce the original short cleanup explosion; no third-party recordings."""
from pathlib import Path
import math
import random
import struct
import wave

rate = 44100
randomizer = random.Random(20377)
low = mid = phase = 0.0
samples = []
for i in range(int(rate * 1.2)):
    t = i / rate
    noise = randomizer.uniform(-1, 1)
    low += .018 * (noise - low)
    mid += .19 * (noise - mid)
    phase += 2 * math.pi * (52 + 83 * math.exp(-t * 24)) / rate
    crack = (noise - mid) * math.exp(-t * 48) * .28
    body = mid * math.exp(-t * 5.2) * 1.1
    rumble = low * math.exp(-t * 2.7) * 2.5 * (.8 + .2 * math.sin(t * 37))
    sub = math.sin(phase) * math.exp(-t * 6.2) * .42
    envelope = min(1, t / .003) * min(1, (1.2 - t) / .08)
    samples.append(math.tanh((crack + body + rumble + sub) * 1.6) * envelope)
peak = max(map(abs, samples))
output = Path(__file__).resolve().parents[1] / 'android/app/src/main/res/raw/cleanup_explosion.wav'
output.parent.mkdir(parents=True, exist_ok=True)
with wave.open(str(output), 'wb') as wav:
    wav.setnchannels(1)
    wav.setsampwidth(2)
    wav.setframerate(rate)
    wav.writeframes(b''.join(struct.pack('<h', int(v / peak * .88 * 32767)) for v in samples))
print(output)
