#!/bin/sh

# Paths
SONG_NAME_PATH="$XDG_RUNTIME_DIR/music-name"
SONG_PAUSE_PATH="$XDG_RUNTIME_DIR/music-paused"
MPV_SOCKET_PATH="$XDG_RUNTIME_DIR/music-socket"
CMD_PATH="/run/current-system/sw/bin/"

# Options
MODULES="$@"

if [[ -z "$MODULES" ]]; then
	echo "Modules:"
	echo "- Clock"
	echo "- Calendar"
	echo "- Battery"
	echo "- Temperature"
	echo "- Music"
	exit 0
fi

# Functions
clock() {
	CLOCK="$(${CMD_PATH}/date +%H:%M) "
}

calendar() {
	CALENDAR="$(${CMD_PATH}/date  +%d/%m/%y) "
}

battery() {
	BATTERY="$(cat '/sys/class/power_supply/BAT0/capacity')% "
}

temperature() {
	TEMPERATURE="$(sed 's/+//g' <<<  "$(sensors | grep "Tctl" | awk '{print $2}')") "
}

music() {
	if [[ $(pgrep mpv) && $(file "$MPV_SOCKET_PATH")  ]]; then

		# Cat title
		TITLE_SIZE="$(cat "$SONG_NAME_PATH" | awk '{print length}')"

		# Roll size (the max characters that will be visible at the same time)
		#ROLL_SIZE="30"
		
		#
		ROLL_SIZE="$title_size"
		ROLL_SIZE="$title_size"

		# Initial values
		#[[ "$ROLL_END" -ge "$TITLE_SIZE" || -z "$ROLL_START" ]] && ROLL_START="1"
		#[[ "$ROLL_END" -ge "$TITLE_SIZE" || -z "$ROLL_END" ]] && ROLL_END="$ROLL_SIZE"

		# Song name var (if paused song name will be exhibited with exclamation  prefix)
		[[ -f "$SONG_PAUSE_PATH" ]] || MUSIC=" $(cut -b "$ROLL_START"-"$ROLL_END" "$SONG_NAME_PATH")"
		[[ -f "$SONG_PAUSE_PATH" ]] && MUSIC=" $(cut -b "$ROLL_START"-"$ROLL_END" "$SONG_NAME_PATH")"

		# Make the roll effect
		#ROLL_START=$((ROLL_START + 1))
		#ROLL_END=$((ROLL_END + 1))
	else
		[[ -z "$MUSIC" ]] || unset MUSIC
	fi
}

# Main loop
while true; do

	# Load and update modules
	[[ "$MODULES" == *"music"*        ]] && music
	[[ "$MODULES" == *"clock"*        ]] && clock
	[[ "$MODULES" == *"calendar"*     ]] && calendar
	[[ "$MODULES" == *"battery"*      ]] && battery
	[[ "$MODULES" == *"temperature"*  ]] && temperature

	# All
	if [[ "$modules" == "all" ]];then
		music
		clock
		calendar
		battery
		temperature
	fi

	# Print modules
	echo "$CLOCK$CALENDAR$BATTERY$TEMPERATURE$MUSIC"

	# Wait 1 second
	${CMD_PATH}/sleep 1
done
