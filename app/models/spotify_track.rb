# app/models/spotify_track.rb
class SpotifyTrack < ApplicationRecord
  enum age: { unspecified: 0, upto_1979: 1, the_1980s: 2, the_1990s: 3, the_2000s: 4, the_2010s: 5, from_2020: 6 }
  enum genre: { 
    acoustic: 0,
    afrobeat: 1,
    alternative: 2,
    ambient: 3,
    anime: 4,
    black_metal: 5,
    bluegrass: 6,
    blues: 7,
    bossanova: 8,
    brazil: 9,
    breakbeat: 10,
    british: 11,
    cantopop: 12,
    chicago_house: 13,
    children: 14,
    chill: 15
  }
end
