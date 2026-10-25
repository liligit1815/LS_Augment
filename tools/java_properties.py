"""Read Java Properties files used by Android's local build configuration."""
from pathlib import Path
import re


def _unescape(value):
    def replace(match):
        escape = match[1]
        if escape.startswith('u'):
            if not re.fullmatch(r'u[0-9a-fA-F]{4}', escape):
                raise ValueError('Malformed Java Properties Unicode escape')
            return chr(int(escape[1:], 16))
        return {'t': '\t', 'n': '\n', 'r': '\r', 'f': '\f'}.get(escape, escape)
    return re.sub(r'\\(u.{0,4}|.)', replace, value)


def read_properties(path):
    # Java Properties.load(InputStream), used for local.properties, is Latin-1.
    result = {}
    pending = ''
    continuing = False
    for physical in re.split(r'\r\n|\r|\n', Path(path).read_text(encoding='iso-8859-1')):
        line = pending + physical.lstrip(' \t\f')
        if not continuing and (not line or line.startswith(('#', '!'))):
            continue
        trailing = len(line) - len(line.rstrip('\\'))
        if trailing % 2:
            pending = line[:-1]
            continuing = True
            continue
        pending = ''
        continuing = False
        _put(result, line)
    if continuing:
        _put(result, pending)
    return result


def _put(result, line):
    escaped = False
    boundary = len(line)
    for index, char in enumerate(line):
        if not escaped and char in '=:\t\f ':
            boundary = index
            break
        escaped = not escaped if char == '\\' else False
    remainder = line[boundary:].lstrip(' \t\f')
    if remainder.startswith(('=', ':')):
        remainder = remainder[1:].lstrip(' \t\f')
    result[_unescape(line[:boundary])] = _unescape(remainder)
