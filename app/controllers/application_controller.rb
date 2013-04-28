class ApplicationController < ActionController::Base
  def stories
    headers['Access-Control-Allow-Origin'] = '*'#'http://localhost:4567' 
    headers['Access-Control-Request-Method'] = '*'
    headers["Access-Control-Allow-Headers"] = "Origin, X-Requested-With, Content-Type, Accept"
    @objects = Story.find(:all)
    render :json =>  '{ "stories": ' + @objects.to_json + '}'
  end
  def delete
    headers['Access-Control-Allow-Origin'] = '*'#'http://localhost:4567' 
    headers['Access-Control-Request-Method'] = '*'
    headers["Access-Control-Allow-Headers"] = "Origin, X-Requested-With, Content-Type, Accept"
    s=Story.new
    s.text = ""
    Word.find(:all).each do |word|
      s.text += " " + word.letters
    end
    s.save
    Word.delete_all
    render :text => "del"
 end
  
  def index
    headers["Content-Type"] = "text/json"
    
headers['Access-Control-Allow-Origin'] = '*'#'http://localhost:4567' 
headers['Access-Control-Request-Method'] = '*'
headers["Access-Control-Allow-Headers"] = "Origin, X-Requested-With, Content-Type, Accept"
    @objects = Word.find(:all)
    render :json =>  '{ "words": ' + @objects.to_json + '}'
  end
  def create

headers['Access-Control-Allow-Origin'] = '*'#'http://localhost:4567' 
headers['Access-Control-Request-Method'] = '*'
headers["Access-Control-Allow-Headers"] = "Origin, X-Requested-With, Content-Type, Accept"
    word=Word.new(params[:word])
    if (word && word.letters)
      #validation
      if (word.letters.length > 20 || word.letters.include?(" ") || word.letters.length < 1)
        render :status => 403, :text => "Bad word string"
      else
        word.save
        render :status => 201, :text => word.inspect + "\n"
      end
    else
      render :status => 400, :text => "Error (params)"
    end
  end
end
