console.log("about:devtools-toolbox")
// open: about:devtools-toolbox?id=%40testpilot-containers&type=extension
//
// adapted from: https://github.com/phy1729/container-config
async function addUrl(container, url) {
  const identities = await browser.contextualIdentities.query({
    name: container
  });
  if (identities.length > 1) throw new Error("too many container with the same name");
  if (identities.length == 0) throw new Error("container not found");

  const cookieStoreId = identities[0].cookieStoreId;
  const userContextId = backgroundLogic.getUserContextIdFromCookieStoreId(cookieStoreId);
  console.log("user context: ", userContextId);

  const assignManager = window.assignManager;

  await assignManager._setOrRemoveAssignment(false, url, userContextId, false);
}
//retrieveAll()
console.log("Calling console.log")
console.log("Trying t")
console.log("About to find out how much sync storage is used: ")
let gettingSpace = browser.storage.sync.getBytesInUse(
  //keys                      // null, string, or array of strings
)
console.log(gettingSpace)
