class GitHubClient
  ROOT_ENDPOINT = "https://api.github.com"
  ACCESS_TOKEN = '2b8c4b94ff410b41bdb011faedceeefc75c8671b'

  def initialize
    @http_client = setup_http_client
  end

  def create_gists(params)
    @http_client.post('gists',params) do |request|
      request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
      request.headers['Content-Type'] = 'application/json'
      request.body = params.to_json
    end
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end
end
