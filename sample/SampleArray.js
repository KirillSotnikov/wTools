if( typeof module !== 'undefined' )
require( 'wTools' );
var _ = wTools;

var dst = [ [ 1 ], [ 1 ], [ 1 ] ];
var onEqualize = function( a )
{
  return a[ 0 ];
}
var got = _.arrayMakeRandom( 3 );

logger.log( got )
