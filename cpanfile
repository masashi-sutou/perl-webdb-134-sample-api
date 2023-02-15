requires 'Mojolicious', '== 9.31';
requires 'Moo', '== 2.005005';
requires 'Type::Tiny', '== 2.002000';
requires 'DBD::mysql', '4.050';
requires 'Data::Printer', '== 1.1.0';

on 'test' => sub {
    requires 'Test2::V0', '== 0.000145';
};
