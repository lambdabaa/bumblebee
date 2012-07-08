#!/usr/bin/env python

import api
import tornado.ioloop
import tornado.web

PORT = 8080

if __name__ == "__main__":
  app = tornado.web.Application([
      ("/ping", api.LocationPingHandler)
  ])
  
  app.listen(PORT)
  tornado.ioloop.IOLoop.instance().start()
