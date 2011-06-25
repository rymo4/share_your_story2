class Ranking < ActiveRecord::Base
  #attr_accessible :content, :score, :essay_id
  
  validates :score, :presence => true, :inclusion => { :in => [0,1,2,3,4,5,6,7,8,9,10] }
  #validates :user_id, :presence => true
  
  belongs_to :essay
  belongs_to :user
  
  #scope :not_ranked_by_user, lambda {|user| where('id NOT IN (?)', user.essay_ids + [0]) }
  #scope :ranked, lambda {{:conditions => ['user_id = (?)', User.current_user.id]}}
  
  
  
end
