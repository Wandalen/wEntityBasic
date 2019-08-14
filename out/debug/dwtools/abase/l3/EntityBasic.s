( function _EntityBasic_s_() {

'use strict';

/**
 * Collection of routines for processing heterogenous data.
 * @module Tools/base/EntityFundamentals
 */

/**
 * @file l3/Entity.s.
 */

/**
 * Collection of routines for processing heterogenous data.
 * @namespace Tools( module::EntityFundamentals )
 * @memberof module:Tools/base/EntityFundamentals
 */

if( typeof module !== 'undefined' )
{

  let _ = require( '../../Tools.s' );

}

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

let _ArraySlice = Array.prototype.slice;
let _FunctionBind = Function.prototype.bind;
let _ObjectToString = Object.prototype.toString;
let _ObjectHasOwnProperty = Object.hasOwnProperty;

// --
// entity
// --

function eachInRange( o )
{

  if( _.arrayIs( o ) )
  o = { range : o };

  _.routineOptions( eachInRange, o );
  if( _.numberIs( o.range ) )
  o.range = [ 0, o.range ];

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( o.range.length === 2 );
  _.assert( o.increment >= 0 );

  let increment = o.increment;
  let range = o.range;
  let len = _.rangeNumberElements( range, o.increment );
  let value = range[ 0 ];

  if( o.estimate )
  {
    return { length : len };
  }

  if( o.result === null )
  o.result = new Float32Array( len );

  // if( o.batch === 0 )
  // o.batch = o.range[ 1 ] - o.range[ 0 ];

  /* begin */

  if( o.onBegin )
  o.onBegin.call( o );

  if( len )
  exec();

  /* end */

  if( value > range[ 1 ] )
  if( o.onEnd )
  o.onEnd.call( o, o.result );

  /* return */

  if( o.result )
  return o.result;
  else
  return o.resultIndex;

  /* */

  function exec()
  {

    while( value < range[ 1 ] )
    {

      if( o.onEach )
      o.onEach.call( o, value, o.resultIndex );
      if( o.result )
      o.result[ o.resultIndex ] = value;

      value += increment;
      o.resultIndex += 1;
    }

  }

}

eachInRange.defaults =
{
  result : null,
  resultIndex : 0,
  range : null,
  onBegin : null,
  onEnd : null,
  onEach : null,
  increment : 1,
  delay : 0,
  estimate : 0,
}

//

function eachInManyRanges( o )
{

  let len = 0;

  if( _.arrayIs( o ) )
  o = { range : o };

  _.routineOptions( eachInManyRanges, o );
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.arrayIs( o.range ) );

  /* estimate */

  for( let r = 0 ; r < o.range.length ; r++ )
  {
    let range = o.range[ r ];
    if( _.numberIs( o.range ) )
    range = o.range[ r ] = [ 0, o.range ];
    len += _.rangeNumberElements( range, o.increment );
  }

  if( o.estimate )
  return { length : len };

  /* exec */

  if( o.result === null )
  o.result = new Float32Array( len );

  let ranges = o.range;
  for( let r = 0 ; r < ranges.length ; r++ )
  {
    o.range = ranges[ r ];
    _.eachInRange( o );
  }

  /* return */

  if( o.result )
  return o.result;
  else
  return o.resultIndex;

}

eachInManyRanges.defaults = Object.create( eachInRange.defaults )

//

function eachInMultiRange( o )
{

  if( !o.onEach )
  o.onEach = function( e )
  {
    console.log( e );
  }

  _.routineOptions( eachInMultiRange, o );
  _.assert( _.objectIs( o ) )
  _.assert( _.arrayIs( o.ranges ) || _.objectIs( o.ranges ), 'Expects o.ranges as array or object' )
  _.assert( _.routineIs( o.onEach ), 'Expects o.onEach as routine' )
  _.assert( !o.delta || _.strType( o.delta ) === _.strType( o.ranges ), 'o.delta must be same type as ranges' );

  /* */

  let iterationNumber = 1;
  let l = 0;
  let delta = _.objectIs( o.delta ) ? [] : null;
  let ranges = [];
  let names = null;
  if( _.objectIs( o.ranges ) )
  {
    _.assert( _.objectIs( o.delta ) || !o.delta );

    names = [];
    let i = 0;
    for( let r in o.ranges )
    {
      names[ i ] = r;
      ranges[ i ] = o.ranges[ r ];
      if( o.delta )
      {
        if( !o.delta[ r ] )
        throw _.err( 'no delta for', r );
        delta[ i ] = o.delta[ r ];
      }
      i += 1;
    }

    l = names.length;

  }
  else
  {
    debugger;
    // ranges = o.ranges.slice();
    // ranges = _.cloneJust( o.ranges ); // xxx
    // ranges = _.entityShallowClone();

    _.assert( _.arrayIs( o.ranges ) );
    ranges = [];
    for( let i = 0 ; i < o.ranges.length ; i++ )
    {
      ranges[ i ] = _.arrayIs( o.ranges[ i ] ) ? o.ranges[ i ].slice() : o.ranges[ i ];
    }

    delta = _.longIs( o.delta ) ? o.delta.slice() : null;
    _.assert( !delta || ranges.length === delta.length, 'delta must be same length as ranges'  );
    l = o.ranges.length;
  }

  let last = ranges.length-1;

  /* adjust range */

  function adjustRange( r )
  {

    if( _.numberIs( ranges[ r ] ) )
    ranges[ r ] = [ 0, ranges[ r ] ];

    if( !_.longIs( ranges[ r ] ) )
    throw _.err( 'Expects range as array :', ranges[ r ] );

    _.assert( ranges[ r ].length === 2 );
    _.assert( _.numberIs( ranges[ r ][ 0 ] ) );
    _.assert( _.numberIs( ranges[ r ][ 1 ] ) );

    if( _.numberIsInfinite( ranges[ r ][ 0 ] ) )
    ranges[ r ][ 0 ] = 1;
    if( _.numberIsInfinite( ranges[ r ][ 1 ] ) )
    ranges[ r ][ 1 ] = 1;

    iterationNumber *= ranges[ r ][ 1 ] - ranges[ r ][ 0 ];

  }

  if( _.objectIs( ranges ) )
  for( let r in ranges )
  adjustRange( r );
  else
  for( let r = 0 ; r < ranges.length ; r++ )
  adjustRange( r );

  /* estimate */

  if( o.estimate )
  {

    if( !ranges.length )
    return 0;

    return { length : iterationNumber };

  }

  /* */

  function getValue( arg ){ return arg.slice(); };
  if( names )
  getValue = function( arg )
  {
    let result = Object.create( null );
    for( let i = 0 ; i < names.length ; i++ )
    result[ names[ i ] ] = arg[ i ];
    return result;
  }

  /* */

  let indexFlat = 0;
  let indexNd = [];
  for( let r = 0 ; r < ranges.length ; r++ )
  {
    indexNd[ r ] = ranges[ r ][ 0 ];
    if( ranges[ r ][ 1 ] <= ranges[ r ][ 0 ] )
    return 0;
  }

  /* */

  while( indexNd[ last ] < ranges[ last ][ 1 ] )
  {

    let r = getValue( indexNd );
    if( o.result )
    o.result[ indexFlat ] = r;

    let res = o.onEach.call( o, r, indexFlat );

    if( res === false )
    break;

    indexFlat += 1;

    let c = 0;
    do
    {
      if( c >= ranges.length )
      break;
      if( c > 0 )
      indexNd[ c-1 ] = ranges[ c-1 ][ 0 ];
      if( delta )
      {
        _.assert( _.numberIsFinite( delta[ c ] ) && delta[ c ] > 0, 'delta must contain only positive numbers, incorrect element:', delta[ c ] );
        indexNd[ c ] += delta[ c ];
      }
      else
      indexNd[ c ] += 1;
      c += 1;
    }
    while( indexNd[ c-1 ] >= ranges[ c-1 ][ 1 ] );

  }

  /* */

  if( o.result )
  return o.result
  else
  return indexFlat;
}

eachInMultiRange.defaults =
{
  result : null,
  ranges : null,
  delta : null,
  onEach : null,
  estimate : 0,
}

//

/**
 * Returns value from entity( src ) using position provided by argument( index ).
 * For object routine iterates over all properties and returns value when counter reaches( index ).
 *
 * @param {*} src - Source entity.
 * @param {number} index - Specifies position of needed value.
 * @returns {*} Returns value at specified position.
 *
 * @example
 * //returns 1
 * _.entityValueWithIndex( [ 1, 2, 3 ], 0);
 *
 * @example
 * //returns 123
 * _.entityValueWithIndex( { a : 'str', b : 123 }, 1 )
 *
 * @example
 * //returns undefined
 * _.entityValueWithIndex( { a : 'str', b : 123 }, 2 )
 *
 * @function entityValueWithIndex
 * @memberof module:Tools/base/EntityFundamentals.Tools( module::EntityFundamentals )
*/

function entityValueWithIndex( src, index )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  _.assert( _.numberIs( index ) );

  if( _.arrayLike( src ) )
  {
    return src[ index ];
  }
  else if( _.objectIs( src ) )
  {
    let i = 0;
    for( let s in src )
    {
      if( i === index )
      return src[ s ];
      i++;
    }
  }
  else if( _.strIs( src ) )
  {
    return src[ index ];
  }
  else _.assert( 0, 'unknown kind of argument', _.strType( src ) );

}

