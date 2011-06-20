module ApplicationHelper
  #returns the title ona  per page basis
  def title
    base_title = "Share Your Story"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
    
    def logo
       
      "Share Your Story"
       
     end
     
     def find_essay_ids
       User.first.rankings.find_each do |ranking|
         ranking.essay_id
       end
     end
    
     def line_break(string)
         string.gsub("\n", '<br/>')
         #put .html_safe at end of string!!!!
         
         #Use the simple_format(“your text\nhere”) helper, but in order to still escape html, do simple_format(h(“your text\nhere”))
     end
    
end
