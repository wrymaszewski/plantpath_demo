class VectorAttachment < ApplicationRecord
  belongs_to :vector
  mount_uploader :file, FileUploader
  validates :name, presence: true
  # validates :file_type, presence: true

  def self.to_csv
      attributes = %W{name file_type file comments}
      CSV.generate(headers: true) do |csv|
        csv << attributes

        all.each do |r|
          csv << attributes.map {|attr| r.send(attr)}
        end
      end
    end

end
