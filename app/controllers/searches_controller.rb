class SearchesController < ApplicationController
  def search
     word = params[:search_content]
     posts = Post.where("title LIKE ?", "%#{word}%")

     @comments = Comment.where(" content1 LIKE ? or content2 LIKE ? or content3 LIKE ?", "%#{word}%", "%#{word}%", "%#{word}%")

     ary = []
     @comments.each do |comment|
       ary.push(comment.post)
     end

     @posts = (posts + ary).uniq

   end
end
