#!/bin/zsh
# #popclip
# name: GPT-SoVITS TTS
# icon: symbol:message.and.waveform


# Create a temporary audio file
temp_audio_file=$(mktemp)

# Use curl to download and save the audio data to the temporary file
curl -X POST "http://localhost:9880/tts_to_audio/" \
     -H "Content-Type: application/json" \
     -d "{\"text\": \"$POPCLIP_TEXT\"}" -so "$temp_audio_file"

# Play the temporary audio file using afplay
afplay "$temp_audio_file"

# Clean up the temporary audio file when you're done with it
rm "$temp_audio_file"
