<!--
/**
 * DataCheck.js
 * Check the data format.
 * 檢核??�種資�?�格式是?���?�?.
 * @author Kevin Koo
 * @date 2004/6/9 05:45下�??
 */

/**
 * Check the personal identifiction number.
 * 檢核身份證�?�碼?��?���?�?.
 * @param PID An personal identification number string.
 * @return true if is valid, false if is invalid.
 */
function checkPID(PID) {
    var datalen = 10;
    var letters = "ABCDEFGHJKLMNPQRSTUVWXYZIO";
    var weights = "19876543211";
    var pid = PID.toUpperCase();
    if (pid.length != datalen) {
//        alert("身份證�?�碼檢核：長度�?��??!!");
        return false;
    }
    var myExp = /[A-Z][12]\d{8}/
    if (!myExp.test(pid)) {
//        alert("身份證�?�碼檢核：格式�?��??!!");
        return false;
    }
    // Transformed PID.
    var tpid = (letters.indexOf(pid.charAt(0)) + 10) + pid.substring(1, 9);
    var total = 0;
    for (i = 0; i < datalen; i++) {
        var d = tpid.charAt(i);
        var w = weights.charAt(i);
        total += (w * d);
    }
    total += parseInt(pid.substring(9));
    if ((total % 10) > 0) {
//        alert("身份證�?�碼檢核：檢?��碼錯�?!!");
        return false;
    }
//    alert("身份證�?�碼檢核??��??!!!!");
    return true;
}

/**
 * Check the uniform identifiction number.
 * 檢核統�??編�?�是?���?�?.
 * @param UID An uniform identification number string.
 * @return true if is validated, false if is not validated.
 */
function checkUID(UID) {
    var datalen = 8;
    var weights = "12121241";
    if (UID.length != datalen) {
//        alert("統�??編�?�檢?��：長度�?��??!!");
        return false;
    }
    var myExp = /\d{8}/;
    if (!myExp.test(UID)) {
//        alert("統�??編�?�檢?��：格式�?��??!!");
        return false;
    }
    var total = 0;
    for (i = 0; i < datalen; i++) {
        var d = parseInt(UID.charAt(i));
        var w = parseInt(weights.charAt(i));
        var dw = d*w;
        var dws = dw.toString()
        for (j = 0; j < dws.length; j++) {
            total += parseInt(dws.charAt(j));
        }
    }
    if ((total % 10) > 0) {
//        alert("統�??編�?�檢?��：檢?��碼錯�?!!");
        return false;
    }
//    alert("統�??編�?�檢?��??��??!!!!");
    return true;
}

/**
 * Check the email address.
 * 檢核?��子信箱是?��符�?�基?��規格.
 * @param EMAIL An email address string.
 * @return true if is valid, false if is invalid.
 */
// Note: To be improved.
function isEmail(EMAIL) {
    var filter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    return filter.test(EMAIL);
}


function checkEMAIL(EMAIL) {
    return isEmail(EMAIL);
/*
    if (EMAIL.indexOf("@") < 0) {
//        alert("?��子信箱錯誤�?�缺少`@`字�??!!");
        return false;
    }
    if (EMAIL.indexOf(".") < 0) {
//        alert("?��子信箱錯誤�?�缺少`.`字�??!!");
        return false;
    }
    if (EMAIL.indexOf("@") > EMAIL.indexOf(".")) {
//        alert("?��子信箱錯誤�?�`@`字�?��?��?�置???比`.`字�?��?��?�置??�面!!");
        return false;
    }
    if (EMAIL.charAt(EMAIL.length-1) == "@") {
//       alert("?��子信箱錯誤�?�`@`字�?��?�能置於???後面!!");
        return false;
    }
    if (EMAIL.charAt(EMAIL.length-1) == ".") {
//        alert("?��子信箱錯誤�?�`.`字�?��?�能置於???後面!!");
        return false;
    }
    if (EMAIL.charAt(0) == "@") {
//        alert("?��子信箱錯誤�?�缺少帳???!!");
        return false;
    }
    if (EMAIL.charAt(0) == ".") {
//        alert("?��子信箱錯誤�?�`.`字�?��?�能置於?????�面!!");
        return false;
    }
    var regExp = /\w+[@]\w+[.]\w+/;
    if (!regExp.test(EMAIL)) {
//        alert("?��子信箱錯誤�?�格式錯�?!!");
        return false;
    }
//    alert("?��子信箱�?��??檢核??��??!!!!");
    return true;
*/
}

