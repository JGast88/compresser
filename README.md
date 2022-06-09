# README

* System dependencies
Ruby: 3.0.4
PostgreSQL: 13.7
Redis + Sidekiq
Vips imagemagick

* Configuration

In a Mac terminal:

  $ brew install imagemagick vips
  
In a debian/ubuntu terminal:

  $ sudo apt install imagemagick libvips

1. Install dependencies
2. Setup credentials

EDITOR=nano rails credentials:edit

- gmail
    - mailer_login:  **your login**
    - mailer_password_secured: **gmail app password**

