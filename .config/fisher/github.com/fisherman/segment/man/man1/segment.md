segment(1) -- Powerline prompt builder
======================================

## SYNOPSIS

`segment` *foreground color* *background color* [*text*]<br>
`segment_right` *foreground color* *background color* [*text*]<br>
`segment_close`<br>

## DESCRIPTION

**Segment** is a fish library to build powerline prompts.

## USAGE

Call segment / segment_right to create a powerline segment. Call segment_close after you have added all the prompt segments.

```fish
function fish_prompt
    segment white red FRONT
    segment black white BASE
    segment_close
end

function fish_right_prompt
    segment_right white red FRONT
    segment_right black white BASE
    segment_close
end
```

## OPTIONS

* *foreground*: Set the text foreground color.

* *background*: Set the text background color.

* [*text*]: Set the text to display.

## NOTES

* The left prompt is built from *right* to left.
* The right prompt is built from *left* to right.
