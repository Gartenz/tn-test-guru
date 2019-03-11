module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo = '')
    text = repo == "" ? author : repo
    link_to text, "https://github.com/#{author}/#{repo}", target: '_blank'
  end
end
