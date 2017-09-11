#!/bin/bash

words=(isalnum isalpha isascii isblank iscntrl isdigit isgraph islower isprint ispunct isspace isupper isxdigit toupper tolower malloc realloc free strtol strtoul putenv getenv isalnum isalpha iscntrl isdigit islower isprint vprintf vsprintf vfprintf sprintf fprintf memmove ispunct isspace isupper isxdigit memcpy memcmp memset strcpy strcmp strncmp strlen strchr)


for w in "${words[@]}"; do
    echo "replacing $w"
    sed -i "s/\b$w\b/__libpov_$w/g" $1
done

ag -l pcre_malloc | xargs sed -i 's/\bpcre_malloc\b/pcre___libpov_malloc/g'
ag -l pcre_free | xargs sed -i 's/\bpcre_free\b/pcre___libpov_free/g'

exit 0
