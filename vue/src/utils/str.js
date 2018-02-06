// utils/str.js

/**
  checkLookup checks a string in a dictionary and returns matched or ''.

  @param {String} s - a string of word/name
  @param {Array} dictionary - a lookup dictionary

  @return {String} - matched string in dictionary or empty ('')

  @example <caption>Case-insensitive lookup</caption>
  // return 'Approved'
  checkLookup('approved', ['New', 'Approved', 'Rejected'])

  @example <caption>Prefix lookup</caption>
  // return 'Rejected'
  checkLookup('reject', ['New', 'Approved', 'Rejected'])
**/
export const checkLookup = (s, dictionary) => {
  if (typeof s !== 'string') return ''
  let ss = s.toLowerCase().trim()
  if (ss) {
    for (let item of dictionary) {
      let v = typeof item === 'string' ? item.toLowerCase() : ''
      if (v && v.indexOf(ss) === 0) {
        return item
      }
    }
  }
  return ''
}

/**
  clock return current time in format of 'HH:MM:SS'

  @desc Alternatively using RegExp should produce the same result
    ```
    new Date().toTimeString().replace(/.*(\d{2}:\d{2}:\d{2}.*)/, "$1")
    ```
**/
export const clock = () => {
  let now = new Date()
  let hrs = now.getHours()
  let min = now.getMinutes()
  let sec = now.getSeconds()
  let _hh = hrs < 10 ? '0' + hrs : hrs
  let _mm = min < 10 ? '0' + min : min
  let _ss = sec < 10 ? '0' + sec : sec

  return `${_hh}:${_mm}:${_ss}`
}

/**
  parseDate returns ISO or locale date in format of 'yyyy-mm-dd HH:MM:SS',
  or '' if input is not a valid date.

  @param {String} s - string of date
  @param {Boolean} toLocale - using locale date

  @return {String} - ISO or locale date in format of 'yyyy-mm-dd HH:MM:SS'
**/
export const parseDateTime = (s, toLocale = false) => {
  let date = new Date(s)
  if (date.toString() !== 'Invalid Date') {
    if (toLocale) {
      let yyyy = date.getFullYear().toString().padStart(4, '0')
      let mm = (date.getMonth() + 1).toString().padStart(2, '0')
      let dd = date.getDate().toString().padStart(2, '0')
      let HH = date.getHours().toString().padStart(2, '0')
      let MM = date.getMinutes().toString().padStart(2, '0')
      let SS = date.getSeconds().toString().padStart(2, '0')
      return `${yyyy}-${mm}-${dd} ${HH}:${MM}:${SS}`
    }
    let sUTC = date.toISOString().replace('T', ' ')
    return sUTC.slice(0, 19)
  }
  return ''
}

/**
  parseDate returns ISO or locale date in format of 'yyyy-mm-dd',
  or '' if input is not a valid date.

  @param {String} s - string of date
  @param {Boolean} toLocale - using locale date

  @return {String} - ISO or locale date in format of 'yyyy-mm-dd'

  @example <caption>Parsing mm/dd/yy</caption>
  // return '2017-01-16' (tz >= GMT) or '2017-01-15' (tz < GMT)
  parseDate('1/16/17')

  @example <caption>Parsing yyyy.mm.dd</caption>
  // return '2017-01-16' (tz >= GMT) or '2017-01-15' (tz < GMT)
  parseDate('2017.01.16')

  @example <caption>Parsing yyyy/mm/dd</caption>
  // return '2017-01-16' (tz >= GMT) or '2017-01-15' (tz < GMT)
  parseDate('2017/1/16')

  @example <caption>Parsing yyyy/mm/dd to locale</caption>
  // return '2017-01-16'
  parseDate('2017/1/16', true)

  @example <caption>Parsing yyyy-m-d to locale</caption>
  // return '2017-02-01'
  parseDate('2017-2-1')

  @example <caption>Parsing yyyy-mm-dd to locale</caption>
  // return '2017-12-11' (tz >= GMT) or '2017-12-10' (tz < GMT)
  parseDate('2017-12-11', true)

  @example <caption>Parsing yyyy-mm-dd</caption>
  // return '2017-01-16' since 'yyyy-mm-dd' always results in ISO date
  parseDate('2017-01-16')
**/
export const parseDate = (s, toLocale = false) => {
  let date = new Date(s)
  if (date.toString() !== 'Invalid Date') {
    if (toLocale) {
      let yyyy = date.getFullYear().toString().padStart(4, '0')
      let mm = (date.getMonth() + 1).toString().padStart(2, '0')
      let dd = date.getDate().toString().padStart(2, '0')
      return `${yyyy}-${mm}-${dd}`
    }
    return date.toISOString().slice(0, 10)
  }
  return ''
}