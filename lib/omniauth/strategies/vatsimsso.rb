require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Vatsimsso < OmniAuth::Strategies::OAuth2
      option :name, 'vatsimsso'
      option :client_options,
             site: 'https://auth-dev.vatsim.net',
             authorize_url: '/oauth/authorize',
             token_url: '/oauth/token'

      uid do
        raw_info.dig('data', 'cid').to_s
      end

      info do
        {
          name_full: raw_info.dig('data', 'personal', 'name_full'),
          email: raw_info.dig('data', 'personal', 'email'),
          rating: raw_info.dig('data', 'vatsim', 'rating', 'short')
        }
      end

      extra do
        { raw_info: raw_info }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/user').parsed
      end

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end