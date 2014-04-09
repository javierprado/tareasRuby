class Match < ActiveRecord::Base
  belongs_to :local_team, :class_name => Team
  belongs_to :visit_team, :class_name => Team
  belongs_to :winner_team, :class_name => Team
  belongs_to :looser_team, :class_name => Team
  belongs_to :group, :class_name => Group
  belongs_to :stadium, :class_name => Stadium

  validates :date, presence: true #Atributo tipo Date revisa que sea una fecha valida
  validates :phase, presence: true, format: {with: /\A(Grupos|Octavos de final|Cuartos de final|Semifinales|Final)\z/i, message: "ERROR: Match Phase must be: Grupos, Octavos de Final, Cuartos de final, Semifinales, Final"}
  validates :state, presence: true, format: {with: /\A(Por jugar|En juego|Finalizado)\z/i, message: "ERROR: Match State must be: Por jugar, En juego, Finalizado"}
  validates :local_team, presence: true
  validates :visit_team, presence: true
  validates :local_goals, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :visit_goals, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :stadium, presence: true

  validate :local_and_visit_team_different
  
  after_validation :draw

end

	def local_and_visit_team_different
	    if local_team == visit_team
	      errors.add(:visit_team, "ERROR: Local and visit team must be different")
	    end
	  end

	  def draw
	  	if local_goals == visit_goals
	  		self.winner_team = nil
	  		self.looser_team = nil
	  	elsif local_goals > visit_goals
	  		self.winner_team = self.local_team
	  		self.looser_team = self.visit_team
	  	elsif local_goals < visit_goals
	  		self.winner_team = self.visit_team
	  		self.looser_team = self.local_team
	  	end
	  end
	end