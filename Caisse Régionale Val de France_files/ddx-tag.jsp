

var ca_cmCookieMigrationQuery = window.location.host + '/?'+'&cm_mc_uid=56152017650615099872471&cm_mc_sid_50580000|84400_CLI_3=1511864461'+'&cm_mc_managed-cookie-reccli-new=Accord';

function ca_cmSetupCookieMigration(pJSFPmigration,pforceVisitorOverwrite,pdomainWhitelist,pdomainBlacklist,pathWhitelist,potherCookie,potherCookiesExpireTimes){
    if(pJSFPmigration){
        cm_JSFPCookieMigrate=pJSFPmigration
    }
    if(pforceVisitorOverwrite){
        cm_JSFPForceMigrateCookies=pforceVisitorOverwrite
    }
    if(pdomainWhitelist){
        cm_JSFPMigrationDomainWhitelist=pdomainWhitelist
    }
    if(pdomainBlacklist){
        cm_JSFPMigrationDomainBlacklist=pdomainBlacklist
    }
    if(pathWhitelist){cm_JSFPMigrationPathWhitelist=pathWhitelist}
    if(potherCookie){cm_JSFPMigrationOtherCookies=potherCookie}
    if(potherCookiesExpireTimes){cm_JSFPMigrationOtherCookiesExpireTimes=potherCookiesExpireTimes}
    if(cm_JSFPCookieMigrate){
        var l=cm_ClientID.split(";"),b={},h,g,a,f,c={};
        for(h=0;h<l.length;++h){
            a=cmExtractParameter(
                cmJSFCreateSessionMigrationParamName(l[h]),
                ca_cmCookieMigrationQuery
            );
            if(a){b[l[h]]=a}
        }
        if(cm_JSFPMigrationOtherCookies){
            f=cm_JSFPMigrationOtherCookies.split(",");
            for(g=0;g<f.length;++g){
                a=cmExtractParameter(
                    "cm_mc_"+f[g],
                    ca_cmCookieMigrationQuery
                );
                if(a){c[f[g]]=a}
            }
        }
        cmJSFPMigrateCookies(
            cmExtractParameter(
                cm_JSFPCookieMigrateVisitorID,
                ca_cmCookieMigrationQuery
            ),
            b,
            c
        )
    }
}

try{
if (TRACKING =="O"){
	cmSetupOther({"cm_JSFCoreCookieExpireSeconds":"33696000"});
	
	var blackList = new Array();
	
	var dropParams = function(locat){
		var query = locat.split("?");
		query = query.length > 1 ? query[1].split("&") : [];
		for(var i=0; i<query.length; i++){
			var param = query[i].split("=");
			if(blackList.join().indexOf(param[0]) == -1) blackList.push(param[0]);
		}
	};
	dropParams(location+"");
	dropParams(document.referrer);
	
	if(blackList.length > 0){
		cmSetupNormalization(blackList.join() + "-_-" + blackList.join());
	}
    
    ca_cmSetupCookieMigration(true, true, ".credit-agricole.fr", null, null, "managed-cookie-reccli-new",{"managed-cookie-reccli-new":604800000});
	var attr = webanalytics.page.attributes.split("-_-");
	var crID = attr.pop();
	var partID = attr[0];
	
    var rxReg = /regId=(\d+)-(\d+)/i;
    var match = rxReg.exec(document.cookie);
    var now = new Date().getTime();
    
    var doRegMig = true;
    if(match){
        var timeStamp = parseInt(match[1]);
        doRegMig = (Math.abs(now - timeStamp) > (45 * 60 * 1000)) || (match[2] != partID);
    }
	
    if(doRegMig) {
        var regId = crID+"-"+partID;
        cmCreateRegistrationTag(regId, null, null, null, null, null, webanalytics.page.categoryid + "-_--_--_--_--_--_--_--_-" + crID);
        document.cookie = "regId=" + now + "-" + partID + ";Path=/";
    }
	
	var scripts = document.scripts;
	if(scripts){
		for(var i=0; i<scripts.length; i++){
			var src = scripts.item(i).innerHTML;
			src = src ? src.replace(/^\s+|\s+$/gm,'') : src;
			
			if(src && src.length > 16 && src.substring(0,16) == "var marqueurXiti"){
				try{
					var idx0 = src.indexOf(";var marqueurXiti", 16);
					if(idx0 > 0){
						var idx1 = src.indexOf(" = marqueurXiti+", idx0);
						if(idx1 > 0) clicXiti(window[src.substring(idx0+5, idx1)]);
					}
				}catch(e0){}
			}
		}
	}
	else{
		for(var l in window){
			if(l.indexOf("marqueurXiti") == 0 && l.length > 12){
				clicXiti(window[l]);
			}
		}
	}
	
	var pageid = webanalytics.page.pageid !== "" ? webanalytics.page.pageid : (marqueurXiti && iframeFormulaire ? "EMESSAGE::" + marqueurXiti : "");
    
    cmCreatePageviewTag(pageid, webanalytics.page.categoryid, "", "", webanalytics.page.attributes);
}
}catch(e){
try{console.log("ERR 15-12-04", e.message);}catch(e){}
}

