/**
 * Main entry point for the webscript
 */
function main()
{
   // Is user privileged to change the configuration
   var isPrivileged = true;
   if (!user.isAdmin)
   {
      if (page.url.templateArgs.site)
      {
         isPrivileged = false;
         // We are in the context of a site, so call the repository to see if the user is site manager or not
         var json = remote.call("/api/sites/" + page.url.templateArgs.site + "/memberships/" + encodeURIComponent(user.name));

         if (json.status == 200)
         {
            var obj = eval('(' + json + ')');
            if (obj)
            {
               isPrivileged = obj.role == "SiteManager";
            }
         }
      }
   }
   model.isPrivileged = isPrivileged;

   model.network = args.network || "";
   model.group = args.group || "";
   model.componentId = instance.object.id

   var actions = [];
   if (model.isPrivileged)
   {
      actions.push({
         cssClass: "edit",
         eventOnClick: {
            _alfValue : "yammerDashletEvent" + args.htmlid.replace(/-/g, "_"),
            _alfType: "REFERENCE"
         },
         tooltip: msg.get("dashlet.edit.tooltip")
      });
   }

   var dashletTitleBarActions = {
      id : "DashletTitleBarActions",
      name : "Alfresco.widget.DashletTitleBarActions",
      useMessages : false,
      options : {
         actions: actions
      }
   };

   model.widgets = [dashletTitleBarActions];
}

main();
