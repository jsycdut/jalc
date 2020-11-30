#!/usr/bin/env bash

function load_average
{
  cat /proc/loadavg | cut -d ' ' -f "1 2 3"
}
