require 'find'  

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
    make_essays
  end
end
    
    
    
    
    
    
def make_users
    admin = User.create!(:name => "Ryder Moody (admin)",
                         :email => "ADMIN@gmail.com",
                         :password => "password",
                         :password_confirmation => "password",
                         :invite_code=>"1121")
    admin.toggle!(:admin)
end


def read_dir dir
  Dir.glob("#{dir}/*").each_with_object({}) do |f, h|
    #if File.file?(f)
      h[f] = open(f).read.html_safe
    #elsif File.directory?(f)
     # h[f] = read_dir(f)
    #end
  end
end



def make_essays    
# 
# 
# 
## 
## to open and save:
## file=File.open("/open.txt")
## 
## 
## to display all lines of one file:
## file.each {|line| print line }
## 
## 
## 
#Find.find('/Users/juliemoody/rails_projects/share_your_story/db/testing') do |f|  
#  file=File.open(f) 
#  text=""
#  file.each {|line|
#    text << line
#   }
#   Essay.create!(:body => text)
#end
## 
## 
## 
## 
## 
# 

dir="/Users/juliemoody/rails_projects/share_your_story2/db/testing"
h = {}
h=read_dir(dir)
essay=""
h.each do |key, value| 
  a=[]
  b=[]
  c=[]
  s=key
  essay=value
  a=s.split(dir+"/")
  b=a[1].split("_")
  c=b[2].split(".")
  Essay.create!(:body => essay, :author => b[0]+", "+b[1], :author_num => c[0]) 
end

#dirname="/Users/juliemoody/rails_projects/share_your_story/db/testing"

#Dir.foreach( dirname ) {| filename | 
#  file=File.open("#{dirname}/#{filename}") 
#    text=""
#    file.each {|line|
#      text << line
#     }
#     Essay.create!(:body => text, :autor => filename)
#   }
    



#

#Dir['./rails_projects/share_your_story/db/testing/*.txt'].each do |file|
#  Essay.create!(:body => "hey")
#end

#file_names_with_contents = {}.tap do |h|
#  Dir.glob('/path/*.txt').each{|file_name| h[file_name] = IO.read(file_name)}
#end



#end
 
 #
# file = File.open("path-to-file.tar.gz")
# contents = ""
# file.each {|line|
#   contents << line
# }
 
 
 
# file_names_with_contents = {}.tap do |h|
#   Dir.glob('./rails_projects/share_your_story/db/testing/*.txt').each{|file_name| h[file_name] = IO.read(file_name)}
# end

end
 
 
 
    
 