//

/**
 * Searchs value( value ) in entity( src ) and returns index/key that represent that value or
 * null if nothing finded.
 *
 * @param {*} src - Source entity.
 * @param {*} value - Specifies value to search.
 * @returns {*} Returns specific index/key or null.
 *
 * @example
 * //returns 2
 * _.entityKeyWithValue( [ 1, 2, 3 ], 3);
 *
 * @example
 * //returns null
 * _.entityKeyWithValue( { a : 'str', b : 123 }, 1 )
 *
 * @example
 * //returns "b"
 * _.entityKeyWithValue( { a : 'str', b : 123 }, 123 )
 *
 * @function entityKeyWithValue
 * @memberof module:Tools/base/EntityFundamentals.Tools( module::EntityFundamentals )
*/

function entityKeyWithValue( src, value )
{
  let result = null;

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( _.arrayLike( src ) )
  {
    result = src.indexOf( value );
  }
  else if( _.objectIs( src ) )
  {
    let i = 0;
    for( let s in src )
    {
      if( src[ s ] == value ) return s;
    }
  }
  else if( _.strIs( src ) )
  {
    result = src.indexOf( value );
  }
  else _.assert( 0, 'unknown kind of argument', _.strType( src ) );

  if( result === -1 )
  result = null;

  return result;
}

