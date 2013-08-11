class Note < ActiveRecord::Base
  attr_accessible :text, :track_id, :author_id

  belongs_to :track,
  :class_name => "Track",
  :foreign_key => :track_id,
  :primary_key => :id

  belongs_to :author,
  :class_name => 'User',
  :foreign_key => :author_id,
  :primary_key => :id
end
