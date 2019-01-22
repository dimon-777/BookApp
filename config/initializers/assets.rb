# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

Rails.application.config.assets.precompile += %w( dima.css )

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w( book/modernizr.custom.js )
Rails.application.config.assets.precompile += %w( book/book.js )
Rails.application.config.assets.precompile += %w( book/jquery.bookblock.js )
Rails.application.config.assets.precompile += %w( editor/froala_editor.min.js )
Rails.application.config.assets.precompile += %w( editor/froala_editor.pkgd.min.js )

Rails.application.config.assets.precompile += %w( editor/froala_editor.min.css )
Rails.application.config.assets.precompile += %w( editor/froala_style.min.css )
Rails.application.config.assets.precompile += %w( editor/plugins/code_view.min.css )
Rails.application.config.assets.precompile += %w( editor/plugins/colors.min.css )
Rails.application.config.assets.precompile += %w( editor/plugins/emoticons.min.css )
Rails.application.config.assets.precompile += %w( editor/plugins/image_manager.min.css )
Rails.application.config.assets.precompile += %w( editor/plugins/image.min.css )
Rails.application.config.assets.precompile += %w( editor/plugins/line_breaker.min.css )
Rails.application.config.assets.precompile += %w( editor/plugins/char_counter.min.css )
Rails.application.config.assets.precompile += %w( editor/plugins/video.min.css )
Rails.application.config.assets.precompile += %w( editor/plugins/fullscreen.min.css )
Rails.application.config.assets.precompile += %w( editor/plugins/file.min.css )
Rails.application.config.assets.precompile += %w( editor/plugins/table.min.css )


Rails.application.config.assets.precompile += %w( navbar/navbar.css )
Rails.application.config.assets.precompile += %w( illustrations/main.scss )

Rails.application.config.assets.precompile += %w( navbar/jquery.dropotron.min.js )
Rails.application.config.assets.precompile += %w( navbar/browser.min.js )
Rails.application.config.assets.precompile += %w( navbar/breakpoints.min.js )
Rails.application.config.assets.precompile += %w( navbar/util.js )
Rails.application.config.assets.precompile += %w( navbar/main.js )

Rails.application.config.assets.precompile += %w( illustrations/jquery.poptrox.min.js )
Rails.application.config.assets.precompile += %w( illustrations/browser.min.js )
Rails.application.config.assets.precompile += %w( illustrations/breakpoints.min.js )
Rails.application.config.assets.precompile += %w( illustrations/main.js )
