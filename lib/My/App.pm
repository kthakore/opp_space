package My::App;
use strict;
use warnings;
use Carp;

use SDL;
use SDL::Rect;
use SDL::Event;
use SDL::Events;
use SDL::Video;

use SDLx::Widget::Controller;

sub new {
	my ($class, %options) = @_;
	my $self = bless {}, ref $class || $class;

	$self->_init( \%options );

	return $self;
}


sub _init
{
	my ($self, $options) = @_;

	# Initing video
	# Die here if we cannot make video init
	croak 'Cannot init  ' . SDL::get_error()
	if ( SDL::init(SDL_INIT_VIDEO) == -1 );

	my $width = exists $options->{width} ? $options->{width} : 800;
	my $height = exists $options->{height} ? $options->{height} : 600;
	my $depth = exists $options->{depth} ? $options->{depth} : 32;

	# Create our display window
	# This is our actual SDL application window
	my $a = SDL::Video::set_video_mode( $width, $height, 32,
		SDL_HWSURFACE | SDL_DOUBLEBUF | SDL_HWACCEL );

	croak "Cannot init video mode $width x $height x $depth: " . SDL::get_error()
	unless $a;

	$self->{display} = $a;

}


sub start
{
    sleep(1);

}


1;
