# Description: Jekyll plugin to wrap image tags with a link to the source image
# place in /_plugins/

Jekyll::Hooks.register :posts, :pre_render do |post, payload|
  docExt = post.extname.tr('.', '')
  # only process if we deal with a markdown file
  if payload['site']['markdown_ext'].include? docExt
    newContent = post.content.gsub(/\!\[(.+)\]\((.+)\)/, '[!["\1"](\2)](\2)')
    post.content = newContent
  end
end