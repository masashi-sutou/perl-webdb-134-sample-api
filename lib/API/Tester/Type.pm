package API::Tester::Type;

use v5.36;
use Type::Library -base;
use Type::Utils -all;

enum Role => ['member', 'admin', 'owner'];

1;
