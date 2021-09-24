SinOsc foo => dac;
SinOsc bar => dac;
SinOsc boo => dac;

// converts pitch number into frequency
// miditones (this is middle C and E flat)
// set initial frequencies
60 => int bottom;
63 => int mid;
67 => int top;

while (true) {
    Std.mtof(bottom) => foo.freq;
    Std.mtof(mid) => bar.freq;
    Std.mtof(top) => boo.freq;
    
     // turn on
    0.5 => foo.gain => bar.gain => boo.gain;
    // wait 
    600::ms => now;
    
    // turn off
    0 => foo.gain => bar.gain => boo.gain;
    // wait
    600::ms => now;
    
    Math.random2(-10, 10) => int change;
    change +=> bottom;
    change +=> mid;
    change +=> top;
}