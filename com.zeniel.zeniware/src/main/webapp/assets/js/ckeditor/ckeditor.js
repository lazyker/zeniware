﻿/*! UIkit 2.10.0 | http://www.getuikit.com | (c) 2014 YOOtheme | MIT License */

!function (a) {
	var b;
	jQuery && jQuery.UIkit && (b = a(jQuery, jQuery.UIkit)),
	"function" == typeof define && define.amd && define("uikit-datepicker", ["uikit"], function () {
		return b || a(jQuery, jQuery.UIkit)
	})
}
(function (a, b) {
	var c,
	d,
	e = !1;
	return b.component("datepicker", {
		defaults : {
			weekstart : 1,
			i18n : {
				months : ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
				weekdays : ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
			},
			format : "DD.MM.YYYY",
			offsettop : 5,
			maxDate : !1,
			minDate : !1,
			template : function (a, c) {
				var e,
				f,
				g = "";
				if (c.maxDate !== !1 && (e = isNaN(c.maxDate) ? d(c.maxDate, c.format) : d().add("days", c.maxDate)), c.minDate !== !1 && (f = isNaN(c.minDate) ? d(c.minDate, c.format) : d().add("days", c.minDate - 1)), g += '<div class="uk-datepicker-nav">', g += '<a href="" class="uk-datepicker-previous"></a>', g += '<a href="" class="uk-datepicker-next"></a>', b.formSelect) {
					var h,
					i,
					j,
					k,
					l,
					m = (new Date).getFullYear(),
					n = [];
					for (h = 0; h < c.i18n.months.length; h++)
						n.push(h == a.month ? '<option value="' + h + '" selected>' + c.i18n.months[h] + "</option>" : '<option value="' + h + '">' + c.i18n.months[h] + "</option>");
					for (i = '<span class="uk-form-select">' + c.i18n.months[a.month] + '<select class="update-picker-month">' + n.join("") + "</select></span>", n = [], k = f ? f.year() : m - 50, l = e ? e.year() : m + 20, h = k; l >= h; h++)
						n.push(h == a.year ? '<option value="' + h + '" selected>' + h + "</option>" : '<option value="' + h + '">' + h + "</option>");
					j = '<span class="uk-form-select">' + a.year + '<select class="update-picker-year">' + n.join("") + "</select></span>",
					g += '<div class="uk-datepicker-heading">' + i + " " + j + "</div>"
				} else
					g += '<div class="uk-datepicker-heading">' + c.i18n.months[a.month] + " " + a.year + "</div>";
				g += "</div>",
				g += '<table class="uk-datepicker-table">',
				g += "<thead>";
				for (var h = 0; h < a.weekdays.length; h++)
					a.weekdays[h] && (g += "<th>" + a.weekdays[h] + "</th>");
				g += "</thead>",
				g += "<tbody>";
				for (var h = 0; h < a.days.length; h++)
					if (a.days[h] && a.days[h].length) {
						g += "<tr>";
						for (var o = 0; o < a.days[h].length; o++)
							if (a.days[h][o]) {
								var p = a.days[h][o],
								q = [];
								p.inmonth || q.push("uk-datepicker-table-muted"),
								p.selected && q.push("uk-active"),
								e && p.day > e && q.push("uk-datepicker-date-disabled uk-datepicker-table-muted"),
								f && f > p.day && q.push("uk-datepicker-date-disabled uk-datepicker-table-muted"),
								g += '<td><a href="" class="' + q.join(" ") + '" data-date="' + p.day.format() + '">' + p.day.format("D") + "</a></td>"
							}
						g += "</tr>"
					}
				return g += "</tbody>",
				g += "</table>"
			}
		},
		init : function () {
			var b = this;
			this.current = this.element.val() ? d(this.element.val(), this.options.format) : d(),
			this.on("click", function () {
				e !== b && b.pick(this.value)
			}).on("change", function () {
				b.element.val() && !d(b.element.val(), b.options.format).isValid() && b.element.val(d().format(b.options.format))
			}),
			c || (c = a('<div class="uk-dropdown uk-datepicker"></div>'), c.on("click", ".uk-datepicker-next, .uk-datepicker-previous, [data-date]", function (b) {
					b.stopPropagation(),
					b.preventDefault();
					var f = a(this);
					return f.hasClass("uk-datepicker-date-disabled") ? !1 : void(f.is("[data-date]") ? (e.element.val(d(f.data("date")).format(e.options.format)).trigger("change"), c.hide(), e = !1) : e.add("months", 1 * (f.hasClass("uk-datepicker-next") ? 1 : -1)))
				}), c.on("change", ".update-picker-month, .update-picker-year", function () {
					var b = a(this);
					e[b.is(".update-picker-year") ? "setYear" : "setMonth"](Number(b.val()))
				}), c.appendTo("body"))
		},
		pick : function (b) {
			var f = this.element.offset(),
			g = {
				top : f.top + this.element.outerHeight() + this.options.offsettop,
				left : f.left,
				right : ""
			};
			this.current = b ? d(b, this.options.format) : d(),
			this.initdate = this.current.format("YYYY-MM-DD"),
			this.update(),
			"right" == a.UIkit.langdirection && (g.right = window.innerWidth - (g.left + this.element.outerWidth()), g.left = ""),
			c.css(g).show(),
			e = this
		},
		add : function (a, b) {
			this.current.add(a, b),
			this.update()
		},
		setMonth : function (a) {
			this.current.month(a),
			this.update()
		},
		setYear : function (a) {
			this.current.year(a),
			this.update()
		},
		update : function () {
			var a = this.getRows(this.current.year(), this.current.month()),
			b = this.options.template(a, this.options);
			c.html(b)
		},
		getRows : function (a, b) {
			var c = this.options,
			e = d().format("YYYY-MM-DD"),
			f = [31, a % 4 === 0 && a % 100 !== 0 || a % 400 === 0 ? 29 : 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][b],
			g = new Date(a, b, 1).getDay(),
			h = {
				month : b,
				year : a,
				weekdays : [],
				days : []
			},
			i = [];
			h.weekdays = function () {
				for (var a = 0, b = []; 7 > a; a++) {
					for (var d = a + (c.weekstart || 0); d >= 7; )
						d -= 7;
					b.push(c.i18n.weekdays[d])
				}
				return b
			}
			(),
			c.weekstart && c.weekstart > 0 && (g -= c.weekstart, 0 > g && (g += 7));
			for (var j = f + g, k = j; k > 7; )
				k -= 7;
			j += 7 - k;
			for (var l, m, n, o, p, q = 0, r = 0; j > q; q++)
				l = new Date(a, b, 1 + (q - g)), m = c.mindate && l < c.mindate || c.maxdate && l > c.maxdate, p = !(g > q || q >= f + g), l = d(l), n = this.initdate == l.format("YYYY-MM-DD"), o = e == l.format("YYYY-MM-DD"), i.push({
					selected : n,
					today : o,
					disabled : m,
					day : l,
					inmonth : p
				}), 7 === ++r && (h.days.push(i), i = [], r = 0);
			return h
		},
		hide : function () {
			e && e === this && (c.hide(), e = !1)
		}
	}),
	b.$win.on("resize orientationchange", function () {
		e && e.hide()
	}),
	b.$doc.on("focus.datepicker.uikit", "[data-uk-datepicker]", function (c) {
		var d = a(this);
		if (!d.data("datepicker")) {
			c.preventDefault(); {
				b.datepicker(d, b.Utils.options(d.attr("data-uk-datepicker")))
			}
			d.trigger("focus")
		}
	}),
	b.$doc.on("click.datepicker.uikit", function (b) {
		var d = a(b.target);
		!e || d[0] == c[0] || d.data("datepicker") || d.parents(".uk-datepicker:first").length || e.hide()
	}),
	d = function (a) {
		function b() {
			return {
				empty : !1,
				unusedTokens : [],
				unusedInput : [],
				overflow : -2,
				charsLeftOver : 0,
				nullInput : !1,
				invalidMonth : null,
				invalidFormat : !1,
				userInvalidated : !1,
				iso : !1
			}
		}
		function c(a, b) {
			return function (c) {
				return j(a.call(this, c), b)
			}
		}
		function d(a, b) {
			return function (c) {
				return this.lang().ordinal(a.call(this, c), b)
			}
		}
		function e() {}

		function f(a) {
			u(a),
			h(this, a)
		}
		function g(a) {
			a = o(a);
			var b = a.year || 0,
			c = a.month || 0,
			d = a.week || 0,
			e = a.day || 0;
			this._milliseconds =  + (a.millisecond || 0) + 1e3 * (a.second || 0) + 6e4 * (a.minute || 0) + 36e5 * (a.hour || 0),
			this._days = +e + 7 * d,
			this._months = +c + 12 * b,
			this._data = {},
			this._bubble()
		}
		function h(a, b) {
			for (var c in b)
				b.hasOwnProperty(c) && (a[c] = b[c]);
			return b.hasOwnProperty("toString") && (a.toString = b.toString),
			b.hasOwnProperty("valueOf") && (a.valueOf = b.valueOf),
			a
		}
		function i(a) {
			return 0 > a ? Math.ceil(a) : Math.floor(a)
		}
		function j(a, b, c) {
			for (var d = "" + Math.abs(a); d.length < b; )
				d = "0" + d;
			return (a >= 0 ? c ? "+" : "" : "-") + d
		}
		function k(a, b, c, d) {
			var e = b._milliseconds,
			f = b._days;
			b = b._months;
			var g,
			h;
			e && a._d.setTime(+a._d + e * c),
			(f || b) && (g = a.minute(), h = a.hour()),
			f && a.date(a.date() + f * c),
			b && a.month(a.month() + b * c),
			e && !d && T.updateOffset(a, f || b),
			(f || b) && (a.minute(g), a.hour(h))
		}
		function l(a) {
			return "[object Array]" === Object.prototype.toString.call(a)
		}
		function m(a, b, c) {
			var d,
			e = Math.min(a.length, b.length),
			f = Math.abs(a.length - b.length),
			g = 0;
			for (d = 0; e > d; d++)
				(c && a[d] !== b[d] || !c && q(a[d]) !== q(b[d])) && g++;
			return g + f
		}
		function n(a) {
			if (a) {
				var b = a.toLowerCase().replace(/(.)s$/, "$1");
				a = Fb[a] || Gb[b] || b
			}
			return a
		}
		function o(a) {
			var b,
			c,
			d = {};
			for (c in a)
				a.hasOwnProperty(c) && (b = n(c)) && (d[b] = a[c]);
			return d
		}
		function p(b) {
			var c,
			d;
			if (0 === b.indexOf("week"))
				c = 7, d = "day";
			else {
				if (0 !== b.indexOf("month"))
					return;
				c = 12,
				d = "month"
			}
			T[b] = function (e, f) {
				var g,
				h,
				i = T.fn._lang[b],
				j = [];
				if ("number" == typeof e && (f = e, e = a), h = function (a) {
					return a = T().utc().set(d, a),
					i.call(T.fn._lang, a, e || "")
				}, null != f)
					return h(f);
				for (g = 0; c > g; g++)
					j.push(h(g));
				return j
			}
		}
		function q(a) {
			a = +a;
			var b = 0;
			return 0 !== a && isFinite(a) && (b = a >= 0 ? Math.floor(a) : Math.ceil(a)),
			b
		}
		function r(a, b) {
			return new Date(Date.UTC(a, b + 1, 0)).getUTCDate()
		}
		function s(a, b, c) {
			return N(T([a, 11, 31 + b - c]), b, c).week
		}
		function t(a) {
			return 0 === a % 4 && 0 !== a % 100 || 0 === a % 400
		}
		function u(a) {
			var b;
			a._a && -2 === a._pf.overflow && (b = 0 > a._a[X] || 11 < a._a[X] ? X : 1 > a._a[Y] || a._a[Y] > r(a._a[W], a._a[X]) ? Y : 0 > a._a[Z] || 23 < a._a[Z] ? Z : 0 > a._a[$] || 59 < a._a[$] ? $ : 0 > a._a[_] || 59 < a._a[_] ? _ : 0 > a._a[ab] || 999 < a._a[ab] ? ab : -1, a._pf._overflowDayOfYear && (W > b || b > Y) && (b = Y), a._pf.overflow = b)
		}
		function v(a) {
			return null == a._isValid && (a._isValid = !isNaN(a._d.getTime()) && 0 > a._pf.overflow && !a._pf.empty && !a._pf.invalidMonth && !a._pf.nullInput && !a._pf.invalidFormat && !a._pf.userInvalidated, a._strict && (a._isValid = a._isValid && 0 === a._pf.charsLeftOver && 0 === a._pf.unusedTokens.length)),
			a._isValid
		}
		function w(a) {
			return a ? a.toLowerCase().replace("_", "-") : a
		}
		function x(a, b) {
			return b._isUTC ? T(a).zone(b._offset || 0) : T(a).local()
		}
		function y(a) {
			var b,
			c,
			d,
			e,
			f = 0,
			g = function (a) {
				if (!bb[a] && db)
					try {
						require("./lang/" + a)
					} catch (b) {}

				return bb[a]
			};
			if (!a)
				return T.fn._lang;
			if (!l(a)) {
				if (c = g(a))
					return c;
				a = [a]
			}
			for (; f < a.length; ) {
				for (e = w(a[f]).split("-"), b = e.length, d = (d = w(a[f + 1])) ? d.split("-") : null; b > 0; ) {
					if (c = g(e.slice(0, b).join("-")))
						return c;
					if (d && d.length >= b && m(e, d, !0) >= b - 1)
						break;
					b--
				}
				f++
			}
			return T.fn._lang
		}
		function z(a) {
			return a.match(/\[[\s\S]/) ? a.replace(/^\[|\]$/g, "") : a.replace(/\\/g, "")
		}
		function A(a) {
			var b,
			c,
			d = a.match(hb);
			for (b = 0, c = d.length; c > b; b++)
				d[b] = Kb[d[b]] ? Kb[d[b]] : z(d[b]);
			return function (e) {
				var f = "";
				for (b = 0; c > b; b++)
					f += d[b]instanceof Function ? d[b].call(e, a) : d[b];
				return f
			}
		}
		function B(a, b) {
			return a.isValid() ? (b = C(b, a.lang()), Hb[b] || (Hb[b] = A(b)), Hb[b](a)) : a.lang().invalidDate()
		}
		function C(a, b) {
			function c(a) {
				return b.longDateFormat(a) || a
			}
			var d = 5;
			for (ib.lastIndex = 0; d >= 0 && ib.test(a); )
				a = a.replace(ib, c), ib.lastIndex = 0, d -= 1;
			return a
		}
		function D(a, b) {
			var c = b._strict;
			switch (a) {
			case "DDDD":
				return vb;
			case "YYYY":
			case "GGGG":
			case "gggg":
				return c ? wb : lb;
			case "Y":
			case "G":
			case "g":
				return yb;
			case "YYYYYY":
			case "YYYYY":
			case "GGGGG":
			case "ggggg":
				return c ? xb : mb;
			case "S":
				if (c)
					return tb;
			case "SS":
				if (c)
					return ub;
			case "SSS":
				if (c)
					return vb;
			case "DDD":
				return kb;
			case "MMM":
			case "MMMM":
			case "dd":
			case "ddd":
			case "dddd":
				return ob;
			case "a":
			case "A":
				return y(b._l)._meridiemParse;
			case "X":
				return rb;
			case "Z":
			case "ZZ":
				return pb;
			case "T":
				return qb;
			case "SSSS":
				return nb;
			case "MM":
			case "DD":
			case "YY":
			case "GG":
			case "gg":
			case "HH":
			case "hh":
			case "mm":
			case "ss":
			case "ww":
			case "WW":
				return c ? ub : jb;
			case "M":
			case "D":
			case "d":
			case "H":
			case "h":
			case "m":
			case "s":
			case "w":
			case "W":
			case "e":
			case "E":
				return jb;
			case "Do":
				return sb;
			default:
				var d,
				c = RegExp;
				return d = I(a.replace("\\", "")).replace(/[-\/\\^$*+?.()|[\]{}]/g, "\\$&"),
				new c(d)
			}
		}
		function E(a) {
			a = (a || "").match(pb) || [],
			a = ((a[a.length - 1] || []) + "").match(Cb) || ["-", 0, 0];
			var b =  + (60 * a[1]) + q(a[2]);
			return "+" === a[0] ? -b : b
		}
		function F(a) {
			var b,
			c,
			d,
			e,
			f,
			g,
			h = [];
			if (!a._d) {
				for (c = G(a), a._w && null == a._a[Y] && null == a._a[X] && (b = function (b) {
						var c = parseInt(b, 10);
						return b ? 3 > b.length ? c > 68 ? 1900 + c : 2e3 + c : c : null == a._a[W] ? T().weekYear() : a._a[W]
					}, d = a._w, null != d.GG || null != d.W || null != d.E ? b = O(b(d.GG), d.W || 1, d.E, 4, 1) : (e = y(a._l), f = null != d.d ? L(d.d, e) : null != d.e ? parseInt(d.e, 10) + e._week.dow : 0, g = parseInt(d.w, 10) || 1, null != d.d && f < e._week.dow && g++, b = O(b(d.gg), g, f, e._week.doy, e._week.dow)), a._a[W] = b.year, a._dayOfYear = b.dayOfYear), a._dayOfYear && (b = null == a._a[W] ? c[W] : a._a[W], a._dayOfYear > (t(b) ? 366 : 365) && (a._pf._overflowDayOfYear = !0), b = K(b, 0, a._dayOfYear), a._a[X] = b.getUTCMonth(), a._a[Y] = b.getUTCDate()), b = 0; 3 > b && null == a._a[b]; ++b)
					a._a[b] = h[b] = c[b];
				for (; 7 > b; b++)
					a._a[b] = h[b] = null == a._a[b] ? 2 === b ? 1 : 0 : a._a[b];
				h[Z] += q((a._tzm || 0) / 60),
				h[$] += q((a._tzm || 0) % 60),
				a._d = (a._useUTC ? K : J).apply(null, h)
			}
		}
		function G(a) {
			var b = new Date;
			return a._useUTC ? [b.getUTCFullYear(), b.getUTCMonth(), b.getUTCDate()] : [b.getFullYear(), b.getMonth(), b.getDate()]
		}
		function H(a) {
			a._a = [],
			a._pf.empty = !0;
			var b,
			c,
			d,
			e,
			f = y(a._l),
			g = "" + a._i,
			h = g.length,
			i = 0;
			for (c = C(a._f, f).match(hb) || [], f = 0; f < c.length; f++)
				if (d = c[f], (b = (g.match(D(d, a)) || [])[0]) && (e = g.substr(0, g.indexOf(b)), 0 < e.length && a._pf.unusedInput.push(e), g = g.slice(g.indexOf(b) + b.length), i += b.length), Kb[d]) {
					b ? a._pf.empty = !1 : a._pf.unusedTokens.push(d),
					e = a;
					var j = void 0,
					k = e._a;
					switch (d) {
					case "M":
					case "MM":
						null != b && (k[X] = q(b) - 1);
						break;
					case "MMM":
					case "MMMM":
						j = y(e._l).monthsParse(b),
						null != j ? k[X] = j : e._pf.invalidMonth = b;
						break;
					case "D":
					case "DD":
						null != b && (k[Y] = q(b));
						break;
					case "Do":
						null != b && (k[Y] = q(parseInt(b, 10)));
						break;
					case "DDD":
					case "DDDD":
						null != b && (e._dayOfYear = q(b));
						break;
					case "YY":
						k[W] = q(b) + (68 < q(b) ? 1900 : 2e3);
						break;
					case "YYYY":
					case "YYYYY":
					case "YYYYYY":
						k[W] = q(b);
						break;
					case "a":
					case "A":
						e._isPm = y(e._l).isPM(b);
						break;
					case "H":
					case "HH":
					case "h":
					case "hh":
						k[Z] = q(b);
						break;
					case "m":
					case "mm":
						k[$] = q(b);
						break;
					case "s":
					case "ss":
						k[_] = q(b);
						break;
					case "S":
					case "SS":
					case "SSS":
					case "SSSS":
						k[ab] = q(1e3 * ("0." + b));
						break;
					case "X":
						e._d = new Date(1e3 * parseFloat(b));
						break;
					case "Z":
					case "ZZ":
						e._useUTC = !0,
						e._tzm = E(b);
						break;
					case "w":
					case "ww":
					case "W":
					case "WW":
					case "d":
					case "dd":
					case "ddd":
					case "dddd":
					case "e":
					case "E":
						d = d.substr(0, 1);
					case "gg":
					case "gggg":
					case "GG":
					case "GGGG":
					case "GGGGG":
						d = d.substr(0, 2),
						b && (e._w = e._w || {}, e._w[d] = b)
					}
				} else
					a._strict && !b && a._pf.unusedTokens.push(d);
			a._pf.charsLeftOver = h - i,
			0 < g.length && a._pf.unusedInput.push(g),
			a._isPm && 12 > a._a[Z] && (a._a[Z] += 12),
			!1 === a._isPm && 12 === a._a[Z] && (a._a[Z] = 0),
			F(a),
			u(a)
		}
		function I(a) {
			return a.replace(/\\(\[)|\\(\])|\[([^\]\[]*)\]|\\(.)/g, function (a, b, c, d, e) {
				return b || c || d || e
			})
		}
		function J(a, b, c, d, e, f, g) {
			return b = new Date(a, b, c, d, e, f, g),
			1970 > a && b.setFullYear(a),
			b
		}
		function K(a) {
			var b = new Date(Date.UTC.apply(null, arguments));
			return 1970 > a && b.setUTCFullYear(a),
			b
		}
		function L(a, b) {
			if ("string" == typeof a)
				if (isNaN(a)) {
					if (a = b.weekdaysParse(a), "number" != typeof a)
						return null
				} else
					a = parseInt(a, 10);
			return a
		}
		function M(a, b, c, d, e) {
			return e.relativeTime(b || 1, !!c, a, d)
		}
		function N(a, b, c) {
			return b = c - b,
			c -= a.day(),
			c > b && (c -= 7),
			b - 7 > c && (c += 7),
			a = T(a).add("d", c), {
				week : Math.ceil(a.dayOfYear() / 7),
				year : a.year()
			}
		}
		function O(a, b, c, d, e) {
			var f = K(a, 0, 1).getUTCDay();
			return b = 7 * (b - 1) + ((null != c ? c : e) - e) + (e - f + (f > d ? 7 : 0) - (e > f ? 7 : 0)) + 1, {
				year : b > 0 ? a : a - 1,
				dayOfYear : b > 0 ? b : (t(a - 1) ? 366 : 365) + b
			}
		}
		function P(c) {
			var d = c._i,
			e = c._f;
			if (null === d)
				return T.invalid({
					nullInput : !0
				});
			if ("string" == typeof d && (c._i = d = y().preparse(d)), T.isMoment(d)) {
				c = d;
				var g,
				i = {};
				for (g in c)
					c.hasOwnProperty(g) && cb.hasOwnProperty(g) && (i[g] = c[g]);
				c = i,
				c._d = new Date(+d._d)
			} else if (e)
				if (l(e)) {
					var j,
					k,
					d = c;
					if (0 === d._f.length)
						d._pf.invalidFormat = !0, d._d = new Date(0 / 0);
					else {
						for (g = 0; g < d._f.length; g++)
							e = 0, i = h({}, d), i._pf = b(), i._f = d._f[g], H(i), v(i) && (e += i._pf.charsLeftOver, e += 10 * i._pf.unusedTokens.length, i._pf.score = e, null == k || k > e) && (k = e, j = i);
						h(d, j || i)
					}
				} else
					H(c);
			else if (i = c, j = i._i, k = eb.exec(j), j === a)
				i._d = new Date;
			else if (k)
				i._d = new Date(+k[1]);
			else if ("string" == typeof j)
				if (d = i._i, g = zb.exec(d)) {
					for (i._pf.iso = !0, j = 0, k = Ab.length; k > j; j++)
						if (Ab[j][1].exec(d)) {
							i._f = Ab[j][0] + (g[6] || " ");
							break
						}
					for (j = 0, k = Bb.length; k > j; j++)
						if (Bb[j][1].exec(d)) {
							i._f += Bb[j][0];
							break
						}
					d.match(pb) && (i._f += "Z"),
					H(i)
				} else
					i._d = new Date(d);
			else
				l(j) ? (i._a = j.slice(0), F(i)) : "[object Date]" === Object.prototype.toString.call(j) || j instanceof Date ? i._d = new Date(+j) : "object" == typeof j ? i._d || (j = o(i._i), i._a = [j.year, j.month, j.day, j.hour, j.minute, j.second, j.millisecond], F(i)) : i._d = new Date(j);
			return new f(c)
		}
		function Q(a, b) {
			var c = "date" === b || "month" === b || "year" === b;
			T.fn[a] = T.fn[a + "s"] = function (a, d) {
				var e = this._isUTC ? "UTC" : "";
				return null == d && (d = c),
				null != a ? (this._d["set" + e + b](a), T.updateOffset(this, d), this) : this._d["get" + e + b]()
			}
		}
		function R(a) {
			T.duration.fn[a] = function () {
				return this._data[a]
			}
		}
		function S(a, b) {
			T.duration.fn["as" + a] = function () {
				return +this / b
			}
		}
		for (var T, U, V = Math.round, W = 0, X = 1, Y = 2, Z = 3, $ = 4, _ = 5, ab = 6, bb = {}, cb = {
				_isAMomentObject : null,
				_i : null,
				_f : null,
				_l : null,
				_strict : null,
				_isUTC : null,
				_offset : null,
				_pf : null,
				_lang : null
			}, db = "undefined" != typeof module && module.exports && "undefined" != typeof require, eb = /^\/?Date\((\-?\d+)/i, fb = /(\-)?(?:(\d*)\.)?(\d+)\:(\d+)(?:\:(\d+)\.?(\d{3})?)?/, gb = /^(-)?P(?:(?:([0-9,.]*)Y)?(?:([0-9,.]*)M)?(?:([0-9,.]*)D)?(?:T(?:([0-9,.]*)H)?(?:([0-9,.]*)M)?(?:([0-9,.]*)S)?)?|([0-9,.]*)W)$/, hb = /(\[[^\[]*\])|(\\)?(Mo|MM?M?M?|Do|DDDo|DD?D?D?|ddd?d?|do?|w[o|w]?|W[o|W]?|YYYYYY|YYYYY|YYYY|YY|gg(ggg?)?|GG(GGG?)?|e|E|a|A|hh?|HH?|mm?|ss?|S{1,4}|X|zz?|ZZ?|.)/g, ib = /(\[[^\[]*\])|(\\)?(LT|LL?L?L?|l{1,4})/g, jb = /\d\d?/, kb = /\d{1,3}/, lb = /\d{1,4}/, mb = /[+\-]?\d{1,6}/, nb = /\d+/, ob = /[0-9]*['a-z\u00A0-\u05FF\u0700-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+|[\u0600-\u06FF\/]+(\s*?[\u0600-\u06FF]+){1,2}/i, pb = /Z|[\+\-]\d\d:?\d\d/gi, qb = /T/i, rb = /[\+\-]?\d+(\.\d{1,3})?/, sb = /\d{1,2}/, tb = /\d/, ub = /\d\d/, vb = /\d{3}/, wb = /\d{4}/, xb = /[+-]?\d{6}/, yb = /[+-]?\d+/, zb = /^\s*(?:[+-]\d{6}|\d{4})-(?:(\d\d-\d\d)|(W\d\d$)|(W\d\d-\d)|(\d\d\d))((T| )(\d\d(:\d\d(:\d\d(\.\d+)?)?)?)?([\+\-]\d\d(?::?\d\d)?|\s*Z)?)?$/, Ab = [["YYYYYY-MM-DD", /[+-]\d{6}-\d{2}-\d{2}/], ["YYYY-MM-DD", /\d{4}-\d{2}-\d{2}/], ["GGGG-[W]WW-E", /\d{4}-W\d{2}-\d/], ["GGGG-[W]WW", /\d{4}-W\d{2}/], ["YYYY-DDD", /\d{4}-\d{3}/]], Bb = [["HH:mm:ss.SSSS", /(T| )\d\d:\d\d:\d\d\.\d{1,3}/], ["HH:mm:ss", /(T| )\d\d:\d\d:\d\d/], ["HH:mm", /(T| )\d\d:\d\d/], ["HH", /(T| )\d\d/]], Cb = /([\+\-]|\d\d)/gi, Db = ["Date", "Hours", "Minutes", "Seconds", "Milliseconds"], Eb = {
				Milliseconds : 1,
				Seconds : 1e3,
				Minutes : 6e4,
				Hours : 36e5,
				Days : 864e5,
				Months : 2592e6,
				Years : 31536e6
			}, Fb = {
				ms : "millisecond",
				s : "second",
				m : "minute",
				h : "hour",
				d : "day",
				D : "date",
				w : "week",
				W : "isoWeek",
				M : "month",
				y : "year",
				DDD : "dayOfYear",
				e : "weekday",
				E : "isoWeekday",
				gg : "weekYear",
				GG : "isoWeekYear"
			}, Gb = {
				dayofyear : "dayOfYear",
				isoweekday : "isoWeekday",
				isoweek : "isoWeek",
				weekyear : "weekYear",
				isoweekyear : "isoWeekYear"
			}, Hb = {}, Ib = "DDD w W M D d".split(" "), Jb = "MDHhmswW".split(""), Kb = {
				M : function () {
					return this.month() + 1
				},
				MMM : function (a) {
					return this.lang().monthsShort(this, a)
				},
				MMMM : function (a) {
					return this.lang().months(this, a)
				},
				D : function () {
					return this.date()
				},
				DDD : function () {
					return this.dayOfYear()
				},
				d : function () {
					return this.day()
				},
				dd : function (a) {
					return this.lang().weekdaysMin(this, a)
				},
				ddd : function (a) {
					return this.lang().weekdaysShort(this, a)
				},
				dddd : function (a) {
					return this.lang().weekdays(this, a)
				},
				w : function () {
					return this.week()
				},
				W : function () {
					return this.isoWeek()
				},
				YY : function () {
					return j(this.year() % 100, 2)
				},
				YYYY : function () {
					return j(this.year(), 4)
				},
				YYYYY : function () {
					return j(this.year(), 5)
				},
				YYYYYY : function () {
					var a = this.year();
					return (a >= 0 ? "+" : "-") + j(Math.abs(a), 6)
				},
				gg : function () {
					return j(this.weekYear() % 100, 2)
				},
				gggg : function () {
					return j(this.weekYear(), 4)
				},
				ggggg : function () {
					return j(this.weekYear(), 5)
				},
				GG : function () {
					return j(this.isoWeekYear() % 100, 2)
				},
				GGGG : function () {
					return j(this.isoWeekYear(), 4)
				},
				GGGGG : function () {
					return j(this.isoWeekYear(), 5)
				},
				e : function () {
					return this.weekday()
				},
				E : function () {
					return this.isoWeekday()
				},
				a : function () {
					return this.lang().meridiem(this.hours(), this.minutes(), !0)
				},
				A : function () {
					return this.lang().meridiem(this.hours(), this.minutes(), !1)
				},
				H : function () {
					return this.hours()
				},
				h : function () {
					return this.hours() % 12 || 12
				},
				m : function () {
					return this.minutes()
				},
				s : function () {
					return this.seconds()
				},
				S : function () {
					return q(this.milliseconds() / 100)
				},
				SS : function () {
					return j(q(this.milliseconds() / 10), 2)
				},
				SSS : function () {
					return j(this.milliseconds(), 3)
				},
				SSSS : function () {
					return j(this.milliseconds(), 3)
				},
				Z : function () {
					var a = -this.zone(),
					b = "+";
					return 0 > a && (a = -a, b = "-"),
					b + j(q(a / 60), 2) + ":" + j(q(a) % 60, 2)
				},
				ZZ : function () {
					var a = -this.zone(),
					b = "+";
					return 0 > a && (a = -a, b = "-"),
					b + j(q(a / 60), 2) + j(q(a) % 60, 2)
				},
				z : function () {
					return this.zoneAbbr()
				},
				zz : function () {
					return this.zoneName()
				},
				X : function () {
					return this.unix()
				},
				Q : function () {
					return this.quarter()
				}
			}, Lb = ["months", "monthsShort", "weekdays", "weekdaysShort", "weekdaysMin"]; Ib.length; )
			U = Ib.pop(), Kb[U + "o"] = d(Kb[U], U);
		for (; Jb.length; )
			U = Jb.pop(), Kb[U + U] = c(Kb[U], 2);
		for (Kb.DDDD = c(Kb.DDD, 3), h(e.prototype, {
				set : function (a) {
					var b,
					c;
					for (c in a)
						b = a[c], "function" == typeof b ? this[c] = b : this["_" + c] = b
				},
				_months : "January February March April May June July August September October November December".split(" "),
				months : function (a) {
					return this._months[a.month()]
				},
				_monthsShort : "Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec".split(" "),
				monthsShort : function (a) {
					return this._monthsShort[a.month()]
				},
				monthsParse : function (a) {
					var b,
					c;
					for (this._monthsParse || (this._monthsParse = []), b = 0; 12 > b; b++)
						if (this._monthsParse[b] || (c = T.utc([2e3, b]), c = "^" + this.months(c, "") + "|^" + this.monthsShort(c, ""), this._monthsParse[b] = RegExp(c.replace(".", ""), "i")), this._monthsParse[b].test(a))
							return b
				},
				_weekdays : "Sunday Monday Tuesday Wednesday Thursday Friday Saturday".split(" "),
				weekdays : function (a) {
					return this._weekdays[a.day()]
				},
				_weekdaysShort : "Sun Mon Tue Wed Thu Fri Sat".split(" "),
				weekdaysShort : function (a) {
					return this._weekdaysShort[a.day()]
				},
				_weekdaysMin : "Su Mo Tu We Th Fr Sa".split(" "),
				weekdaysMin : function (a) {
					return this._weekdaysMin[a.day()]
				},
				weekdaysParse : function (a) {
					var b,
					c;
					for (this._weekdaysParse || (this._weekdaysParse = []), b = 0; 7 > b; b++)
						if (this._weekdaysParse[b] || (c = T([2e3, 1]).day(b), c = "^" + this.weekdays(c, "") + "|^" + this.weekdaysShort(c, "") + "|^" + this.weekdaysMin(c, ""), this._weekdaysParse[b] = RegExp(c.replace(".", ""), "i")), this._weekdaysParse[b].test(a))
							return b
				},
				_longDateFormat : {
					LT : "h:mm A",
					L : "MM/DD/YYYY",
					LL : "MMMM D YYYY",
					LLL : "MMMM D YYYY LT",
					LLLL : "dddd, MMMM D YYYY LT"
				},
				longDateFormat : function (a) {
					var b = this._longDateFormat[a];
					return !b && this._longDateFormat[a.toUpperCase()] && (b = this._longDateFormat[a.toUpperCase()].replace(/MMMM|MM|DD|dddd/g, function (a) {
								return a.slice(1)
							}), this._longDateFormat[a] = b),
					b
				},
				isPM : function (a) {
					return "p" === (a + "").toLowerCase().charAt(0)
				},
				_meridiemParse : /[ap]\.?m?\.?/i,
				meridiem : function (a, b, c) {
					return a > 11 ? c ? "pm" : "PM" : c ? "am" : "AM"
				},
				_calendar : {
					sameDay : "[Today at] LT",
					nextDay : "[Tomorrow at] LT",
					nextWeek : "dddd [at] LT",
					lastDay : "[Yesterday at] LT",
					lastWeek : "[Last] dddd [at] LT",
					sameElse : "L"
				},
				calendar : function (a, b) {
					var c = this._calendar[a];
					return "function" == typeof c ? c.apply(b) : c
				},
				_relativeTime : {
					future : "in %s",
					past : "%s ago",
					s : "a few seconds",
					m : "a minute",
					mm : "%d minutes",
					h : "an hour",
					hh : "%d hours",
					d : "a day",
					dd : "%d days",
					M : "a month",
					MM : "%d months",
					y : "a year",
					yy : "%d years"
				},
				relativeTime : function (a, b, c, d) {
					var e = this._relativeTime[c];
					return "function" == typeof e ? e(a, b, c, d) : e.replace(/%d/i, a)
				},
				pastFuture : function (a, b) {
					var c = this._relativeTime[a > 0 ? "future" : "past"];
					return "function" == typeof c ? c(b) : c.replace(/%s/i, b)
				},
				ordinal : function (a) {
					return this._ordinal.replace("%d", a)
				},
				_ordinal : "%d",
				preparse : function (a) {
					return a
				},
				postformat : function (a) {
					return a
				},
				week : function (a) {
					return N(a, this._week.dow, this._week.doy).week
				},
				_week : {
					dow : 0,
					doy : 6
				},
				_invalidDate : "Invalid date",
				invalidDate : function () {
					return this._invalidDate
				}
			}), T = function (c, d, e, f) {
			var g;
			return "boolean" == typeof e && (f = e, e = a),
			g = {
				_isAMomentObject : !0
			},
			g._i = c,
			g._f = d,
			g._l = e,
			g._strict = f,
			g._isUTC = !1,
			g._pf = b(),
			P(g)
		}, T.utc = function (c, d, e, f) {
			var g;
			return "boolean" == typeof e && (f = e, e = a),
			g = {
				_isAMomentObject : !0,
				_useUTC : !0,
				_isUTC : !0
			},
			g._l = e,
			g._i = c,
			g._f = d,
			g._strict = f,
			g._pf = b(),
			P(g).utc()
		}, T.unix = function (a) {
			return T(1e3 * a)
		}, T.duration = function (a, b) {
			var c,
			d = a,
			e = null;
			return T.isDuration(a) ? d = {
				ms : a._milliseconds,
				d : a._days,
				M : a._months
			}
			 : "number" == typeof a ? (d = {}, b ? d[b] = a : d.milliseconds = a) : (e = fb.exec(a)) ? (c = "-" === e[1] ? -1 : 1, d = {
					y : 0,
					d : q(e[Y]) * c,
					h : q(e[Z]) * c,
					m : q(e[$]) * c,
					s : q(e[_]) * c,
					ms : q(e[ab]) * c
				}) : (e = gb.exec(a)) && (c = "-" === e[1] ? -1 : 1, d = function (a) {
				return a = a && parseFloat(a.replace(",", ".")),
				(isNaN(a) ? 0 : a) * c
			}, d = {
					y : d(e[2]),
					M : d(e[3]),
					d : d(e[4]),
					h : d(e[5]),
					m : d(e[6]),
					s : d(e[7]),
					w : d(e[8])
				}),
			e = new g(d),
			T.isDuration(a) && a.hasOwnProperty("_lang") && (e._lang = a._lang),
			e
		}, T.version = "2.5.1", T.defaultFormat = "YYYY-MM-DDTHH:mm:ssZ", T.updateOffset = function () {}, T.lang = function (a, b) {
			if (!a)
				return T.fn._lang._abbr;
			if (b) {
				var c = w(a);
				b.abbr = c,
				bb[c] || (bb[c] = new e),
				bb[c].set(b)
			} else
				null === b ? (delete bb[a], a = "en") : bb[a] || y(a);
			return (T.duration.fn._lang = T.fn._lang = y(a))._abbr
		}, T.langData = function (a) {
			return a && a._lang && a._lang._abbr && (a = a._lang._abbr),
			y(a)
		}, T.isMoment = function (a) {
			return a instanceof f || null != a && a.hasOwnProperty("_isAMomentObject")
		}, T.isDuration = function (a) {
			return a instanceof g
		}, U = Lb.length - 1; U >= 0; --U)
			p(Lb[U]);
		for (T.normalizeUnits = function (a) {
			return n(a)
		}, T.invalid = function (a) {
			var b = T.utc(0 / 0);
			return null != a ? h(b._pf, a) : b._pf.userInvalidated = !0,
			b
		}, T.parseZone = function () {
			return T.apply(null, arguments).parseZone()
		}, h(T.fn = f.prototype, {
				clone : function () {
					return T(this)
				},
				valueOf : function () {
					return +this._d + 6e4 * (this._offset || 0)
				},
				unix : function () {
					return Math.floor(+this / 1e3)
				},
				toString : function () {
					return this.clone().lang("en").format("ddd MMM DD YYYY HH:mm:ss [GMT]ZZ")
				},
				toDate : function () {
					return this._offset ? new Date(+this) : this._d
				},
				toISOString : function () {
					var a = T(this).utc();
					return 0 < a.year() && 9999 >= a.year() ? B(a, "YYYY-MM-DD[T]HH:mm:ss.SSS[Z]") : B(a, "YYYYYY-MM-DD[T]HH:mm:ss.SSS[Z]")
				},
				toArray : function () {
					return [this.year(), this.month(), this.date(), this.hours(), this.minutes(), this.seconds(), this.milliseconds()]
				},
				isValid : function () {
					return v(this)
				},
				isDSTShifted : function () {
					return this._a ? this.isValid() && 0 < m(this._a, (this._isUTC ? T.utc(this._a) : T(this._a)).toArray()) : !1
				},
				parsingFlags : function () {
					return h({}, this._pf)
				},
				invalidAt : function () {
					return this._pf.overflow
				},
				utc : function () {
					return this.zone(0)
				},
				local : function () {
					return this.zone(0),
					this._isUTC = !1,
					this
				},
				format : function (a) {
					return a = B(this, a || T.defaultFormat),
					this.lang().postformat(a)
				},
				add : function (a, b) {
					var c;
					return c = "string" == typeof a ? T.duration(+b, a) : T.duration(a, b),
					k(this, c, 1),
					this
				},
				subtract : function (a, b) {
					var c;
					return c = "string" == typeof a ? T.duration(+b, a) : T.duration(a, b),
					k(this, c, -1),
					this
				},
				diff : function (a, b, c) {
					a = x(a, this);
					var d,
					e = 6e4 * (this.zone() - a.zone());
					return b = n(b),
					"year" === b || "month" === b ? (d = 432e5 * (this.daysInMonth() + a.daysInMonth()), e = 12 * (this.year() - a.year()) + (this.month() - a.month()), e += (this - T(this).startOf("month") - (a - T(a).startOf("month"))) / d, e -= 6e4 * (this.zone() - T(this).startOf("month").zone() - (a.zone() - T(a).startOf("month").zone())) / d, "year" === b && (e /= 12)) : (d = this - a, e = "second" === b ? d / 1e3 : "minute" === b ? d / 6e4 : "hour" === b ? d / 36e5 : "day" === b ? (d - e) / 864e5 : "week" === b ? (d - e) / 6048e5 : d),
					c ? e : i(e)
				},
				from : function (a, b) {
					return T.duration(this.diff(a)).lang(this.lang()._abbr).humanize(!b)
				},
				fromNow : function (a) {
					return this.from(T(), a)
				},
				calendar : function () {
					var a = x(T(), this).startOf("day"),
					a = this.diff(a, "days", !0),
					a = -6 > a ? "sameElse" : -1 > a ? "lastWeek" : 0 > a ? "lastDay" : 1 > a ? "sameDay" : 2 > a ? "nextDay" : 7 > a ? "nextWeek" : "sameElse";
					return this.format(this.lang().calendar(a, this))
				},
				isLeapYear : function () {
					return t(this.year())
				},
				isDST : function () {
					return this.zone() < this.clone().month(0).zone() || this.zone() < this.clone().month(5).zone()
				},
				day : function (a) {
					var b = this._isUTC ? this._d.getUTCDay() : this._d.getDay();
					return null != a ? (a = L(a, this.lang()), this.add({
							d : a - b
						})) : b
				},
				month : function (a) {
					var b,
					c = this._isUTC ? "UTC" : "";
					return null != a ? "string" == typeof a && (a = this.lang().monthsParse(a), "number" != typeof a) ? this : (b = Math.min(this.date(), r(this.year(), a)), this._d["set" + c + "Month"](a, b), T.updateOffset(this, !0), this) : this._d["get" + c + "Month"]()
				},
				startOf : function (a) {
					switch (a = n(a)) {
					case "year":
						this.month(0);
					case "month":
						this.date(1);
					case "week":
					case "isoWeek":
					case "day":
						this.hours(0);
					case "hour":
						this.minutes(0);
					case "minute":
						this.seconds(0);
					case "second":
						this.milliseconds(0)
					}
					return "week" === a ? this.weekday(0) : "isoWeek" === a && this.isoWeekday(1),
					this
				},
				endOf : function (a) {
					return a = n(a),
					this.startOf(a).add("isoWeek" === a ? "week" : a, 1).subtract("ms", 1)
				},
				isAfter : function (a, b) {
					return b = "undefined" != typeof b ? b : "millisecond",
					+this.clone().startOf(b) > +T(a).startOf(b)
				},
				isBefore : function (a, b) {
					return b = "undefined" != typeof b ? b : "millisecond",
					+this.clone().startOf(b) < +T(a).startOf(b)
				},
				isSame : function (a, b) {
					return b = b || "ms",
					+this.clone().startOf(b) === +x(a, this).startOf(b)
				},
				min : function (a) {
					return a = T.apply(null, arguments),
					this > a ? this : a
				},
				max : function (a) {
					return a = T.apply(null, arguments),
					a > this ? this : a
				},
				zone : function (a, b) {
					b = null == b ? !0 : !1;
					var c = this._offset || 0;
					return null == a ? this._isUTC ? c : this._d.getTimezoneOffset() : ("string" == typeof a && (a = E(a)), 16 > Math.abs(a) && (a *= 60), this._offset = a, this._isUTC = !0, c !== a && b && k(this, T.duration(c - a, "m"), 1, !0), this)
				},
				zoneAbbr : function () {
					return this._isUTC ? "UTC" : ""
				},
				zoneName : function () {
					return this._isUTC ? "Coordinated Universal Time" : ""
				},
				parseZone : function () {
					return this._tzm ? this.zone(this._tzm) : "string" == typeof this._i && this.zone(this._i),
					this
				},
				hasAlignedHourOffset : function (a) {
					return a = a ? T(a).zone() : 0,
					0 === (this.zone() - a) % 60
				},
				daysInMonth : function () {
					return r(this.year(), this.month())
				},
				dayOfYear : function (a) {
					var b = V((T(this).startOf("day") - T(this).startOf("year")) / 864e5) + 1;
					return null == a ? b : this.add("d", a - b)
				},
				quarter : function () {
					return Math.ceil((this.month() + 1) / 3)
				},
				weekYear : function (a) {
					var b = N(this, this.lang()._week.dow, this.lang()._week.doy).year;
					return null == a ? b : this.add("y", a - b)
				},
				isoWeekYear : function (a) {
					var b = N(this, 1, 4).year;
					return null == a ? b : this.add("y", a - b)
				},
				week : function (a) {
					var b = this.lang().week(this);
					return null == a ? b : this.add("d", 7 * (a - b))
				},
				isoWeek : function (a) {
					var b = N(this, 1, 4).week;
					return null == a ? b : this.add("d", 7 * (a - b))
				},
				weekday : function (a) {
					var b = (this.day() + 7 - this.lang()._week.dow) % 7;
					return null == a ? b : this.add("d", a - b)
				},
				isoWeekday : function (a) {
					return null == a ? this.day() || 7 : this.day(this.day() % 7 ? a : a - 7)
				},
				isoWeeksInYear : function () {
					return s(this.year(), 1, 4)
				},
				weeksInYear : function () {
					var a = this._lang._week;
					return s(this.year(), a.dow, a.doy)
				},
				get : function (a) {
					return a = n(a),
					this[a]()
				},
				set : function (a, b) {
					return a = n(a),
					"function" == typeof this[a] && this[a](b),
					this
				},
				lang : function (b) {
					return b === a ? this._lang : (this._lang = y(b), this)
				}
			}), U = 0; U < Db.length; U++)
			Q(Db[U].toLowerCase().replace(/s$/, ""), Db[U]);
		Q("year", "FullYear"),
		T.fn.days = T.fn.day,
		T.fn.months = T.fn.month,
		T.fn.weeks = T.fn.week,
		T.fn.isoWeeks = T.fn.isoWeek,
		T.fn.toJSON = T.fn.toISOString,
		h(T.duration.fn = g.prototype, {
			_bubble : function () {
				var a = this._milliseconds,
				b = this._days,
				c = this._months,
				d = this._data;
				d.milliseconds = a % 1e3,
				a = i(a / 1e3),
				d.seconds = a % 60,
				a = i(a / 60),
				d.minutes = a % 60,
				a = i(a / 60),
				d.hours = a % 24,
				b += i(a / 24),
				d.days = b % 30,
				c += i(b / 30),
				d.months = c % 12,
				b = i(c / 12),
				d.years = b
			},
			weeks : function () {
				return i(this.days() / 7)
			},
			valueOf : function () {
				return this._milliseconds + 864e5 * this._days + this._months % 12 * 2592e6 + 31536e6 * q(this._months / 12)
			},
			humanize : function (a) {
				var b,
				c = +this;
				b = !a;
				var d = this.lang(),
				e = V(Math.abs(c) / 1e3),
				f = V(e / 60),
				g = V(f / 60),
				h = V(g / 24),
				i = V(h / 365),
				e = 45 > e && ["s", e] || 1 === f && ["m"] || 45 > f && ["mm", f] || 1 === g && ["h"] || 22 > g && ["hh", g] || 1 === h && ["d"] || 25 >= h && ["dd", h] || 45 >= h && ["M"] || 345 > h && ["MM", V(h / 30)] || 1 === i && ["y"] || ["yy", i];
				return e[2] = b,
				e[3] = c > 0,
				e[4] = d,
				b = M.apply({}, e),
				a && (b = this.lang().pastFuture(c, b)),
				this.lang().postformat(b)
			},
			add : function (a, b) {
				var c = T.duration(a, b);
				return this._milliseconds += c._milliseconds,
				this._days += c._days,
				this._months += c._months,
				this._bubble(),
				this
			},
			subtract : function (a, b) {
				var c = T.duration(a, b);
				return this._milliseconds -= c._milliseconds,
				this._days -= c._days,
				this._months -= c._months,
				this._bubble(),
				this
			},
			get : function (a) {
				return a = n(a),
				this[a.toLowerCase() + "s"]()
			},
			as : function (a) {
				return a = n(a),
				this["as" + a.charAt(0).toUpperCase() + a.slice(1) + "s"]()
			},
			lang : T.fn.lang,
			toIsoString : function () {
				var a = Math.abs(this.years()),
				b = Math.abs(this.months()),
				c = Math.abs(this.days()),
				d = Math.abs(this.hours()),
				e = Math.abs(this.minutes()),
				f = Math.abs(this.seconds() + this.milliseconds() / 1e3);
				return this.asSeconds() ? (0 > this.asSeconds() ? "-" : "") + "P" + (a ? a + "Y" : "") + (b ? b + "M" : "") + (c ? c + "D" : "") + (d || e || f ? "T" : "") + (d ? d + "H" : "") + (e ? e + "M" : "") + (f ? f + "S" : "") : "P0D"
			}
		});
		for (U in Eb)
			Eb.hasOwnProperty(U) && (S(U, Eb[U]), R(U.toLowerCase()));
		return S("Weeks", 6048e5),
		T.duration.fn.asMonths = function () {
			return (+this - 31536e6 * this.years()) / 2592e6 + 12 * this.years()
		},
		T.lang("en", {
			ordinal : function (a) {
				var b = a % 10,
				b = 1 === q(a % 100 / 10) ? "th" : 1 === b ? "st" : 2 === b ? "nd" : 3 === b ? "rd" : "th";
				return a + b
			}
		}),
		T
	}
	.call(this),
	b.datepicker.moment = d,
	b.datepicker
});
