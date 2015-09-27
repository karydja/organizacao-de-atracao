class AttractionDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all

  def formatted_description
    unless object.description.empty?
      content_tag(:p, attribute_content_tag("description") + object.description)
    end
  end

  def formatted_media
    unless object.media.nil?
      content_tag(:p, attribute_content_tag("media") + i18n_media_value(object.media))
    end
  end

  def formatted_date
    unless object.date.nil?
      content_tag(:p, attribute_content_tag("date") +
        object.date.strftime("%d/%m/%Y, %H:%M"))
    end
  end

  private

  def attribute_content_tag(attribute)
    locale = I18n.t("attraction.attributes.#{attribute}")
    content_tag(:strong, "#{locale}: ")
  end

  def i18n_media_value(value)
    Attraction.i18n_media.key(value)
  end
end
