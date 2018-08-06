# Cron Expression Parser (CEP)
## Introduction
CEP is a command line application which parses a cron string and expands each field to
show the times at which it will run.
## How to run
1. Install ruby
2. Open terminal 
3. put `ruby main.rb '<params>'` into terminal. Please close params into single upper commas. 
4. Enjoy beautiful results

### Params
Params should contain 6 arguments:
1. Minute `0-59`
2. Hour `0-23`
3. Day of month `0-31`
4. Month `1-12`
5. Day of week `1-7`
6. Command `any with args`

It can be single values or special notation:
1. Division `*/2`
2. All `*`
3. List `1,2,3`
4. Range `1-4`

Example of params

`*/1 2 1,15,10 * 1-3 /hello --ddd`

`1 2 3 4 5 /delete --all`

## What to expect
If you provide correct params you will get nice table in output

```
+--------------+----------------------------+
| Minute       | 0 15 30 45                 |
| Hour         | 0                          |
| Day of month | 1 15                       |
| Month        | 1 2 3 4 5 6 7 8 9 10 11 12 |
| Day of week  | 1 2 3 4 5                  |
| Command      | /hello                     |
+--------------+----------------------------+
```

## Who is in charge
The code is developed by Andrii Seleznov (great@google.com). It is a part of feature TT-123.
Which solve the problem with our internal cron scheduling stuff.