extends Node

# song_selection visual displays
signal on_new_song_name(song_name)
signal on_slide_song_name_right_to_left(is_reversed)
signal on_slide_song_name_to_right(is_reversed)

signal on_new_album_cover(album_cover_name)
signal on_slide_album_right_to_left(is_reversed)
signal on_slide_album_left_to_right(is_reversed)

# song_selection background music
signal on_restart_song()

# status system
signal on_status_decrement(status_type)

# score system
signal on_combo_increment(is_increment)
signal on_score_increment()

# adding a new song
signal on_new_song(difficulty_duration)
