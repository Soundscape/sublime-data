(function(){var t,e,r,n,o=function(t,e){function r(){this.constructor=t}for(var n in e)i.call(e,n)&&(t[n]=e[n]);return r.prototype=e.prototype,t.prototype=new r,t.__super__=e.prototype,t},i={}.hasOwnProperty;t=require("sublime-core"),r=require("waterline"),n=require("when"),e=function(t){function e(t){e.__super__.constructor.call(this,t),this.ctx=new r}return o(e,t),e.prototype.init=function(t){var e;return e=n.defer(),t.forEach(function(t){return function(e){return t.ctx.loadCollection(e)}}(this)),this.ctx.initialize(this.options,function(t){return function(r,n){return r&&e.reject(r),t.models=n.collections,t.connections=n.connections,t.emit("ready",t),e.resolve(t)}}(this)),e.promise},e}(t.CoreObject),module.exports=e}).call(this);