import argparse
from pydub import AudioSegment
import os

def split_wav_into_intervals(input_file, output_template, interval_seconds):
    sound = AudioSegment.from_wav(input_file)
    file_name, file_extension = os.path.splitext(input_file)

    for i, start_time in enumerate(range(0, len(sound), interval_seconds * 1000)):
        end_time = start_time + interval_seconds * 1000
        interval = sound[start_time:end_time]

        output_file = f"{output_template}-{i + 1}.wav"
        interval.export(output_file, format="wav")
        print(f"Interval {i + 1}: Saved as '{output_file}'")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Split a WAV file into X-second intervals.")
    parser.add_argument("input_file", help="Path to the input WAV file.")
    parser.add_argument("output_template", help="Output file template. Example: output.wav")
    parser.add_argument("interval_seconds", type=int, help="Interval in seconds.")

    args = parser.parse_args()

    split_wav_into_intervals(args.input_file, args.output_template, args.interval_seconds)