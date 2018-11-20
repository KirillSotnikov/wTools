( function _fLong_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

//

let _ArrayIndexOf = Array.prototype.indexOf;
let _ArrayLastIndexOf = Array.prototype.lastIndexOf;
let _ArraySlice = Array.prototype.slice;
let _ArraySplice = Array.prototype.splice;
let _FunctionBind = Function.prototype.bind;
let _ObjectToString = Object.prototype.toString;
let _ObjectHasOwnProperty = Object.hasOwnProperty;
let _propertyIsEumerable = Object.propertyIsEnumerable;

// --
// arguments array
// --

function argumentsArrayIs( src )
{
  return _ObjectToString.call( src ) === '[object Arguments]';
}

//

function _argumentsArrayMake()
{
  return arguments;
}

//

function argumentsArrayOfLength( length )
{
  debugger; xxx
  let a = new Arguments( length );
  return a;
}

//

function argumentsArrayFrom( args )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  if( _.argumentsArrayIs( args ) )
  return args;
  return _argumentsArrayMake.apply( this, args );
}

// --
// unroll
// --

function unrollFrom( unrollMaybe )
{
  _.assert( arguments.length === 1 );
  if( _.unrollIs( unrollMaybe ) )
  return unrollMaybe;
  return _.unrollAppend( null, unrollMaybe );
}

//

function unrollPrepend( dstArray )
{
  _.assert( arguments.length >= 1 );
  _.assert( _.arrayIs( dstArray ) || dstArray === null, 'Expects array' );

  dstArray = dstArray || [];

  for( let a = arguments.length - 1 ; a >= 1 ; a-- )
  {
    if( _.longIs( arguments[ a ] ) )
    {
      dstArray.unshift.apply( dstArray, arguments[ a ] );
    }
    else
    {
      dstArray.unshift( arguments[ a ] );
    }
  }

  dstArray[ unrollSymbol ] = true;

  return dstArray;
}

//

function unrollAppend( dstArray )
{
  _.assert( arguments.length >= 1 );
  _.assert( _.arrayIs( dstArray ) || dstArray === null, 'Expects array' );

  dstArray = dstArray || [];

  for( let a = 1, len = arguments.length ; a < len; a++ )
  {
    if( _.longIs( arguments[ a ] ) )
    {
      dstArray.push.apply( dstArray, arguments[ a ] );
    }
    else
    {
      dstArray.push( arguments[ a ] );
    }
  }

  dstArray[ unrollSymbol ] = true;

  return dstArray;
}

// --
// array checker
// --

/**
 * The arrayIs() routine determines whether the passed value is an Array.
 *
 * If the {-srcMap-} is an Array, true is returned,
 * otherwise false is.
 *
 * @param { * } src - The object to be checked.
 *
 * @example
 * // returns true
 * arrayIs( [ 1, 2 ] );
 *
 * @example
 * // returns false
 * arrayIs( 10 );
 *
 * @returns { boolean } Returns true if {-srcMap-} is an Array.
 * @function arrayIs
 * @memberof wTools
 */

function arrayIs( src )
{
  return _ObjectToString.call( src ) === '[object Array]';
}

//

function arrayIsPopulated( src )
{
  if( !_.arrayIs( src ) )
  return false;
  return src.length > 0;
}

//

function arrayLikeResizable( src )
{
  if( _ObjectToString.call( src ) === '[object Array]' )
  return true;
  return false;
}

//

function arrayLike( src )
{
  if( _.arrayIs( src ) )
  return true;
  if( _.argumentsArrayIs( src ) )
  return true;
  return false;
}

//

/**
 * The longIs() routine determines whether the passed value is an array-like or an Array.
 * Imortant : longIs returns false for Object, even if the object has length field.
 *
 * If {-srcMap-} is an array-like or an Array, true is returned,
 * otherwise false is.
 *
 * @param { * } src - The object to be checked.
 *
 * @example
 * // returns true
 * longIs( [ 1, 2 ] );
 *
 * @example
 * // returns false
 * longIs( 10 );
 *
 * @example
 * // returns true
 * let isArr = ( function() {
 *   return _.longIs( arguments );
 * } )( 'Hello there!' );
 *
 * @returns { boolean } Returns true if {-srcMap-} is an array-like or an Array.
 * @function longIs.
 * @memberof wTools
 */

function longIs( src )
{
  if( _.primitiveIs( src ) )
  return false;
  if( _.routineIs( src ) )
  return false;
  if( _.objectIs( src ) )
  return false;
  if( _.strIs( src ) )
  return false;

  if( Object.propertyIsEnumerable.call( src, 'length' ) )
  return false;
  if( !_.numberIs( src.length ) )
  return false;

  return true;
}

//

function longIsPopulated( src )
{
  if( !_.longIs( src ) )
  return false;
  return src.length > 0;
}

//

function unrollIs( src )
{
  if( !_.arrayIs( src ) )
  return false;
  return !!src[ unrollSymbol ];
}

//

function unrollIsPopulated( src )
{
  if( !_.unrollIs( src ) )
  return false;
  return src.length > 0;
}

//

function constructorLikeArray( src )
{
  if( !src )
  return false;

  if( src === Function )
  return false;
  if( src === Object )
  return false;
  if( src === String )
  return false;

  if( _.primitiveIs( src ) )
  return false;

  if( !( 'length' in src.prototype ) )
  return false;
  if( Object.propertyIsEnumerable.call( src.prototype,'length' ) )
  return false;

  return true;
}

//

/**
 * The hasLength() routine determines whether the passed value has the property (length).
 *
 * If {-srcMap-} is equal to the (undefined) or (null) false is returned.
 * If {-srcMap-} has the property (length) true is returned.
 * Otherwise false is.
 *
 * @param { * } src - The object to be checked.
 *
 * @example
 * // returns true
 * hasLength( [ 1, 2 ] );
 *
 * @example
 * // returns true
 * hasLength( 'Hello there!' );
 *
 * @example
 * // returns true
 * let isLength = ( function() {
 *   return _.hasLength( arguments );
 * } )( 'Hello there!' );
 *
 * @example
 * // returns false
 * hasLength( 10 );
 *
 * @example
 * // returns false
 * hasLength( { } );
 *
 * @returns { boolean } Returns true if {-srcMap-} has the property (length).
 * @function hasLength
 * @memberof wTools
 */

function hasLength( src )
{
  if( src === undefined || src === null )
  return false;
  if( _.numberIs( src.length ) )
  return true;
  return false;
}

//

function arrayHasArray( arr )
{

  if( !_.arrayLike( arr ) )
  return false;

  for( let a = 0 ; a < arr.length ; a += 1 )
  if( _.arrayLike( arr[ a ] ) )
  return true;

  return false;
}

//

/**
 * The arrayCompare() routine returns the first difference between the values of the first array from the second.
 *
 * @param { longIs } src1 - The first array.
 * @param { longIs } src2 - The second array.
 *
 * @example
 * // returns 3
 * let arr = _.arrayCompare( [ 1, 5 ], [ 1, 2 ] );
 *
 * @returns { Number } - Returns the first difference between the values of the two arrays.
 * @function arrayCompare
 * @throws { Error } Will throw an Error if (arguments.length) is less or more than two.
 * @throws { Error } Will throw an Error if (src1 and src2) are not the array-like.
 * @throws { Error } Will throw an Error if (src2.length) is less or not equal to the (src1.length).
 * @memberof wTools
 */

function arrayCompare( src1,src2 )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.longIs( src1 ) && _.longIs( src2 ) );
  _.assert( src2.length >= src1.length );

  let result = 0;

  for( let s = 0 ; s < src1.length ; s++ )
  {

    result = src1[ s ] - src2[ s ];
    if( result !== 0 )
    return result;

  }

  return result;
}

//

/**
 * The arrayIdentical() routine checks the equality of two arrays.
 *
 * @param { longIs } src1 - The first array.
 * @param { longIs } src2 - The second array.
 *
 * @example
 * // returns true
 * let arr = _.arrayIdentical( [ 1, 2, 3 ], [ 1, 2, 3 ] );
 *
 * @returns { Boolean } - Returns true if all values of the two arrays are equal. Otherwise, returns false.
 * @function arrayIdentical
 * @throws { Error } Will throw an Error if (arguments.length) is less or more than two.
 * @memberof wTools
 */

function arrayIdentical( src1,src2 )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.longIs( src1 ) );
  _.assert( _.longIs( src2 ) );

  let result = true;

  if( src1.length !== src2.length )
  return false;

  for( let s = 0 ; s < src1.length ; s++ )
  {

    result = src1[ s ] === src2[ s ];

    if( result === false )
    return false;

  }

  return result;
}

//

function arrayHas( array, value, evaluator1, evaluator2 )
{
  _.assert( 2 <= arguments.length && arguments.length <= 4 );
  _.assert( _.arrayLike( array ) );

  if( evaluator1 === undefined )
  {
    return _ArrayIndexOf.call( array, value ) !== -1;
  }
  else
  {
    if( _.arrayLeftIndex( array, value, evaluator1, evaluator2 ) >= 0 )
    return true;
    return false;
  }

}

//

/**
 * The arrayHasAny() routine checks if the {-srcMap-} array has at least one value of the following arguments.
 *
 * It iterates over array-like (arguments[]) copies each argument to the array (ins) by the routine
 * [arrayAs()]{@link wTools.arrayAs}
 * Checks, if {-srcMap-} array has at least one value of the (ins) array.
 * If true, it returns true.
 * Otherwise, it returns false.
 *
 * @see {@link wTools.arrayAs} - See for more information.
 *
 * @param { longIs } src - The source array.
 * @param {...*} arguments - One or more argument(s).
 *
 * @example
 * // returns true
 * let arr = _.arrayHasAny( [ 5, 'str', 42, false ], false, 7 );
 *
 * @returns { Boolean } - Returns true, if {-srcMap-} has at least one value of the following argument(s), otherwise false is returned.
 * @function arrayHasAny
 * @throws { Error } If the first argument in not an array.
 * @memberof wTools
 */

function arrayHasAny( src )
{
  let empty = true;
  empty = false;

  _.assert( arguments.length >= 1, 'Expects at least one argument' );
  _.assert( _.arrayLike( src ) || _.bufferTypedIs( src ),'arrayHasAny :','array expected' );

  for( let a = 1 ; a < arguments.length ; a++ )
  {
    empty = false;

    let ins = _.arrayAs( arguments[ a ] );
    for( let i = 0 ; i < ins.length ; i++ )
    {
      if( src.indexOf( ins[ i ] ) !== -1 )
      return true;
    }

  }

  return empty;
}

//

function arrayHasAll( src )
{
  _.assert( arguments.length >= 1, 'Expects at least one argument' );
  _.assert( _.arrayLike( src ) || _.bufferTypedIs( src ),'arrayHasAll :','array expected' );

  for( let a = 1 ; a < arguments.length ; a++ )
  {

    let ins = _.arrayAs( arguments[ a ] );
    for( let i = 0 ; i < ins.length ; i++ )
    if( src.indexOf( ins[ i ] ) === -1 )
    return false;

  }

  return true;
}

//

function arrayHasNone( src )
{
  _.assert( arguments.length >= 1, 'Expects at least one argument' );
  _.assert( _.arrayLike( src ) || _.bufferTypedIs( src ),'arrayHasNone :','array expected' );

  for( let a = 1 ; a < arguments.length ; a++ )
  {

    let ins = _.arrayAs( arguments[ a ] );
    for( let i = 0 ; i < ins.length ; i++ )
    if( src.indexOf( ins[ i ] ) !== -1 )
    return false;

  }

  return true;
}

//

function arrayAll( src )
{

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.longIs( src ) );

  for( let s = 0 ; s < src.length ; s += 1 )
  {
    if( !src[ s ] )
    return false;
  }

  return true;
}

//

function arrayAny( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.longIs( src ) );

  debugger;
  for( let s = 0 ; s < src.length ; s += 1 )
  if( src[ s ] )
  return true;

  debugger;
  return false;
}

//

function arrayNone( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.longIs( src ) );

  for( let s = 0 ; s < src.length ; s += 1 )
  if( src[ s ] )
  return false;

  return true;
}

// --
// array sequential search
// --

function arrayLeftIndex( arr, ins, evaluator1, evaluator2 )
{

  _.assert( 2 <= arguments.length && arguments.length <= 4 );
  _.assert( _.longIs( arr ) );
  _.assert( !evaluator1 || evaluator1.length === 1 || evaluator1.length === 2 );
  _.assert( !evaluator1 || _.routineIs( evaluator1 ) );
  _.assert( !evaluator2 || evaluator2.length === 1 );
  _.assert( !evaluator2 || _.routineIs( evaluator2 ) );

  if( !evaluator1 )
  {
    _.assert( !evaluator2 );
    return _ArrayIndexOf.call( arr, ins );
  }
  else if( evaluator1.length === 2 )
  {
    _.assert( !evaluator2 );
    for( let a = 0 ; a < arr.length ; a++ )
    {

      if( evaluator1( arr[ a ],ins ) )
      return a;

    }
  }
  else
  {

    if( evaluator2 )
    ins = evaluator2( ins );
    else
    ins = evaluator1( ins );

    for( let a = 0 ; a < arr.length ; a++ )
    {
      if( evaluator1( arr[ a ] ) === ins )
      return a;
    }

  }

  return -1;
}

