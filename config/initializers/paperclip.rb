if 'S3' == ENV['PAPERCLIP_STORAGE']
  options = Paperclip::Attachment.default_options
  options[:storage] = :s3
  options[:url] = ':s3_domain_url'
  options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
  options[:s3_permissions] = 'public-read'
  options[:s3_credentials] = {
    bucket: ENV.fetch('S3_BUCKET_NAME'),
    access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
    secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
    s3_region: ENV.fetch('AWS_REGION'),
  }
end
