( function _Typing_test_s_( ) {

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer2.s' );
  _.include( 'wTesting' );
}

var _global = _global_;
var _ = _global_.wTools;

// --
// tests
// --

function nothingIs( test )
{
  test.case = 'without argument';
  var got = _.nothingIs();
  test.identical( got, true );

  test.case = 'check null';
  var got = _.nothingIs( null );
  test.identical( got, true );

  test.case = 'check undefined';
  var got = _.nothingIs( undefined );
  test.identical( got, true );

  test.case = 'check _.nothing';
  var got = _.nothingIs( _.nothing );
  test.identical( got, true );

  test.case = 'check zero';
  var got = _.nothingIs( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.nothingIs( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.nothingIs( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.nothingIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.nothingIs( Symbol() );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.nothingIs( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.nothingIs( _.argumentsArrayMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.nothingIs( _.unrollMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.nothingIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.nothingIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.nothingIs( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.nothingIs( new Map( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.nothingIs( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.nothingIs( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.nothingIs( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.nothingIs( 1n );
  test.identical( got, false );

  test.case = 'check object Number';
  var got = _.nothingIs( new Number( 2 ) );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.nothingIs( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.nothingIs( [ null ] );
  test.identical( got, false );

  test.case = 'check not empty map';
  var got = _.nothingIs( { '' : null } );
  test.identical( got, false );

  test.case = 'check instance of contsructor';
  var Constr = function()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.nothingIs( src );
  test.identical( got, false );
}

//

function definedIs( test )
{
  test.case = 'without argument';
  var got = _.definedIs();
  test.identical( got, false );

  test.case = 'check null';
  var got = _.definedIs( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.definedIs( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.definedIs( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.definedIs( 0 );
  test.identical( got, true );

  test.case = 'check empty string';
  var got = _.definedIs( '' );
  test.identical( got, true );

  test.case = 'check false';
  var got = _.definedIs( false );
  test.identical( got, true );

  test.case = 'check NaN';
  var got = _.definedIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.definedIs( Symbol() );
  test.identical( got, true );

  test.case = 'check empty array';
  var got = _.definedIs( [] );
  test.identical( got, true );

  test.case = 'check empty arguments array';
  var got = _.definedIs( _.argumentsArrayMake( [] ) );
  test.identical( got, true );

  test.case = 'check empty unroll';
  var got = _.definedIs( _.unrollMake( [] ) );
  test.identical( got, true );

  test.case = 'check empty map';
  var got = _.definedIs( {} );
  test.identical( got, true );

  test.case = 'check empty pure map';
  var got = _.definedIs( Object.create( null ) );
  test.identical( got, true );

  test.case = 'check empty Set';
  var got = _.definedIs( new Set( [] ) );
  test.identical( got, true );

  test.case = 'check empty Map';
  var got = _.definedIs( new Map( [] ) );
  test.identical( got, true );

  test.case = 'check empty BufferRaw';
  var got = _.definedIs( new BufferRaw() );
  test.identical( got, true );

  test.case = 'check empty BufferTyped';
  var got = _.definedIs( new U8x() );
  test.identical( got, true );

  test.case = 'check number';
  var got = _.definedIs( 3 );
  test.identical( got, true );

  test.case = 'check bigInt';
  var got = _.definedIs( 1n );
  test.identical( got, true );

  test.case = 'check object Number';
  var got = _.definedIs( new Number( 2 ) );
  test.identical( got, true );

  test.case = 'check string';
  var got = _.definedIs( 'str' );
  test.identical( got, true );

  test.case = 'check not empty array';
  var got = _.definedIs( [ null ] );
  test.identical( got, true );

  test.case = 'check not empty map';
  var got = _.definedIs( { '' : null } );
  test.identical( got, true );

  test.case = 'check instance of contsructor';
  var Constr = function()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.definedIs( src );
  test.identical( got, true );
}

//

function primitiveIs( test )
{
  test.case = 'without argument';
  var got = _.primitiveIs();
  test.identical( got, true );

  test.case = 'check null';
  var got = _.primitiveIs( null );
  test.identical( got, true );

  test.case = 'check undefined';
  var got = _.primitiveIs( undefined );
  test.identical( got, true );

  test.case = 'check _.nothing';
  var got = _.primitiveIs( _.nothing );
  test.identical( got, true );

  test.case = 'check zero';
  var got = _.primitiveIs( 0 );
  test.identical( got, true );

  test.case = 'check empty string';
  var got = _.primitiveIs( '' );
  test.identical( got, true );

  test.case = 'check false';
  var got = _.primitiveIs( false );
  test.identical( got, true );

  test.case = 'check NaN';
  var got = _.primitiveIs( NaN );
  test.identical( got, true );

  test.case = 'check Symbol';
  var got = _.primitiveIs( Symbol() );
  test.identical( got, true );

  test.case = 'check empty array';
  var got = _.primitiveIs( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.primitiveIs( _.argumentsArrayMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.primitiveIs( _.unrollMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.primitiveIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.primitiveIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.primitiveIs( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.primitiveIs( new Map( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.primitiveIs( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.primitiveIs( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.primitiveIs( 3 );
  test.identical( got, true );

  test.case = 'check bigInt';
  var got = _.primitiveIs( 1n );
  test.identical( got, true );

  test.case = 'check object Number';
  var got = _.primitiveIs( new Number( 2 ) );
  test.identical( got, true );

  test.case = 'check string';
  var got = _.primitiveIs( 'str' );
  test.identical( got, true );

  test.case = 'check not empty array';
  var got = _.primitiveIs( [ null ] );
  test.identical( got, false );

  test.case = 'check not empty map';
  var got = _.primitiveIs( { '' : null } );
  test.identical( got, false );

  test.case = 'check instance of contsructor';
  var Constr = function()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.primitiveIs( src );
  test.identical( got, false );
}

//

function symbolIs( test )
{
  test.case = 'without argument';
  var got = _.symbolIs();
  test.identical( got, false );

  test.case = 'check null';
  var got = _.symbolIs( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.symbolIs( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.symbolIs( _.nothing );
  test.identical( got, true );

  test.case = 'check zero';
  var got = _.symbolIs( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.symbolIs( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.symbolIs( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.symbolIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.symbolIs( Symbol() );
  test.identical( got, true );

  test.case = 'check empty array';
  var got = _.symbolIs( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.symbolIs( _.argumentsArrayMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.symbolIs( _.unrollMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.symbolIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.symbolIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.symbolIs( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.symbolIs( new Map( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.symbolIs( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.symbolIs( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.symbolIs( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.symbolIs( 1n );
  test.identical( got, false );

  test.case = 'check object Number';
  var got = _.symbolIs( new Number( 2 ) );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.symbolIs( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.symbolIs( [ null ] );
  test.identical( got, false );

  test.case = 'check not empty map';
  var got = _.symbolIs( { '' : null } );
  test.identical( got, false );

  test.case = 'check instance of contsructor';
  var Constr = function()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.symbolIs( src );
  test.identical( got, false );
}

//

function bigIntIs( test )
{
  test.case = 'without argument';
  var got = _.bigIntIs();
  test.identical( got, false );

  test.case = 'check null';
  var got = _.bigIntIs( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.bigIntIs( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.bigIntIs( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.bigIntIs( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.bigIntIs( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.bigIntIs( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.bigIntIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.bigIntIs( Symbol() );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.bigIntIs( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.bigIntIs( _.argumentsArrayMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.bigIntIs( _.unrollMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.bigIntIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.bigIntIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.bigIntIs( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.bigIntIs( new Map( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.bigIntIs( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.bigIntIs( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.bigIntIs( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.bigIntIs( 1n );
  test.identical( got, true );

  test.case = 'check object Number';
  var got = _.bigIntIs( new Number( 2 ) );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.bigIntIs( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.bigIntIs( [ null ] );
  test.identical( got, false );

  test.case = 'check not empty map';
  var got = _.bigIntIs( { '' : null } );
  test.identical( got, false );

  test.case = 'check instance of contsructor';
  var Constr = function()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.bigIntIs( src );
  test.identical( got, false );
}

// --
//
// --

function vectorAdapterIs( test )
{
  test.case = 'without argument';
  var got = _.vectorAdapterIs();
  test.identical( got, false );

  test.case = 'check null';
  var got = _.vectorAdapterIs( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.vectorAdapterIs( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.vectorAdapterIs( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.vectorAdapterIs( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.vectorAdapterIs( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.vectorAdapterIs( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.vectorAdapterIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.vectorAdapterIs( Symbol() );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.vectorAdapterIs( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.vectorAdapterIs( _.argumentsArrayMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.vectorAdapterIs( _.unrollMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.vectorAdapterIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.vectorAdapterIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.vectorAdapterIs( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.vectorAdapterIs( new Map( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.vectorAdapterIs( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.vectorAdapterIs( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.vectorAdapterIs( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.vectorAdapterIs( 1n );
  test.identical( got, false );

  test.case = 'check object Number';
  var got = _.vectorAdapterIs( new Number( 2 ) );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.vectorAdapterIs( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.vectorAdapterIs( [ null ] );
  test.identical( got, false );

  test.case = 'check not empty map';
  var got = _.vectorAdapterIs( { '' : null } );
  test.identical( got, false );

  /* */

  test.case = 'check not empty map';
  var src = Object.create( null );
  src._vectorBuffer = true;
  var got = _.vectorAdapterIs( src );
  test.identical( got, true );

  test.case = 'check not empty map';
  var src = Object.create( null );
  src._vectorBuffer = false;
  var got = _.vectorAdapterIs( src );
  test.identical( got, true );

  test.case = 'check instance of contsructor with not own property "constructor"';
  var Constr = function()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  src._vectorBuffer = true;
  var got = _.vectorAdapterIs( src );
  test.identical( got, true );

  test.case = 'check instance of contsructor with own property "constructor"';
  var Constr = function()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  src.constructor = Constr;
  src._vectorBuffer = true;
  var got = _.vectorAdapterIs( src );
  test.identical( got, false );

  test.case = 'check instance of contsructor prototyped by another instance with _vectorBuffer property';
  var Constr = function()
  {
    this.x = 1;
    return this;
  };
  var proto = new Constr();
  proto._vectorBuffer = true;
  var src = new Constr();
  src.prototype = proto;
  var got = _.vectorAdapterIs( src );
  test.identical( got, false );

  test.case = 'check instance of contsructor prototyped by another instance with _vectorBuffer and own "constructor" properties';
  var Constr = function()
  {
    this.x = 1;
    return this;
  };
  var proto = new Constr();
  proto._vectorBuffer = true;
  proto.constructor = Constr;
  var src = new Constr();
  src.prototype = proto;
  var got = _.vectorAdapterIs( src );
  test.identical( got, false );
}

//

function constructorIsVector( test ) 
{
  test.case = 'without argument';
  var got = _.constructorIsVector();
  test.identical( got, false );

  test.case = 'check null';
  var got = _.constructorIsVector( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.constructorIsVector( undefined );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.constructorIsVector( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.constructorIsVector( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.constructorIsVector( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.constructorIsVector( NaN );
  test.identical( got, false );

  /* */

  test.case = 'map has property prototype';
  var proto = { a : 1 };
  var src = {};
  src.prototype = proto;
  var got = _.constructorIsVector( src );
  test.identical( got, false );

  test.case = 'map has property prototype and prototype has property _vectorBuffer';
  var proto = { a : 1 };
  proto._vectorBuffer = true;
  var src = {};
  src.prototype = proto;
  var got = _.constructorIsVector( src );
  test.identical( got, true );

  /* */

  test.case = 'check instance of contsructor prototyped by another instance without _vectorBuffer property';
  var Constr = function()
  {
    this.x = 1;
    return this;
  };
  var proto = new Constr();
  var src = new Constr();
  src.prototype = proto;
  var got = _.constructorIsVector( src );
  test.identical( got, false );

  test.case = 'check instance of contsructor prototyped by another instance with _vectorBuffer property';
  var Constr = function()
  {
    this.x = 1;
    return this;
  };
  var proto = new Constr();
  proto._vectorBuffer = true;
  var src = new Constr();
  src.prototype = proto;
  var got = _.constructorIsVector( src );
  test.identical( got, true );

  test.case = 'check instance of contsructor prototyped by another instance with _vectorBuffer and own "constructor" properties';
  var Constr = function()
  {
    this.x = 1;
    return this;
  };
  var proto = new Constr();
  proto._vectorBuffer = true;
  proto.constructor = Constr;
  var src = new Constr();
  src.prototype = proto;
  var got = _.constructorIsVector( src );
  test.identical( got, true );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'src.prototype is undefined';
  test.shouldThrowErrorSync( () => _.constructorIsVector( [] ) );
  test.shouldThrowErrorSync( () => _.constructorIsVector( {} ) );
}

//

function spaceIs( test ) 
{
  test.case = 'without argument';
  var got = _.spaceIs();
  test.identical( got, false );

  test.case = 'check null';
  var got = _.spaceIs( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.spaceIs( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.spaceIs( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.spaceIs( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.spaceIs( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.spaceIs( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.spaceIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.spaceIs( Symbol() );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.spaceIs( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.spaceIs( _.argumentsArrayMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.spaceIs( _.unrollMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.spaceIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.spaceIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.spaceIs( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.spaceIs( new Map( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.spaceIs( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.spaceIs( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.spaceIs( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.spaceIs( 1n );
  test.identical( got, false );

  test.case = 'check object Number';
  var got = _.spaceIs( new Number( 2 ) );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.spaceIs( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.spaceIs( [ null ] );
  test.identical( got, false );

  test.case = 'check not empty map';
  var got = _.spaceIs( { '' : null } );
  test.identical( got, false );

  test.case = 'check not empty map';
  var src = Object.create( null );
  var got = _.spaceIs( src );
  test.identical( got, false );

  test.case = 'check not empty map';
  var src = Object.create( null );
  src.some = false;
  var got = _.spaceIs( src );
  test.identical( got, false );

  test.case = 'check instance of contsructor with not own property "constructor"';
  var Constr = function()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.spaceIs( src );
  test.identical( got, false );

  test.case = '';
  if( _.Space )
  {
    var buffer = new U8x( [ 1, 2, 3, 4, 5 ] );
    var src = new _.Space
    ({
      buffer : buffer,
      dims : [ 3,1 ],
    });
    var got = _.spaceIs( src );
    test.identical( got, true );
  }

  /* - */

  if( !_.Space )
  {
    test.case = 'property - not instance';
    _.Space = true;
    var src = _.Space;
    test.shouldThrowErrorSync( () => wTools.spaceIs( src ) );
  }
}

//

function constructorIsSpace( test ) 
{
  test.case = 'without argument';
  var got = _.constructorIsSpace();
  test.identical( got, false );

  test.case = 'check null';
  var got = _.constructorIsSpace( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.constructorIsSpace( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.constructorIsSpace( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.constructorIsSpace( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.constructorIsSpace( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.constructorIsSpace( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.constructorIsSpace( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.constructorIsSpace( Symbol() );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.constructorIsSpace( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.constructorIsSpace( _.argumentsArrayMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.constructorIsSpace( _.unrollMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.constructorIsSpace( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.constructorIsSpace( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.constructorIsSpace( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.constructorIsSpace( new Map( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.constructorIsSpace( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.constructorIsSpace( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.constructorIsSpace( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.constructorIsSpace( 1n );
  test.identical( got, false );

  test.case = 'check object Number';
  var got = _.constructorIsSpace( new Number( 2 ) );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.constructorIsSpace( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.constructorIsSpace( [ null ] );
  test.identical( got, false );

  test.case = 'check not empty map';
  var got = _.constructorIsSpace( { '' : null } );
  test.identical( got, false );

  test.case = 'check not empty map';
  var src = Object.create( null );
  var got = _.constructorIsSpace( src );
  test.identical( got, false );

  test.case = 'check not empty map';
  var src = Object.create( null );
  src.some = false;
  var got = _.constructorIsSpace( src );
  test.identical( got, false );

  test.case = 'check instance of contsructor with not own property "constructor"';
  var Constr = function()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.constructorIsSpace( src );
  test.identical( got, false );

  if( _.Space )
  {
    test.case = 'instance of Space';
    var buffer = new U8x( [ 1, 2, 3, 4, 5 ] );
    var src = new _.Space
    ({
      buffer : buffer,
      dims : [ 3,1 ],
    });
    var got = _.constructorIsSpace( src );
    test.identical( got, true );
  }

  /* - */

  if( !_.Space )
  {
    test.case = 'property - not instance, true';
    _.Space = true;
    var src = _.Space;
    var got = _.constructorIsSpace( src );
    test.identical( got, true );

    test.case = 'property - not instance, false';
    _.Space = false;
    var src = _.Space;
    var got = _.constructorIsSpace( src );
    test.identical( got, false );
  }
}

//

function consequenceIs( test ) 
{
  test.case = 'without argument';
  var got = _.consequenceIs();
  test.identical( got, false );

  test.case = 'check null';
  var got = _.consequenceIs( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.consequenceIs( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.consequenceIs( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.consequenceIs( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.consequenceIs( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.consequenceIs( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.consequenceIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.consequenceIs( Symbol() );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.consequenceIs( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.consequenceIs( _.argumentsArrayMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.consequenceIs( _.unrollMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.consequenceIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.consequenceIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.consequenceIs( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.consequenceIs( new Map( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.consequenceIs( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.consequenceIs( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.consequenceIs( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.consequenceIs( 1n );
  test.identical( got, false );

  test.case = 'check object Number';
  var got = _.consequenceIs( new Number( 2 ) );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.consequenceIs( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.consequenceIs( [ null ] );
  test.identical( got, false );

  test.case = 'check not empty map';
  var got = _.consequenceIs( { '' : null } );
  test.identical( got, false );

  test.case = 'check not empty map';
  var src = Object.create( null );
  var got = _.consequenceIs( src );
  test.identical( got, false );

  test.case = 'check not empty map';
  var src = Object.create( null );
  src.some = false;
  var got = _.consequenceIs( src );
  test.identical( got, false );

  test.case = 'check instance of contsructor with not own property "constructor"';
  var Constr = function()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.consequenceIs( src );
  test.identical( got, false );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.consequenceIs( src );
  test.identical( got, false );
  
  if( _.Consequence )
  {
    test.case = 'instance of Consequence';
    var src = new _.Consequence().take( 0 );
    var got = _.consequenceIs( src );
    test.identical( got, true );
  }
}

//

function consequenceLike( test )
{
  test.case = 'without argument';
  var got = _.consequenceLike();
  test.identical( got, false );

  test.case = 'check null';
  var got = _.consequenceLike( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.consequenceLike( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.consequenceLike( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.consequenceLike( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.consequenceLike( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.consequenceLike( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.consequenceLike( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.consequenceLike( Symbol() );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.consequenceLike( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.consequenceLike( _.argumentsArrayMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.consequenceLike( _.unrollMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.consequenceLike( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.consequenceLike( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.consequenceLike( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.consequenceLike( new Map( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.consequenceLike( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.consequenceLike( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.consequenceLike( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.consequenceLike( 1n );
  test.identical( got, false );

  test.case = 'check object Number';
  var got = _.consequenceLike( new Number( 2 ) );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.consequenceLike( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.consequenceLike( [ null ] );
  test.identical( got, false );

  test.case = 'check not empty map';
  var got = _.consequenceLike( { '' : null } );
  test.identical( got, false );

  test.case = 'check not empty map';
  var src = Object.create( null );
  var got = _.consequenceLike( src );
  test.identical( got, false );

  test.case = 'check not empty map';
  var src = Object.create( null );
  src.some = false;
  var got = _.consequenceLike( src );
  test.identical( got, false );

  test.case = 'check instance of contsructor with not own property "constructor"';
  var Constr = function()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.consequenceLike( src );
  test.identical( got, false );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.consequenceLike( src );
  test.identical( got, true );
  
  if( _.Consequence )
  {
    test.case = 'instance of Consequence';
    var src = new _.Consequence().take( 0 );
    var got = _.consequenceLike( src );
    test.identical( got, true );
  }
}

//

function promiseIs( test ) 
{
  test.case = 'without argument';
  var got = _.promiseIs();
  test.identical( got, false );

  test.case = 'check null';
  var got = _.promiseIs( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.promiseIs( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.promiseIs( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.promiseIs( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.promiseIs( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.promiseIs( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.promiseIs( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.promiseIs( Symbol() );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.promiseIs( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.promiseIs( _.argumentsArrayMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.promiseIs( _.unrollMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.promiseIs( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.promiseIs( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.promiseIs( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.promiseIs( new Map( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.promiseIs( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.promiseIs( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.promiseIs( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.promiseIs( 1n );
  test.identical( got, false );

  test.case = 'check object Number';
  var got = _.promiseIs( new Number( 2 ) );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.promiseIs( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.promiseIs( [ null ] );
  test.identical( got, false );

  test.case = 'check not empty map';
  var got = _.promiseIs( { '' : null } );
  test.identical( got, false );

  test.case = 'check not empty map';
  var src = Object.create( null );
  var got = _.promiseIs( src );
  test.identical( got, false );

  test.case = 'check not empty map';
  var src = Object.create( null );
  src.some = false;
  var got = _.promiseIs( src );
  test.identical( got, false );

  test.case = 'check instance of contsructor with not own property "constructor"';
  var Constr = function()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.promiseIs( src );
  test.identical( got, false );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.promiseIs( src );
  test.identical( got, true );
  
  if( _.Consequence )
  {
    test.case = 'instance of Consequence';
    var src = new _.Consequence().take( 0 );
    var got = _.promiseIs( src );
    test.identical( got, false );
  }

  test.case = 'function _Promise';
  var _Promise = function Promise(){};
  var src = new _Promise();
  var got = _.promiseIs( src );
  test.identical( got, false );
}

//

function promiseLike( test ) 
{
  test.case = 'without argument';
  var got = _.promiseLike();
  test.identical( got, false );

  test.case = 'check null';
  var got = _.promiseLike( null );
  test.identical( got, false );

  test.case = 'check undefined';
  var got = _.promiseLike( undefined );
  test.identical( got, false );

  test.case = 'check _.nothing';
  var got = _.promiseLike( _.nothing );
  test.identical( got, false );

  test.case = 'check zero';
  var got = _.promiseLike( 0 );
  test.identical( got, false );

  test.case = 'check empty string';
  var got = _.promiseLike( '' );
  test.identical( got, false );

  test.case = 'check false';
  var got = _.promiseLike( false );
  test.identical( got, false );

  test.case = 'check NaN';
  var got = _.promiseLike( NaN );
  test.identical( got, false );

  test.case = 'check Symbol';
  var got = _.promiseLike( Symbol() );
  test.identical( got, false );

  test.case = 'check empty array';
  var got = _.promiseLike( [] );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var got = _.promiseLike( _.argumentsArrayMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var got = _.promiseLike( _.unrollMake( [] ) );
  test.identical( got, false );

  test.case = 'check empty map';
  var got = _.promiseLike( {} );
  test.identical( got, false );

  test.case = 'check empty pure map';
  var got = _.promiseLike( Object.create( null ) );
  test.identical( got, false );

  test.case = 'check empty Set';
  var got = _.promiseLike( new Set( [] ) );
  test.identical( got, false );

  test.case = 'check empty Map';
  var got = _.promiseLike( new Map( [] ) );
  test.identical( got, false );

  test.case = 'check empty BufferRaw';
  var got = _.promiseLike( new BufferRaw() );
  test.identical( got, false );

  test.case = 'check empty BufferTyped';
  var got = _.promiseLike( new U8x() );
  test.identical( got, false );

  test.case = 'check number';
  var got = _.promiseLike( 3 );
  test.identical( got, false );

  test.case = 'check bigInt';
  var got = _.promiseLike( 1n );
  test.identical( got, false );

  test.case = 'check object Number';
  var got = _.promiseLike( new Number( 2 ) );
  test.identical( got, false );

  test.case = 'check string';
  var got = _.promiseLike( 'str' );
  test.identical( got, false );

  test.case = 'check not empty array';
  var got = _.promiseLike( [ null ] );
  test.identical( got, false );

  test.case = 'check not empty map';
  var got = _.promiseLike( { '' : null } );
  test.identical( got, false );

  test.case = 'check not empty map';
  var src = Object.create( null );
  var got = _.promiseLike( src );
  test.identical( got, false );

  test.case = 'check not empty map';
  var src = Object.create( null );
  src.some = false;
  var got = _.promiseLike( src );
  test.identical( got, false );

  test.case = 'check instance of contsructor with not own property "constructor"';
  var Constr = function()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.promiseLike( src );
  test.identical( got, false );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.promiseLike( src );
  test.identical( got, true );

  if( _.Consequence )
  {
    test.case = 'instance of Consequence';
    var src = new _.Consequence().take( 0 );
    var got = _.promiseLike( src );
    test.identical( got, false );
  }

  test.case = 'function _Promise';
  var _Promise = function Promise(){};
  var src = new _Promise();
  var got = _.promiseLike( src );
  test.identical( got, false );
}

//

function typeOf( test ) 
{
  test.open( 'one argument' );

  test.case = 'check null';
  var src = null;
  var got = _.typeOf( src );
  test.identical( got, null );

  test.case = 'check undefined';
  var src = undefined;
  var got = _.typeOf( src );
  test.identical( got, null );

  test.case = 'check zero';
  var src = 0;
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Number' );

  test.case = 'check false';
  var src = false;
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Boolean' );

  test.case = 'check NaN';
  var src = NaN;
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Number' );

  test.case = 'check array';
  var src = [ 1, 2 ];
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Array' );

  test.case = 'check empty arguments array';
  var src = _.argumentsArrayMake( [] );
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Object' );

  test.case = 'check empty unroll';
  var src = _.unrollMake( [] );
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Array' );

  test.case = 'check map';
  var src = { a : 2 };
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Object' );

  test.case = 'check pure map';
  var src = Object.create( null );
  src.a = 2;
  var got = _.typeOf( src );
  test.identical( got, null );

  test.case = 'check Set';
  var src = new Set( [] );
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Set' );

  test.case = 'check HashMap';
  var src = new Map( [ [ 1, 1 ] ] );
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Map' );

  test.case = 'check BufferRaw';
  var src = new BufferRaw( 10 );
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'ArrayBuffer' );

  test.case = 'check BufferTyped';
  var src = new U8x( [ 1, 2 ] );
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Uint8Array' );

  test.case = 'check object Number';
  var src = new Number( 2 );
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Number' );

  test.case = 'check instance of contsructor';
  var Constr = function()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Constr' );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Promise' );

  if( _.Consequence )
  {
    test.case = 'instance of Consequence';
    var src = new _.Consequence().take( 0 );
    var got = _.typeOf( src );
    test.identical( got, src.constructor );
    test.identical( got.name, 'wConsequence' );
  }

  test.case = 'function _Promise';
  var _Promise = function Promise(){};
  var src = new _Promise();
  var got = _.typeOf( src );
  test.identical( got, src.constructor );
  test.identical( got.name, 'Promise' );

  test.close( 'one argument' );

  /* - */

  test.open( 'two arguments' );

  test.case = 'check null';
  var src = null;
  var got = _.typeOf( src, null );
  test.identical( got, true );

  test.case = 'check undefined';
  var src = undefined;
  var got = _.typeOf( src, null );
  test.identical( got, true );

  test.case = 'check zero';
  var src = 0;
  var src1 = 1;
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.case = 'check false';
  var src = false;
  var src1 = true;
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.case = 'check NaN';
  var src = NaN;
  var src1 = 2;
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.case = 'check array';
  var src = [ 1, 2 ];
  var src1 = [];
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.case = 'check empty arguments array';
  var src = _.argumentsArrayMake( [] );
  var src1 = _.argumentsArrayMake( [ 1, 2 ] );
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.case = 'check empty unroll';
  var src = _.unrollMake( [] );
  var src1 = [ 1, 2 ];
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.case = 'check map';
  var src = { a : 2 };
  var src1 = {};
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.case = 'check pure map';
  var src = Object.create( null );
  src.a = 2;
  var src1 = null;
  var got = _.typeOf( src, src1 );
  test.identical( got, true );

  test.case = 'check Set';
  var src = new Set( [] );
  var src1 = new Set( [ 1, 2, 3 ] );
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.case = 'check HashMap';
  var src = new Map( [ [ 1, 1 ] ] );
  var src1 = new Map();
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.case = 'check BufferRaw';
  var src = new BufferRaw( 10 );
  var src1 = new U8x( 10 ).buffer;
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.case = 'check BufferTyped';
  var src = new U8x( [ 1, 2 ] );
  var src1 = new U8x();
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.case = 'check object Number';
  var src = new Number( 2 );
  var src1 = 2;
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.case = 'check instance of contsructor';
  var Constr = function()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.typeOf( src, src.constructor );
  test.identical( got, true );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var src1 = new Promise( ( resolve, reject ) => { return resolve( 1 ) } );
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  if( _.Consequence )
  {
    test.case = 'instance of Consequence';
    var src = new _.Consequence().take( 0 );
    var got = _.typeOf( src, src.constructor );
    test.identical( got, true );
  }

  test.case = 'function _Promise';
  var _Promise = function Promise(){};
  var src = new _Promise();
  var src1 = new _Promise();
  var got = _.typeOf( src, src1.constructor );
  test.identical( got, true );

  test.close( 'two arguments' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorSync( () => _.typeOf() );

  test.case = 'src - Symbol';
  test.shouldThrowErrorSync( () => _.typeOf( Symbol() ) );

  test.case = 'src - BigInt';
  test.shouldThrowErrorSync( () => _.typeOf( 1n ) );
}

//

function isPrototypeOf( test ) 
{
  test.open( 'subPrototype === superPrototype' );

  test.case = 'check null';
  var src = null;
  var got = _.isPrototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check undefined';
  var src = undefined;
  var got = _.isPrototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check zero';
  var src = 0;
  var got = _.isPrototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check false';
  var src = false;
  var got = _.isPrototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check NaN';
  var src = NaN;
  var got = _.isPrototypeOf( src, src );
  test.identical( got, false );

  test.case = 'check array';
  var src = [ 1, 2 ];
  var got = _.isPrototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check empty arguments array';
  var src = _.argumentsArrayMake( [] );
  var got = _.isPrototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check empty unroll';
  var src = _.unrollMake( [] );
  var got = _.isPrototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check map';
  var src = { a : 2 };
  var got = _.isPrototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check pure map';
  var src = Object.create( null );
  src.a = 2;
  var got = _.isPrototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check Set';
  var src = new Set( [] );
  var got = _.isPrototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check HashMap';
  var src = new Map( [ [ 1, 1 ] ] );
  var got = _.isPrototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check BufferRaw';
  var src = new BufferRaw( 10 );
  var got = _.isPrototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check BufferTyped';
  var src = new U8x( [ 1, 2 ] );
  var got = _.isPrototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check object Number';
  var src = new Number( 2 );
  var got = _.isPrototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check BigIng';
  var src = 1n;
  var got = _.isPrototypeOf( src, src );
  test.identical( got, true );

  test.case = 'check instance of contsructor';
  var Constr = function()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.isPrototypeOf( src, src );
  test.identical( got, true );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.isPrototypeOf( src, src );
  test.identical( got, true );

  if( _.Consequence )
  {
    test.case = 'instance of Consequence';
    var src = new _.Consequence().take( 0 );
    var got = _.isPrototypeOf( src, src );
    test.identical( got, true );
  }

  test.case = 'function _Promise';
  var _Promise = function Promise(){};
  var src = new _Promise();
  var got = _.isPrototypeOf( src, src );
  test.identical( got, true );

  test.close( 'subPrototype === superPrototype' );

  /* - */

  test.open( 'one argument is undefines' );

  test.case = 'check null';
  var src = null;
  var got = _.isPrototypeOf( src, undefined );
  test.identical( got, false );

  test.case = 'check undefined';
  var src = undefined;
  var got = _.isPrototypeOf( src, null );
  test.identical( got, false );

  test.case = 'check zero';
  var src = 0;
  var got = _.isPrototypeOf( false, src );
  test.identical( got, false );

  test.case = 'check false';
  var src = false;
  var got = _.isPrototypeOf( undefined, src );
  test.identical( got, false );

  test.case = 'check NaN';
  var src = NaN;
  var got = _.isPrototypeOf( src, src );
  test.identical( got, false );

  test.case = 'check array';
  var src = [ 1, 2 ];
  var got = _.isPrototypeOf( false, src );
  test.identical( got, false );

  test.case = 'check empty arguments array';
  var src = _.argumentsArrayMake( [] );
  var got = _.isPrototypeOf( src, null );
  test.identical( got, false );

  test.case = 'check empty unroll';
  var src = _.unrollMake( [] );
  var got = _.isPrototypeOf( 0, src );
  test.identical( got, false );

  test.case = 'check map';
  var src = { a : 2 };
  var got = _.isPrototypeOf( src, undefined );
  test.identical( got, false );

  test.case = 'check pure map';
  var src = Object.create( null );
  src.a = 2;
  var got = _.isPrototypeOf( null, src );
  test.identical( got, false );

  test.case = 'check Set';
  var src = new Set( [] );
  var got = _.isPrototypeOf( src, false );
  test.identical( got, false );

  test.case = 'check HashMap';
  var src = new Map( [ [ 1, 1 ] ] );
  var got = _.isPrototypeOf( null, src );
  test.identical( got, false );

  test.case = 'check BufferRaw';
  var src = new BufferRaw( 10 );
  var got = _.isPrototypeOf( src, undefined );
  test.identical( got, false );

  test.case = 'check BufferTyped';
  var src = new U8x( [ 1, 2 ] );
  var got = _.isPrototypeOf( false, src );
  test.identical( got, false );

  test.case = 'check object Number';
  var src = new Number( 2 );
  var got = _.isPrototypeOf( src, false );
  test.identical( got, false );

  test.case = 'check BigIng';
  var src = 1n;
  var got = _.isPrototypeOf( null, src );
  test.identical( got, false );

  test.case = 'check instance of contsructor';
  var Constr = function()
  {
    this.x = 1;
    return this;
  };
  var src = new Constr();
  var got = _.isPrototypeOf( src, undefined );
  test.identical( got, false );

  test.case = 'instance of Promise';
  var src = new Promise( ( resolve, reject ) => { return resolve( 0 ) } );
  var got = _.isPrototypeOf( false, src );
  test.identical( got, false );

  if( _.Consequence )
  {
    test.case = 'instance of Consequence';
    var src = new _.Consequence().take( 0 );
    var got = _.isPrototypeOf( src, null );
    test.identical( got, false );
  }

  test.case = 'function _Promise';
  var _Promise = function Promise(){};
  var src = new _Promise();
  var got = _.isPrototypeOf( undefined, src );
  test.identical( got, false );


  test.close( 'one argument is undefines' );

  /* - */

  test.open( 'two objects' );
  
  test.case = 'subPrototype - Object.prototype, superPrototype - simple map';
  var src = {};
  var got = _.isPrototypeOf( Object.prototype, src );
  test.identical( got, true );

  test.case = 'subPrototype - simple map, superPrototype - Object.prototype';
  var src = {};
  var got = _.isPrototypeOf( src, Object.prototype );
  test.identical( got, false );

  test.case = 'subPrototype - simple map, superPrototype - simple map';
  var src = {};
  var got = _.isPrototypeOf( src, {} );
  test.identical( got, false );

  test.case = 'subPrototype - simple map, superPrototype - pure map';
  var src = {};
  var got = _.isPrototypeOf( src, Object.create( null ) );
  test.identical( got, false );

  test.case = 'subPrototype - pure map, superPrototype - simple map';
  var src = {};
  var got = _.isPrototypeOf( Object.create( null ), src );
  test.identical( got, false );

  test.case = 'subPrototype - pure map, superPrototype - Object.prototype';
  var src = Object.create( null );
  var got = _.isPrototypeOf( src, Object.prototype );
  test.identical( got, false );

  test.case = 'subPrototype - Object.prototype, superPrototype - pure map';
  var src = Object.create( null );
  var got = _.isPrototypeOf( Object.prototype, src );
  test.identical( got, false );

  test.case = 'subPrototype - pure map, superPrototype - simple map';
  var src = Object.create( null );
  var got = _.isPrototypeOf( src, {} );
  test.identical( got, false );

  test.case = 'subPrototype - pure map, superPrototype - simple map';
  var src = Object.create( null );
  var got = _.isPrototypeOf( {}, src );
  test.identical( got, false );

  test.case = 'subPrototype - pure map, superPrototype - pure map';
  var src = Object.create( null );
  var got = _.isPrototypeOf( src, Object.create( null ) );
  test.identical( got, false );

  test.case = 'subPrototype - pure map, superPrototype - pure map from subPrototype';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = _.isPrototypeOf( prototype, src );
  test.identical( got, true );

  test.case = 'subPrototype - pure map from superPrototype, superPrototype - pure map';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = _.isPrototypeOf( src, prototype );
  test.identical( got, false );

  test.case = 'subPrototype - pure map from prototype, superPrototype - Object.prototype';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = _.isPrototypeOf( src, Object.prototype );
  test.identical( got, false );

  test.case = 'subPrototype - Object.prototype, superPrototype - pure map from prototype';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = _.isPrototypeOf( Object.prototype, src );
  test.identical( got, false );

  test.case = 'subPrototype - pure map from prototype, superPrototype - simple map';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = _.isPrototypeOf( src, {} );
  test.identical( got, false );

  test.case = 'subPrototype - simple map, superPrototype - pure map from prototype';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = _.isPrototypeOf( {}, src );
  test.identical( got, false );

  test.case = 'subPrototype - pure map from prototype, superPrototype - pure map';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = _.isPrototypeOf( src, Object.create( null ) );
  test.identical( got, false );

  test.case = 'subPrototype - pure map, superPrototype - pure map from prototype';
  var prototype = Object.create( null );
  var src = Object.create( prototype );
  var got = _.isPrototypeOf( Object.create( null ), src );
  test.identical( got, false );

  /* */

  test.case = 'one constructor prototyped by another, not prototype';
  var proto1 = function(){ this.a = 0; return this };
  var proto2 = function(){ this.x = 1; return this };
  proto2.prototype = new proto1();
  var prototyped = function(){ this.y = 1; return this };
  prototyped.prototype = new proto2();
  var src = new prototyped();
  var got = _.isPrototypeOf( src, proto2.prototype );
  test.identical( got, false );

  test.case = 'one constructor prototyped by another, prototype';
  var proto1 = function(){ this.a = 0; return this };
  var proto2 = function(){ this.x = 1; return this };
  proto2.prototype = new proto1();
  var prototyped = function(){ this.y = 1; return this };
  prototyped.prototype = new proto2();
  var src = new prototyped();
  var got = _.isPrototypeOf( proto2.prototype, src );
  test.identical( got, true );

  test.close( 'two objects' );
}

//

function objectLike( test )
{
  test.description = 'array-like entities should not overlap with array-like entities set';

  test.identical( _.objectLike( new ArrayBuffer( 10 ) ),false );
  test.identical( _.objectLike( new Float32Array( 10 ) ),false );
  test.identical( _.objectLike( new Int32Array( 10 ) ),false );
  test.identical( _.objectLike( new DataView( new ArrayBuffer( 10 ) ) ),false );
  test.identical( _.objectLike( new Array( 10 ) ),false );
  test.identical( _.objectLike( [ 1,2,3 ] ),false );
  test.identical( _.objectLike( new Map ),false );

  test.description = 'this entities are object-like';

  test.identical( _.objectLike( _global_ ),true );
  test.identical( _.objectLike( new Object() ),true );
  test.identical( _.objectLike( {} ),true );
  test.identical( _.objectLike( Object.create( null ) ),true );
}

// --
// declaration
// --

var Self =
{

  name : 'Tools.base.Typing',
  silencing : 1,

  tests :
  {

    nothingIs,
    definedIs,
    primitiveIs,
    symbolIs,
    bigIntIs,

    //

    vectorAdapterIs,
    constructorIsVector,
    spaceIs,
    constructorIsSpace,
    
    consequenceIs,
    consequenceLike,
    promiseIs,
    promiseLike,

    typeOf,
    isPrototypeOf,

    objectLike,

  }

}

//

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

} )( );
