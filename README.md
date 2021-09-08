# fmke_plot
Script for plotting graphs of FMKe benchmark

## Quick Start
You must have [R](http://www.r-project.org) to generate graphs of your benchmarks. 

The results are in CSV format in the `your/fmke/benchmark/results/directory`. Now you can generate a graph:

```bash
$ cd fmke_plot
$ Rscript --vanilla summary.r -i your/fmke/benchmark/results/directory
```
The output should be:
```
Loading required package: proto
Loading required package: reshape
Loading required package: plyr
Loading required package: digest
null device
```
The graph will be saved at `your/fmke/benchmark/results/directory/summary.png`

## Troubleshooting Graph Generation

If make results fails with the error `/usr/bin/env: Rscript --vanilla: No such file or directory`
please edit `summary.r` and replace the first line with the full path to the Rscript binary on your system

If you receive the error message `Warning: unable to access index for repository http://lib.stat.cmu.edu/R/CRAN/src/contrib`, it means the default R repo for installing additional packages is broken, you can change it as follows:

```bash
$ R
> chooseCRANmirror()
Selection: 69
quit()
```

## Alternative Graph Generation by gnuplot
You can generate graphs using gnuplot.

```bash
$ ./gp_throughput.sh
$ ./gp_latency.sh
```

By passing `-h` option to each script, help messages are shown.

Some of options for these scripts are:

- `-d TEST_DIR` : comma separated list of directories which include test result CSV files
- `-t TERMINAL_TYPE` : gnuplot terminal type
- `-P` : just print gnuplot script without drawing graph

For example, you can draw graphs with ASCII characters by the option `-t dumb`, which is useful in non-graphical environment or quick sharing of result in chat.

Also, you can plot multiple test results on a single plot by using `-d` switch.
