#!/bin/sh
if [ "${{ github.event.inputs.shell_url }}" ]; then
  echo "shell_url: ${{ github.event.inputs.shell_url }}"
  curl -fsSL "${{ github.event.inputs.shell_url }}" | /bin/sh
fi
if [ "${{ github.event.inputs.command }}" ]; then
  echo "command: ${{ github.event.inputs.command }}"
  command_str="${{ github.event.inputs.command }}"
  eval $command_str
fi

