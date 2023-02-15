package Monolith::Repository::Tester;

use strict;
use warnings;
use Monolith::DBIWrapper;

sub lookup {
    my ($self, $id) = @_;

    my $sql = << "__SQL__";
SELECT * FROM tester
WHERE id = ?
limit 1
__SQL__

    return Monolith::DBIWrapper->exec_sql($sql, $id);
}

1;