//

function arrayRightIndex( arr, ins, evaluator1, evaluator2 )
{

  if( ins === undefined )
  debugger;

  _.assert( 2 <= arguments.length && arguments.length <= 4 );
  _.assert( !evaluator1 || evaluator1.length === 1 || evaluator1.length === 2 );
  _.assert( !evaluator1 || _.routineIs( evaluator1 ) );
  _.assert( !evaluator2 || evaluator2.length === 1 );
  _.assert( !evaluator2 || _.routineIs( evaluator2 ) );

  if( !evaluator1 )
  {
    _.assert( !evaluator2 );
    if( !_.arrayIs( arr ) )
    debugger;
    return _ArrayLastIndexOf.call( arr, ins );
  }
  else if( evaluator1.length === 2 )
  {
    _.assert( !evaluator2 );
    for( let a = arr.length-1 ; a >= 0 ; a-- )
    {
      if( evaluator1( arr[ a ],ins ) )
      return a;
    }
  }
  else
  {

    if( evaluator2 )
    ins = evaluator2( ins );
    else
    ins = evaluator1( ins );

    for( let a = arr.length-1 ; a >= 0 ; a-- )
    {
      if( evaluator1( arr[ a ] ) === ins )
      return a;
    }

  }

  return -1;
}

//

/**
 * The arrayLeft() routine returns a new object containing the properties, (index, element),
 * corresponding to a found value (ins) from an array (arr).
 *
 * It creates the variable (i), assigns and calls to it the function( _.arrayLeftIndex( arr, ins, evaluator1 ) ),
 * that returns the index of the value (ins) in the array (arr).
 * [wTools.arrayLeftIndex()]{@link wTools.arrayLeftIndex}
 * If (i) is more or equal to the zero, it returns the object containing the properties ({ index : i, element : arr[ i ] }).
 * Otherwise, it returns the empty object.
 *
 * @see {@link wTools.arrayLeftIndex} - See for more information.
 *
 * @param { longIs } arr - Entity to check.
 * @param { * } ins - Element to locate in the array.
 * @param { wTools~compareCallback } evaluator1 - A callback function.
 *
 * @example
 * // returns { index : 3, element : 'str' }
 * _.arrayLeft( [ 1, 2, false, 'str', 5 ], 'str', function( a, b ) { return a === b } );
 *
 * @example
 * // returns {  }
 * _.arrayLeft( [ 1, 2, 3, 4, 5 ], 6 );
 *
 * @returns { Object } Returns a new object containing the properties, (index, element),
 * corresponding to the found value (ins) from the array (arr).
 * Otherwise, it returns the empty object.
 * @function arrayLeft
 * @throws { Error } Will throw an Error if (evaluator1) is not a Function.
 * @memberof wTools
 */

function arrayLeft( arr, ins, evaluator1, evaluator2 )
{
  let result = Object.create( null );
  let i = _.arrayLeftIndex( arr, ins, evaluator1, evaluator2 );

  _.assert( 2 <= arguments.length && arguments.length <= 4 );

  if( i >= 0 )
  {
    result.index = i;
    result.element = arr[ i ];
  }

  return result;
}

//

function arrayRight( arr, ins, evaluator1, evaluator2 )
{
  let result = Object.create( null );
  let i = _.arrayRightIndex( arr, ins, evaluator1, evaluator2 );

  _.assert( 2 <= arguments.length && arguments.length <= 4 );

  if( i >= 0 )
  {
    result.index = i;
    result.element = arr[ i ];
  }

  return result;
}

//

function arrayLeftDefined( arr )
{

  _.assert( arguments.length === 1, 'Expects single argument' );

  return _.arrayLeft( arr,true,function( e ){ return e !== undefined; } );
}

//

function arrayRightDefined( arr )
{

  _.assert( arguments.length === 1, 'Expects single argument' );

  return _.arrayRight( arr,true,function( e ){ return e !== undefined; } );
}

//

/**
 * The arrayCount() routine returns the count of matched elements in the {-srcMap-} array.
 *
 * @param { Array } src - The source array.
 * @param { * } instance - The value to search.
 *
 * @example
 * // returns 2
 * let arr = _.arrayCount( [ 1, 2, 'str', 10, 10, true ], 10 );
 *
 * @returns { Number } - Returns the count of matched elements in the {-srcMap-}.
 * @function arrayCount
 * @throws { Error } If passed arguments is less than two or more than two.
 * @throws { Error } If the first argument is not an array-like object.
 * @memberof wTools
 */

function arrayCount( src,instance )
{
  let result = 0;

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.longIs( src ),'arrayCount :','Expects ArrayLike' );

  let index = src.indexOf( instance );
  while( index !== -1 )
  {
    result += 1;
    index = src.indexOf( instance,index+1 );
  }

  return result;
}

//

/**
 * The arrayCountUnique() routine returns the count of matched pairs ([ 1, 1, 2, 2, ., . ]) in the array {-srcMap-}.
 *
 * @param { longIs } src - The source array.
 * @param { Function } [ onEvaluate = function( e ) { return e } ] - A callback function.
 *
 * @example
 * // returns 3
 * _.arrayCountUnique( [ 1, 1, 2, 'abc', 'abc', 4, true, true ] );
 *
 * @example
 * // returns 0
 * _.arrayCountUnique( [ 1, 2, 3, 4, 5 ] );
 *
 * @returns { Number } - Returns the count of matched pairs ([ 1, 1, 2, 2, ., . ]) in the array {-srcMap-}.
 * @function arrayCountUnique
 * @throws { Error } If passed arguments is less than one or more than two.
 * @throws { Error } If the first argument is not an array-like object.
 * @throws { Error } If the second argument is not a Function.
 * @memberof wTools
 */

function arrayCountUnique( src, onEvaluate )
{
  let found = [];
  onEvaluate = onEvaluate || function( e ){ return e };

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.longIs( src ),'arrayCountUnique :','Expects ArrayLike' );
  _.assert( _.routineIs( onEvaluate ) );
  _.assert( onEvaluate.length === 1 );

  for( let i1 = 0 ; i1 < src.length ; i1++ )
  {
    let element1 = onEvaluate( src[ i1 ] );
    if( found.indexOf( element1 ) !== -1 )
    continue;

    for( let i2 = i1+1 ; i2 < src.length ; i2++ )
    {

      let element2 = onEvaluate( src[ i2 ] );
      if( found.indexOf( element2 ) !== -1 )
      continue;

      if( element1 === element2 )
      found.push( element1 );

    }

  }

  return found.length;
}

// --
// array prepend
// --

/*

qqq : optimize *OnlyStrict* routines
qqq : use for documentation

alteration Routines :

- array { Op } { Tense } { Second } { How }

alteration Op : [ Append , Prepend , Remove, Flatten ]        // operation
alteration Tense : [ - , ed ]                                 // what to return
alteration Second : [ -, element, array, array ]              // how to treat src arguments
alteration How : [ - , Once , OnceStrictly ]                  // how to treat repeats

~ 60 routines

*/

function _arrayPrependUnrolling( dstArray, srcArray )
{
  _.assert( arguments.length === 2 );
  _.assert( _.arrayIs( dstArray ), 'Expects array' );

  for( let a = srcArray.length - 1 ; a >= 0 ; a-- )
  {
    if( _.unrollIs( srcArray[ a ] ) )
    {
      _arrayPrependUnrolling( dstArray, srcArray[ a ] );
    }
    else
    {
      dstArray.unshift( srcArray[ a ] );
    }
  }

  return dstArray;
}

//

function arrayPrependUnrolling( dstArray )
{
  _.assert( arguments.length >= 1 );
  _.assert( _.arrayIs( dstArray ) || dstArray === null, 'Expects array' );

  dstArray = dstArray || [];

  _._arrayPrependUnrolling( dstArray, _.longSlice( arguments, 1 ) );

  return dstArray;
}

//

function arrayPrepend_( dstArray )
{
  _.assert( arguments.length >= 1 );
  _.assert( _.arrayIs( dstArray ) || dstArray === null, 'Expects array' );

  dstArray = dstArray || [];

  for( let a = arguments.length - 1 ; a >= 1 ; a-- )
  {
    if( _.longIs( arguments[ a ] ) )
    {
      dstArray.unshift.apply( dstArray, arguments[ a ] );
    }
    else
    {
      dstArray.unshift( arguments[ a ] );
    }
  }

  return dstArray;
}

//

/**
 * Routine adds a value of argument( ins ) to the beginning of an array( dstArray ).
 *
 * @param { Array } dstArray - The destination array.
 * @param { * } ins - The element to add.
 *
 * @example
 * // returns [ 5, 1, 2, 3, 4 ]
 * _.arrayPrependElement( [ 1, 2, 3, 4 ], 5 );
 *
 * @example
 * // returns [ 5, 1, 2, 3, 4, 5 ]
 * _.arrayPrependElement( [ 1, 2, 3, 4, 5 ], 5 );
 *
 * @returns { Array } Returns updated array, that contains new element( ins ).
 * @function arrayPrependElement
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( arguments.length ) is less or more than two.
 * @memberof wTools
 */

function arrayPrependElement( dstArray, ins )
{
  arrayPrependedElement.apply( this,arguments );
  return dstArray;
}

//

/**
 * Method adds a value of argument( ins ) to the beginning of an array( dstArray )
 * if destination( dstArray ) doesn't have the value of ( ins ).
 * Additionaly takes callback( onEqualize ) that checks if element from( dstArray ) is equal to( ins ).
 *
 * @param { Array } dstArray - The destination array.
 * @param { * } ins - The value to add.
 * @param { wTools~compareCallback } onEqualize - A callback function. By default, it checks the equality of two arguments.
 *
 * @example
 * // returns [ 5, 1, 2, 3, 4 ]
 * _.arrayPrependOnce( [ 1, 2, 3, 4 ], 5 );
 *
 * @example
 * // returns [ 1, 2, 3, 4, 5 ]
 * _.arrayPrependOnce( [ 1, 2, 3, 4, 5 ], 5 );
 *
 * @example
 * // returns [ 'Dmitry', 'Petre', 'Mikle', 'Oleg' ]
 * _.arrayPrependOnce( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry' );
 *
 * @example
 * // returns [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ]
 * _.arrayPrependOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry' );
 *
 * @example
 * function onEqualize( a, b )
 * {
 *  return a.value === b.value;
 * };
 * _.arrayPrependOnce( [ { value : 1 }, { value : 2 } ], { value : 1 }, onEqualize );
 * // returns [ { value : 1 }, { value : 2 } ]
 *
 * @returns { Array } If an array ( dstArray ) doesn't have a value ( ins ) it returns the updated array ( dstArray ) with the new length,
 * otherwise, it returns the original array ( dstArray ).
 * @function arrayPrependOnce
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( onEqualize ) is not an Function.
 * @throws { Error } An Error if ( arguments.length ) is not equal two or three.
 * @memberof wTools
 */

function arrayPrependOnce( dstArray, ins, evaluator1, evaluator2 )
{
  arrayPrependedOnce.apply( this,arguments );
  return dstArray;
}

//

/**
 * Method adds a value of argument( ins ) to the beginning of an array( dstArray )
 * if destination( dstArray ) doesn't have the value of ( ins ).
 * Additionaly takes callback( onEqualize ) that checks if element from( dstArray ) is equal to( ins ).
 * Returns updated array( dstArray ) if( ins ) was added, otherwise throws an Error.
 *
 * @param { Array } dstArray - The destination array.
 * @param { * } ins - The value to add.
 * @param { wTools~compareCallback } onEqualize - A callback function. By default, it checks the equality of two arguments.
 *
 * @example
 * // returns [ 5, 1, 2, 3, 4 ]
 * _.arrayPrependOnceStrictly( [ 1, 2, 3, 4 ], 5 );
 *
 * @example
 * // throws error
 * _.arrayPrependOnceStrictly( [ 1, 2, 3, 4, 5 ], 5 );
 *
 * @example
 * // returns [ 'Dmitry', 'Petre', 'Mikle', 'Oleg' ]
 * _.arrayPrependOnceStrictly( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry' );
 *
 * @example
 * // throws error
 * _.arrayPrependOnceStrictly( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry' );
 *
 * @example
 * function onEqualize( a, b )
 * {
 *  return a.value === b.value;
 * };
 * _.arrayPrependOnceStrictly( [ { value : 1 }, { value : 2 } ], { value : 0 }, onEqualize );
 * // returns [ { value : 0 }, { value : 1 }, { value : 2 } ]
 *
 * @returns { Array } If an array ( dstArray ) doesn't have a value ( ins ) it returns the updated array ( dstArray ) with the new length,
 * otherwise, it throws an Error.
 * @function arrayPrependOnceStrictly
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( onEqualize ) is not an Function.
 * @throws { Error } An Error if ( arguments.length ) is not equal two or three.
 * @throws { Error } An Error if ( ins ) already exists on( dstArray ).
 * @memberof wTools
 */

function arrayPrependOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{
  let result;
  if ( Config.debug )
  {
    debugger;
    result = arrayPrependedOnce.apply( this, arguments );
    _.assert( result >= 0,'array should have only unique elements, but has several',ins );
  }
  else
  {
    result = arrayPrependedElement.apply( this, [ dstArray, ins ] );
  }

  return dstArray;
}

/*
function arrayPrependOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{

  let result = arrayPrependedOnce.apply( this, arguments );
  _.assert( result >= 0,'array should have only unique elements, but has several',ins );

  return dstArray;
}
*/

//

/**
 * Method adds a value of argument( ins ) to the beginning of an array( dstArray )
 * and returns zero if value was succesfully added.
 *
 * @param { Array } dstArray - The destination array.
 * @param { * } ins - The element to add.
 *
 * @example
 * // returns 0
 * _.arrayPrependedElement( [ 1, 2, 3, 4 ], 5 );
 *
 * @returns { Array } Returns updated array, that contains new element( ins ).
 * @function arrayPrependedElement
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( arguments.length ) is not equal to two.
 * @memberof wTools
 */

function arrayPrependedElement( dstArray, ins )
{
  _.assert( arguments.length === 2  );
  _.assert( _.arrayIs( dstArray ) );

  dstArray.unshift( ins );
  return 0;
}

//

/**
 * Method adds a value of argument( ins ) to the beginning of an array( dstArray )
 * if destination( dstArray ) doesn't have the value of ( ins ).
 * Additionaly takes callback( onEqualize ) that checks if element from( dstArray ) is equal to( ins ).
 *
 * @param { Array } dstArray - The destination array.
 * @param { * } ins - The value to add.
 * @param { wTools~compareCallback } onEqualize - A callback function. By default, it checks the equality of two arguments.
 *
 * @example
 * // returns 0
 * _.arrayPrependedOnce( [ 1, 2, 3, 4 ], 5 );
 *
 * @example
 * // returns -1
 * _.arrayPrependedOnce( [ 1, 2, 3, 4, 5 ], 5 );
 *
 * @example
 * // returns 0
 * _.arrayPrependedOnce( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry' );
 *
 * @example
 * // returns -1
 * _.arrayPrependedOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry' );
 *
 * @example
 * function onEqualize( a, b )
 * {
 *  return a.value === b.value;
 * };
 * _.arrayPrependedOnce( [ { value : 1 }, { value : 2 } ], { value : 1 }, onEqualize );
 * // returns -1
 *
 * @returns { Array } Returns zero if elements was succesfully added, otherwise returns -1.
 *
 * @function arrayPrependedOnce
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( onEqualize ) is not an Function.
 * @throws { Error } An Error if ( arguments.length ) is not equal two or three.
 * @memberof wTools
 */

function arrayPrependedOnce( dstArray, ins, evaluator1, evaluator2 )
{
  _.assert( _.arrayIs( dstArray ) );

  let i = _.arrayLeftIndex.apply( _, arguments );

  if( i === -1 )
  {
    dstArray.unshift( ins );
    return 0;
  }
  return -1;
}

//

/**
 * Method adds all elements from array( insArray ) to the beginning of an array( dstArray ).
 *
 * @param { Array } dstArray - The destination array.
 * @param { ArrayLike } insArray - The source array.
 *
 * @example
 * // returns [ 5, 1, 2, 3, 4 ]
 * _.arrayPrependArray( [ 1, 2, 3, 4 ], [ 5 ] );
 *
 * @example
 * // returns [ 5, 1, 2, 3, 4, 5 ]
 * _.arrayPrependArray( [ 1, 2, 3, 4, 5 ], [ 5 ] );
 *
 * @returns { Array } Returns updated array, that contains elements from( insArray ).
 * @function arrayPrependArray
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( insArray ) is not an ArrayLike entity.
 * @throws { Error } An Error if ( arguments.length ) is less or more than two.
 * @memberof wTools
 */

function arrayPrependArray( dstArray, insArray )
{
  arrayPrependedArray.apply( this, arguments );
  return dstArray;
}

//

/**
 * Method adds all unique elements from array( insArray ) to the beginning of an array( dstArray )
 * Additionaly takes callback( onEqualize ) that checks if element from( dstArray ) is equal to( ins ).
 *
 * @param { Array } dstArray - The destination array.
 * @param { ArrayLike } insArray - The source array.
 * @param { wTools~compareCallback } onEqualize - A callback function. By default, it checks the equality of two arguments.
 *
 * @example
 * // returns [ 0, 1, 2, 3, 4 ]
 * _.arrayPrependArrayOnce( [ 1, 2, 3, 4 ], [ 0, 1, 2, 3, 4 ] );
 *
 * @example
 * // returns [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ]
 * _.arrayPrependArrayOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], [ 'Dmitry' ] );
 *
 * @example
 * function onEqualize( a, b )
 * {
 *  return a.value === b.value;
 * };
 * _.arrayPrependArrayOnce( [ { value : 1 }, { value : 2 } ], [ { value : 1 } ], onEqualize );
 * // returns [ { value : 1 }, { value : 2 } ]
 *
 * @returns { Array } Returns updated array( dstArray ) or original if nothing added.
 * @function arrayPrependArrayOnce
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( insArray ) is not an ArrayLike entity.
 * @throws { Error } An Error if ( onEqualize ) is not an Function.
 * @throws { Error } An Error if ( arguments.length ) is not equal two or three.
 * @memberof wTools
 */

function arrayPrependArrayOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  arrayPrependedArrayOnce.apply( this, arguments );
  return dstArray;
}

//

/**
 * Method adds all unique elements from array( insArray ) to the beginning of an array( dstArray )
 * Additionaly takes callback( onEqualize ) that checks if element from( dstArray ) is equal to( ins ).
 * Returns updated array( dstArray ) if all elements from( insArray ) was added, otherwise throws error.
 * Even error was thrown, elements that was prepended to( dstArray ) stays in the destination array.
 *
 * @param { Array } dstArray - The destination array.
 * @param { ArrayLike } insArray - The source array.
 * @param { wTools~compareCallback } onEqualize - A callback function. By default, it checks the equality of two arguments.
 *
 * @example
 * // returns [ 0, 1, 2, 3, 4 ]
 * _.arrayPrependArrayOnceStrictly( [ 1, 2, 3, 4 ], [ 0, 1, 2, 3, 4 ] );
 *
 * @example
 * function onEqualize( a, b )
 * {
 *  return a.value === b.value;
 * };
 * _.arrayPrependArrayOnceStrictly( [ { value : 1 }, { value : 2 } ], { value : 1 }, onEqualize );
 * // returns [ { value : 1 }, { value : 2 } ]
 *
 * * @example
 * let dst = [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ];
 * _.arrayPrependArrayOnceStrictly( dst, [ 'Antony', 'Dmitry' ] );
 * // throws error, but dstArray was updated by one element from insArray
 *
 * @returns { Array } Returns updated array( dstArray ) or throws an error if not all elements from source
 * array( insArray ) was added.
 * @function arrayPrependArrayOnceStrictly
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( insArray ) is not an ArrayLike entity.
 * @throws { Error } An Error if ( onEqualize ) is not an Function.
 * @throws { Error } An Error if ( arguments.length ) is not equal two or three.
 * @memberof wTools
 */

function arrayPrependArrayOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result;
  if( Config.debug )
  {
    result = arrayPrependedArrayOnce.apply( this, arguments );
    _.assert( result === insArray.length );
  }
  else
  {
    result = arrayPrependedArray.apply( this, [ dstArray, insArray ] );
  }

  return dstArray;
}

/*
function arrayPrependArrayOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result = arrayPrependedArrayOnce.apply( this, arguments );
  _.assert( result === insArray.length );
  return dstArray;
}
*/

//

/**
 * Method adds all elements from array( insArray ) to the beginning of an array( dstArray ).
 * Returns count of added elements.
 *
 * @param { Array } dstArray - The destination array.
 * @param { ArrayLike } insArray - The source array.
 *
 * @example
 * let dst = [ 1, 2, 3, 4 ];
 * _.arrayPrependedArray( dst, [ 5, 6, 7 ] );
 * // returns 3
 * console.log( dst );
 * //returns [ 5, 6, 7, 1, 2, 3, 4 ]
 *
 * @returns { Array } Returns count of added elements.
 * @function arrayPrependedArray
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( insArray ) is not an ArrayLike entity.
 * @throws { Error } An Error if ( arguments.length ) is less or more than two.
 * @memberof wTools
 */

function arrayPrependedArray( dstArray, insArray )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.arrayIs( dstArray ),'arrayPrependedArray :','Expects array' );
  _.assert( _.longIs( insArray ),'arrayPrependedArray :','Expects longIs' );

  dstArray.unshift.apply( dstArray,insArray );
  return insArray.length;
}

//

/**
 * Method adds all unique elements from array( insArray ) to the beginning of an array( dstArray )
 * Additionaly takes callback( onEqualize ) that checks if element from( dstArray ) is equal to( ins ).
 * Returns count of added elements.
 *
 * @param { Array } dstArray - The destination array.
 * @param { ArrayLike } insArray - The source array.
 * @param { wTools~compareCallback } onEqualize - A callback function. By default, it checks the equality of two arguments.
 *
 * @example
 * // returns 3
 * _.arrayPrependedArrayOnce( [ 1, 2, 3 ], [ 4, 5, 6] );
 *
 * @example
 * // returns 1
 * _.arrayPrependedArrayOnce( [ 0, 2, 3, 4 ], [ 1, 1, 1 ] );
 *
 * @example
 * // returns 0
 * _.arrayPrependedArrayOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], [ 'Dmitry' ] );
 *
 * @example
 * function onEqualize( a, b )
 * {
 *  return a.value === b.value;
 * };
 * _.arrayPrependedArrayOnce( [ { value : 1 }, { value : 2 } ], [ { value : 1 } ], onEqualize );
 * // returns 0
 *
 * @returns { Array } Returns count of added elements.
 * @function arrayPrependedArrayOnce
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( insArray ) is not an ArrayLike entity.
 * @throws { Error } An Error if ( onEqualize ) is not an Function.
 * @throws { Error } An Error if ( arguments.length ) is not equal two or three.
 * @memberof wTools
 */

function arrayPrependedArrayOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  _.assert( _.arrayIs( dstArray ) );
  _.assert( _.longIs( insArray ) );
  _.assert( dstArray !== insArray );
  _.assert( 2 <= arguments.length && arguments.length <= 4 );

  let result = 0;

  for( let i = insArray.length - 1; i >= 0; i-- )
  {
    if( _.arrayLeftIndex( dstArray, insArray[ i ], evaluator1, evaluator2 ) === -1 )
    {
      dstArray.unshift( insArray[ i ] );
      result += 1;
    }
  }

  return result;
}

//

/**
 * Method adds all elements from provided arrays to the beginning of an array( dstArray ) in same order
 * that they are in( arguments ).
 * If argument provided after( dstArray ) is not a ArrayLike entity it will be prepended to destination array as usual element.
 * If argument is an ArrayLike entity and contains inner arrays, routine looks for elements only on first two levels.
 * Example: _.arrayPrependArrays( [], [ [ 1 ], [ [ 2 ] ] ] ) -> [ 1, [ 2 ] ];
 * Throws an error if one of arguments is undefined. Even if error was thrown, elements that was prepended to( dstArray ) stays in the destination array.
 *
 * @param { Array } dstArray - The destination array.
 * @param{ longIs | * } arguments[...] - Source arguments.
 *
 * @example
 * // returns [ 5, 6, 7, 1, 2, 3, 4 ]
 * _.arrayPrependArrays( [ 1, 2, 3, 4 ], [ 5 ], [ 6 ], 7 );
 *
 * @example
 * let dst = [ 1, 2, 3, 4 ];
 * _.arrayPrependArrays( dst, [ 5 ], [ 6 ], undefined );
 * // throws error, but dst becomes equal [ 5, 6, 1, 2, 3, 4 ]
 *
 * @returns { Array } Returns updated array( dstArray ).
 * @function arrayPrependArrays
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if one of ( arguments ) is undefined.
 * @memberof wTools
 */

function arrayPrependArrays( dstArray, insArray )
{
  arrayPrependedArrays.apply( this, arguments );
  return dstArray;
}

//

/**
 * Method adds all unique elements from provided arrays to the beginning of an array( dstArray ) in same order
 * that they are in( arguments ).
 * If argument provided after( dstArray ) is not a ArrayLike entity it will be prepended to destination array as usual element.
 * If argument is an ArrayLike entity and contains inner arrays, routine looks for elements only on first two levels.
 * Example: _.arrayPrependArrays( [], [ [ 1 ], [ [ 2 ] ] ] ) -> [ 1, [ 2 ] ];
 * Throws an error if one of arguments is undefined. Even if error was thrown, elements that was prepended to( dstArray ) stays in the destination array.

 * @param { Array } dstArray - The destination array.
 * @param{ longIs | * } arguments[...] - Source arguments.
 *
 * @example
 * // returns [ 5, 6, 7, 1, 2, 3, 4 ]
 * _.arrayPrependArraysOnce( [ 1, 2, 3, 4 ], [ 5 ], 5, [ 6 ], 6, 7, [ 7 ] );
 *
 * @example
 * let dst = [ 1, 2, 3, 4 ];
 * _.arrayPrependArraysOnce( dst, [ 5 ], 5, [ 6 ], 6, undefined );
 * // throws error, but dst becomes equal [ 5, 6, 1, 2, 3, 4 ]
 *
 * @returns { Array } Returns updated array( dstArray ).
 * @function arrayPrependArraysOnce
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if one of ( arguments ) is undefined.
 * @memberof wTools
 */

function arrayPrependArraysOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  arrayPrependedArraysOnce.apply( this, arguments );
  return dstArray;
}

//

/**
 * Method adds all unique elements from provided arrays to the beginning of an array( dstArray ) in same order
 * that they are in( arguments ).
 * Throws an error if one of arguments is undefined.
 * If argument provided after( dstArray ) is not a ArrayLike entity it will be prepended to destination array as usual element.
 * If argument is an ArrayLike entity and contains inner arrays, routine looks for elements only on first two levels.
 * Example: _.arrayPrependArraysOnce( [], [ [ 1 ], [ [ 2 ] ] ] ) -> [ 1, [ 2 ] ];
 * After copying checks if all elements( from first two levels ) was copied, if true returns updated array( dstArray ), otherwise throws an error.
 * Even if error was thrown, elements that was prepended to( dstArray ) stays in the destination array.

 * @param { Array } dstArray - The destination array.
 * @param { longIs | * } arguments[...] - Source arguments.
 * @param { wTools~compareCallback } onEqualize - A callback function that can be provided through routine`s context. By default, it checks the equality of two arguments.
 *
 * @example
 * // returns [ 5, 6, 7, 8, 1, 2, 3, 4 ]
 * _.arrayPrependArraysOnceStrictly( [ 1, 2, 3, 4 ], 5, [ 6, [ 7 ] ], 8 );
 *
 * @example
 * // throws error
 * _.arrayPrependArraysOnceStrictly( [ 1, 2, 3, 4 ], [ 5 ], 5, [ 6 ], 6, 7, [ 7 ] );
 *
 * @example
 * function onEqualize( a, b )
 * {
 *  return a === b;
 * };
 * let dst = [];
 * let arguments = [ dst, [ 1, [ 2 ], [ [ 3 ] ] ], 4 ];
 * _.arrayPrependArraysOnceStrictly.apply( { onEqualize : onEqualize }, arguments );
 * //returns [ 1, 2, [ 3 ], 4 ]
 *
 * @returns { Array } Returns updated array( dstArray ).
 * @function arrayPrependArraysOnceStrictly
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if one of ( arguments ) is undefined.
 * @throws { Error } An Error if count of added elements is not equal to count of elements from( arguments )( only first two levels inside of array are counted ).
 * @memberof wTools
 */

function arrayPrependArraysOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result;
  if( Config.debug )
  {
    result = arrayPrependedArraysOnce.apply( this, arguments );
    let expected = 0;
    for( let i = insArray.length - 1; i >= 0; i-- )
    {
      if( _.longIs( insArray[ i ] ) )
      expected += insArray[ i ].length;
      else
      expected += 1;
    }
    _.assert( result === expected, '{-dstArray-} should have none element from {-insArray-}' );
  }
  else
  {
    result = arrayPrependedArrays.apply( this, [ dstArray, insArray ] );
  }

  return dstArray;
}

/*
function arrayPrependArraysOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result = arrayPrependedArraysOnce.apply( this, arguments );
  let expected = 0;

  if( Config.debug )
  {

    for( let i = insArray.length - 1; i >= 0; i-- )
    {
      if( _.longIs( insArray[ i ] ) )
      expected += insArray[ i ].length;
      else
      expected += 1;
    }

    _.assert( result === expected, '{-dstArray-} should have none element from {-insArray-}' );

  }

  return dstArray;
}
*/

//

/**
 * Method adds all elements from provided arrays to the beginning of an array( dstArray ) in same order
 * that they are in( arguments ).
 * If argument provided after( dstArray ) is not a ArrayLike entity it will be prepended to destination array as usual element.
 * If argument is an ArrayLike entity and contains inner arrays, routine looks for elements only on first two levels.
 * Example: _.arrayPrependArrays( [], [ [ 1 ], [ [ 2 ] ] ] ) -> [ 1, [ 2 ] ];
 * Throws an error if one of arguments is undefined. Even if error was thrown, elements that was prepended to( dstArray ) stays in the destination array.
 *
 * @param { Array } dstArray - The destination array.
 * @param{ longIs | * } arguments[...] - Source arguments.
 *
 * @example
 * // returns 3
 * _.arrayPrependedArrays( [ 1, 2, 3, 4 ], [ 5 ], [ 6 ], 7 );
 *
 * @example
 * let dst = [ 1, 2, 3, 4 ];
 * _.arrayPrependedArrays( dst, [ 5 ], [ 6 ], undefined );
 * // throws error, but dst becomes equal [ 5, 6, 1, 2, 3, 4 ]
 *
 * @returns { Array } Returns count of added elements.
 * @function arrayPrependedArrays
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @memberof wTools
 */

function arrayPrependedArrays( dstArray, insArray )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.arrayIs( dstArray ),'arrayPrependedArrays :','Expects array' );
  _.assert( _.longIs( insArray ),'arrayPrependedArrays :','Expects longIs entity' );

  let result = 0;

  for( let a = insArray.length - 1 ; a >= 0 ; a-- )
  {
    if( _.longIs( insArray[ a ] ) )
    {
      dstArray.unshift.apply( dstArray, insArray[ a ] );
      result += insArray[ a ].length;
    }
    else
    {
      dstArray.unshift( insArray[ a ] );
      result += 1;
    }
  }

  return result;
}

//

/**
 * Method adds all unique elements from provided arrays to the beginning of an array( dstArray ) in same order
 * that they are in( arguments ).
 * If argument provided after( dstArray ) is not a ArrayLike entity it will be prepended to destination array as usual element.
 * If argument is an ArrayLike entity and contains inner arrays, routine looks for elements only on first two levels.
 * Example: _.arrayPrependArrays( [], [ [ 1 ], [ [ 2 ] ] ] ) -> [ 1, [ 2 ] ];
 * Throws an error if one of arguments is undefined. Even if error was thrown, elements that was prepended to( dstArray ) stays in the destination array.
 *
 * @param { Array } dstArray - The destination array.
 * @param{ longIs | * } arguments[...] - Source arguments.
 *
 * @example
 * // returns 0
 * _.arrayPrependedArraysOnce( [ 1, 2, 3, 4, 5, 6, 7 ], [ 5 ], [ 6 ], 7 );
 *
 * @example
 * // returns 3
 * _.arrayPrependedArraysOnce( [ 1, 2, 3, 4 ], [ 5 ], 5, [ 6 ], 6, 7, [ 7 ] );
 *
 * @example
 * let dst = [ 1, 2, 3, 4 ];
 * _.arrayPrependedArraysOnce( dst, [ 5 ], [ 6 ], undefined );
 * // throws error, but dst becomes equal [ 5, 6, 1, 2, 3, 4 ]
 *
 * @returns { Array } Returns count of added elements.
 * @function arrayPrependedArraysOnce
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @memberof wTools
 */

function arrayPrependedArraysOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  _.assert( 2 <= arguments.length && arguments.length <= 4 );
  _.assert( _.arrayIs( dstArray ),'arrayPrependedArraysOnce :','Expects array' );
  _.assert( _.longIs( insArray ),'arrayPrependedArraysOnce :','Expects longIs entity' );

  let result = 0;

  function _prependOnce( element )
  {
    let index = _.arrayLeftIndex( dstArray, element, evaluator1, evaluator2 );
    if( index === -1 )
    {
      // dstArray.unshift( argument );
      dstArray.splice( result, 0, element );
      result += 1;
    }
  }

  // for( let ii = insArray.length - 1; ii >= 0; ii-- )
  for( let ii = 0 ; ii < insArray.length ; ii++ )
  {
    if( _.longIs( insArray[ ii ] ) )
    {
      let array = insArray[ ii ];
      // for( let a = array.length - 1; a >= 0; a-- )
      for( let a = 0 ; a < array.length ; a++ )
      _prependOnce( array[ a ] );
    }
    else
    {
      _prependOnce( insArray[ ii ] );
    }
  }

  return result;
}

// --
// array append
// --

function _arrayAppendUnrolling( dstArray, srcArray )
{
  _.assert( arguments.length === 2 );
  _.assert( _.arrayIs( dstArray ), 'Expects array' );

  for( let a = 0, len = srcArray.length ; a < len; a++ )
  {
    if( _.unrollIs( srcArray[ a ] ) )
    {
      _arrayAppendUnrolling( dstArray, srcArray[ a ] );
    }
    else
    {
      dstArray.push( srcArray[ a ] );
    }
  }

  return dstArray;
}

//

function arrayAppendUnrolling( dstArray )
{
  _.assert( arguments.length >= 1 );
  _.assert( _.arrayIs( dstArray ) || dstArray === null, 'Expects array' );

  dstArray = dstArray || [];

  _._arrayAppendUnrolling( dstArray, _.longSlice( arguments, 1 ) );

  return dstArray;
}

//

function arrayAppend_( dstArray )
{
  _.assert( arguments.length >= 1 );
  _.assert( _.arrayIs( dstArray ) || dstArray === null, 'Expects array' );

  dstArray = dstArray || [];

  for( let a = 1, len = arguments.length ; a < len; a++ )
  {
    if( _.longIs( arguments[ a ] ) )
    {
      dstArray.push.apply( dstArray, arguments[ a ] );
    }
    else
    {
      dstArray.push( arguments[ a ] );
    }
  }

  return dstArray;
}

//

function arrayAppendElement( dstArray, ins )
{
  arrayAppendedElement.apply( this, arguments );
  return dstArray;
}

//

/**
 * The arrayAppendOnce() routine adds at the end of an array (dst) a value {-srcMap-},
 * if the array (dst) doesn't have the value {-srcMap-}.
 *
 * @param { Array } dst - The source array.
 * @param { * } src - The value to add.
 *
 * @example
 * // returns [ 1, 2, 3, 4, 5 ]
 * _.arrayAppendOnce( [ 1, 2, 3, 4 ], 5 );
 *
 * @example
 * // returns [ 1, 2, 3, 4, 5 ]
 * _.arrayAppendOnce( [ 1, 2, 3, 4, 5 ], 5 );
 *
 * @example
 * // returns [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ]
 * _.arrayAppendOnce( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry' );
 *
 * @example
 * // returns [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ]
 * _.arrayAppendOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry' );
 *
 * @returns { Array } If an array (dst) doesn't have a value {-srcMap-} it returns the updated array (dst) with the new length,
 * otherwise, it returns the original array (dst).
 * @function arrayAppendOnce
 * @throws { Error } Will throw an Error if (dst) is not an Array.
 * @throws { Error } Will throw an Error if (arguments.length) is less or more than two.
 * @memberof wTools
 */

function arrayAppendOnce( dstArray, ins, evaluator1, evaluator2 )
{
  arrayAppendedOnce.apply( this, arguments );
  return dstArray;
}

//

function arrayAppendOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{
  let result;
  if( Config.debug )
  {
    result = arrayAppendedOnce.apply( this, arguments );
    _.assert( result >= 0,'array should have only unique elements, but has several', ins );
  }
  else
  {
    result = arrayAppendedElement.apply( this, [ dstArray, ins ] );
  }
  return dstArray;
}

/*
function arrayAppendOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{

  let result = arrayAppendedOnce.apply( this, arguments );
  _.assert( result >= 0,'array should have only unique elements, but has several', ins );
  return dstArray;
}
*/

//

function arrayAppendedElement( dstArray, ins )
{
  _.assert( arguments.length === 2  );
  _.assert( _.arrayIs( dstArray ) );
  dstArray.push( ins );
  return dstArray.length - 1;
}

//

function arrayAppendedOnce( dstArray, ins, evaluator1, evaluator2 )
{
  let i = _.arrayLeftIndex.apply( _, arguments );

  if( i === -1 )
  {
    dstArray.push( ins );
    return dstArray.length - 1;
  }

  return -1;
}

//

/**
* The arrayAppendArray() routine adds one or more elements to the end of the (dst) array
* and returns the new length of the array.
*
* It creates two variables the (result) - array and the (argument) - elements of array-like object (arguments[]),
* iterate over array-like object (arguments[]) and assigns to the (argument) each element,
* checks, if (argument) is equal to the 'undefined'.
* If true, it throws an Error.
* If (argument) is an array-like.
* If true, it merges the (argument) into the (result) array.
* Otherwise, it adds element to the result.
*
* @param { Array } dst - Initial array.
* @param {*} arguments[] - One or more argument(s) to add to the end of the (dst) array.
*
* @example
* // returns [ 1, 2, 'str', false, { a : 1 }, 42, 3, 7, 13 ];
* let arr = _.arrayAppendArray( [ 1, 2 ], 'str', false, { a : 1 }, 42, [ 3, 7, 13 ] );
*
* @returns { Array } - Returns an array (dst) with all of the following argument(s) that were added to the end of the (dst) array.
* @function arrayAppendArray
* @throws { Error } If the first argument is not an array.
* @throws { Error } If type of the argument is equal undefined.
* @memberof wTools
*/

