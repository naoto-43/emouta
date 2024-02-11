class SpotifyTrack < ApplicationRecord
  enum age: { nineties: 0, two_thousands: 1, twenty_tens: 2 }
end
