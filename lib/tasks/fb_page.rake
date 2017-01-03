namespace :fb_page do
  desc "page id "
  task :id_crawling, [:page_url] => :environment do |t, args|
    raise "Need to page_url" unless args[:page_url]
    page_url = URI(args.page_url).without_query

    res = RestClient.get page_url
    if res.code == 200
      page_id = res.body.match(/\?page_id=(\d+)/)\
                        .try(:[], 0)\
                        .try(:split, "=")\
                        .try(:[], 1)
      puts "page_id: #{page_id}, page_url: #{page_url}"
      FacebookPage.find_or_create_by(fb_id: page_id, url: page_url)
      [page_id, page_url]
    else
      puts "Get #{page_url} failed."
      nil
    end
  end

end
