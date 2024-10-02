extends Node

# song_selection visual displays
signal on_new_album_cover(album_cover_name)

# status system
signal on_status_decrement(status_type)

# score system
signal on_combo_increment(is_increment)
signal on_score_increment()

# adding a new song
signal on_new_song(difficulty_duration)
