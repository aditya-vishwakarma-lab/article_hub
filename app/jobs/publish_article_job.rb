class PublishArticleJob < ApplicationJob
  # self.queue_adapter = :sidekiq
  queue_as :default

  def perform(article,publish_time)
    if article.publish_time == publish_time
      puts "article is being published"
      article.published = true
      article.save
    else
      puts "not publishing article, since its publish time has changed"
    end
  end
end
