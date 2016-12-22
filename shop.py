# coding:utf8
import sys

reload(sys)
sys.setdefaultencoding('utf8')
import os

import tornado
from tornado.httpserver import HTTPServer
from tornado.options import define, options, parse_command_line

define('port', default=8000, help='default port is 8000', type=int)
define('app_name', type=str)
define('debug', default=True, type=bool)
define('dev', default=True, type=bool)

from handler import index


def make_app(handlers, settings):
    return tornado.web.Application(handlers=handlers, **settings)


if __name__ == '__main__':
    parse_command_line()
    base_dir = os.path.dirname(__file__)

    handlers = [
        ('/', index.IndexHandler),
    ]

    settings = dict(
        debug=True,
        template_path=os.path.join(base_dir, 'front', 'src'),
        static_path=os.path.join(base_dir, 'front', 'src', 'static')
    )

    app = make_app(handlers, settings)
    server = HTTPServer(app)
    server.listen(options.port)
    tornado.ioloop.IOLoop.instance().start()