//

function entityVals( src )
{
  let result = [];

  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( !_.primitiveIs( src ) );

  if( _.longIs( src ) )
  return src;

  for( let s in src )
  result.push( src[ s ] );

  return result;
}

//

/**
 * Returns atomic entity( src ) casted into type of entity( ins ) to avoid unexpected implicit type casts.
 *
 * @param {object} src - Source object.
 * @param {object} ins - Type of( src ) depends on type of this object.
 * @returns {object} Returns object( src ) with  type of( ins ).
 *
 * @example
 * //returns "string"
 * typeof _.entityCoerceTo( 1, '1' )
 *
 * @example
 * //returns "number"
 * typeof _.entityCoerceTo( "1" , 1 )
 *
 * @example
 * //returns "boolean"
 * typeof _.entityCoerceTo( "1" , true )
 *
 * @function entityCoerceTo
 * @throws {exception} If only one or no arguments provided.
 * @throws {exception} If type of( ins ) is not supported.
 * @memberof module:Tools/base/EntityFundamentals.Tools( module::EntityFundamentals )
 *
 */

function entityCoerceTo( src, ins )
{

  _.assert( arguments.length === 2, 'Expects exactly two arguments' );

  if( _.numberIs( ins ) )
  {

    return _.numberFrom( src );

  }
  else if( _.strIs( ins ) )
  {

    return _.strFrom( src );

  }
  else if( _.boolIs( ins ) )
  {

    return _.boolFrom( src );

  }
  else _.assert( 0, 'unknown type to coerce to : ' + _.strType( ins ) );

}

//

function entityFreeze( src )
{
  let _src = src;

  if( _.bufferTypedIs( src ) )
  {
    src = src.buffer;
    debugger;
  }

  Object.freeze( src );

  return _src;
}

// --
// entity checker
// --

/**
 * Checks if object( src ) has any NaN. Also works with arrays and maps. Works recursively.
 *
 * @param {object} src - Source object.
 * @returns {boolean} Returns result of check for NaN.
 *
 * @example
 * //returns true
 * _.entityHasNan( NaN )
 *
 * @example
 * //returns true
 * let arr = [ NaN, 1, 2 ];
 * _.entityHasNan( arr );
 *
 * @function entityHasNan
 * @throws {exception} If no argument provided.
 * @memberof module:Tools/base/EntityFundamentals.Tools( module::EntityFundamentals )
 *
 */

function entityHasNan( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );

  let result = false;
  if( src === undefined )
  {
    return true;
  }
  else if( _.numberIs( src ) )
  {
    return isNaN( src );
  }
  else if( _.arrayLike( src ) )
  {
    for( let s = 0 ; s < src.length ; s++ )
    if( entityHasNan( src[ s ] ) )
    {
      return true;
    }
  }
  else if( _.objectLike( src ) )
  {
    for( let s in src )
    if( entityHasNan( src[ s ] ) )
    {
      return true;
    }
  }

  return result;
}

//

/**
 * Checks if object( src ) or array has any undefined property. Works recursively.
 *
 * @param {object} src - Source object.
 * @returns {boolean} Returns result of check for undefined.
 *
 * @example
 * //returns true
 * _.entityHasUndef( undefined )
 *
 * @example
 * //returns true
 * let arr = [ undefined, 1, 2 ];
 * _.entityHasUndef( arr );
 *
 * @function entityHasUndef
 * @throws {exception} If no argument provided.
 * @memberof module:Tools/base/EntityFundamentals.Tools( module::EntityFundamentals )
 *
 */

function entityHasUndef( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );

  let result = false;
  if( src === undefined )
  {
    return true;
  }
  else if( _.arrayLike( src ) )
  {
    for( let s = 0 ; s < src.length ; s++ )
    if( entityHasUndef( src[ s ] ) )
    {
      return true;
    }
  }
  else if( _.objectLike( src ) )
  {
    for( let s in src )
    if( entityHasUndef( src[ s ] ) )
    {
      return true;
    }
  }
  return result;

}

// --
// fields
// --

let Fields =
{
}

// --
// routines
// --

let Routines =
{

  eachInRange,
  eachInManyRanges,
  eachInMultiRange, /* experimental */

  entityValueWithIndex, /* dubious */
  entityKeyWithValue, /* dubious */
  entityVals,

  entityCoerceTo,
  entityFreeze,

  // entity chacker

  entityHasNan,
  entityHasUndef,

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
