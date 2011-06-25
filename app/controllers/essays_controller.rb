class EssaysController < ApplicationController
  
  
  
  def new
 
  end
  
  def show
    @essay=Essay.find(params[:id])
    @author=@essay.author
    @author_num=@essay.author_num
    @body=@essay.body
    @ranking=Ranking.new(params[:ranking]) if signed_in?

   @existing_ranking=Ranking.find_by_user_id_and_essay_id(current_user.id, @essay.id)
  end 
   
   def index
     @title = "All Essays"
     @essays = Essay.paginate(:page => params[:page])
   end
   
   def current_essay
         @essay = Essay.find(params[:id])
   end
   
   def scoreindex0
      @lookup=0
   end
   def scoreindex1
     @lookup=1
   end
   def scoreindex2
     @lookup=2
   end
   def scoreindex3
     @lookup=3
   end
   def scoreindex4
     @lookup=4
   end
   def scoreindex5
     @lookup=5
   end
   def scoreindex6
     @lookup=6
   end
   def scoreindex7
     @lookup=7
   end
   def scoreindex8
     @lookup=8
   end
   def scoreindex9
     @lookup=9
   end
   def scoreindex10
     @lookup=10
   end

end
