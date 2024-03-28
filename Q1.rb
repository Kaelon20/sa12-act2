require 'httparty'
require 'json'

def user_repos(username)
  url = "https://api.github.com/users/#{username}/repos"
  response = HTTParty.get(url)
  JSON.parse(response.body)
end

def repo_info(repo)
    puts "Name: #{repo[:name]}"
    puts "Description: #{repo[:description]}"
    puts "Stars: #{repo[:stars]}"
    puts "URL: #{repo[:url]}"
end

def most_starred_repo(repos)
    most_starred_repo = repos.max_by { |repo| repo['stargazers_count'] }
    {
      name: most_starred_repo['name'],
      description: most_starred_repo['description'],
      stars: most_starred_repo['stargazers_count'],
      url: most_starred_repo['html_url']
    }
end

username = 'Kaelon20'
repos = user_repos(username)
most_starred_repo = most_starred_repo(repos)
repo_info(most_starred_repo)
