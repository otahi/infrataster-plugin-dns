require 'infrataster-plugin-dns'

Infrataster::Server.define(
  :dns,
  '192.168.33.0/24',
  vagrant: true
)
