# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from datetime import datetime

from django.conf import settings

TIMESTAMP = datetime.now().strftime("%Y-%m-%d_%H-%M-%S")


def server_info(request):
    return {
        'SERVER_MODE': settings.SERVER_MODE,
        'TIMESTAMP': 't='+TIMESTAMP,
    }
