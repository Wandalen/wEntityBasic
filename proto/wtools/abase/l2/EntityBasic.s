( function _EntityBasic_s_() {

'use strict';

/**
 * Collection of routines for processing heterogenous data.
 * @module Tools/base/EntityFundamentals
 */

/**
 * Collection of routines for processing heterogenous data.
 * @namespace Tools.EntityFundamentals
 * @memberof module:Tools/base/EntityFundamentals
 */

if( typeof module !== 'undefined' )
{

  let _ = require( '../../../wtools/Tools.s' );

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
  let len = _.rangeCountElements( range, o.increment );
  let value = range[ 0 ];

  if( o.estimate )
  {
    return { length : len };
  }

  if( o.result === null )
  o.result = new F32x( len );

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
    len += _.rangeCountElements( range, o.increment );
  }

  if( o.estimate )
  return { length : len };

  /* exec */

  if( o.result === null )
  o.result = new F32x( len );

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

// //
//
// /* qqq2 : split body and pre */
// /* qqq2 : improve formatting, put all subroutines to the end of the routine */
// /* qqq2 : implement special code for 2, 3 dimensional cases */
//
// /* qqq2 : split
// - _eachInMultiRange
// - whileInMultiRange
// - eachInMultiRange
// */
//
// function eachInMultiRange( o )
// {
//
//   if( !o.onEach )
//   o.onEach = function( e )
//   {
//     console.log( e );
//   }
//
//   _.routineOptions( eachInMultiRange, o );
//   _.assert( _.objectIs( o ) )
//   _.assert( _.arrayIs( o.ranges ) || _.objectIs( o.ranges ), 'Expects o.ranges as array or object' )
//   _.assert( _.routineIs( o.onEach ), 'Expects o.onEach as routine' )
//   _.assert( !o.delta || _.strType( o.delta ) === _.strType( o.ranges ), 'o.delta must be same type as ranges' );
//
//   /* */
//
//   let iterationNumber = 1;
//   let l = 0;
//   let delta = _.objectIs( o.delta ) ? [] : null;
//   let ranges = [];
//   let names = null;
//   if( _.objectIs( o.ranges ) )
//   {
//     _.assert( _.objectIs( o.delta ) || !o.delta );
//
//     names = [];
//     let i = 0;
//     for( let r in o.ranges )
//     {
//       names[ i ] = r;
//       ranges[ i ] = o.ranges[ r ];
//       if( o.delta )
//       {
//         if( !o.delta[ r ] )
//         throw _.err( 'no delta for', r );
//         delta[ i ] = o.delta[ r ];
//       }
//       i += 1;
//     }
//
//     l = names.length;
//
//   }
//   else
//   {
//     // debugger;
//     // ranges = o.ranges.slice();
//     // ranges = _.cloneJust( o.ranges ); // xxx
//     // ranges = _.entityMake();
//
//     _.assert( _.arrayIs( o.ranges ) );
//     ranges = [];
//     for( let i = 0 ; i < o.ranges.length ; i++ )
//     {
//       ranges[ i ] = _.arrayIs( o.ranges[ i ] ) ? o.ranges[ i ].slice() : o.ranges[ i ];
//     }
//
//     delta = _.longIs( o.delta ) ? o.delta.slice() : null;
//     _.assert( !delta || ranges.length === delta.length, 'delta must be same length as ranges' );
//     l = o.ranges.length;
//   }
//
//   let last = ranges.length-1;
//
//   /* adjust range */
//
//   function adjustRange( r )
//   {
//
//     if( _.numberIs( ranges[ r ] ) )
//     ranges[ r ] = [ 0, ranges[ r ] ];
//
//     if( !_.longIs( ranges[ r ] ) )
//     throw _.err( 'Expects range as array :', ranges[ r ] );
//
//     _.assert( ranges[ r ].length === 2 );
//     _.assert( _.numberIs( ranges[ r ][ 0 ] ) );
//     _.assert( _.numberIs( ranges[ r ][ 1 ] ) );
//
//     if( _.numberIsInfinite( ranges[ r ][ 0 ] ) )
//     ranges[ r ][ 0 ] = 1;
//     if( _.numberIsInfinite( ranges[ r ][ 1 ] ) )
//     ranges[ r ][ 1 ] = 1;
//
//     iterationNumber *= ranges[ r ][ 1 ] - ranges[ r ][ 0 ];
//
//   }
//
//   if( _.objectIs( ranges ) )
//   for( let r in ranges )
//   adjustRange( r );
//   else
//   for( let r = 0 ; r < ranges.length ; r++ )
//   adjustRange( r );
//
//   /* estimate */
//
//   if( o.estimate )
//   {
//
//     if( !ranges.length )
//     return 0;
//
//     return { length : iterationNumber };
//
//   }
//
//   /* */
//
//   function getValue( arg ){ return arg.slice(); };
//   if( names )
//   getValue = function( arg )
//   {
//     let result = Object.create( null );
//     for( let i = 0 ; i < names.length ; i++ )
//     result[ names[ i ] ] = arg[ i ];
//     return result;
//   }
//
//   /* */
//
//   let indexFlat = 0;
//   let indexNd = [];
//   for( let r = 0 ; r < ranges.length ; r++ )
//   {
//     indexNd[ r ] = ranges[ r ][ 0 ];
//     if( ranges[ r ][ 1 ] <= ranges[ r ][ 0 ] )
//     return 0;
//   }
//
//   /* */
//
//   while( indexNd[ last ] < ranges[ last ][ 1 ] )
//   {
//
//     let r = getValue( indexNd );
//     if( o.result )
//     o.result[ indexFlat ] = r;
//
//     let res = o.onEach.call( o, r, indexFlat );
//
//     if( res === false )
//     break;
//
//     indexFlat += 1;
//
//     let c = 0;
//     do
//     {
//       if( c >= ranges.length )
//       break;
//       if( c > 0 )
//       indexNd[ c-1 ] = ranges[ c-1 ][ 0 ];
//       if( delta )
//       {
//         _.assert( _.numberIsFinite( delta[ c ] ) && delta[ c ] > 0, 'delta must contain only positive numbers, incorrect element:', delta[ c ] );
//         indexNd[ c ] += delta[ c ];
//       }
//       else
//       indexNd[ c ] += 1;
//       c += 1;
//     }
//     while( indexNd[ c-1 ] >= ranges[ c-1 ][ 1 ] );
//
//   }
//
//   /* */
//
//   if( o.result )
//   return o.result
//   else
//   return indexFlat;
// }
//
// eachInMultiRange.defaults =
// {
//   result : null,
//   ranges : null,
//   delta : null,
//   onEach : null,
//   estimate : 0,
// }
//
// //
//
// /* Dmytro : pre that keep all features of previous routine */
//
// function eachInMultiRange_pre( routine, arg )
// {
//
//   let o = arg[ 0 ];
//
//   if( !o.onEach )
//   o.onEach = function( e )
//   {
//     console.log( e );
//   }
//
//   _.routineOptions( routine, o );
//   _.assert( _.objectIs( o ) )
//   _.assert( _.arrayIs( o.ranges ) || _.objectIs( o.ranges ), 'Expects o.ranges as array or object' )
//   _.assert( _.routineIs( o.onEach ), 'Expects o.onEach as routine' )
//   _.assert( !o.delta || _.strType( o.delta ) === _.strType( o.ranges ), 'o.delta must be same type as ranges' );
//
//   o.iterationNumber = 1;
//   let delta = _.objectIs( o.delta ) ? [] : null;
//   let ranges = [];
//   o.names = null;
//
//   /* */
//
//   if( _.objectIs( o.ranges ) )
//   {
//     _.assert( _.objectIs( o.delta ) || !o.delta );
//
//     o.names = [];
//     let i = 0;
//     for( let r in o.ranges )
//     {
//       o.names[ i ] = r;
//       ranges[ i ] = o.ranges[ r ];
//       if( o.delta )
//       {
//         if( !o.delta[ r ] )
//         throw _.err( 'no delta for', r );
//         delta[ i ] = o.delta[ r ];
//       }
//       i += 1;
//     }
//
//   }
//   else
//   {
//
//     _.assert( _.longIs( o.ranges ) );
//     ranges = [];
//     for( let i = 0 ; i < o.ranges.length ; i++ )
//     {
//       ranges[ i ] = _.longIs( o.ranges[ i ] ) ? o.ranges[ i ].slice() : o.ranges[ i ];
//     }
//
//     delta = _.longIs( o.delta ) ? o.delta.slice() : null;
//     _.assert( !delta || ranges.length === delta.length, 'delta must be same length as ranges' );
//   }
//
//   if( _.objectIs( ranges ) )
//   for( let r in ranges )
//   adjustRange( r );
//   else
//   for( let r = 0 ; r < ranges.length ; r++ )
//   adjustRange( r );
//
//   o.ranges = ranges
//   o.delta = delta;
//   return o;
//
//   /* adjust range */
//
//   function adjustRange( r )
//   {
//
//     if( _.numberIs( ranges[ r ] ) )
//     ranges[ r ] = [ 0, ranges[ r ] ];
//
//     if( !_.longIs( ranges[ r ] ) )
//     throw _.err( 'Expects range as array :', ranges[ r ] );
//
//     _.assert( ranges[ r ].length === 2 );
//     _.assert( _.numberIs( ranges[ r ][ 0 ] ) );
//     _.assert( _.numberIs( ranges[ r ][ 1 ] ) );
//
//     if( _.numberIsInfinite( ranges[ r ][ 0 ] ) )
//     ranges[ r ][ 0 ] = 1;
//     if( _.numberIsInfinite( ranges[ r ][ 1 ] ) )
//     ranges[ r ][ 1 ] = 1;
//
//     o.iterationNumber *= ranges[ r ][ 1 ] - ranges[ r ][ 0 ];
//
//   }
//
// }
//
// //
//
// /* Dmytro : body that keep all features of previous routine, not used */
//
// function eachInMultiRange_body( o )
// {
//
//   if( o.estimate )
//   {
//     if( !o.ranges.length )
//     return 0;
//     return { length : o.iterationNumber };
//   }
//
//   let last = o.ranges.length-1;
//   let indexFlat = 0;
//   let indexNd = [];
//   for( let r = 0 ; r < o.ranges.length ; r++ )
//   {
//     indexNd[ r ] = o.ranges[ r ][ 0 ];
//     if( o.ranges[ r ][ 1 ] <= o.ranges[ r ][ 0 ] )
//     return 0;
//   }
//
//   while( indexNd[ last ] < o.ranges[ last ][ 1 ] )
//   {
//
//     let r = getValue( indexNd );
//     if( o.result )
//     o.result[ indexFlat ] = r;
//
//     let res = o.onEach.call( o, r, indexFlat );
//
//     if( o.breaking && res === false )
//     break;
//
//     indexFlat += 1;
//
//     let c = 0;
//     do
//     {
//       if( c >= o.ranges.length )
//       break;
//       if( c > 0 )
//       indexNd[ c-1 ] = o.ranges[ c-1 ][ 0 ];
//
//       if( o.delta )
//       {
//         _.assert
//         (
//           _.numberIsFinite( o.delta[ c ] ) && o.delta[ c ] > 0,
//           `delta must contain only positive numbers, incorrect element : ${ o.delta[ c ] }`
//         );
//         indexNd[ c ] += o.delta[ c ];
//       }
//       else
//       {
//         indexNd[ c ] += 1;
//       }
//
//       c += 1;
//     }
//     while( indexNd[ c-1 ] >= o.ranges[ c-1 ][ 1 ] );
//
//   }
//
//   /* */
//
//   if( o.result )
//   return o.result
//   else
//   return indexFlat;
//
//   /* */
//
//   function getValue( arg )
//   {
//     if( o.names )
//     {
//       let result = Object.create( null );
//       for( let i = 0 ; i < o.names.length ; i++ )
//       result[ o.names[ i ] ] = arg[ i ];
//       return result;
//     }
//     else
//     {
//       return arg.slice();
//     }
//   }
//
// }
//
// eachInMultiRange_body.defaults =
// {
//   result : null,
//   ranges : null,
//   delta : null, /* Dmytro : maybe it not needs */
//   onEach : null,
//   estimate : 0, /* Dmytro : maybe it not needs */
//   breaking : 0,
// }

//

/* Dmytro : pre without options `delta` and `estimate`, used in routines */

function eachInMultiRange_pre_( routine, arg )
{

  let o = arg[ 0 ];

  if( !o.onEach )
  o.onEach = function( e )
  {
    console.log( e );
  }

  _.routineOptions( routine, o );
  _.assert( arg.length === 1, 'Expects single argument' );
  _.assert( _.objectIs( o ) );
  _.assert( _.arrayIs( o.ranges ) || _.objectIs( o.ranges ), 'Expects o.ranges as array or object' )
  _.assert( _.routineIs( o.onEach ), 'Expects o.onEach as routine' )
  _.assert( !o.delta || _.strType( o.delta ) === _.strType( o.ranges ), 'o.delta must be same type as ranges' );

  let delta = _.objectIs( o.delta ) ? [] : null;
  let ranges = [];
  o.names = null;

  /* */

  if( _.objectIs( o.ranges ) )
  {
    _.assert( _.objectIs( o.delta ) || !o.delta );

    o.names = [];
    let i = 0;
    for( let r in o.ranges )
    {
      o.names[ i ] = r;
      ranges[ i ] = o.ranges[ r ];
      if( o.delta )
      {
        if( !o.delta[ r ] )
        throw _.err( 'no delta for', r );
        delta[ i ] = o.delta[ r ];
      }
      i += 1;
    }

  }
  else
  {

    _.assert( _.longIs( o.ranges ) );
    for( let i = 0 ; i < o.ranges.length ; i++ )
    ranges[ i ] = _.longIs( o.ranges[ i ] ) ? o.ranges[ i ].slice() : o.ranges[ i ];

    if( _.longIs( o.delta ) )
    {
      _.assert( o.delta.length === o.ranges.length );
      for( let c = 0 ; c < o.delta.length ; c++ )
      _.assert( _.numberIsFinite( o.delta[ c ] ) && o.delta[ c ] > 0 );

      delta = o.delta.slice();
    }

  }

  if( _.objectIs( ranges ) )
  for( let r in ranges )
  adjustRange( r );
  else
  for( let r = 0 ; r < ranges.length ; r++ )
  adjustRange( r );

  o.ranges = ranges
  o.delta = delta;
  return o;

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

  }

}

//

function eachInMultiRange_body_( o )
{

  let result = true;
  let indexFlat = 0;
  let indexNd = [];

  let oResult = o.result ? 1 : 0;
  let oBreaking = o.breaking ? 2 : 0;
  const iterate =
  [
    iterate1R0B0, iterate1R1B0, iterate1R0B1, iterate1R1B1,
    iterate2R0B0, iterate2R1B0, iterate2R0B1, iterate2R1B1,
    iterate3R0B0, iterate3R1B0, iterate3R0B1, iterate3R1B1,
    iterateNR0B0, iterateNR1B0, iterateNR0B1, iterateNR1B1,
  ];

  if( o.names )
  {
    if( !checkRanges() )
    return 0;
    iterateMap();
  }
  else if( o.delta )
  {
    if( !checkRanges() )
    return 0;
    iterateWithDelta();
  }
  else if( o.ranges.length <= 3 )
  {
    let result = iterate[ ( o.ranges.length - 1 ) * 4 + oResult + oBreaking ]();
    if( result === false )
    return 0;
  }
  else
  {
    if( !checkRanges() )
    return 0;
    iterate[ iterate.length - 4 + oResult + oBreaking ]();
  }

  if( o.result )
  return o.result
  else
  return indexFlat;

  /* */

  function iterateMap()
  {
    while( indexNd[ indexNd.length - 1 ] < o.ranges[ indexNd.length - 1 ][ 1 ] )
    {
      let r = getValue( indexNd );
      if( o.result )
      o.result[ indexFlat ] = r;

      let res = o.onEach.call( o, r, indexFlat );

      if( o.breaking && res === false )
      break;

      indexFlat +=1;

      let d = 0;
      do
      {
        if( d >= o.ranges.length )
        break;
        if( d > 0 )
        indexNd[ d - 1 ] = o.ranges[ d - 1 ][ 0 ];

        indexNd[ d ] += o.delta ? o.delta[ d ] : 1;
        d += 1;
      }
      while( indexNd[ d - 1 ] >= o.ranges[ d - 1 ][ 1 ] );
    }
  }

  /* */

  function iterateWithDelta()
  {
    while( indexNd[ indexNd.length - 1 ] < o.ranges[ indexNd.length - 1 ][ 1 ] )
    {
      if( o.result )
      o.result[ indexFlat ] = indexNd.slice();

      let res = o.onEach.call( o, indexNd, indexFlat );

      if( o.breaking && res === false )
      break;

      indexFlat +=1;

      let d = 0;
      do
      {
        if( d >= o.ranges.length )
        break;
        if( d > 0 )
        indexNd[ d - 1 ] = o.ranges[ d - 1 ][ 0 ];

        indexNd[ d ] += o.delta ? o.delta[ d ] : 1;
        d += 1;
      }
      while( indexNd[ d - 1 ] >= o.ranges[ d - 1 ][ 1 ] );
    }
  }

  /* */

  function iterate1R0B0()
  {
    if( ( o.ranges[ 0 ][ 1 ] <= o.ranges[ 0 ][ 0 ] ) || o.ranges[ 0 ][ 0 ] < 0 )
    return false;

    for( let r = o.ranges[ 0 ][ 0 ] ; r < o.ranges[ 0 ][ 1 ] ; r++ )
    {
      indexNd[ 0 ] = r;
      o.onEach.call( o, indexNd, indexFlat );
      indexFlat += 1;
    }
  }

  function iterate1R1B0()
  {
    if( ( o.ranges[ 0 ][ 1 ] <= o.ranges[ 0 ][ 0 ] ) || o.ranges[ 0 ][ 0 ] < 0 )
    return false;

    for( let r = o.ranges[ 0 ][ 0 ] ; r < o.ranges[ 0 ][ 1 ] ; r++ )
    {
      indexNd[ 0 ] = r;

      o.result[ indexFlat ] = indexNd.slice();
      o.onEach.call( o, indexNd, indexFlat );
      indexFlat += 1;
    }
  }

  function iterate1R0B1()
  {
    if( ( o.ranges[ 0 ][ 1 ] <= o.ranges[ 0 ][ 0 ] ) || o.ranges[ 0 ][ 0 ] < 0 )
    return false;

    for( let r = o.ranges[ 0 ][ 0 ] ; r < o.ranges[ 0 ][ 1 ] && result !== false ; r++ )
    {
      indexNd[ 0 ] = r;

      result = o.onEach.call( o, indexNd, indexFlat );
      indexFlat += 1;
    }
  }

  function iterate1R1B1()
  {
    if( ( o.ranges[ 0 ][ 1 ] <= o.ranges[ 0 ][ 0 ] ) || o.ranges[ 0 ][ 0 ] < 0 )
    return false;

    for( let r = o.ranges[ 0 ][ 0 ] ; r < o.ranges[ 0 ][ 1 ] && result !== false ; r++ )
    {
      indexNd[ 0 ] = r;

      o.result[ indexFlat ] = indexNd.slice();
      result = o.onEach.call( o, indexNd, indexFlat );
      indexFlat += 1;
    }
  }

  /* */

  function iterate2R0B0()
  {
    if
    (
      ( o.ranges[ 0 ][ 1 ] <= o.ranges[ 0 ][ 0 ] ) || o.ranges[ 0 ][ 0 ] < 0 ||
      ( o.ranges[ 1 ][ 1 ] <= o.ranges[ 1 ][ 0 ] ) || o.ranges[ 1 ][ 0 ] < 0
    )
    return false;

    for( let c = o.ranges[ 1 ][ 0 ] ; c < o.ranges[ 1 ][ 1 ] ; c++ )
    {
      indexNd[ 1 ] = c;
      for( let r = o.ranges[ 0 ][ 0 ] ; r < o.ranges[ 0 ][ 1 ] ; r++ )
      {
        indexNd[ 0 ] = r;
        o.onEach.call( o, indexNd, indexFlat );
        indexFlat += 1;
      }
    }
  }

  function iterate2R1B0()
  {
    if
    (
      ( o.ranges[ 0 ][ 1 ] <= o.ranges[ 0 ][ 0 ] ) || o.ranges[ 0 ][ 0 ] < 0 ||
      ( o.ranges[ 1 ][ 1 ] <= o.ranges[ 1 ][ 0 ] ) || o.ranges[ 1 ][ 0 ] < 0
    )
    return false;

    for( let c = o.ranges[ 1 ][ 0 ] ; c < o.ranges[ 1 ][ 1 ] ; c++ )
    {
      indexNd[ 1 ] = c;
      for( let r = o.ranges[ 0 ][ 0 ] ; r < o.ranges[ 0 ][ 1 ] ; r++ )
      {
        indexNd[ 0 ] = r;
        o.result[ indexFlat ] = indexNd.slice();
        o.onEach.call( o, indexNd, indexFlat );
        indexFlat += 1;
      }
    }
  }

  function iterate2R0B1()
  {
    if
    (
      ( o.ranges[ 0 ][ 1 ] <= o.ranges[ 0 ][ 0 ] ) || o.ranges[ 0 ][ 0 ] < 0 ||
      ( o.ranges[ 1 ][ 1 ] <= o.ranges[ 1 ][ 0 ] ) || o.ranges[ 1 ][ 0 ] < 0
    )
    return false;

    for( let c = o.ranges[ 1 ][ 0 ] ; c < o.ranges[ 1 ][ 1 ] && result !== false ; c++ )
    {
      indexNd[ 1 ] = c;
      for( let r = o.ranges[ 0 ][ 0 ] ; r < o.ranges[ 0 ][ 1 ] && result !== false ; r++ )
      {
        indexNd[ 0 ] = r;

        result = o.onEach.call( o, indexNd, indexFlat );
        indexFlat += 1;
      }
    }
  }

  function iterate2R1B1()
  {
    if
    (
      ( o.ranges[ 0 ][ 1 ] <= o.ranges[ 0 ][ 0 ] ) || o.ranges[ 0 ][ 0 ] < 0 ||
      ( o.ranges[ 1 ][ 1 ] <= o.ranges[ 1 ][ 0 ] ) || o.ranges[ 1 ][ 0 ] < 0
    )
    return false;

    for( let c = o.ranges[ 1 ][ 0 ] ; c < o.ranges[ 1 ][ 1 ] && result !== false ; c++ )
    {
      indexNd[ 1 ] = c;
      for( let r = o.ranges[ 0 ][ 0 ] ; r < o.ranges[ 0 ][ 1 ] && result !== false ; r++ )
      {
        indexNd[ 0 ] = r;

        o.result[ indexFlat ] = indexNd.slice();
        result = o.onEach.call( o, indexNd, indexFlat );
        indexFlat += 1;
      }
    }
  }

  /* */

  function iterate3R0B0()
  {
    if
    (
      ( o.ranges[ 0 ][ 1 ] <= o.ranges[ 0 ][ 0 ] ) || o.ranges[ 0 ][ 0 ] < 0 ||
      ( o.ranges[ 1 ][ 1 ] <= o.ranges[ 1 ][ 0 ] ) || o.ranges[ 1 ][ 0 ] < 0 ||
      ( o.ranges[ 2 ][ 1 ] <= o.ranges[ 2 ][ 0 ] ) || o.ranges[ 2 ][ 0 ] < 0
    )
    return false;

    for( let d = o.ranges[ 2 ][ 0 ] ; d < o.ranges[ 2 ][ 1 ] ; d++ )
    {
      indexNd[ 2 ] = d;
      for( let c = o.ranges[ 1 ][ 0 ] ; c < o.ranges[ 1 ][ 1 ] ; c++ )
      {
        indexNd[ 1 ] = c;
        for( let r = o.ranges[ 0 ][ 0 ] ; r < o.ranges[ 0 ][ 1 ] ; r++ )
        {
          indexNd[ 0 ] = r;

          o.onEach.call( o, indexNd, indexFlat );
          indexFlat += 1;
        }
      }
    }
  }

  function iterate3R1B0()
  {
    if
    (
      ( o.ranges[ 0 ][ 1 ] <= o.ranges[ 0 ][ 0 ] ) || o.ranges[ 0 ][ 0 ] < 0 ||
      ( o.ranges[ 1 ][ 1 ] <= o.ranges[ 1 ][ 0 ] ) || o.ranges[ 1 ][ 0 ] < 0 ||
      ( o.ranges[ 2 ][ 1 ] <= o.ranges[ 2 ][ 0 ] ) || o.ranges[ 2 ][ 0 ] < 0
    )
    return false;

    for( let d = o.ranges[ 2 ][ 0 ] ; d < o.ranges[ 2 ][ 1 ] ; d++ )
    {
      indexNd[ 2 ] = d;
      for( let c = o.ranges[ 1 ][ 0 ] ; c < o.ranges[ 1 ][ 1 ] ; c++ )
      {
        indexNd[ 1 ] = c;
        for( let r = o.ranges[ 0 ][ 0 ] ; r < o.ranges[ 0 ][ 1 ] ; r++ )
        {
          indexNd[ 0 ] = r;

          o.result[ indexFlat ] = indexNd.slice();
          o.onEach.call( o, indexNd, indexFlat );
          indexFlat += 1;
        }
      }
    }
  }

  function iterate3R0B1()
  {
    if
    (
      ( o.ranges[ 0 ][ 1 ] <= o.ranges[ 0 ][ 0 ] ) || o.ranges[ 0 ][ 0 ] < 0 ||
      ( o.ranges[ 1 ][ 1 ] <= o.ranges[ 1 ][ 0 ] ) || o.ranges[ 1 ][ 0 ] < 0 ||
      ( o.ranges[ 2 ][ 1 ] <= o.ranges[ 2 ][ 0 ] ) || o.ranges[ 2 ][ 0 ] < 0
    )
    return false;

    for( let d = o.ranges[ 2 ][ 0 ] ; d < o.ranges[ 2 ][ 1 ] && result !== false ; d++ )
    {
      indexNd[ 2 ] = d;
      for( let c = o.ranges[ 1 ][ 0 ] ; c < o.ranges[ 1 ][ 1 ] && result !== false ; c++ )
      {
        indexNd[ 1 ] = c;
        for( let r = o.ranges[ 0 ][ 0 ] ; r < o.ranges[ 0 ][ 1 ] && result !== false ; r++ )
        {
          indexNd[ 0 ] = r;

          result = o.onEach.call( o, indexNd, indexFlat );
          indexFlat += 1;
        }
      }
    }
  }

  function iterate3R1B1()
  {
    if
    (
      ( o.ranges[ 0 ][ 1 ] <= o.ranges[ 0 ][ 0 ] ) || o.ranges[ 0 ][ 0 ] < 0 ||
      ( o.ranges[ 1 ][ 1 ] <= o.ranges[ 1 ][ 0 ] ) || o.ranges[ 1 ][ 0 ] < 0 ||
      ( o.ranges[ 2 ][ 1 ] <= o.ranges[ 2 ][ 0 ] ) || o.ranges[ 2 ][ 0 ] < 0
    )
    return false;

    for( let d = o.ranges[ 2 ][ 0 ] ; d < o.ranges[ 2 ][ 1 ] && result !== false ; d++ )
    {
      indexNd[ 2 ] = d;
      for( let c = o.ranges[ 1 ][ 0 ] ; c < o.ranges[ 1 ][ 1 ] && result !== false ; c++ )
      {
        indexNd[ 1 ] = c;
        for( let r = o.ranges[ 0 ][ 0 ] ; r < o.ranges[ 0 ][ 1 ] && result !== false ; r++ )
        {
          indexNd[ 0 ] = r;

          o.result[ indexFlat ] = indexNd.slice();
          result = o.onEach.call( o, indexNd, indexFlat );
          indexFlat += 1;
        }
      }
    }
  }

  /* */

  function iterateNR0B0()
  {
    do
    {
      o.onEach.call( o, indexNd, indexFlat );
    }
    while( inc() )
  }

  function iterateNR1B0()
  {
    do
    {
      o.result[ indexFlat ] = indexNd.slice();
      o.onEach.call( o, indexNd, indexFlat );
    }
    while( inc() )
  }

  function iterateNR0B1()
  {
    do
    {
      let res = o.onEach.call( o, indexNd, indexFlat );
      if( res === false )
      break;
    }
    while( inc() )
  }

  function iterateNR1B1()
  {
    do
    {
      o.result[ indexFlat ] = indexNd.slice();
      let res = o.onEach.call( o, indexNd, indexFlat );
      if( res === false )
      break;
    }
    while( inc() )
  }

  /* */

  function getValue( arg )
  {
    let r = Object.create( null );
    for( let i = 0 ; i < o.names.length ; i++ )
    r[ o.names[ i ] ] = arg[ i ];
    return r;
  }

  /* */

  function inc()
  {
    let d = 0;

    while( d < o.ranges.length )
    {
      indexNd[ d ] += o.delta ? o.delta[ d ] : 1;
      if( indexNd[ d ] < o.ranges[ d ][ 1 ] )
      {
        indexFlat += 1;
        return true;
      }
      indexNd[ d ] = o.ranges[ d ][ 0 ];
      d += 1;
    }

    indexFlat += 1;

    return false;
  }

  /* */

  function checkRanges()
  {
    for( let r = 0 ; r < o.ranges.length ; r++ )
    {
      indexNd[ r ] = o.ranges[ r ][ 0 ];
      if( ( o.ranges[ r ][ 1 ] <= o.ranges[ r ][ 0 ] ) || o.ranges[ r ][ 0 ] < 0 )
      return false;
    }
    return true;
  }

}

eachInMultiRange_body_.defaults =
{
  result : null,
  ranges : null,
  onEach : null,
  delta : null,
  breaking : 0,
}

//

let whileInMultiRange_ = _.routineFromPreAndBody( eachInMultiRange_pre_, eachInMultiRange_body_ );
whileInMultiRange_.defaults.breaking = 1;

//

let eachInMultiRange_ = _.routineFromPreAndBody( eachInMultiRange_pre_, eachInMultiRange_body_ );
eachInMultiRange_.defaults.breaking = 0;

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
 * @namespace Tools
 * @module Tools/base/EntityFundamentals
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
 * @namespace Tools
 * @module Tools/base/EntityFundamentals
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
      if( src[ s ] === value ) return s;
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
 * @namespace Tools
 * @module Tools/base/EntityFundamentals
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
 * @namespace Tools
 * @module Tools/base/EntityFundamentals
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
 * @namespace Tools
 * @module Tools/base/EntityFundamentals
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
  // eachInMultiRange, /* qqq : light coverage required */

  whileInMultiRange_, /* xxx : rename, later */
  eachInMultiRange_,

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

if( typeof module !== 'undefined' )
module[ 'exports' ] = Self;

} )( );