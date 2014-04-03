class Match < ActiveRecord::Base
  belongs_to :local_team, :class_name => Team
  belongs_to :visit_team, :class_name => Team
  belongs_to :winner_team, :class_name => Team
  belongs_to :looser_team, :class_name => Team
  belongs_to :group, :class_name => Group
  belongs_to :stadium, :class_name => Stadium
end
