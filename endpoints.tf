locals {
  // uri_matcher provides a way to separate scheme from authority in a URL
  uri_matcher = "^(?:(?P<scheme>[^:/?#]+):)?(?://(?P<authority>[^/?#]*))?"
}

locals {
  // raw_endpoints holds a single array of all endpoints of the format `amqps://amqps://broker-id.mq.us-west-2.amazonaws.com:5671`
  raw_endpoints = [for instance in aws_mq_broker.this.instances : instance.endpoints[0]]

  // endpoints is a list of endpoints with only the url authority (no scheme or user info)
  endpoints = [for url in local.raw_endpoints : lookup(regex(local.uri_matcher, url), "authority")]
}
