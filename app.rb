require "sinatra"

get "/" do
  flac_files = File.join("resources/musics/**", "*.flac")
  @flac_filenames = Dir.glob(flac_files)
  mp3_files = File.join("resources/musics/**", "*.mp3")
  @mp3_filenames = Dir.glob(mp3_files)

  erb :index
end

get '/:filename' do |filename|
  send_file "./#{filename}", :filename => filename, :type => 'Application/octet-stream'
end
