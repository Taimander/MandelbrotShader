# MandelbrotShader
A processing visualization of the Mandelbrot fractal that uses GLSL shaders for computation.

This is a small visualization project I created to learn about how to use GLSL shaders in Processing.

You can drag the screen to move the fractal, also, with the menu on the left, you are able to control how many iterations you want for the computation.
More iterations give a sharper image, specially the more zoomed in the fractal is, but with a very high number of iterations, it may slow down the render.

All the mandelbrot fractal computation happens within a shader, so it makes heavy use of the gpu, rather than doing
the calculations on the CPU. This adds the benefit of making it way faster, because the CPU may be faster on doing a
single calculation, but the GPU can split up the calculation of all pixels into different GPU cores, thus making the
overall render faster.

This allows the iterations to be cranked up with little performance penalty.

The two down-sides of this implementation is that it is bound to only the 32-bit floating point precision that GLSL allows,
which makes the sliding of the render not work as intented when the zoom is really big, the other down-side is also
because of the limited precision. If the zoom is really big, multiple pixels will map to the same "value" in the
floating point numbers, this causes that, with enough zoom, the result will look pixelated.

A great video explaining this phenomenon: https://www.youtube.com/watch?v=Q2OGwnRik24

This problem may be solved with arbitrary-precision floating point numbers, but it may require more resources to run,
and may not even be posible by computing it on the gpu, having to resort to computing it all on the cpu, which defeats
the whole purpose of this project.

