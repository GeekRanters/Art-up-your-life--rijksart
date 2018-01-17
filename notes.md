@detail = Artobject.find_by(objectNumber:objectNumber)


<h1>Detail of <%=@detail["artObject"]["webImage"]["url"]%></h1>


def show_detail(objectNumber)
  detail_request = "https://www.rijksmuseum.nl/api/en/collection/#{@objectNumber}?key=YB4GHC25&format=json"
  @detail_result = HTTParty.get(detail_request)
  @webImage = @detail["artObject"]["webImage"]["url"]
  erb :detail
end

get '/detail' do
  show_detail(params[:objectNumber])
end


@detail_result = HTTParty.get(detail_request)
@webImage = @detail["artObject"]["webImage"]["url"]
