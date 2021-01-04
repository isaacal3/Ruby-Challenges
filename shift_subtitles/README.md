# The Ruby Challenge

**Goals**: Basic control over Ruby elements, specially command line scripting.

**Description**: There are several ways to subtitle a movie nowadays, and one of  
the most well known format is the SubRip format  
(http://en.wikipedia.org/wiki/SubRip).

#### It has entries like these:

```bash
  645
  01:31:51,210 --> 01:31:54,893
  the government is implementing a new policy...

  646
  01:31:54,928 --> 01:31:57,664
  In connection with a dramatic increase
  in crime in certain neighbourhoods,
```

Each line has an increasing integer identification, then comes the time range  
(start and end time) in the format “hours:minutes:seconds,milliseconds”. The  
decimal separator used is the comma. Finally there are the subtitles themselves  
and a line break marks the end of an entry.

Sometimes the timing is shifted for a small amount, 2 or 3 seconds. Then comes  
the trouble when you need to shift everything a few seconds back or ahead.

The goal is to create a small command line script in Ruby that will read an SRT  
file, and output another one with the new calculated times.

So, for example, if I want to shift everything 2,500 (2 seconds and 500  
milliseconds) ahead, I would start with this:

```bash
  01:32:04,283 --> 01:32:07,769

and end up with:

  01:32:06,783 --> 01:32:10,269
```

The command line should accept arguments such as:

```bash
  shift_subtitle --operation add --time 02,110 input_file output_file
```

This means “–operation” can accept either ‘add’ or ‘sub’ to add or subtract  
times. The “–time” will accept the amount of time to shift in the format 11,222  
where “11” is the amount of seconds and “222” the amount of milliseconds.

## Requirements:

- This has to be a pure Ruby script, using only the Ruby Standard Libraries  
  (meaning, no external Gems).
- It has to implement “optparse” to parse the command line arguments.

# Credits

- [Fabio Akita](https://www.akitaonrails.com)
- [Ruby Learning](http://www.rubylearning.com/)