/**
 * Check if the date is valid.
 * 檢核?��??��?�串?��?��符�?�日??�格�?"2004/09/03".
 * @param DATE A date string.
 * @return true if is valid, false if is invalid.
 */
function validDate(DATE) { 
    /* ?��度�?��?? */
    if (DATE.length != 10) {
        return false;
    }
    var ymd = DATE.split("/");
    /* 年�?�日不�?�整 */
    if (ymd.length != 3) {
        return false;
    }
    /* ??�份超出範�?? */
    if (ymd[1] < 1 || ymd[1] > 12) {
        return false;
    }
    /* ?��?��超出範�?? */
    if (ymd[2] < 1 || ymd[2] > 31) {
        return false;
    }
    var day = new Date(ymd[0], ymd[1]-1, ymd[2]);
    /* ?��了�?��?�份??��?��?�日?�� */
    if (day.getDate() != ymd[2]) {
        return false;
    }
    return true;
}

/**
 * Check if the input is all number.
 * 檢核字串?��?��?��?��?���?.
 * @param INPUT A number string.
 * @return ture if are all numerics
 */
function validNum(INPUT) {
    var numExp = /\D+/;  // non numeral
    var invalid = numExp.test(INPUT);
    return !invalid;
}

/**
 * Check if the input is all number or letter or underscore.
 * 檢核字串?��?��?��?��?��字�?�英??��?��?��?��?��??.
 * @param INPUT A string to be checked.
 * @return ture if are all literals.
 */
function validLiteral(INPUT) {
    var litExp = /\W+/;  // non numeral or letter or underscore
    var invalid = litExp.test(INPUT);
    return !invalid;
}

/**
 * �p���ڦr�ꪺ���.
 * @param STR �n�p���ת��r��.
 * @param BYTES �DASCII���r�p����.
 * @return ��ڪ����.
 */
function realLength(STR, BYTES) {
    var len = 0;
    for (i = 0; i < STR.length; i++) {
        if (STR.charCodeAt(i) > 255) {
            len += BYTES;
        } else {
            len += 1;
        }
    }
    return len;
}

/**
 * �P�_�O�_��ASCII.
 * @param BYTE ��@�r��.
 */
function isASCII(BYTE) {
    if (BYTE.charCodeAt(0) > 255) {
        return false;
    } else {
        return true;
    }
}

/**
 * Check the cellphone is in the format of 0910-123-456
 */
function validCellphone(PHONE) {
   var regexp = /09\d{2}-\d{3}-\d{3}/;
   return regexp.test(PHONE);
}

/**
 * Check if the telephone is in the format of 02-2585-2998
 */
function validTelephone(PHONE) {
   var regexp = /0\d{1,3}-\d{2,4}-\d{4}-\d{3,}/; 

   return regexp.test(PHONE);
}

/**
 * Check if the international phone is in the format of +886-2-2595-3226
 */
function validIntlphone(PHONE) {
   var regexp = /\+\d{1,3}-\d{1,3}-\d{4}-\d{4}-\d{3,}/;
   return regexp.test(PHONE);
}

/**
 * Check if the phone is in the format of +?????????????
 */
function validTel(PHONE) {
   var regexp = /^[\+]?[\d\(\)\-]+$/;
   return regexp.test(PHONE);
}

/**
 * Check if the phone is in right format of the above 3 formats.
 */
function validPhone(PHONE) {
   if (validTelephone(PHONE) || validCellphone(PHONE) || validIntlphone(PHONE) || validTel(PHONE) || validNum(PHONE)) {
      return true;
   } else {
      return false;
   }
}
//-->