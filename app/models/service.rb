class Service < ApplicationRecord
  
  include Rails.application.routes.url_helpers
  require "rqrcode"
  has_one_attached :qr_code
  after_create :generate_qr
  
  belongs_to :user
  has_many :taps, dependent: :destroy

  after_create :current_usage

  def current_usage
    current_usage = taps.sum { |tap| tap.usage }
    update_column(:current_usage, current_usage)
    current_usage
  end

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :capacity

  def generate_qr
    qr_url = url_for(controller: 'services',
      action: 'show',
      id: self.id,
      only_path: false,
      host: 'localhost:3000',
      protocol: 'http',
      source: 'from_qr'
      )

      qrcode = RQRCode::QRCode.new(qr_url)

      png = qrcode.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: "black",
      file: nil,
      fill: "white",
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 120
      )

      image_name = SecureRandom.hex

      IO.binwrite("tmp/#{image_name}.png", png.to_s)

      blob = ActiveStorage::Blob.create_after_upload!(
      io: File.open("tmp/#{image_name}.png"),
      filename: image_name,
      content_type: 'png'
      )

      self.qr_code.attach(blob)
  end
  
end
