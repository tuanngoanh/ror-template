module AppUtils
  def json_to_array(json)
    begin
      result = JSON.parse(json.to_s) || []
    rescue Exception => e
      Rails.logger.info e.inspect
      result = []
    end

    result = [] unless result.kind_of?(Array)
    result
  end

  def json_to_hash(json)
    begin
      result = JSON.parse(json.to_s) || {}
    rescue Exception => e
      Rails.logger.info e.inspect
      result = {}
    end

    result = {} unless result.kind_of?(Hash)
    result
  end

  def json_to_hash_with_symbolize_names(json)
    begin
      result = JSON.parse(json.to_s, :symbolize_names => true) || {}
    rescue Exception => e
      Rails.logger.info e.inspect
      result = {}
    end

    result = {} if !result.kind_of?(Hash)

    result
  end

  def strings_to_dates(strings)
    result = []
    strings.each do |string|
      date = Date.parse(string) rescue nil
      result << date if date
    end
    result
  end

  def escape_elastic_search_query(query)
    specials_chars = '\+\-&|!(){}[]^"~*?:\\/'
    query.to_s.tr(specials_chars, '')
  end

  # Quote string to avoid sql injection
  def quote_string(v)
    v.to_s.gsub(/\\/, '\&\&').gsub(/'/, "''")
  end

  def address_decoration(address_1, city, state, zip, country)
    address_1 = "#{address_1}<br />" unless address_1.blank?
    address_city_state_zip = "#{city}, " unless city.blank?
    address_city_state_zip += "#{state}, " unless state.blank?
    address_city_state_zip += "#{zip}" unless zip.blank?
    address_city_state_zip += '<br />' unless address_city_state_zip.blank?
    address_country = "#{country.name}" if country != nil && country.id != 1
    "#{address_1} #{address_city_state_zip} #{address_country}"
  end

  def short_address_decoration(city_name, state, country)
    address_string = ''
    address_string = "#{city_name}" if city_name.present?
    address_string += ", #{state.abbr}" if state.present? && state.abbr.present?
    address_string += ", #{country.name}" if country != nil && country.id != 1
    address_string
  end

  def valid_email?(email)
    (email.present? && VALID_EMAIL_REGEX.match(email).present?)
  end

  def open_spreadsheet(file)
    case File.extname(file.original_filename)
      when '.csv' then Roo::Csv.new(file.path, nil, :ignore)
      when '.xls' then Roo::Excel.new(file.path, nil, :ignore)
      when '.xlsx' then Roo::Excelx.new(file.path, nil, :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def last_digits(number)
    number.to_s.length <= 4 ? number : number.to_s.slice(-4..-1)
  end

  def mask_number(number)
    "xxxx-xxxx-xxxx-#{last_digits(number)}"
  end

  def mask_email(email)
    return '' if email.blank? || email.index('@').nil?

    begin_index = 1
    end_index = email.index('@') - 2

    return email if end_index < begin_index

    number_of_mask_chacters = end_index - begin_index + 1
    email.sub(email[begin_index, number_of_mask_chacters], '*' * number_of_mask_chacters)
  end

  def convert_params_to_hash(*args)
    result = Hash.new
    begin
      if args[0].present?
        args[0].each { |name, value| result[name] = value }
      end
    rescue Exception => e
      Rails.logger.info e.inspect
    end

    result
  end

  def get_short_url(url)
    begin
      return Bitly.client.shorten(url).short_url || ''
    rescue
      return ''
    end
  end

  def get_server_url(path, request)
    begin
      path = path[1...path.length] if path.start_with?('/')
      return "#{MAIN_SERVER_URL}/#{path}" if MAIN_SERVER_HOST.present?
      return "#{request.protocol}#{request.host_with_port}/#{path}" if request.present?
    rescue
      return ''
    end
    path
  end

  # Round up input number next 9
  # @param [Object] number: input number
  # All number will be rounded-up to the nearest "9" in the dollar range.
  # For example:
  # * if less than 10.00 == do not change
  # * 12.34 = 19.00
  # * 123.45 = 129.00
  # * 1234.56 = 1239.00
  # * 12345.67 = 12349.00
  # * 123456.78 = 123459.00
  # * 123459.78 = 123469.00
  def round_up_next_9(number)
    number.to_f < 10 ? number.to_f : (((number.to_f + 1) / 10).ceil * 10 - 1).to_f
  end

  def format_long_date(date)
    return date.strftime('%A, %b %d, %Y')
  rescue
    return ''
  end

  def format_short_date(date)
    return date.strftime('%b %d, %Y')
  rescue
    return ''
  end

  def to_time(date)
    return date.strftime('%H:%M')
  rescue
    return ''
  end

  def format_date_time(date_time)
    return date_time.strftime('%b %d, %Y %H:%M')
  rescue
    return ''
  end

  def time_difference_in_hours(utc_time, timezone_time)
    return 0 if utc_time.nil? || timezone_time.nil?
    ((utc_time.utc_offset - timezone_time.utc_offset)/3600).abs
  end

  def time_difference_in_seconds(from_time, to_time)
    return 0 if from_time.nil? || to_time.nil? || from_time >= to_time
    (to_time - from_time).to_i
  end

  def timezone_query(date_time_column)
    "(#{date_time_column} AT TIME ZONE 'UTC') AT TIME ZONE '#{Time.zone.name}'"
  end

  def round_amount(amount)
    BigDecimal((amount * 100).round)/100
  end

  def week_of_the_month(date)
    date.strftime('%U').to_i - date.beginning_of_month.strftime('%U').to_i + 1
  end

  def key_search(words)
    return '' if words.blank?

    words = quote_string(words)
    words = words.strip.gsub(' ', '%')
    "%#{words}%"
  end

  module_function :json_to_array
  module_function :json_to_hash
  module_function :strings_to_dates
  module_function :escape_elastic_search_query
  module_function :short_address_decoration
  module_function :open_spreadsheet
  module_function :valid_email?
  module_function :mask_email
  module_function :last_digits
  module_function :mask_number
  module_function :json_to_hash_with_symbolize_names
  module_function :convert_params_to_hash
  module_function :get_short_url
  module_function :quote_string
  module_function :round_up_next_9
  module_function :format_long_date
  module_function :format_short_date
  module_function :format_date_time
  module_function :time_difference_in_hours
  module_function :time_difference_in_seconds
  module_function :to_time
  module_function :timezone_query
  module_function :get_server_url
  module_function :round_amount
  module_function :week_of_the_month
  module_function :key_search
end