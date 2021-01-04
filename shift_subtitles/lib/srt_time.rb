require 'time'

# Return a time & line
class SrtTime
  def initialize(line, options = {})
    @line = line
    @operation = options[:operation]
    @time = options[:time]
  end

  # Convert time recived and do a operation
  def convert_time(string)
    time = Time.parse(string).send(@operation, @time)
    time.strftime('%T,%L') # Formating on 'hh:mm:ss,mls'
  end

  def srt_time
    if @line.match(/^0[0-9]:/)
      line_splited = @line.strip.split
      start_time = convert_time(line_splited[0])
      final_time = convert_time(line_splited[2])

      "#{start_time} --> #{final_time}\r\n"
    else
      @line.to_s
    end
  end
end
