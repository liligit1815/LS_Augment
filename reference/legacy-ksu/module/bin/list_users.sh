#!/system/bin/sh
pm list users 2>/dev/null | sed -n 's/.*UserInfo{\([0-9][0-9]*\):\([^:}]*\).*/\1|\2/p'
