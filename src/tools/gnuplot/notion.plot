# file: notion.plot

set terminal pngcairo size 1000,700 enhanced font 'Verdana,10'
set output 'results/dashboard.png'
set multiplot title strftime("%Y-%m-%d", time(0))

set origin 0,0.5
set size 1,0.48
#set title 'Distribution of Scores'
#set style fill transparent solid 0.5
set style histogram clustered
set style fill solid 0.6
set xlabel 'Score'
set ylabel 'Count'
set grid y
plot 'results/distribute_2024.txt' using 1:2 with boxes lc rgb "blue" title '2024', \
     'results/distribute_2025.txt' using 1:2 with boxes lc rgb "red" title '2025'

set origin 0,0
set size 0.5,0.5
#set title 'Score Trend By Year'
set xlabel 'Weeks in year'
set ylabel 'Score per week'
plot 'results/trend_2024.txt' using 1:9 with lines lw 2 lc rgb "blue" title '2024', \
     'results/trend_2025.txt' using 1:9 with lines lw 2 lc rgb "red" title '2025'


set origin 0.5,0
set size 0.5,0.5
#set title 'Score Trend At All Times'
set xlabel 'Weeks in year'
set ylabel 'Avg score at all times'
plot 'results/sumtrend_2024.txt' using 1:9 with lines lw 2 lc rgb "blue" title '2024', \
     'results/sumtrend_2025.txt' using 1:9 with lines lw 2 lc rgb "red" title '2025'

unset multiplot
