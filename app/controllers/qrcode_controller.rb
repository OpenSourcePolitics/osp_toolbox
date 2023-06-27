class QrcodeController < ApplicationController
  include ActionView::Helpers::TagHelper

  def generate
    @query = params["query"] || ""

    if @query.blank?
      @svg = ""
    elsif !valid_url?(@query)
      @svg = "<p class='qrcode__svg_error'>L'URL ne semble pas valide</p>"
    elsif @query.size > 300
      @svg = "<p class='qrcode__svg_error'>Maximum 300 caractères (actuellement #{@query.size})</p>"
    else
      @svg = qrcode_to_svg(@query)
    end
  end


  private

  def qrcode_to_svg(query)
    qrcode = RQRCode::QRCode.new(query)

    qrcode.as_svg(
      color: "000",
      shape_rendering: "crispEdges",
      module_size: 11,
      standalone: true,
      use_path: true,
      fill: "fff",
      offset: 15,
      )
  end

  def valid_url?(url)
    URI.parse(url).host.present?
  rescue URI::InvalidURIError
    false
  end
end
