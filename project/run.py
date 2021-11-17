import argparse
import os
import sys

import pytest
from glob import glob


def _get_args():
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument('--help', action='store_true')
    return parser.parse_known_args()[1]


def main():
    pytest_args = _get_args()
    tests_path = os.path.abspath('project/academy/tests/')
    pytest_command = ['--verbose', '--capture', 'tee-sys', '--log-cli-level=10', tests_path, '--color=yes', '--pyargs',
                      'project']
    exit_code = pytest.main([*pytest_command, *pytest_args])
    sys.exit(exit_code)


if __name__ == '__main__':
    main()
