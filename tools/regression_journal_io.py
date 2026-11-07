"""Atomic replacement of a flushed local evidence journal on Windows and POSIX."""
from time import sleep


def replace_flushed_file(temporary, target):
    # A reader or a scanner can briefly hold the destination without delete sharing.
    # Keep the old committed journal until rename succeeds. Propagate lasting failures.
    for delay in (0.02, 0.05, 0.1, 0.25, 0.5, 1.0):
        try:
            temporary.replace(target)
            return
        except PermissionError as error:
            if getattr(error, "winerror", None) not in (5, 32, 33):
                raise
            sleep(delay)
    temporary.replace(target)
