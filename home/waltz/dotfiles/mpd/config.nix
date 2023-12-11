''
# Audio output
audio_output {
    type "pipewire"
    name "Pipewire Output"
} 
                    
audio_output {
    type "fifo"
    name "my_fifo"
    path "/tmp/mpd.fifo"
    format "44100:16:2"
}
''
