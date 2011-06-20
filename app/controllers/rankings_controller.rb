class RankingsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  
  def new
    @ranking = Ranking.new
  
  end
  
  
  def create
     @essay=Essay.find(params[:essay_id])
     if current_user.rankings.where(:essay_id => @essay.id).empty?
       @ranking = Ranking.new(:comment => params[:ranking][:comment], 
                            :user_id => current_user.id, 
                            :essay_id => params[:essay_id],
                            :score => params[:ranking][:score]) 
        if @ranking.save
          flash[:success] = "Ranking created!"
          redirect_to root_path
        else
          redirect_to @essay
          flash[:error] = "Please select a rank!"
        end
      else
        
        Ranking.find(current_user.rankings.find_by_essay_id(@essay.id).id).update_attributes(
                              :comment => params[:ranking][:comment], 
                              :user_id => current_user.id, 
                              :essay_id => params[:essay_id],
                              :score => params[:ranking][:score]) 
          @ranking=Ranking.new(:comment => params[:ranking][:comment], 
                              :user_id => current_user.id, 
                              :essay_id => params[:essay_id],
                              :score => params[:ranking][:score])
          if @ranking.valid?
            flash[:success] = "Ranking updated!"
            redirect_to root_path
          else
            redirect_to @essay
            flash[:error] = "Please select a rank!"
          end
      end
   end
   
end
