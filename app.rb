require "sinatra"
require "zip"

flac_paths = Dir.glob(File.join("resources/musics/**", "*.flac"))
mp3_paths = Dir.glob(File.join("resources/musics/**", "*.mp3"))

def create_zip(zip_name, entries)
  Zip::File.open(zip_name, create: true) do |zip|
    entries.each do |filename|
      zip.add(filename.delete_prefix("resources/musics/"), filename)
    end
  end
end

get "/" do
  flac_list = flac_paths.map do |path|
    path.delete_prefix "resources/musics"
  end
  mp3_list = mp3_paths.map do |path|
    path.delete_prefix "resources/musics"
  end

  @flac_list = flac_list
  @mp3_list = mp3_list

  erb :index
end

get "/mp3" do
  zip_name = "./resources/zips/mp3-files.zip"
  if File.exist?(zip_name)
    File.delete(zip_name)
  end

  create_zip zip_name, mp3_paths
  send_file zip_name
end

get "/flac" do
  zip_name = "./resources/zips/flac-files.zip"
  if File.exist?(zip_name)
    File.delete(zip_name)
  end

  create_zip zip_name, flac_paths
  send_file zip_name
end

get '/:filename' do |filename|
  send_file "./resources/musics/#{filename}", :filename => filename, :type => 'Application/octet-stream'
end
