#!/usr/bin/env fish

function is_nvidia
  lspci | grep -i GeForce > /dev/null

  if test $status -eq 0
    echo 1
  else
    echo 0
  end
end

function is_nvidia_render
  glxinfo | grep -i "OpenGL renderer string" | grep -i GeForce > /dev/null

  if test $status -eq 0
    echo 1
  else
    echo 0
  end
end

if test (is_nvidia) -eq 1 -a (is_nvidia_render) -eq 0
  notify-send -a 'gpu-detect.fish' -i dialog-warning 'OpenGL renderer mismatch!' 'You are using NVIDIA GPU, but OpenGL renderer does not use it.'
end

