require 'sinatra'
require 'haml'

get '/' do
	@images = Dir.entries('public/img/')
	@images.shift
	@images.shift
	haml :index
end

post '/' do
	if params.has_key?('file')
		@filename = params[:file][:filename]
		file = params[:file][:tempfile]
		File.open("./public/img/#{@filename}", 'wb') do |f|
			f.write(file.read)
		end
	end
	redirect "/"
end

#154855