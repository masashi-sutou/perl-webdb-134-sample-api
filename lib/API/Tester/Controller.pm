package API::Tester::Controller;

use v5.36;
use Mojo::Base 'Mojolicious::Controller', -signatures;
use Types::Common -types;
use experimental qw(try);
use Monolith::Repository::Tester;
use API::Tester::Response;

sub endpoint ($class, $r) {
    my $tester = $r->any('/tester')->to(controller => 'Tester::Controller');
    $tester->get('/id/:id' => [id => qr/[\d]+/a])->to('#id');
    return;
}

sub id ($c) {
    try {
        my $id       = $c->param('id');
        my $props    = Monolith::Repository::Tester->lookup($id);
        my $response = API::Tester::Response->new($props);

        return $c->render(json => $response->as_json);
    } catch ($e) {
        $c->app->log->warn($e);
        return $c->render(
            status => 400,
            json   => {
                error   => 'bad request: not found tester',
                message => '該当のテスターが見つかりません'
            }
        );
    }
}

1;
