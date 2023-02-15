package API::Tester::Response;

use v5.36;
use Moo;
use Types::Common -types;
use API::Tester::Type -types;

has id => (
    is            => 'ro',
    isa           => PositiveInt,
    required      => 1,
    documentation => "テスターのID"
);

has name => (
    is            => 'ro',
    isa           => StrLength [1, 128],
    required      => 1,
    documentation => "テスターの名前"
);

has role => (
    is            => 'ro',
    isa           => Role,
    required      => 1,
    documentation => "テスターの役割"
);

sub as_json ($self) {
    my %attr = $self->%*;
    return +{%attr};
}

1;
