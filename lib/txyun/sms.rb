require "txyun/sms/version"

module Txyun
  module Sms
    class Configuration
      attr_accessor :nationcode, :sign, :time, :extend_code, :ext, :appkey, :sdkappid

      def initialize
        @nationcode = ''
        @sign = ''
        @time = ''
        @extend_code = ''
        @ext = ''
        @appkey = ''
        @sdkappid = ''
      end
    end

    class << self
      attr_writer :configuration

      def configuration
        @configuration ||= Configuration.new
      end

      def configure
        yield(configuration)
      end

      def create_params(mobile_num, tpl_id, message_params, time_stamp, sig)
        sms_params ={
          'tel' => {
            'nationcode' => configuration.nationcode,
            'mobile' => mobile_num
          },
          'sign' => configuration.sign,
          'tpl_id' => tpl_id,
          'params' => [message_params],
          'sig' => "#{sig}",
          'time' => time_stamp,
          'extend' => configuration.extend_code,
          'ext' => configuration.ext
        }
      end

      def send(mobile_num, template_code, message_params)
        temp_string = rand(100000..999999)
        current_url = "https://yun.tim.qq.com/v5/tlssmssvr/sendsms?sdkappid=#{configuration.sdkappid}&random=#{temp_string}"

        time_stamp = Time.now.to_i

        wait_string = "appkey=#{configuration.appkey}&random=#{temp_string}&time=#{time_stamp}&mobile=#{mobile_num}"

        sig  = Digest::SHA256.hexdigest(wait_string)

        sms_params = create_params(mobile_num, template_code, message_params, time_stamp, sig)

        rpost = HTTParty.post(current_url, {body: sms_params.to_json})
      end
    end
  end
end
