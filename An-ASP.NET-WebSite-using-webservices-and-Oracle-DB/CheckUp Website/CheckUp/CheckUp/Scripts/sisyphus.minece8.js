(function(a){a.sisyphus=function(){return Sisyphus.getInstance()},a.fn.sisyphus=function(a){var b=Sisyphus.getInstance();return b.setOptions(a),b.protect(this),b};var b={};b.isAvailable=function(){if("object"==typeof a.jStorage)return!0;try{return localStorage.getItem}catch(b){return!1}},b.set=function(b,c){if("object"==typeof a.jStorage)a.jStorage.set(b,c+"");else try{localStorage.setItem(b,c+"")}catch(d){}},b.get=function(b){if("object"==typeof a.jStorage){var c=a.jStorage.get(b);return c?""+c:c}return console.log(localStorage.getItem),console.log(typeof localStorage.getItem),localStorage.getItem(b)},b.remove=function(b){"object"==typeof a.jStorage?a.jStorage.deleteKey(b):localStorage.removeItem(b)},Sisyphus=function(){function d(){return{setInitialOptions:function(c){var d={excludeFields:[],customKeyPrefix:"",timeout:0,autoRelease:!0,name:null,onSave:function(){},onBeforeRestore:function(){},onRestore:function(){},onRelease:function(){}};this.options=this.options||a.extend(d,c),this.browserStorage=b},setOptions:function(b){this.options=this.options||this.setInitialOptions(b),this.options=a.extend(this.options,b)},protect:function(b){b=b||{};var d=this;return this.targets=this.targets||[],this.href=this.options.name||location.hostname+location.pathname+location.search+location.hash,this.targets=a.merge(this.targets,b),this.targets=a.unique(this.targets),this.targets=a(this.targets),this.browserStorage.isAvailable()?(d.restoreAllData(),this.options.autoRelease&&d.bindReleaseData(),c.started||(d.bindSaveData(),c.started=!0),void 0):!1},bindSaveData:function(){var b=this;b.options.timeout&&b.saveDataByTimeout(),b.targets.each(function(){var c=a(this).attr("id"),d=a(this).find(":input").not(":submit").not(":reset").not(":button").not(":file");d.each(function(){if(-1!==a.inArray(this,b.options.excludeFields))return!0;var d=a(this),e=b.href+c+d.attr("name")+b.options.customKeyPrefix;d.is(":text")||d.is("textarea")?b.options.timeout||b.bindSaveDataImmediately(d,e):b.bindSaveDataOnChange(d,e)})})},saveAllData:function(){var b=this;b.targets.each(function(){var c=a(this).attr("id"),d=a(this).find(":input").not(":submit").not(":reset").not(":button").not(":file");d.each(function(){var d=a(this);if(-1!==a.inArray(this,b.options.excludeFields)||void 0===d.attr("name"))return!0;var e=b.href+c+d.attr("name")+b.options.customKeyPrefix,f=d.val();d.is(":checkbox")?(-1!==d.attr("name").indexOf("[")?(f=[],a("[name='"+d.attr("name")+"']:checked").each(function(){f.push(a(this).val())})):f=d.is(":checked"),b.saveToBrowserStorage(e,f,!1)):d.is(":radio")?d.is(":checked")&&(f=d.val(),b.saveToBrowserStorage(e,f,!1)):b.saveToBrowserStorage(e,f,!1)})}),a.isFunction(b.options.onSave)&&b.options.onSave.call()},restoreAllData:function(){var b=this,c=!1;a.isFunction(b.options.onBeforeRestore)&&b.options.onBeforeRestore.call(b),b.targets.each(function(){var d=a(this),e=d.attr("id"),f=d.find(":input").not(":submit").not(":reset").not(":button").not(":file");f.each(function(){if(-1!==a.inArray(this,b.options.excludeFields))return!0;var d=a(this),f=b.href+e+d.attr("name")+b.options.customKeyPrefix,g=b.browserStorage.get(f);g&&(b.restoreFieldsData(d,g),c=!0)})}),c&&a.isFunction(b.options.onRestore)&&b.options.onRestore.call()},restoreFieldsData:function(a,b){return void 0===a.attr("name")?!1:(a.is(":checkbox")&&"false"!==b&&-1===a.attr("name").indexOf("[")?a.attr("checked","checked"):a.is(":checkbox")&&"false"===b&&-1===a.attr("name").indexOf("[")?a.removeAttr("checked"):a.is(":radio")?a.val()===b&&a.attr("checked","checked"):-1===a.attr("name").indexOf("[")?a.val(b):(b=b.split(","),a.val(b)),void 0)},bindSaveDataImmediately:function(b,c){var d=this;a.browser.msie===void 0?b.get(0).oninput=function(){d.saveToBrowserStorage(c,b.val())}:b.get(0).onpropertychange=function(){d.saveToBrowserStorage(c,b.val())}},saveToBrowserStorage:function(b,c,d){d=void 0===d?!0:d,this.browserStorage.set(b,c),d&&""!==c&&a.isFunction(this.options.onSave)&&this.options.onSave.call()},bindSaveDataOnChange:function(a){var c=this;a.change(function(){c.saveAllData()})},saveDataByTimeout:function(){var a=this,b=a.targets;setTimeout(function(){function c(){a.saveAllData(),setTimeout(c,1e3*a.options.timeout)}return c}(b),1e3*a.options.timeout)},bindReleaseData:function(){var b=this;b.targets.each(function(){var d=a(this),e=d.find(":input").not(":submit").not(":reset").not(":button").not(":file"),f=d.attr("id");a(this).bind("submit reset",function(){b.releaseData(f,e)})})},manuallyReleaseData:function(){var b=this;b.targets.each(function(){var d=a(this),e=d.find(":input").not(":submit").not(":reset").not(":button").not(":file"),f=d.attr("id");b.releaseData(f,e)})},releaseData:function(b,c){var d=!1,e=this;c.each(function(){if(-1!==a.inArray(this,e.options.excludeFields))return!0;var c=a(this),f=e.href+b+c.attr("name")+e.options.customKeyPrefix;e.browserStorage.remove(f),d=!0}),d&&a.isFunction(e.options.onRelease)&&e.options.onRelease.call()}}}var c={instantiated:null,started:null};return{getInstance:function(){return c.instantiated||(c.instantiated=d(),c.instantiated.setInitialOptions()),c.instantiated},free:function(){return c={},null}}}()})(jQuery),function(a){a.sisyphus=function(){return Sisyphus.getInstance()},a.fn.sisyphus=function(a){var b=Sisyphus.getInstance();return b.setOptions(a),b.protect(this),b};var b={};b.isAvailable=function(){if("object"==typeof a.jStorage)return!0;try{return localStorage.getItem}catch(b){return!1}},b.set=function(b,c){if("object"==typeof a.jStorage)a.jStorage.set(b,c+"");else try{localStorage.setItem(b,c+"")}catch(d){}},b.get=function(b){if("object"==typeof a.jStorage){var c=a.jStorage.get(b);return c?""+c:c}return localStorage.getItem(b)},b.remove=function(b){"object"==typeof a.jStorage?a.jStorage.deleteKey(b):localStorage.removeItem(b)},Sisyphus=function(){function d(){return{setInitialOptions:function(c){var d={excludeFields:[],customKeyPrefix:"",timeout:0,autoRelease:!0,name:null,onSave:function(){},onBeforeRestore:function(){},onRestore:function(){},onRelease:function(){}};this.options=this.options||a.extend(d,c),this.browserStorage=b},setOptions:function(b){this.options=this.options||this.setInitialOptions(b),this.options=a.extend(this.options,b)},protect:function(b){b=b||{};var d=this;return this.targets=this.targets||[],this.href=this.options.name||location.hostname+location.pathname+location.search+location.hash,this.targets=a.merge(this.targets,b),this.targets=a.unique(this.targets),this.targets=a(this.targets),this.browserStorage.isAvailable()?(d.restoreAllData(),this.options.autoRelease&&d.bindReleaseData(),c.started||(d.bindSaveData(),c.started=!0),void 0):!1},bindSaveData:function(){var b=this;b.options.timeout&&b.saveDataByTimeout(),b.targets.each(function(){var c=a(this).attr("id"),d=a(this).find(":input").not(":submit").not(":reset").not(":button").not(":file");d.each(function(){if(-1!==a.inArray(this,b.options.excludeFields))return!0;var d=a(this),e=b.href+c+d.attr("name")+b.options.customKeyPrefix;d.is(":text")||d.is("textarea")?b.options.timeout||b.bindSaveDataImmediately(d,e):b.bindSaveDataOnChange(d,e)})})},saveAllData:function(){var b=this;b.targets.each(function(){var c=a(this).attr("id"),d=a(this).find(":input").not(":submit").not(":reset").not(":button").not(":file");d.each(function(){var d=a(this);if(-1!==a.inArray(this,b.options.excludeFields)||void 0===d.attr("name"))return!0;var e=b.href+c+d.attr("name")+b.options.customKeyPrefix,f=d.val();d.is(":checkbox")?(-1!==d.attr("name").indexOf("[")?(f=[],a("[name='"+d.attr("name")+"']:checked").each(function(){f.push(a(this).val())})):f=d.is(":checked"),b.saveToBrowserStorage(e,f,!1)):d.is(":radio")?d.is(":checked")&&(f=d.val(),b.saveToBrowserStorage(e,f,!1)):b.saveToBrowserStorage(e,f,!1)})}),a.isFunction(b.options.onSave)&&b.options.onSave.call()},restoreAllData:function(){var b=this,c=!1;a.isFunction(b.options.onBeforeRestore)&&b.options.onBeforeRestore.call(b),b.targets.each(function(){var d=a(this),e=d.attr("id"),f=d.find(":input").not(":submit").not(":reset").not(":button").not(":file");f.each(function(){if(-1!==a.inArray(this,b.options.excludeFields))return!0;var d=a(this),f=b.href+e+d.attr("name")+b.options.customKeyPrefix,g=b.browserStorage.get(f);g&&(b.restoreFieldsData(d,g),c=!0)})}),c&&a.isFunction(b.options.onRestore)&&b.options.onRestore.call()},restoreFieldsData:function(a,b){return void 0===a.attr("name")?!1:(a.is(":checkbox")&&"false"!==b&&-1===a.attr("name").indexOf("[")?a.attr("checked","checked"):a.is(":checkbox")&&"false"===b&&-1===a.attr("name").indexOf("[")?a.removeAttr("checked"):a.is(":radio")?a.val()===b&&a.attr("checked","checked"):-1===a.attr("name").indexOf("[")?a.val(b):(b=b.split(","),a.val(b)),void 0)},bindSaveDataImmediately:function(b,c){var d=this;a.browser.msie===void 0?b.get(0).oninput=function(){d.saveToBrowserStorage(c,b.val())}:b.get(0).onpropertychange=function(){d.saveToBrowserStorage(c,b.val())}},saveToBrowserStorage:function(b,c,d){d=void 0===d?!0:d,this.browserStorage.set(b,c),d&&""!==c&&a.isFunction(this.options.onSave)&&this.options.onSave.call()},bindSaveDataOnChange:function(a){var c=this;a.change(function(){c.saveAllData()})},saveDataByTimeout:function(){var a=this,b=a.targets;setTimeout(function(){function c(){a.saveAllData(),setTimeout(c,1e3*a.options.timeout)}return c}(b),1e3*a.options.timeout)},bindReleaseData:function(){var b=this;b.targets.each(function(){var d=a(this),e=d.find(":input").not(":submit").not(":reset").not(":button").not(":file"),f=d.attr("id");a(this).bind("submit reset",function(){b.releaseData(f,e)})})},manuallyReleaseData:function(){var b=this;b.targets.each(function(){var d=a(this),e=d.find(":input").not(":submit").not(":reset").not(":button").not(":file"),f=d.attr("id");b.releaseData(f,e)})},releaseData:function(b,c){var d=!1,e=this;c.each(function(){if(-1!==a.inArray(this,e.options.excludeFields))return!0;var c=a(this),f=e.href+b+c.attr("name")+e.options.customKeyPrefix;e.browserStorage.remove(f),d=!0}),d&&a.isFunction(e.options.onRelease)&&e.options.onRelease.call()}}}var c={instantiated:null,started:null};return{getInstance:function(){return c.instantiated||(c.instantiated=d(),c.instantiated.setInitialOptions()),c.instantiated},free:function(){return c={},null}}}()}(jQuery);