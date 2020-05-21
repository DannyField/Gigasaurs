module BandsHelper
  def background_image(band)
    return "
        background: url(#{url_for(band.profile_picture)});
        height: 100%
        background-position: center;
        background-size: cover
        "
  end
end
