# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w( sb-admin-2.min.css )
Rails.application.config.assets.precompile += %w( googleapi.css )
Rails.application.config.assets.precompile += %w( fontawesome-free/css/all.min.css )
Rails.application.config.assets.precompile += %w( jquery/jquery.min.js )
Rails.application.config.assets.precompile += %w( bootstrap/bootstrap.bundle.min.js )
Rails.application.config.assets.precompile += %w( jquery-easing/jquery.easing.min.js )
Rails.application.config.assets.precompile += %w( sb-admin/sb-admin-2.min.js )
Rails.application.config.assets.precompile += %w( sb-admin/chart.js/Chart.min.js )
Rails.application.config.assets.precompile += %w( sb-admin/demo/chart-area-demo.js )
Rails.application.config.assets.precompile += %w( sb-admin/demo/chart-pie-demo.js )
