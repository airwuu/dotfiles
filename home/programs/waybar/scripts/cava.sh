#!/usr/bin/env bash
# CAVA wrapper for Waybar - hides visualization after 2 seconds of silence

# Configuration
CAVA_CONFIG="/tmp/waybar-cava.conf"
SILENCE_THRESHOLD=2  # seconds of silence before hiding

# Create minimal CAVA config
cat > "$CAVA_CONFIG" <<EOF
[general]
bars = 6
bar_width = 2
bar_spacing = 1
height = 20
bit_depth = 5

[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 7
EOF

# Function to get audio level
get_audio_level() {
    # Get current volume and check if anything is playing
    if pactl list sinks | grep -q "State: RUNNING"; then
        echo "1"
    else
        echo "0"
    fi
}

last_audio_time=$(date +%s)
silence_counter=0

while true; do
    # Check if audio is playing
    if [[ $(get_audio_level) -eq 1 ]]; then
        last_audio_time=$(date +%s)
        silence_counter=0

        # Run CAVA for one frame and capture output
        output=$(cava -p "$CAVA_CONFIG" 2>/dev/null | head -n 1)

        if [[ -n "$output" ]]; then
            # Format the output for waybar
            echo "$output"
        fi
    else
        # No audio detected
        current_time=$(date +%s)
        elapsed=$((current_time - last_audio_time))

        if [[ $elapsed -ge $SILENCE_THRESHOLD ]]; then
            # Hide visualization after silence threshold
            echo ""
        fi
    fi

    sleep 0.1
done
