class PagesController < ApplicationController
  
  def home
      @title = "Home"
     
      @essay=Essay.where('true')
      if signed_in?
          @rankings=current_user.rankings
          num_essays=Essay.all.count
        
          all_essay_ids=(1..num_essays).to_a
          ranked_essay_ids=[]
          current_user.rankings.each do |ranking|
            ranked_essay_ids<<ranking.essay_id
          end
          @unranked=all_essay_ids-ranked_essay_ids
       end
  end
  
  def contact
    @title="Contact"
  end
  
  def bio
    @title="Bios"
  end
  
  def about
    @title="About"
  end
  
  def help
     @title="Help"
  end
  
  def control
    
    total_score=0.0
    Ranking.all.each do |ranking|
      total_score+=ranking.score
    end
    
    @mean_score=total_score/(Ranking.count-Ranking.where(:score=>0).count)
    
    @mean_rank_per_user=0.0
    @mean_rank_per_user=Ranking.count/User.count
    
    essay_ids_with_mean_score={}
    
    Essay.all.each do |essay|
      essay_scores=[]
      total_score=0
      if !Ranking.find_by_essay_id(essay.id).nil?
      Ranking.where(:essay_id=>essay.id).each do |ranking|
        unless ranking.score==0
          essay_scores<<ranking.score
        end
      end
    end
    essay_scores.each do |score|
        total_score+=score
    end
    if !essay_scores.empty?
        essay_ids_with_mean_score[essay.id]=total_score/essay_scores.length
    else
        essay_ids_with_mean_score[essay.id]=0
    end
    @essays_arr=[]
    @essays_arr=essay_ids_with_mean_score.sort_by {|key, value| value}
    @essays_arr.reverse! 
    end    
  end
end
