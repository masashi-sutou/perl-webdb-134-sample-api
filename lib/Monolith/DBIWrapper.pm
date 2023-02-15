package Monolith::DBIWrapper;

use strict;
use warnings;
use DBI;

sub _dbh {
    my ($class) = @_;

    return DBI->connect_cached(
        'dbi:mysql:sample;hostname=db',
        'tester',
        'password',
        {
            RaiseError            => 1,
            PrintError            => 0,
            AutoCommit            => 1,
            mysql_connect_timeout => 5,
            mysql_enable_utf8     => 1
        }
    );
}

sub exec_sql {
    my ($class, $sql, @bind) = @_;

    my $dbh = __PACKAGE__->_dbh();
    my $sth = $dbh->prepare_cached($sql);
    $sth->execute(@bind);
    my $result = $sth->fetchrow_hashref();
    $sth->finish();

    return $result;
}

1;
