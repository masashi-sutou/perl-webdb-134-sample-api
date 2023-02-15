package API::App;

use v5.36;
use Mojo::Base 'Mojolicious', -signatures;
use API::Tester::Controller;

sub _setupRoutes ($self) {
    my $r = $self->routes;
    $r->namespaces(['API']);

    API::Tester::Controller->endpoint($r);

    return;
}

sub startup ($self) {
    _setupRoutes($self);
    return $self;
}

1;
