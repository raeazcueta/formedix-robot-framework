import sys
import os
import configparser

try:
    dir_path = os.path.dirname(os.path.realpath(__file__))
    config_file = os.path.join(dir_path, 'EvnConfig.ini')

    config = configparser.ConfigParser()
    config.read(config_file)

    server = config.get('Environment', 'server')
    user = config.get('Environment', 'user')
    browser = config.get('Environment', 'browser')


except (configparser.Error, configparser.NoSectionError, configparser.NoOptionError) as e:
    sys.stderr.write("Error: {0}.\n".format(e))
    sys.exit()
