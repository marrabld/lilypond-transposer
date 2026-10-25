# Includes
import argparse
import os

# CLI arguments
parser = argparse.ArgumentParser(description="Transpose a LilyPond file from one key to another.")

# Input file
parser.add_argument("song_file", help="The LilyPond .ly file you would like to transpose")

# Target key
parser.add_argument("key", help="Target key")

# Desired octave (in case new key is too high/low)
parser.add_argument("--octave", choices=["up", "down"], default=None,
                    help="Shift transposed notes up or down one octave - doesn't affect chords")

# Lyrics on or off
parser.add_argument("--lyrics", choices=["on", "off"], default="off", help="Include lyrics")

args = parser.parse_args()

# Simply variable names
song = args.song_file
key = args.key
lyrics_flag = args.lyrics

# Octave change direction variable
direction = args.octave

# Convert (potential) user input to LilyPond formats (ie. bb -> bf or b# -> bs)
key = key.lower().strip()

note = key[0]
accidental = key[1:]

# LilyPond formats
accidental = accidental.replace("b", "f")
accidental = accidental.replace("flat", "f")
accidental = accidental.replace("sharp", "s")
accidental = accidental.replace("#", "s")

# Put it back together all nice like
key = note + accidental

# Open LilyPond song file
with open(song, "r", encoding="utf-8") as f:
    contents = f.read().splitlines()

# Lyrics off by default
in_lyrics_block = False

# Prepare new file and load contents of original
new_contents = []
for line in contents:
    stripped = line.strip()

    # Find the transpose function, split it into parts and change the last part to the desired key
    if stripped.startswith("\\transpose "):
        parts = stripped.split()
        if len(parts) >= 3:
            parts[2] = key  # Change target key
            
            # Change octave if entered as argument in CLI
            if direction == "up":
                parts[2] += "'"
            elif direction == "down":
                parts[2] += ","
            
            # Rebuild new line
            line = " ".join(parts)

    # Lyrics
    if "\\addlyrics" in stripped:
        in_lyrics_block = True

    # Lyrics toggle
    if in_lyrics_block:
        if lyrics_flag == "off":
            if not stripped.startswith("%"):
                line = "% " + line
        else:
            if stripped.startswith("%"):
                line = line.lstrip("% ").rstrip()

    # End of lyrics block
    if in_lyrics_block and "}" in stripped:
        in_lyrics_block = False
    
    # Modified LilyPond file
    new_contents.append(line)

# Reassemble the file
final_contents = "\n".join(new_contents)
  
# Create output file with new key in filename
output_file = os.path.splitext(song)[0] + f"-{key}.ly"

# Write the new file
with open(output_file, "w", encoding="utf-8") as f:
    f.write(final_contents)

# Show everything worked good
print(f"Created: {output_file}")