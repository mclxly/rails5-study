class RecreateOldThumbnails < ActiveRecord::Migration[5.0]
  def change
    Rails.logger.debug("aaaaa")
    Pin.all.each {|p| p.image.recreate_versions! if p.image}
  end

  def up
    Rails.logger.debug("aaaaa")
    Pin.all.each {|p| p.image.recreate_versions! if p.image}
  end

  def down
  end
end