function arrayAppendArray( dstArray, insArray )
{
  arrayAppendedArray.apply( this, arguments );
  return dstArray;
}

//

/**
 * The arrayAppendArrayOnce() routine returns an array of elements from (dst)
 * and appending only unique following arguments to the end.
 *
 * It creates two variables the (result) - array and the (argument) - elements of array-like object (arguments[]),
 * iterate over array-like object (arguments[]) and assigns to the (argument) each element,
 * checks, if (argument) is equal to the 'undefined'.
 * If true, it throws an Error.
 * if (argument) is an array-like.
 * If true, it iterate over array (argument) and checks if (result) has the same values as the (argument).
 * If false, it adds elements of (argument) to the end of the (result) array.
 * Otherwise, it checks if (result) has not the same values as the (argument).
 * If true, it adds elements to the end of the (result) array.
 *
 * @param { Array } dst - Initial array.
 * @param {*} arguments[] - One or more argument(s).
 *
 * @example
 * // returns [ 1, 2, 'str', {}, 5 ]
 * let arr = _.arrayAppendArrayOnce( [ 1, 2 ], 'str', 2, {}, [ 'str', 5 ] );
 *
 * @returns { Array } - Returns an array (dst) with only unique following argument(s) that were added to the end of the (dst) array.
 * @function arrayAppendArrayOnce
 * @throws { Error } If the first argument is not array.
 * @throws { Error } If type of the argument is equal undefined.
 * @memberof wTools
 */

function arrayAppendArrayOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  arrayAppendedArrayOnce.apply( this,arguments )
  return dstArray;
}

//

function arrayAppendArrayOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result;
  if( Config.debug )
  {
    result = arrayAppendedArrayOnce.apply( this,arguments )
    _.assert( result === insArray.length );
  }
  else
  {
    result = arrayAppendedArray.apply( this, [ dstArray, insArray ] )
  }
  return dstArray;
}

/*
function arrayAppendArrayOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result = arrayAppendedArrayOnce.apply( this,arguments )
  _.assert( result === insArray.length );
  return dstArray;
}
*/

//

function arrayAppendedArray( dstArray, insArray )
{
  _.assert( arguments.length === 2 )
  _.assert( _.arrayIs( dstArray ),'arrayPrependedArray :','Expects array' );
  _.assert( _.longIs( insArray ),'arrayPrependedArray :','Expects longIs' );

  dstArray.push.apply( dstArray,insArray );
  return insArray.length;
}

//

function arrayAppendedArrayOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  _.assert( _.longIs( insArray ) );
  _.assert( dstArray !== insArray );
  _.assert( 2 <= arguments.length && arguments.length <= 4 );

  let result = 0;

  for( let i = 0 ; i < insArray.length ; i++ )
  {
    if( _.arrayLeftIndex( dstArray, insArray[ i ], evaluator1, evaluator2 ) === -1 )
    {
      dstArray.push( insArray[ i ] );
      result += 1;
    }
  }

  return result;
}

//

function arrayAppendArrays( dstArray )
{
  arrayAppendedArrays.apply( this, arguments );
  return dstArray;
}

//

function arrayAppendArraysOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  arrayAppendedArraysOnce.apply( this, arguments );
  return dstArray;
}

//

function arrayAppendArraysOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result;
  if( Config.debug )
  {

    result = arrayAppendedArraysOnce.apply( this, arguments );

    let expected = 0;
    for( let i = insArray.length - 1; i >= 0; i-- )
    {
      if( _.longIs( insArray[ i ] ) )
      expected += insArray[ i ].length;
      else
      expected += 1;
    }
    _.assert( result === expected, '{-dstArray-} should have none element from {-insArray-}' );
  }
  else
  {
    result = arrayAppendedArrays.apply( this, [ dstArray, insArray ] );
  }

  return dstArray;
}

/*
function arrayAppendArraysOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result = arrayAppendedArraysOnce.apply( this, arguments );

  if( Config.debug )
  {

    let expected = 0;
    for( let i = insArray.length - 1; i >= 0; i-- )
    {
      if( _.longIs( insArray[ i ] ) )
      expected += insArray[ i ].length;
      else
      expected += 1;
    }

    _.assert( result === expected, '{-dstArray-} should have none element from {-insArray-}' );

  }

  return dstArray;
}
*/

//

function arrayAppendedArrays( dstArray, insArray )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.arrayIs( dstArray ), 'Expects array' );
  _.assert( _.longIs( insArray ), 'Expects longIs entity' );

  let result = 0;

  for( let a = 0, len = insArray.length; a < len; a++ )
  {
    if( _.longIs( insArray[ a ] ) )
    {
      dstArray.push.apply( dstArray, insArray[ a ] );
      result += insArray[ a ].length;
    }
    else
    {
      dstArray.push( insArray[ a ] );
      result += 1;
    }
  }

  return result;
}

//

function arrayAppendedArraysOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  _.assert( 2 <= arguments.length && arguments.length <= 4 );
  _.assert( _.arrayIs( dstArray ),'arrayAppendedArraysOnce :','Expects array' );
  _.assert( _.longIs( insArray ),'arrayAppendedArraysOnce :','Expects longIs entity' );

  let result = 0;

  function _appendOnce( argument )
  {
    let index = _.arrayLeftIndex( dstArray, argument, evaluator1, evaluator2 );
    if( index === -1 )
    {
      dstArray.push( argument );
      result += 1;
    }
  }

  for( let a = 0, len = insArray.length; a < len; a++ )
  {
    if( _.longIs( insArray[ a ] ) )
    {
      let array = insArray[ a ];
      for( let i = 0, alen = array.length; i < alen; i++ )
      _appendOnce( array[ i ] );
    }
    else
    {
      _appendOnce( insArray[ a ] );
    }
  }

  return result;
}

// --
// array remove
// --

/**
 * ArrayRemove, arrayRemoveOnce, arrayRemoveOnceStrictly and arrayRemoved behave just like
 * arrayRemoveElement, arrayRemoveElementOnce, arrayRemoveElementOnceStrictly and arrayRemovedElement.
 */

function arrayRemove( dstArray, ins, evaluator1, evaluator2 )
{
  arrayRemoved.apply( this, arguments );
  return dstArray;
}

//

function arrayRemoveOnce( dstArray, ins, evaluator1, evaluator2 )
{
  arrayRemovedOnce.apply( this, arguments );
  return dstArray;
}

//

function arrayRemoveOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{
  arrayRemoveElementOnceStrictly.apply( this, arguments );
  return dstArray;
}

//

function arrayRemoved( dstArray, ins, evaluator1, evaluator2 )
{
  let removedElements = arrayRemovedElement.apply( this, arguments );
  return removedElements;
}

//

/**
 * ArrayRemovedOnce and arrayRemovedOnceStrictly behave just like arrayRemovedElementOnce and arrayRemovedElementOnceStrictly,
 * but return the index of the removed element, instead of the removed element
 */

function arrayRemovedOnce( dstArray, ins, evaluator1, evaluator2 )
{
  let index = _.arrayLeftIndex.apply( _, arguments );
  if( index >= 0 )
  dstArray.splice( index, 1 );

  return index;
}

//

function arrayRemovedOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{
  let index = _.arrayLeftIndex.apply( _, arguments );
  if( index >= 0 )
  {
    dstArray.splice( index, 1 );
  }
  else _.assert( 0, () => 'Array does not have element ' + _.toStrShort( ins ) );

  let newIndex = _.arrayLeftIndex.apply( _, arguments );
  _.assert( newIndex < 0, () => 'The element ' + _.toStrShort( ins ) + ' is several times in dstArray' );

  return index;
}

//

function arrayRemoveElement( dstArray, ins, evaluator1, evaluator2 )
{
  arrayRemovedElement.apply( this, arguments );
  return dstArray;
}

//

/**
 * The arrayRemoveElementOnce() routine removes the first matching element from (dstArray)
 * that corresponds to the condition in the callback function and returns a modified array.
 *
 * It takes two (dstArray, ins) or three (dstArray, ins, onEvaluate) arguments,
 * checks if arguments passed two, it calls the routine
 * [arrayRemovedElementOnce( dstArray, ins )]{@link wTools.arrayRemovedElementOnce}
 * Otherwise, if passed three arguments, it calls the routine
 * [arrayRemovedElementOnce( dstArray, ins, onEvaluate )]{@link wTools.arrayRemovedElementOnce}
 * @see  wTools.arrayRemovedElementOnce
 * @param { Array } dstArray - The source array.
 * @param { * } ins - The value to remove.
 * @param { wTools~compareCallback } [ onEvaluate ] - The callback that compares (ins) with elements of the array.
 * By default, it checks the equality of two arguments.
 *
 * @example
 * // returns [ 1, 2, 3, 'str' ]
 * let arr = _.arrayRemoveElementOnce( [ 1, 'str', 2, 3, 'str' ], 'str' );
 *
 * @example
 * // returns [ 3, 7, 13, 33 ]
 * let arr = _.arrayRemoveElementOnce( [ 3, 7, 33, 13, 33 ], 13, function( el, ins ) {
 *   return el > ins;
 * });
 *
 * @returns { Array } - Returns the modified (dstArray) array with the new length.
 * @function arrayRemoveElementOnce
 * @throws { Error } If the first argument is not an array.
 * @throws { Error } If passed less than two or more than three arguments.
 * @throws { Error } If the third argument is not a function.
 * @memberof wTools
 */

function arrayRemoveElementOnce( dstArray, ins, evaluator1, evaluator2 )
{
  arrayRemovedElementOnce.apply( this, arguments );
  return dstArray;
}

//

function arrayRemoveElementOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{
  let result;
  if( Config.debug )
  {
    let result = arrayRemovedElementOnce.apply( this, arguments );
    let index = _.arrayLeftIndex.apply( _, arguments );
    _.assert( index < 0 );
    _.assert( result >= 0, () => 'Array does not have element ' + _.toStrShort( ins ) );
  }
  else
  {
    let result = arrayRemovedElement.apply( this, [ dstArray, ins ] );
  }
  return dstArray;
}

/*
function arrayRemoveElementOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{
  let result = arrayRemovedElementOnce.apply( this, arguments );
  _.assert( result >= 0, () => 'Array does not have element ' + _.toStrShort( ins ) );
  return dstArray;
}
*/

//

function arrayRemovedElement( dstArray, ins, evaluator1, evaluator2 )
{
  let index = _.arrayLeftIndex.apply( this, arguments );
  let removedElements = 0;

  for( let i = 0; i < dstArray.length; i++ )
  {
    if( index !== -1 )
    {
      dstArray.splice( index, 1 );
      removedElements = removedElements + 1;
      i = i - 1 ;
    }
    index = _.arrayLeftIndex.apply( this, arguments );
  }
  return removedElements;
}

//

/**
 * The callback function to compare two values.
 *
 * @callback wTools~compareCallback
 * @param { * } el - The element of the array.
 * @param { * } ins - The value to compare.
 */

/**
 * The arrayRemovedElementOnce() routine returns the index of the first matching element from (dstArray)
 * that corresponds to the condition in the callback function and remove this element.
 *
 * It takes two (dstArray, ins) or three (dstArray, ins, onEvaluate) arguments,
 * checks if arguments passed two, it calls built in function(dstArray.indexOf(ins))
 * that looking for the value of the (ins) in the (dstArray).
 * If true, it removes the value (ins) from (dstArray) array by corresponding index.
 * Otherwise, if passed three arguments, it calls the routine
 * [arrayLeftIndex( dstArray, ins, onEvaluate )]{@link wTools.arrayLeftIndex}
 * If callback function(onEvaluate) returns true, it returns the index that will be removed from (dstArray).
 * @see {@link wTools.arrayLeftIndex} - See for more information.
 *
 * @param { Array } dstArray - The source array.
 * @param { * } ins - The value to remove.
 * @param { wTools~compareCallback } [ onEvaluate ] - The callback that compares (ins) with elements of the array.
 * By default, it checks the equality of two arguments.
 *
 * @example
 * // returns 1
 * let arr = _.arrayRemovedElementOnce( [ 2, 4, 6 ], 4, function( el ) {
 *   return el;
 * });
 *
 * @example
 * // returns 0
 * let arr = _.arrayRemovedElementOnce( [ 2, 4, 6 ], 2 );
 *
 * @returns { Number } - Returns the index of the value (ins) that was removed from (dstArray).
 * @function arrayRemovedElementOnce
 * @throws { Error } If the first argument is not an array-like.
 * @throws { Error } If passed less than two or more than three arguments.
 * @throws { Error } If the third argument is not a function.
 * @memberof wTools
 */

