Rails.application.config.middleware.use OmniAuth::Builder do
  provider :wechat, 'wx36fee8a5da4ac490', '1c696a70389e96785c454aa391d4d1ac'
  provider :weibo, '4178601071', '7b1cf76af84be22b54973e28f4ede4b3'
  provider :qq_connect, '101402127', '11bf45841ce125229cae07a33dcd9c30'
end
