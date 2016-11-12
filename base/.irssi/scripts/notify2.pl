use strict;
use vars qw($VERSION %IRSSI);
use Irssi;

$VERSION = '1.00';
%IRSSI = (
    authors     => 'Erwin Atuli',
    contact     => 'erwinatuli\@gmail.com',
    name        => 'Notify',
    description => 'This script allows forwarding notifications' .
                    'to notification engine',
    license     => 'Public Domain',
);

sub send_notification {
    my($msg) = @_;
    $msg = add_slashes($msg);
    system("notify-send \"$msg\" &");
}

sub print_text_notify {
	my ($dest, $text, $stripped) = @_;
	my $server = $dest->{server};

	return if (!$server || !($dest->{level} & MSGLEVEL_HILIGHT));
	my $sender = $stripped;
    $sender =~ s/([\w]+).*/$1/;
	$sender =~ s/.{2}/$2/;
    $stripped =~ s/.{2}\S+ - // ;
	my $channel = $dest->{target};
	send_notification("Mentioned in $channel by $sender: $stripped");
}

sub event_privmsg {
    my ($server, $data, $nick, $address) = @_;

	return if (!$server);
	send_notification("Private message from $nick: $data");
}

sub add_slashes {
    my($text) = shift;
    $text =~ s/\\/\\\\/g;
    $text =~ s/"/\\"/g;
    $text =~ s/\\0/\\\\0/g;
    return $text;
}

Irssi::signal_add('print text', 'print_text_notify');
Irssi::signal_add('message private', 'event_privmsg');