function arrayRemovedElementOnce( dstArray, ins, evaluator1, evaluator2 )
{

  let index = _.arrayLeftIndex.apply( _, arguments );
  if( index >= 0 )
  dstArray.splice( index, 1 );

  return index;
  /* "!!! : breaking" */
  /* // arrayRemovedElementOnce should return the removed element
  let result;
  let index = _.arrayLeftIndex.apply( _, arguments );

  if( index >= 0 )
  {
    result = dstArray[ index ];
    dstArray.splice( index, 1 );
  }

  return result;
  */
}

//

function arrayRemovedElementOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{

  let result;
  let index = _.arrayLeftIndex.apply( _, arguments );
  if( index >= 0 )
  {
    result = dstArray[ index ];
    dstArray.splice( index, 1 );
  }
  else _.assert( 0, () => 'Array does not have element ' + _.toStrShort( ins ) );

  index = _.arrayLeftIndex.apply( _, arguments );
  _.assert( index < 0, () => 'The element ' + _.toStrShort( ins ) + ' is several times in dstArray' );

  return result;
}

/*
function arrayRemovedElementOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{

  let result;
  let index = _.arrayLeftIndex.apply( _, arguments );
  if( index >= 0 )
  {
    result = dstArray[ index ];
    dstArray.splice( index, 1 );
  }
  else _.assert( 0, () => 'Array does not have element ' + _.toStrShort( ins ) );

  return result;
}
*/

//

function arrayRemoveArray( dstArray, insArray )
{
  arrayRemovedArray.apply( this, arguments );
  return dstArray;
}

//

function arrayRemoveArrayOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  arrayRemovedArrayOnce.apply( this, arguments );
  return dstArray;
}

//

function arrayRemoveArrayOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result;
  if( Config.debug )
  {
    result = arrayRemovedArrayOnce.apply( this, arguments );
    let index = - 1;
    for( let i = 0, len = insArray.length; i < len ; i++ )
    {
      index = dstArray.indexOf( insArray[ i ] );
      _.assert( index < 0 );
    }
    _.assert( result === insArray.length );

  }
  else
  {
    result = arrayRemovedArray.apply( this, [ dstArray, insArray ] );
  }
  return dstArray;
}

/*
function arrayRemoveArrayOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result = arrayRemovedArrayOnce.apply( this, arguments );
  _.assert( result === insArray.length );
  return dstArray;
}
*/

//

function arrayRemovedArray( dstArray, insArray )
{
  _.assert( arguments.length === 2 )
  _.assert( _.arrayIs( dstArray ) );
  _.assert( _.longIs( insArray ) );
  _.assert( dstArray !== insArray );

  let result = 0;
  let index = -1;

  for( let i = 0, len = insArray.length; i < len ; i++ )
  {
    index = dstArray.indexOf( insArray[ i ] );
    while( index !== -1 )
    {
      dstArray.splice( index,1 );
      result += 1;
      index = dstArray.indexOf( insArray[ i ], index );
    }
  }

  return result;
}

//

/**
 * The callback function to compare two values.
 *
 * @callback arrayRemovedArrayOnce~onEvaluate
 * @param { * } el - The element of the (dstArray[n]) array.
 * @param { * } ins - The value to compare (insArray[n]).
 */

/**
 * The arrayRemovedArrayOnce() determines whether a (dstArray) array has the same values as in a (insArray) array,
 * and returns amount of the deleted elements from the (dstArray).
 *
 * It takes two (dstArray, insArray) or three (dstArray, insArray, onEqualize) arguments, creates variable (let result = 0),
 * checks if (arguments[..]) passed two, it iterates over the (insArray) array and calls for each element built in function(dstArray.indexOf(insArray[i])).
 * that looking for the value of the (insArray[i]) array in the (dstArray) array.
 * If true, it removes the value (insArray[i]) from (dstArray) array by corresponding index,
 * and incrementing the variable (result++).
 * Otherwise, if passed three (arguments[...]), it iterates over the (insArray) and calls for each element the routine
 *
 * If callback function(onEqualize) returns true, it returns the index that will be removed from (dstArray),
 * and then incrementing the variable (result++).
 *
 * @see wTools.arrayLeftIndex
 *
 * @param { longIs } dstArray - The target array.
 * @param { longIs } insArray - The source array.
 * @param { function } onEqualize - The callback function. By default, it checks the equality of two arguments.
 *
 * @example
 * // returns 0
 * _.arrayRemovedArrayOnce( [  ], [  ] );
 *
 * @example
 * // returns 2
 * _.arrayRemovedArrayOnce( [ 1, 2, 3, 4, 5 ], [ 6, 2, 7, 5, 8 ] );
 *
 * @example
 * // returns 4
 * let got = _.arrayRemovedArrayOnce( [ 1, 2, 3, 4, 5 ], [ 6, 2, 7, 5, 8 ], function( a, b ) {
 *   return a < b;
 * } );
 *
 * @returns { number }  Returns amount of the deleted elements from the (dstArray).
 * @function arrayRemovedArrayOnce
 * @throws { Error } Will throw an Error if (dstArray) is not an array-like.
 * @throws { Error } Will throw an Error if (insArray) is not an array-like.
 * @throws { Error } Will throw an Error if (arguments.length < 2  || arguments.length > 3).
 * @memberof wTools
 */

function arrayRemovedArrayOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  _.assert( _.arrayIs( dstArray ) );
  _.assert( _.longIs( insArray ) );
  _.assert( dstArray !== insArray );
  _.assert( 2 <= arguments.length && arguments.length <= 4 );

  let result = 0;
  let index = -1;

  for( let i = 0, len = insArray.length; i < len ; i++ )
  {
    index = _.arrayLeftIndex( dstArray, insArray[ i ], evaluator1, evaluator2 );

    if( index >= 0 )
    {
      dstArray.splice( index,1 );
      result += 1;
    }
  }

  return result;
}

//

function arrayRemovedArrayOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result;
  if( Config.debug )
  {
    result = arrayRemovedArrayOnce.apply( this, arguments );
    let index = - 1;
    for( let i = 0, len = insArray.length; i < len ; i++ )
    {
      index = dstArray.indexOf( insArray[ i ] );
      _.assert( index < 0 );
    }
    _.assert( result === insArray.length );

  }
  else
  {
    result = arrayRemovedArray.apply( this, [ dstArray, insArray ] );
  }
  return result;
}

//

function arrayRemoveArrays( dstArray, insArray )
{
  arrayRemovedArrays.apply( this, arguments );
  return dstArray;
}

//

function arrayRemoveArraysOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  arrayRemovedArraysOnce.apply( this, arguments );
  return dstArray;
}

//

function arrayRemoveArraysOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result;
  if( Config.debug )
  {
    result = arrayRemovedArraysOnce.apply( this, arguments );

    let expected = 0;
    for( let i = insArray.length - 1; i >= 0; i-- )
    {
      if( _.longIs( insArray[ i ] ) )
      expected += insArray[ i ].length;
      else
      expected += 1;
    }

    _.assert( result === expected );
    _.assert( arrayRemovedArraysOnce.apply( this, arguments ) === 0 );
  }
  else
  {
    result = arrayRemovedArrays.apply( this, [ dstArray, insArray ] );
  }

  return dstArray;
}

/*
function arrayRemoveArraysOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result = arrayRemovedArraysOnce.apply( this, arguments );

  let expected = 0;
  for( let i = insArray.length - 1; i >= 0; i-- )
  {
    if( _.longIs( insArray[ i ] ) )
    expected += insArray[ i ].length;
    else
    expected += 1;
  }

  _.assert( result === expected );

  return dstArray;
}
*/

//

function arrayRemovedArrays( dstArray, insArray )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.arrayIs( dstArray ),'arrayRemovedArrays :','Expects array' );
  _.assert( _.longIs( insArray ),'arrayRemovedArrays :','Expects longIs entity' );

  let result = 0;

  function _remove( argument )
  {
    let index = dstArray.indexOf( argument );
    while( index !== -1 )
    {
      dstArray.splice( index,1 );
      result += 1;
      index = dstArray.indexOf( argument, index );
    }
  }

  for( let a = insArray.length - 1; a >= 0; a-- )
  {
    if( _.longIs( insArray[ a ] ) )
    {
      let array = insArray[ a ];
      for( let i = array.length - 1; i >= 0; i-- )
      _remove( array[ i ] );
    }
    else
    {
      _remove( insArray[ a ] );
    }
  }

  return result;
}

//

function arrayRemovedArraysOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  _.assert( 2 <= arguments.length && arguments.length <= 4 );
  _.assert( _.arrayIs( dstArray ),'arrayRemovedArraysOnce :','Expects array' );
  _.assert( _.longIs( insArray ),'arrayRemovedArraysOnce :','Expects longIs entity' );

  let result = 0;

  function _removeOnce( argument )
  {
    let index = _.arrayLeftIndex( dstArray, argument, evaluator1, evaluator2 );
    if( index >= 0 )
    {
      dstArray.splice( index, 1 );
      result += 1;
    }
  }

  for( let a = insArray.length - 1; a >= 0; a-- )
  {
    if( _.longIs( insArray[ a ] ) )
    {
      let array = insArray[ a ];
      for( let i = array.length - 1; i >= 0; i-- )
      _removeOnce( array[ i ] );
    }
    else
    {
      _removeOnce( insArray[ a ] );
    }
  }

  return result;
}

//

function arrayRemovedArraysOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result;
  if( Config.debug )
  {
    result = arrayRemovedArraysOnce.apply( this, arguments );

    let expected = 0;
    for( let i = insArray.length - 1; i >= 0; i-- )
    {
      if( _.longIs( insArray[ i ] ) )
      expected += insArray[ i ].length;
      else
      expected += 1;
    }

    _.assert( result === expected );
    _.assert( arrayRemovedArraysOnce.apply( this, arguments ) === 0 );
  }
  else
  {
    result = arrayRemovedArrays.apply( this, [ dstArray, insArray ] );
  }

  return result;
}

//

/**
 * Callback for compare two value.
 *
 * @callback arrayRemoveAll~compareCallback
 * @param { * } el - Element of the array.
 * @param { * } ins - Value to compare.
 */

/**
 * The arrayRemoveAll() routine removes all (ins) values from (dstArray)
 * that corresponds to the condition in the callback function and returns the modified array.
 *
 * It takes two (dstArray, ins) or three (dstArray, ins, onEvaluate) arguments,
 * checks if arguments passed two, it calls the routine
 * [arrayRemovedElement( dstArray, ins )]{@link wTools.arrayRemovedElement}
 * Otherwise, if passed three arguments, it calls the routine
 * [arrayRemovedElement( dstArray, ins, onEvaluate )]{@link wTools.arrayRemovedElement}
 *
 * @see wTools.arrayRemovedElement
 *
 * @param { Array } dstArray - The source array.
 * @param { * } ins - The value to remove.
 * @param { wTools~compareCallback } [ onEvaluate ] - The callback that compares (ins) with elements of the array.
 * By default, it checks the equality of two arguments.
 *
 * @example
 * // returns [ 2, 2, 3, 5 ]
 * let arr = _.arrayRemoveAll( [ 1, 2, 2, 3, 5 ], 2, function( el, ins ) {
 *   return el < ins;
 * });
 *
 * @example
 * // returns [ 1, 3, 5 ]
 * let arr = _.arrayRemoveAll( [ 1, 2, 2, 3, 5 ], 2 );
 *
 * @returns { Array } - Returns the modified (dstArray) array with the new length.
 * @function arrayRemoveAll
 * @throws { Error } If the first argument is not an array-like.
 * @throws { Error } If passed less than two or more than three arguments.
 * @throws { Error } If the third argument is not a function.
 * @memberof wTools
 */

function arrayRemoveAll( dstArray, ins, evaluator1, evaluator2 )
{
  arrayRemovedAll.apply( this, arguments );
  return dstArray;
}

//

function arrayRemovedAll( dstArray, ins, evaluator1, evaluator2  )
{
  let index = _.arrayLeftIndex.apply( _, arguments );
  let result = 0;

  while( index >= 0 )
  {
    dstArray.splice( index,1 );
    result += 1;
    index = _.arrayLeftIndex.apply( _, arguments );
  }

  return result;
}

//

/**
 * The arrayRemoveDuplicates( dstArray, evaluator ) routine returns the dstArray with the duplicated elements removed.
 *
 * @param { ArrayIs } dstArray - The source and destination array.
 * @param { Function } [ evaluator = function( e ) { return e } ] - A callback function.
 *
 * @example
 * // returns [ 1, 2, 'abc', 4, true ]
 * _.arrayRemoveDuplicates( [ 1, 1, 2, 'abc', 'abc', 4, true, true ] );
 *
 * @example
 * // [ 1, 2, 3, 4, 5 ]
 * _.arrayRemoveDuplicates( [ 1, 2, 3, 4, 5 ] );
 *
 * @returns { Number } - Returns the source array without the duplicated elements.
 * @function arrayRemoveDuplicates
 * @throws { Error } If passed arguments is less than one or more than two.
 * @throws { Error } If the first argument is not an array.
 * @throws { Error } If the second argument is not a Function.
 * @memberof wTools
 */

