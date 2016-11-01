namespace :fb_page do
  desc "TODO"
  task :id_crawling, [:page_url] => :environment do |t, args|
    raise "Need to page_url" unless args[:page_url]
    page_url = args.page_url
    res = RestClient.get page_url
    if res.code == 200
      page_id = res.body.match(/\?page_id=(\d+)/)[0]
      puts page_id
    else
    end
  end

end
