function __nav( _obj ) {
	var _i, _str;
	_str = '';
	for ( _i in _obj )
		if ( _obj[ _i ][ 1 ] )
			_str += '<a href="' + _obj[ _i ][ 1 ] + '">' + _obj[ _i ][ 0 ] + '</a><span>/</span>';
		else
			_str += _obj[ _i ][ 0 ];
	document.write( _str );
	}
function __onl() {
%	unless ( Hoo::LOCAL || ( $ENV{ SERVER_NAME } =~ /^inviso/ ) || ( $ENV{ SERVER_NAME } =~ /^<% Vencore::HOST_LOCAL %>/ ) ) {
	_uacct = '<% Vencore::GOOGLE_ANALYTICS %>';
	urchinTracker();
%	}
	}
function __reg( _id ) {
	var _regE = document.getElementById( 'reg-' + _id );
	document.getElementById( 'img-' + _id ).src = ( _regE.style.display == 'block' ) ? '/i/expand.gif' : '/i/collapse.gif';
	_regE.style.display = ( _regE.style.display == 'block' ) ? 'none' : 'block';
	return false;
	}
function __tes( _pages, _idx ) {
	var _elemE, _i;
	if ( _idx > 1 ) {
	for ( _i = 1; _i <= _pages; _i++ ) {
			document.getElementById( 'testimonials-' + _i ).style.display = 'none';
			document.getElementById( 'link-' + _i ).style.textDecoration = 'underline';
			}
		document.getElementById( 'testimonials-' + _idx ).style.display = 'block';
		_elemE = document.getElementById( 'link-' + _idx );
		_elemE.style.textDecoration = 'none';
		_elemE.blur();
		}
	}
