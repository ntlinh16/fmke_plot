# fmke_plot

You must have [R](http://www.r-project.org) to generate graphs of your benchmarks. Setting up the R environment with all the required dependencies may be cumbersome. Therefore, the easiest way is to use Docker to run the graph plotting script.

```bash
$ docker pull ntlinh/fmke_plot
$ docker run -it --rm -v your/fmke/benchmark/results/directory/:/data -w /plot fmke_plot Rscript --vanilla summary.r -i /data -o /data/output.png
```
It will first pull the `ntlinh/fmke_plot` image from Docker hub. Then it will run a container that has R and all the required dependencies to generate the graph.
The option `-v` will mount directory `your/fmke/benchmark/results/directory` to the directory `/data` inside your container. When running the R script `summary.r`, the option `-i` indicate the input directory that contains the `summary.csv` file, and the option `-o` is for the output path of the graph.

You can also build the Docker image locally using the `Dockerfile` in this repository:
```bash
$ docker build -t fmke_plot .
```
and then run the command above to plot.

## Plotting graphs directly

The results are in CSV format in the `your/fmke/benchmark/results/directory`. Now you can generate a graph:

```bash
$ cd fmke_plot
$ Rscript --vanilla summary.r -i your/fmke/benchmark/results/directory -o your/fmke/benchmark/graph/output.png
```

The graph will be saved at `your/fmke/benchmark/graph/output.png`

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