function arrayRemoveDuplicates( dstArray, evaluator )
{
  _.assert( 1 <= arguments.length || arguments.length <= 2 );
  _.assert( _.arrayIs( dstArray ), 'Expects Array' );

  let element;
  for( let i = 0 ; i < dstArray.length ; i++ )
  {
    let index;
    do
    {
      element = dstArray[ i ];
      index = _.arrayRightIndex( dstArray, element, evaluator );
      if( index !== i )
      {
        dstArray.splice( index, 1 );
      }
    }
    while( index !== i );
  }

  return dstArray;
}

/* qqq : use do .. while instead */
/*
function arrayRemoveDuplicates( dstArray, evaluator )
{
  _.assert( 1 <= arguments.length || arguments.length <= 2 );
  _.assert( _.arrayIs( dstArray ),'arrayRemoveDuplicates :','Expects Array' );

  for( let i1 = 0 ; i1 < dstArray.length ; i1++ )
  {
    let element1 = dstArray[ i1 ];
    let index = _.arrayRightIndex( dstArray, element1, evaluator );

    while ( index !== i1 )
    {
      dstArray.splice( index, 1 );
      index = _.arrayRightIndex( dstArray, element1, evaluator );
    }
  }

  return dstArray;
}
*/

//

/**
 * The longRemoveDuplicates( dstLong, onEvaluator ) routine returns the dstlong with the duplicated elements removed.
 * The dstLong instance will be returned when possible, if not a new instance of the same type is created.
 *
 * @param { longIs } dstLong - The source and destination long.
 * @param { Function } [ onEvaluate = function( e ) { return e } ] - A callback function.
 *
 * @example
 * // returns [ 1, 2, 'abc', 4, true ]
 * _.longRemoveDuplicates( [ 1, 1, 2, 'abc', 'abc', 4, true, true ] );
 *
 * @example
 * // [ 1, 2, 3, 4, 5 ]
 * _.longRemoveDuplicates( [ 1, 2, 3, 4, 5 ] );
 *
 * @returns { Number } - Returns the source long without the duplicated elements.
 * @function longRemoveDuplicates
 * @throws { Error } If passed arguments is less than one or more than two.
 * @throws { Error } If the first argument is not an long.
 * @throws { Error } If the second argument is not a Function.
 * @memberof wTools
 */

function longRemoveDuplicates( dstLong, onEvaluate )
{
  _.assert( 1 <= arguments.length || arguments.length <= 3 );
  _.assert( _.longIs( dstLong ),'longRemoveDuplicates :','Expects Long' );

  if( _.arrayIs( dstLong ) )
  {
    _.arrayRemoveDuplicates( dstLong, onEvaluate );
  }
  else if( Object.prototype.toString.call( dstLong ) === "[object Arguments]")
  {
    let newElement;
    for( let i = 0; i < dstLong.length; i++ )
    {
      newElement = dstLong[ i ];
      for( let j = i + 1; j < dstLong.length; j++ )
      {
        if( newElement === dstLong[ j ] )
        {
          let array = Array.from( dstLong );
          _.arrayRemoveDuplicates( array, onEvaluate );
          dstLong = new dstLong.constructor( array );
        }
      }
    }
  }
  else
  {
    if( !onEvaluate )
    {
      for( let i = 0 ; i < dstLong.length ; i++ )
      {
        function isDuplicated( element, index, array )
        {
          return ( element !== dstLong[ i ] || index === i );
        }
        dstLong = dstLong.filter( isDuplicated );
      }
    }
    else
    {
      if( onEvaluate.length === 2 )
      {
        for( let i = 0 ; i < dstLong.length ; i++ )
        {
          function isDuplicated( element, index, array )
          {
            return ( !onEvaluate( element, dstLong[ i ] ) || index === i );
          }
          dstLong = dstLong.filter( isDuplicated );
        }
      }
      else
      {
        for( let i = 0 ; i < dstLong.length ; i++ )
        {
          function isDuplicated( element, index, array )
          {
            return ( onEvaluate( element ) !== onEvaluate( dstLong[ i ] ) || index === i );
          }
          dstLong = dstLong.filter( isDuplicated );
        }
      }
    }
  }

  return dstLong;
}

/* qqq : not optimal, no redundant copy */
/*
function longRemoveDuplicates( dstLong, onEvaluate )
{
  _.assert( 1 <= arguments.length || arguments.length <= 3 );
  _.assert( _.longIs( dstLong ),'longRemoveDuplicates :','Expects Long' );

  if( _.arrayIs( dstLong ) )
  {
    _.arrayRemoveDuplicates( dstLong, onEvaluate )
    return dstLong;
  }

  let array = Array.from( dstLong );
  _.arrayRemoveDuplicates( array, onEvaluate )

  if( array.length === dstLong.length )
  {
    return dstLong;
  }
  else
  {
    return new dstLong.constructor( array );
  }

}
*/
//

// --
// array flatten
// --

/**
 * The arrayFlatten() routine returns an array that contains all the passed arguments.
 *
 * It creates two variables the (result) - array and the {-srcMap-} - elements of array-like object (arguments[]),
 * iterate over array-like object (arguments[]) and assigns to the {-srcMap-} each element,
 * checks if {-srcMap-} is not equal to the 'undefined'.
 * If true, it adds element to the result.
 * If {-srcMap-} is an Array and if element(s) of the {-srcMap-} is not equal to the 'undefined'.
 * If true, it adds to the (result) each element of the {-srcMap-} array.
 * Otherwise, if {-srcMap-} is an Array and if element(s) of the {-srcMap-} is equal to the 'undefined' it throws an Error.
 *
 * @param {...*} arguments - One or more argument(s).
 *
 * @example
 * // returns [ 'str', {}, 1, 2, 5, true ]
 * let arr = _.arrayFlatten( 'str', {}, [ 1, 2 ], 5, true );
 *
 * @returns { Array } - Returns an array of the passed argument(s).
 * @function arrayFlatten
 * @throws { Error } If (arguments[...]) is an Array and has an 'undefined' element.
 * @memberof wTools
 */

// function arrayFlatten()
// {
//   let result = _.arrayIs( this ) ? this : [];
//
//   for( let a = 0 ; a < arguments.length ; a++ )
//   {
//
//     let src = arguments[ a ];
//
//     if( !_.longIs( src ) )
//     {
//       if( src !== undefined ) result.push( src );
//       continue;
//     }
//
//     for( let s = 0 ; s < src.length ; s++ )
//     {
//       if( _.arrayIs( src[ s ] ) )
//       _.arrayFlatten.call( result,src[ s ] );
//       else if( src[ s ] !== undefined )
//       result.push( src[ s ] );
//       else if( src[ s ] === undefined )
//       throw _.err( 'array should have no undefined' );
//     }
//
//   }
//
//   return result;
// }
//
//

function arrayFlatten( dstArray, insArray )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }
  _.arrayFlattened.apply( this, arguments );
  return dstArray;
}

//

function arrayFlattenOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  arrayFlattenedOnce.apply( this, arguments );
  return dstArray;
}

//

function arrayFlattenOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result;
  if( Config.debug )
  {
    result = arrayFlattenedOnce.apply( this, arguments );

    function _count( arr )
    {
      let expected = 0;
      for( let i = arr.length - 1; i >= 0; i-- )
      {
        if( _.longIs( arr[ i ] ) )
        expected += _count( arr[ i ] );
        else
        expected += 1;
      }
      return expected;
    }

    _.assert( result === _count( insArray ) );
  }
  else
  {
    result = arrayFlattened.apply( this, [ dstArray, insArray ] );
  }

 return dstArray;
}

/*
function arrayFlattenOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result = arrayFlattenedOnce.apply( this, arguments );

  function _count( arr )
  {
    let expected = 0;
    for( let i = arr.length - 1; i >= 0; i-- )
    {
      if( _.longIs( arr[ i ] ) )
      expected += _count( arr[ i ] );
      else
      expected += 1;
    }
    return expected;
  }

 _.assert( result === _count( insArray ) );

 return dstArray;
}
*/

//

function arrayFlattened( dstArray, insArray )
{

  /* xxx : reuse arrayRemoveDuplicates for single argument call */

  if( arguments.length <= 2 && insArray === undefined )
  return _.arrayRemoveDuplicates( dstArray );

  _.assert( arguments.length >= 2 );
  _.assert( _.objectIs( this ) );
  _.assert( _.arrayIs( dstArray ) );
  // _.assert( _.longIs( insArray ) );

  let result = 0;

  for( let a = 1 ; a < arguments.length ; a++ )
  {
    let insArray = arguments[ a ];

    if( _.longIs( insArray ) )
    {
      for( let i = 0, len = insArray.length; i < len; i++ )
      {
        if( _.longIs( insArray[ i ] ) )
        {
          let c = _.arrayFlattened( dstArray, insArray[ i ] );
          result += c;
        }
        else
        {
          _.assert( insArray[ i ] !== undefined, 'The array should have no undefined' );
          dstArray.push( insArray[ i ] );
          result += 1;
        }
      }
    }
    else
    {
      dstArray.push( insArray );
      result += 1;
    }

  }

  return result;
}

//

function arrayFlattenedOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  _.assert( 2 <= arguments.length && arguments.length <= 4 );
  _.assert( _.arrayIs( dstArray ) );
  // _.assert( _.longIs( insArray ) );

  let result = 0;

  if( _.longIs( insArray ) )
  {
    for( let i = 0, len = insArray.length; i < len; i++ )
    {
      _.assert( insArray[ i ] !== undefined );
      if( _.longIs( insArray[ i ] ) )
      {
        let c = _.arrayFlattenedOnce( dstArray, insArray[ i ], evaluator1, evaluator2 );
        result += c;
      }
      else
      {
        let index = _.arrayLeftIndex( dstArray, insArray[ i ], evaluator1, evaluator2 );
        if( index === -1 )
        {
          dstArray.push( insArray[ i ] );
          result += 1;
        }
      }
    }
  }
  else
  {
    let index = _.arrayLeftIndex( dstArray, insArray, evaluator1, evaluator2 );
    if( index === -1 )
    {
      dstArray.push( insArray );
      result += 1;
    }
  }

  return result;
}

// --
// array replace
// --

/**
 * The arrayReplaceOnce() routine returns the index of the (dstArray) array which will be replaced by (sub),
 * if (dstArray) has the value (ins).
 *
 * It takes three arguments (dstArray, ins, sub), calls built in function(dstArray.indexOf(ins)),
 * that looking for value (ins) in the (dstArray).
 * If true, it replaces (ins) value of (dstArray) by (sub) and returns the index of the (ins).
 * Otherwise, it returns (-1) index.
 *
 * @param { Array } dstArray - The source array.
 * @param { * } ins - The value to find.
 * @param { * } sub - The value to replace.
 *
 * @example
 * // returns -1
 * _.arrayReplaceOnce( [ 2, 4, 6, 8, 10 ], 12, 14 );
 *
 * @example
 * // returns 1
 * _.arrayReplaceOnce( [ 1, undefined, 3, 4, 5 ], undefined, 2 );
 *
 * @example
 * // returns 3
 * _.arrayReplaceOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry', 'Bob' );
 *
 * @example
 * // returns 4
 * _.arrayReplaceOnce( [ true, true, true, true, false ], false, true );
 *
 * @returns { number }  Returns the index of the (dstArray) array which will be replaced by (sub),
 * if (dstArray) has the value (ins).
 * @function arrayReplaceOnce
 * @throws { Error } Will throw an Error if (dstArray) is not an array.
 * @throws { Error } Will throw an Error if (arguments.length) is less than three.
 * @memberof wTools
 */

function arrayReplaceOnce( dstArray, ins, sub, evaluator1, evaluator2 )
{
  arrayReplacedOnce.apply( this, arguments );
  return dstArray;
}

//

function arrayReplaceOnceStrictly( dstArray, ins, sub, evaluator1, evaluator2 )
{
  let result;
  if( Config.debug )
  {
    result = arrayReplacedOnce.apply( this, arguments );
    _.assert( result >= 0, () => 'Array does not have element ' + _.toStrShort( ins ) );
    result = arrayReplacedOnce.apply( this, arguments );
    _.assert( result < 0, () => 'The element ' + _.toStrShort( ins ) + 'is several times in dstArray' );
  }
  else
  {
    result = arrayReplacedOnce.apply( this, arguments );
  }
  return dstArray;
}

/*
function arrayReplaceOnceStrictly( dstArray, ins, sub, evaluator1, evaluator2 )
{
  let result = arrayReplacedOnce.apply( this, arguments );
  _.assert( result >= 0, () => 'Array does not have element ' + _.toStrShort( ins ) );
  return dstArray;
}
*/

//

function arrayReplacedOnce( dstArray, ins, sub, evaluator1, evaluator2 )
{
  _.assert( 3 <= arguments.length && arguments.length <= 5 );

  if( _.longIs( ins ) )
  {
    _.assert( _.longIs( sub ) );
    _.assert( ins.length === sub.length );
  }

  let index = -1;

  index = _.arrayLeftIndex( dstArray, ins, evaluator1, evaluator2 );

  if( index >= 0 )
  dstArray.splice( index, 1, sub );

  return index;
}

