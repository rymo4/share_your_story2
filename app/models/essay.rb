class Essay < ActiveRecord::Base
  has_many :rankings, :dependent => :destroy
  
  
  def unranked_essays
     @unranked_essays=Essay.find(Ranking.where(:user_id=>1).essay_id)
  end
end
