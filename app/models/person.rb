class Person < ApplicationRecord

  validates_presence_of :name

  validates_numericality_of :graduation_year, allow_nil: true,
                            greater_than: 1920, less_than_or_equal_to: Time.now.year,
                            only_integer: true
  #validates_uniqueness_of :name
  validates_uniqueness_of :email, case_sensitive: false,
                          scope: [:name],
                          message: "has already been entered, you can't sign in twice"

  validates_format_of :email,
                      with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                      message: "doesn't look like a proper email address"



  validates_length_of :secret, in: 6..24


  after_save :store_photo


  def has_photo?
    File.exists? photo_filename
  end

  # we could have written "{Rails.root}/public/photo_store"
  PHOTO_STORE = File.join Rails.root, 'public', 'photo_store'

  def photo_filename
    File.join PHOTO_STORE, "#{id}.#{extension}"
  end

  def photo_path
    "/photo_store/#{id}.#{extension}"
  end

  def photo=(file_data)
    unless file_data.blank?
      @file_data = file_data
      self.extension = file_data.original_filename.split('.').last.downcase
    end
  end

  private
  def store_photo
    if @file_data
# make the photo_store directory if it doesn't exist already
      FileUtils.mkdir_p PHOTO_STORE
# write out the image data to the file
      File.open(photo_filename, 'wb') do |f|
        f.write(@file_data.read)
      end
# avoid repeat-saving
      @file_data = nil
    end
  end








end
