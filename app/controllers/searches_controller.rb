class SearchesController < ApplicationController
  def search
     word = params[:search_content]
     posts = Post.where("content LIKE ? or title LIKE ?", "%#{word}%", "%#{word}%")

     @comments = Comment.where("content LIKE ?", "%#{word}%")

     ary = []
     @comments.each do |comment|
       ary.push(comment.post)
     end

     @posts = (posts + ary).uniq

   end
end
