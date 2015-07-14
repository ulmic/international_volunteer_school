module Web::ApplicationHelper
  def copyright_notice_year_range(start_year)
    start_year = start_year.to_i
    current_year = Time.new.year
    if current_year > start_year && start_year > 2000
      "#{start_year} - #{current_year}"
    elsif start_year > 2000
      "#{start_year}"
    else
      "#{current_year}"
    end
  end

  def enumerize_locales_hash(model, attribute)
    I18n.t("enumerize.#{model.name.underscore.gsub('/', '.')}.#{attribute}").invert
  end
end
