<#assign el=args.htmlid?html>
<#assign id=el?replace("-", "_")>
<script type="text/javascript">//<![CDATA[
   var yam = new Extras.dashlet.Yammer("${args.htmlid}").setMessages(${messages}).setOptions({
     componentId : "${componentId}",
     network : "${network}",
     group : "${group}"
   });
   new Alfresco.widget.DashletResizer("${args.htmlid}", "${instance.object.id}");
   yammerDashletEvent${id}.subscribe(yam.onConfigYammerClick, yam, true);
//]]></script>

<@markup id="js">
   <@script type="text/javascript" src="${url.context}/res/modules/simple-dialog.js" group="dashlets"/>
</@>

<@markup id="widgets">
   <@inlineScript group="dashlets">
      var yammerDashletEvent${id} = new YAHOO.util.CustomEvent("onConfigYammerClick");
   </@>
   <@createWidgets group="dashlets"/>
</@>

<div class="dashlet yammer-dashlet">
   <div class="title" id="${args.htmlid}-title">${msg("header")}</div>
   <div class="titleBarActions">
     <div title="Configure this dashlet" class="titleBarActionIcon edit"></div>
   </div>
   <div class="yammer-dashlet-toolbar toolbar" id="${args.htmlid}-toolbar">
      <div>
      	<span class="align-right yui-button-align">
      		<span class="first-child">
            	<a id="${args.htmlid}-link-new-post" class="theme-color-1" title="${msg('link.yammer-new-post')}" href="">${msg('link.yammer-new-post')}</a>
          </span>
         </span>
      </div>
   </div>
   <div class="body scrollableList" <#if args.height??>style="height: ${args.height}px;"</#if>>
     <div id="${args.htmlid}-connect" class="yammer-dashlet-connect" style="display: none;">
     	<div>${msg('message.notConnected')}</div>
     	<input type="button" id="${args.htmlid}-btn-connect" value="${msg('button.connect')}" />
 	 </div>
 	 <div id="${args.htmlid}-messages" class="yammer-dashlet-messages"></div>
 	 <div id="${args.htmlid}-utils" class="yammer-dashlet-utils"><a id="${args.htmlid}-link-disconnect" class="theme-color-1" href="#">${msg('link.disconnect')}</a></div>
   </div>
</div>
