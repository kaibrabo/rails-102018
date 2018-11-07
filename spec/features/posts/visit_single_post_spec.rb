# require "rails-helper"

RSpec.feature "Visit single post", :type => :feature do
    let(:user) { create(:user)}
    let(:post) { create(:post)}

    scenario "User goes to a single post fromm the home page", js: true do
        post
        visit root_path
        page.find(".single-post-card").click
        expect(page).to have_selector('body .modal')
        page.find('.interested a').click
        expect(page).to have_selector('#single-post-content', text: post.content)
    end
end