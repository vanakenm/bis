class PictureIdentifier
  def self.identify(url)
    require "google/cloud/vision"
    vision = Google::Cloud::Vision.new(project_id: "effin-bot")
    image = vision.image(url)
    image.labels.map(&:description)
  end
end