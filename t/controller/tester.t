use v5.36;
use Test::Mojo;
use Test2::V0;

my $t        = Test::Mojo->new('API::App');
my $response = { id => 1, name => 'tester_01', role => 'owner' };

subtest 'get a tester' => sub {
    my $res = $t->get_ok('/tester/id/1');
    $res->status_is(200)->json_is($response);
};

subtest 'cannot get tester with non-existent id' => sub {
    my $res = $t->get_ok('/tester/id/2');
    $res->status_is(400)->json_is(
        {
            error   => 'bad request: not found tester',
            message => '該当のテスターが見つかりません'
        }
    );
};

done_testing;
