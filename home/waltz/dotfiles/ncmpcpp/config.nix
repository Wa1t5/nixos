{
  # Script to show song info
  execute_on_song_change = "/etc/nixos/home/waltz/ncmpcpp/scripts/song_info.sh &>/dev/null"; 

  # Enable visualization
  visualizer_data_source = "/tmp/mpd.fifo";
  visualizer_output_name = "my_fifo";
  visualizer_in_stereo = "yes";
  visualizer_type = "spectrum";
  visualizer_autoscale = "yes";

  # Visual options
  playlist_display_mode = "columns";
  browser_display_mode = "columns";
  search_engine_display_mode = "columns";
  playlist_editor_display_mode = "columns";
                    
  user_interface = "alternative";                    

  now_playing_prefix = ">";
}
