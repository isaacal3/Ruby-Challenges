require 'test/unit'
require_relative '../lib/srt_time.rb'

class SrtTimeTest < Test::Unit::TestCase
  def test_convert_time
    @srt = SrtTime.new('00:01:16,320 --> 00:01:19,320\r\n', { operation: '+', time: 2.5 })
    assert_equal @srt.convert_time('00:01:16,320'), '00:01:18,820'
  end

  def test_srt_time
    @srt = SrtTime.new('00:01:16,320 --> 00:01:19,320\r\n', { operation: '+', time: 2.5 })
    assert_equal @srt.srt_time, "00:01:18,820 --> 00:01:21,820\r\n"
  end

  def test_shift_subtitle
    input_file = File.join(File.dirname(__FILE__), 'fixtures', 'the_godfather.srt')
    output_file = File.join(File.dirname(__FILE__), 'fixtures', 'output.srt')

    expected_output = File.read(output_file)
    output = ''

    options = { operation: '+', time: 2.11 }
    File.readlines(input_file).each do |line|
      output << SrtTime.new(line, options).srt_time
    end
    assert_equal expected_output, output
  end
end
