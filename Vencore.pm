package Vencore;

use strict;
use Hoo qw( $m );
use Hoo::Legacy::MasonInterp;
use Sys::Hostname ();

use vars qw (
	$MENU_SIDE
	);

BEGIN {
	$MENU_SIDE = [
		[
			[ 'Company', 1 ],
			[ 'About Us', 2, '/company/' ],
			[ 'Typical Financing', 2, '/company/typical_financing/' ],
			[ 'Management Team', 2, '/company/management_team/' ],
			[ 'Executive Bios', 3, '/company/management_team/executive_bios/' ],
			[ 'FAQs', 2, '/company/faq/' ],
			[ 'Contact Us', 2, '/company/contact/' ],
			[ 'Directions', 3, '/company/contact/directions/' ]
			],
		[
			[ 'Products', 1 ],
			[ 'Overview', 2, '/products/' ],
			[ 'Extend Your Reach', 2, '/products/extend_your_reach/' ]
			],
		[
			[ 'Portfolio', 1 ],
			[ 'Clients', 2, '/clients/' ],
			[ 'By Industry', 2, '/clients/by_industry/' ],
			[ 'By Region/Industry', 2, '/clients/by_region_industry/' ],
			[ 'Testimonials', 2, '/clients/testimonials/' ]
			],
		[
			[ 'News', 1 ],
			[ 'Press Releases', 2, '/news/press_releases/' ]
			]
		];
	}

use constant LIVE => ( Sys::Hostname::hostname =~ /^server\.hoologic\.com$/ );

use constant HOST_LIVE => 'www.vencorecapital.com';
use constant HOST_LIVE_ADMIN => 'admin.vencorecapital.com';
use constant HOST_LOCAL => 'vencore';
use constant HOST_LOCAL_ADMIN => 'admin.vencore';
use constant HOST_TEST => 'vencore.hoologic.com';
use constant HOST_TEST_ADMIN => 'vencore-admin.hoologic.com';

use constant COMP_ROOT => '/var/www/vencorecapital/html';
use constant DATA_DIR => '/tmp/www/mason/vencorecapital';

use constant GOOGLE_ANALYTICS => 'UA-2262716-1';
use constant META_DESCRIPTION => 'Vencore Capital.';
use constant META_KEYWORDS => 'emerging growth companies, angel funding, financing capital, operating capital, subordinated debt, asset based lending, early stage, seed financing, venture loan, venture lease, venture leasing, venture debt, equipment financing, equipment leasing, working capital loans, growth capital, venture lenders, startup financing, debt financing for startups';
use constant SLOGAN => 'Extend Your Reach';

use constant ITEM_TYPE_CONTENT => 1;
use constant ITEM_TYPE_PAGE => 2;
use constant ITEM_TYPE_PRESS_RELEASE => 3;
use constant ITEM_TYPE_CLIENT => 4;
use constant ITEM_TYPE_TESTIMONIAL => 5;

use constant CONTENT_HOME_TOP_RIGHT => 508416748;
use constant CONTENT_HOME_BOTTOM_CENTER => 460241699;
use constant CONTENT_HOME_BOTTOM_RIGHT => 713613891;

use constant LOOKUP_TYPE_MENU_SIDE => 2;
use constant LOOKUP_TYPE_REGION => 3;
use constant LOOKUP_TYPE_INDUSTRY => 4;

use constant LOOKUP_MENU_SIDE_COMPANY => 1;
use constant LOOKUP_MENU_SIDE_PRODUCTS => 2;
use constant LOOKUP_MENU_SIDE_CLIENTS => 3;
use constant LOOKUP_MENU_SIDE_NEWS => 4;

sub Email( % ) {
	my ( $cmd, $interp, $page_output );
	my ( %args ) = @_;

	$interp = Hoo::Legacy::MasonInterp->new(
		COMP_ROOT => Vencore::COMP_ROOT,
		DATA_DIR => Vencore::DATA_DIR
		);

	if ( -e Vencore::COMP_ROOT . $args{ PATH } ) {
		$page_output = $interp->generate( COMP_PATH => "/$args{ PATH }", %args );
		}

	$cmd = Hoo::SENDMAIL;

	if ( open( MAIL, "| $cmd" ) ) {
		print MAIL $page_output;
		close( MAIL );
		}
	}

1;
