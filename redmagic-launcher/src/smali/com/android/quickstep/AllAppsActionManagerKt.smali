.class public final Lcom/android/quickstep/AllAppsActionManagerKt;
.super Ljava/lang/Object;
.source "AllAppsActionManager.kt"


# static fields
.field private static final USER_SETUP_COMPLETE_URI:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "user_setup_complete"

    .line 2
    .line 3
    invoke-static {v0}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lcom/android/quickstep/AllAppsActionManagerKt;->USER_SETUP_COMPLETE_URI:Landroid/net/Uri;

    .line 8
    .line 9
    return-void
.end method

.method public static final synthetic access$getUSER_SETUP_COMPLETE_URI$p()Landroid/net/Uri;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/AllAppsActionManagerKt;->USER_SETUP_COMPLETE_URI:Landroid/net/Uri;

    .line 2
    .line 3
    return-object v0
.end method
