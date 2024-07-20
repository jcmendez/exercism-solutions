unit module SecretHandshake;

#| Given a decimal number, convert it to the appropriate sequence of events for a secret handshake.
#|  00001 = wink
#|  00010 = double blink
#|  00100 = close your eyes
#|  01000 = jump
#|  10000 = Reverse the order of the operations in the secret handshake.

sub handshake ( $number ) is export {
    my @actions = ('wink', 'double blink', 'close your eyes', 'jump');
    my @result;
    for @actions.kv -> $i, $action {
        if $number +& (1 +< $i) {
            @result.push: $action;
        }
    }
    if $number +& 0b10000 {
        @result = @result.reverse;
    }
    @result;
}
