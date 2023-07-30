module ArticlesHelper
  def filter_unpublished_article(articles)
    articles.where(published: false)
  end
end
