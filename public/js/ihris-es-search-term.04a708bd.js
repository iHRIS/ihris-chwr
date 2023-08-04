"use strict";(self["webpackChunkiHRIS_v5"]=self["webpackChunkiHRIS_v5"]||[]).push([[276],{2252:function(e,t,a){a.r(t),a.d(t,{default:function(){return b}});var i=function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("label",[e.isDropDown&&!e.hideFilters?a("v-autocomplete",{staticClass:"ma-1",attrs:{loading:e.loading,label:e.label,items:e.items,outlined:"","error-messages":e.err_messages,error:e.error,clearable:"","hide-details":"","small-chips":"",dense:"",multiple:"","item-text":"display","item-value":"code"},on:{change:function(t){return e.updateSearch()},"click:clear":function(t){return e.clearSearch()}},scopedSlots:e._u([{key:"prepend-item",fn:function(){return[a("v-radio-group",{attrs:{row:""},on:{change:function(t){return e.updateSearch()}},model:{value:e.filterType,callback:function(t){e.filterType=t},expression:"filterType"}},[a("v-radio",{attrs:{label:"Include",value:"include"}}),a("v-radio",{attrs:{label:"Exclude",value:"exclude"}})],1),a("v-divider")]},proxy:!0}],null,!1,1071381286),model:{value:e.value,callback:function(t){e.value=t},expression:"value"}}):e.hideFilters?e._e():["date"==e.filterDataType?[a("v-menu",{ref:"menu",attrs:{"close-on-content-click":!1,transition:"scale-transition","offset-y":"","min-width":"auto"},scopedSlots:e._u([{key:"activator",fn:function(t){var i=t.on,l=t.attrs;return[a("v-text-field",e._g(e._b({staticClass:"ma-1",attrs:{label:e.label,readonly:"",clearable:"",dense:"",outlined:"","hide-details":""},on:{input:e.updateSearch},model:{value:e.value,callback:function(t){e.value=t},expression:"value"}},"v-text-field",l,!1),i))]}}],null,!1,3224575583),model:{value:e.dateMenu,callback:function(t){e.dateMenu=t},expression:"dateMenu"}},[a("v-date-picker",{ref:"picker",attrs:{max:(new Date).toISOString().substr(0,10),min:"1950-01-01"},on:{change:e.updateSearch},model:{value:e.value,callback:function(t){e.value=t},expression:"value"}})],1)]:a("v-text-field",{staticClass:"ma-1",attrs:{"prepend-inner-icon":"mdi-filter-variant",label:e.label,dense:"",outlined:"","hide-details":"",clearable:""},on:{change:function(t){return e.updateSearch()},"click:clear":function(t){return e.clearSearch()}},model:{value:e.value,callback:function(t){e.value=t},expression:"value"}})]],2)},l=[],r={name:"ihris-search-term",props:["label","expression","isDropDown","reportData","hideFilters"],data:function(){return{loading:!1,items:[],error:!1,err_messages:null,filterType:"include",value:null,filterDataType:"",dateMenu:!1}},mounted:function(){if(this.reportData.mappings.mappings.properties[this.expression]&&(this.filterDataType=this.reportData.mappings.mappings.properties[this.expression].type),this.isDropDown&&this.filterDataType){this.loading=!0;let e=`/es/populateFilter/${this.reportData.indexName}/${this.expression}?dataType=${this.filterDataType}`;fetch(e,{method:"GET"}).then((e=>{e.json().then((e=>{this.loading=!1;for(let t of e)this.items.push(t.key.value)})).catch((e=>{this.loading=!1,this.error_message="Unable to load results.",console.log(e)}))})).catch((e=>{this.loading=!1,this.error_message="Unable to load results.",console.log(e)}))}},methods:{updateSearch:function(){this.$emit("termChange",this.expression,this.value,this.filterType)},clearSearch:function(){this.$emit("termChange",this.expression,[])}},watch:{dateMenu(e){e&&setTimeout((()=>this.$refs.picker.activePicker="YEAR"))}}},n=r,s=a(3736),o=a(3453),u=a.n(o),c=a(1835),d=a(9771),p=a(1418),h=a(1152),f=a(8978),m=a(4739),v=a(5978),g=(0,s.Z)(n,i,l,!1,null,null,null),b=g.exports;u()(g,{VAutocomplete:c.Z,VDatePicker:d.Z,VDivider:p.Z,VMenu:h.Z,VRadio:f.Z,VRadioGroup:m.Z,VTextField:v.Z})}}]);
//# sourceMappingURL=ihris-es-search-term.04a708bd.js.map