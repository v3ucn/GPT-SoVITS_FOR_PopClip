#!/bin/zsh
# #popclip
# name: GPT-SoVITS TTS
# icon: symbol:message.and.waveform


# Create a temporary audio file
temp_audio_file=$(mktemp)

escaped_text=$(echo "$POPCLIP_TEXT" | tr '\n' ' ')


json_body='{"text":"'"$escaped_text"'"}'

# use curl to download and save the audio data to the tempora
curl -X POST "http://localhost:9880/tts_to_audio/" -H "Content-Type: application/json" -d "$json_body" -so "$temp_audio_file"

# Play the temporary audio file using afplay
afplay "$temp_audio_file"

# Clean up the temporary audio file when you're done with it
rm "$temp_audio_file"
