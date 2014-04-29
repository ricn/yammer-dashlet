<#assign el=args.htmlid?html>
<div id="${el}-configDialog">
   <div class="hd">${msg("label.title")}</div>
   <div class="bd">
      <form id="${el}-form" action="" method="POST">
         <div class="yui-gd">
            <div class="yui-u first"><label for="${el}-network">${msg("label.network")}:</label></div>
            <div class="yui-u"><input id="${el}-network" type="text" name="network" value="" maxlength="2048" /></div>

            <div class="yui-u first"><label for="${el}-group">${msg("label.group")}:</label></div>
            <div class="yui-u"><input id="${el}-group" type="text" name="group" value="" maxlength="2048" /></div>
         </div>
         <div class="bdft">
            <input type="submit" id="${el}-ok" value="${msg("button.ok")}" />
            <input type="button" id="${el}-cancel" value="${msg("button.cancel")}" />
         </div>
      </form>
   </div>
</div>
