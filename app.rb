require "sinatra"
require "zip"
require "logger"

logger = Logger.new(STDERR)

resources_dir = "resources/musics"

flac_paths = Dir.glob(File.join(resources_dir, "**", "*.flac"))
mp3_paths = Dir.glob(File.join(resources_dir, "**", "*.mp3"))

def create_zip(zip_name, entries, logger)
  Zip::File.open(zip_name, create: true) do |zip|
    entries.each do |filename|
      logger.info "Appending #{filename} into #{zip_name}..."
      zip.add(filename.delete_prefix("resources/musics/"), filename)
    end
  end
end

logger.info "Creating zip files, for mp3 & flac data..."
logger.info "Creating mp3 zip file..."

# Setup Zip files
# Mp3
mp3_zip_path = File.expand_path("./resources/zips/mp3-files.zip", default_dir = "/opt/songserver")
if File.exist?(mp3_zip_path)
  File.delete(mp3_zip_path)
end
create_zip mp3_zip_path, mp3_paths, logger

logger.info "Creating flac zip file..."

# Flac
flac_zip_path = File.expand_path("./resources/zips/flac-files.zip", default_dir = "/opt/songserver")
if File.exist?(flac_zip_path)
  File.delete(flac_zip_path)
end
create_zip flac_zip_path, flac_paths, logger

# Sinatra Server

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
  send_file mp3_zip_path
end

get "/flac" do
  send_file flac_zip_path
end

get '/:filename' do |filename|
  send_file "./resources/musics/#{filename}"
end
