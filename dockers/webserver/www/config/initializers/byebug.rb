# frozen_string_literal: true

=begin
if Rails.env.development?
  (-> do
    require 'socket'
    require 'timeout'

    def is_port_open?(ip, port)
      begin
        Timeout::timeout(1) do
          begin
            s = TCPSocket.new(ip, port)
            s.close
            return true
          rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH
            return false
          end
        end
      rescue Timeout::Error
      end

      return false
    end

    return if is_port_open?('0.0.0.0', 1048)

    require 'byebug/core'
    Byebug.start_server '0.0.0.0', 1048
  end).call
end
=end
