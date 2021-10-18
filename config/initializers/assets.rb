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

# /app/assets
Rails.application.config.assets.precompile += %w( admins_backoffice.js admins_backoffice.css
                                                  users_backoffice.js users_backoffice.css
                                                )

# /lib/asssets
Rails.application.config.assets.precompile += %w( sb-admin-2.js sb-admin-2.css )

#/lib/images
Rails.application.config.assets.precompile += %w( sb-admin/undraw_posting_photo.svg
                                                  sb-admin/undraw_profile_1.svg
                                                  sb-admin/undraw_profile_2.svg
                                                  sb-admin/undraw_profile_3.svg
                                                  sb-admin/undraw_profile.svg
                                                  sb-admin/undraw_rocket.svg
                                                  sb-admin/edit_user.png
                                                  sb-admin/login_image.jpg
                                                  sb-admin/new_user.jpg
                                                )
