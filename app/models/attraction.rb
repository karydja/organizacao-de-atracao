class Attraction < ActiveRecord::Base
  validates_presence_of :name

  belongs_to :user

  enum media: { television: 0, movie_theater: 1, neftlix: 2, dvd: 3, other: 4 }

  def self.i18n_media(hash = {})
    media.keys.each { |key| hash[I18n.t("attraction.media.#{key}")] = key }
    hash.to_a
  end
end
