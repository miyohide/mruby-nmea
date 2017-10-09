class Nmea
  def initialize
    @type = @ns = @latitude = @ew = @longitude = @time = @date = nil
    @printable = false
  end

  def parse(str)
    tmp = str.split(',')
    @type = tmp[0]
    case @type
    when '$GPGGA'
      @time = tmp[1]
      @latitude = tmp[2]
      @ns = tmp[3]
      @longitude = tmp[4]
      @ew = tmp[5]
      @printable = true
    when '$GPRMC'
      @time = tmp[1]
      @latitude = tmp[3]
      @ns = tmp[4]
      @longitude = tmp[5]
      @ew = tmp[6]
      @date = tmp[9]
      @printable = true
    else
      @printable = false    
    end
  end

  def to_s
    if @printable
      if @date.nil?
        "#{time} lat = #{latitude} , lon = #{longitude}"
      else
        "#{date} #{time} lat = #{latitude} , lon = #{longitude}"        
      end
    else
      ''
    end
  end

  def latitude
    lat_f = @latitude.to_f
    d = (lat_f/100).floor
    m = (lat_f - 100*d)/60
    "%s%3.5f" % [@ns, d + m]
  end

  def longitude
    lon_f = @longitude.to_f
    d = (lon_f/100).floor
    m = (lon_f - 100*d)/60
    "%s%-3.5f" % [@ew, d+m]
  end

  def time
    "#{@time[0..1]}:#{@time[2..3]}:#{@time[4..5]}"
  end

  def date
    "20#{@date[4..5]}/#{@date[2..3]}/#{@date[0..1]}"
  end
end