//

function arrayReplacedOnceStrictly( dstArray, ins, sub, evaluator1, evaluator2 )
{
  let result;
  if( Config.debug )
  {
    result = arrayReplacedOnce.apply( this, arguments );
    _.assert( result >= 0, () => 'Array does not have element ' + _.toStrShort( ins ) );
    let newResult = arrayReplacedOnce.apply( this, arguments );
    _.assert( newResult < 0, () => 'The element ' + _.toStrShort( ins ) + 'is several times in dstArray' );
  }
  else
  {
    result = arrayReplacedOnce.apply( this, arguments );
  }

  return result;
}

/*
function arrayReplacedOnceStrictly( dstArray, ins, sub, evaluator1, evaluator2 )
{
  let result = arrayReplacedOnce.apply( this, arguments );
  _.assert( result >= 0, () => 'Array does not have element ' + _.toStrShort( ins ) );
  return result;
}
*/

//

function arrayReplaceArrayOnce( dstArray, ins, sub, evaluator1, evaluator2  )
{
  arrayReplacedArrayOnce.apply( this,arguments );
  return dstArray;
}

//

function arrayReplaceArrayOnceStrictly( dstArray, ins, sub, evaluator1, evaluator2  )
{
  let result;
  if( Config.debug )
  {
    result = arrayReplacedArrayOnce.apply( this,arguments );
    _.assert( result === ins.length, '{-dstArray-} should have each element of {-insArray-}' );
    _.assert( ins.length === sub.length, '{-subArray-} should have the same length {-insArray-} has' );
    let newResult = arrayReplacedArrayOnce.apply( this, arguments );
    _.assert( newResult === 0, () => 'The element ' + _.toStrShort( ins ) + 'is several times in dstArray' );
  }
  else
  {
    result = arrayReplacedArrayOnce.apply( this,arguments );
  }

  return dstArray;
}

/*
function arrayReplaceArrayOnceStrictly( dstArray, ins, sub, evaluator1, evaluator2  )
{
  let result = arrayReplacedArrayOnce.apply( this,arguments );
  _.assert( result === ins.length, '{-dstArray-} should have each element of {-insArray-}' );
  _.assert( ins.length === sub.length, '{-subArray-} should have the same length {-insArray-} has' );
  return dstArray;
}
*/

//

function arrayReplacedArrayOnce( dstArray, ins, sub, evaluator1, evaluator2 )
{
  _.assert( _.longIs( ins ) );
  _.assert( _.longIs( sub ) );
  _.assert( ins.length === sub.length, '{-subArray-} should have the same length {-insArray-} has'  )
  _.assert( 3 <= arguments.length && arguments.length <= 5 );

  let index = -1;
  let result = 0;

  for( let i = 0, len = ins.length; i < len; i++ )
  {
    index = _.arrayLeftIndex( dstArray, ins[ i ], evaluator1, evaluator2 )
    if( index >= 0 )
    {
      let subValue = sub[ i ];
      if( subValue === undefined )
      dstArray.splice( index, 1 );
      else
      dstArray.splice( index, 1, subValue );
      result += 1;
    }
  }

  return result;
}

//

function arrayReplaceAll( dstArray, ins, sub, evaluator1, evaluator2 )
{
  arrayReplacedAll.apply( this, arguments );
  return dstArray;
}

//

function arrayReplacedAll( dstArray, ins, sub, evaluator1, evaluator2 )
{
  _.assert( 3 <= arguments.length && arguments.length <= 5 );

  let index = -1;
  let result = 0;

  index = _.arrayLeftIndex( dstArray, ins, evaluator1, evaluator2 );

  while( index !== -1 )
  {
    dstArray.splice( index,1,sub );
    result += 1;
    index = _.arrayLeftIndex( dstArray, ins, evaluator1, evaluator2 );
  }

  return result;
}

//

/**
 * The arrayUpdate() routine adds a value (sub) to an array (dstArray) or replaces a value (ins) of the array (dstArray) by (sub),
 * and returns the last added index or the last replaced index of the array (dstArray).
 *
 * It creates the variable (index) assigns and calls to it the function(arrayReplaceOnce( dstArray, ins, sub ).
 * [arrayReplaceOnce( dstArray, ins, sub )]{@link wTools.arrayReplaceOnce}.
 * Checks if (index) equal to the -1.
 * If true, it adds to an array (dstArray) a value (sub), and returns the last added index of the array (dstArray).
 * Otherwise, it returns the replaced (index).
 *
 * @see wTools.arrayReplaceOnce
 *
 * @param { Array } dstArray - The source array.
 * @param { * } ins - The value to change.
 * @param { * } sub - The value to add or replace.
 *
 * @example
 * // returns 3
 * let add = _.arrayUpdate( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry', 'Dmitry' );
 * console.log( add ) = > [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ];
 *
 * @example
 * // returns 5
 * let add = _.arrayUpdate( [ 1, 2, 3, 4, 5 ], 6, 6 );
 * console.log( add ) => [ 1, 2, 3, 4, 5, 6 ];
 *
 * @example
 * // returns 4
 * let replace = _.arrayUpdate( [ true, true, true, true, false ], false, true );
 * console.log( replace ) => [ true, true true, true, true ];
 *
 * @returns { number } Returns the last added or the last replaced index.
 * @function arrayUpdate
 * @throws { Error } Will throw an Error if (dstArray) is not an array-like.
 * @throws { Error } Will throw an Error if (arguments.length) is less or more than three.
 * @memberof wTools
 */

function arrayUpdate( dstArray, ins, sub, evaluator1, evaluator2 )
{
  let index = arrayReplacedOnce.apply( this, arguments );

  if( index === -1 )
  {
    dstArray.push( sub );
    index = dstArray.length - 1;
  }

  return index;
}

// --
// fields
// --

let unrollSymbol = Symbol.for( 'unroll' );

let Fields =
{

  ArrayType : Array,

  accuracy : 1e-7,
  accuracySqrt : 1e-4,
  accuracySqr : 1e-14,

}

// --
// routines
// --

let Routines =
{

  // arguments array

  argumentsArrayIs : argumentsArrayIs,
  _argumentsArrayMake : _argumentsArrayMake,
  args : _argumentsArrayMake,
  argumentsArrayOfLength : argumentsArrayOfLength,
  argumentsArrayFrom : argumentsArrayFrom,

  // unroll

  unrollFrom : unrollFrom,
  unrollPrepend : unrollPrepend,
  unrollAppend : unrollAppend,

  // array checker

  arrayIs : arrayIs,
  arrayIsPopulated : arrayIsPopulated,
  arrayLikeResizable : arrayLikeResizable,
  arrayLike : arrayLike,

  longIs : longIs,
  longIsPopulated : longIsPopulated,

  unrollIs : unrollIs,
  unrollIsPopulated : unrollIsPopulated,

  constructorLikeArray : constructorLikeArray,
  hasLength : hasLength,
  arrayHasArray : arrayHasArray,

  arrayCompare : arrayCompare,
  arrayIdentical : arrayIdentical,

  arrayHas : arrayHas, /* dubious */
  arrayHasAny : arrayHasAny, /* dubious */
  arrayHasAll : arrayHasAll, /* dubious */
  arrayHasNone : arrayHasNone, /* dubious */

  arrayAll : arrayAll,
  arrayAny : arrayAny,
  arrayNone : arrayNone,

  // array sequential search

  arrayLeftIndex : arrayLeftIndex,
  arrayRightIndex : arrayRightIndex,

  arrayLeft : arrayLeft,
  arrayRight : arrayRight,

  arrayLeftDefined : arrayLeftDefined,
  arrayRightDefined : arrayRightDefined,

  arrayCount : arrayCount,
  arrayCountUnique : arrayCountUnique,

  // array prepend

  _arrayPrependUnrolling : _arrayPrependUnrolling,
  arrayPrependUnrolling : arrayPrependUnrolling,
  arrayPrepend_ : arrayPrepend_,

  arrayPrependElement : arrayPrependElement,
  arrayPrependOnce : arrayPrependOnce,
  arrayPrependOnceStrictly : arrayPrependOnceStrictly,
  arrayPrependedElement : arrayPrependedElement,
  arrayPrependedOnce : arrayPrependedOnce,

  arrayPrependArray : arrayPrependArray,
  arrayPrependArrayOnce : arrayPrependArrayOnce,
  arrayPrependArrayOnceStrictly : arrayPrependArrayOnceStrictly,
  arrayPrependedArray : arrayPrependedArray,
  arrayPrependedArrayOnce : arrayPrependedArrayOnce,

  arrayPrependArrays : arrayPrependArrays,
  arrayPrependArraysOnce : arrayPrependArraysOnce,
  arrayPrependArraysOnceStrictly : arrayPrependArraysOnceStrictly,
  arrayPrependedArrays : arrayPrependedArrays,
  arrayPrependedArraysOnce : arrayPrependedArraysOnce,

  // array append

  _arrayAppendUnrolling : _arrayAppendUnrolling,
  arrayAppendUnrolling : arrayAppendUnrolling,
  arrayAppend_ : arrayAppend_,

  arrayAppendElement : arrayAppendElement,
  arrayAppendOnce : arrayAppendOnce,
  arrayAppendOnceStrictly : arrayAppendOnceStrictly,
  arrayAppendedElement : arrayAppendedElement,
  arrayAppendedOnce : arrayAppendedOnce,

  arrayAppendArray : arrayAppendArray,
  arrayAppendArrayOnce : arrayAppendArrayOnce,
  arrayAppendArrayOnceStrictly : arrayAppendArrayOnceStrictly,
  arrayAppendedArray : arrayAppendedArray,
  arrayAppendedArrayOnce : arrayAppendedArrayOnce,

  arrayAppendArrays : arrayAppendArrays,
  arrayAppendArraysOnce : arrayAppendArraysOnce,
  arrayAppendArraysOnceStrictly : arrayAppendArraysOnceStrictly,
  arrayAppendedArrays : arrayAppendedArrays,
  arrayAppendedArraysOnce : arrayAppendedArraysOnce,

  // array remove

  arrayRemove : arrayRemove,
  arrayRemoveOnce : arrayRemoveOnce,
  arrayRemoveOnceStrictly : arrayRemoveOnceStrictly,

  arrayRemoved : arrayRemoved,
  arrayRemovedOnce : arrayRemovedOnce,
  arrayRemovedOnceStrictly : arrayRemovedOnceStrictly,

  arrayRemoveElement : arrayRemoveElement, /* should remove all */
  arrayRemoveElementOnce : arrayRemoveElementOnce,
  arrayRemoveElementOnceStrictly : arrayRemoveElementOnceStrictly,

  arrayRemovedElement : arrayRemovedElement,
  arrayRemovedElementOnce : arrayRemovedElementOnce,
  arrayRemovedElementOnceStrictly : arrayRemovedElementOnceStrictly,

  arrayRemoveArray : arrayRemoveArray,
  arrayRemoveArrayOnce : arrayRemoveArrayOnce,
  arrayRemoveArrayOnceStrictly : arrayRemoveArrayOnceStrictly,
  arrayRemovedArray : arrayRemovedArray,
  arrayRemovedArrayOnce : arrayRemovedArrayOnce,
  arrayRemovedArrayOnceStrictly : arrayRemovedArrayOnceStrictly,

  arrayRemoveArrays : arrayRemoveArrays,
  arrayRemoveArraysOnce : arrayRemoveArraysOnce,
  arrayRemoveArraysOnceStrictly : arrayRemoveArraysOnceStrictly,
  arrayRemovedArrays : arrayRemovedArrays,
  arrayRemovedArraysOnce : arrayRemovedArraysOnce,
  arrayRemovedArraysOnceStrictly : arrayRemovedArraysOnceStrictly,

  arrayRemoveAll : arrayRemoveAll,
  arrayRemovedAll : arrayRemovedAll,

  arrayRemoveDuplicates : arrayRemoveDuplicates,
  longRemoveDuplicates : longRemoveDuplicates,

  // array flatten

  arrayFlatten : arrayFlatten,
  arrayFlattenOnce : arrayFlattenOnce,
  arrayFlattenOnceStrictly : arrayFlattenOnceStrictly,
  arrayFlattened : arrayFlattened,
  arrayFlattenedOnce : arrayFlattenedOnce,

  // array replace

  arrayReplaceOnce : arrayReplaceOnce,
  arrayReplaceOnceStrictly : arrayReplaceOnceStrictly,

  arrayReplacedOnce : arrayReplacedOnce,
  arrayReplacedOnceStrictly : arrayReplacedOnceStrictly, /* qqq implement */

  arrayReplaceArrayOnce : arrayReplaceArrayOnce,
  arrayReplaceArrayOnceStrictly : arrayReplaceArrayOnceStrictly,
  arrayReplacedArrayOnce : arrayReplacedArrayOnce,

  arrayReplaceAll : arrayReplaceAll,
  arrayReplacedAll : arrayReplacedAll,

  arrayUpdate : arrayUpdate,

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

// if( typeof module !== 'undefined' )
// if( _global.WTOOLS_PRIVATE )
// delete require.cache[ module.id ];

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
