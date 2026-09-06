.class Lcom/android/launcher3/resource/UnreadInfoCollection$MessageUnReadInfo;
.super Lcom/android/launcher3/resource/u1$d;
.source "UnreadInfoCollection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/resource/UnreadInfoCollection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "MessageUnReadInfo"
.end annotation


# static fields
.field private static final SMS_COMPONENT:[Landroid/content/ComponentName;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    new-instance v0, Landroid/content/ComponentName;

    .line 2
    .line 3
    const-string v1, "com.android.mms.ui.ConversationList"

    .line 4
    .line 5
    const-string v2, "com.android.mms"

    .line 6
    .line 7
    invoke-direct {v0, v2, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Landroid/content/ComponentName;

    .line 11
    .line 12
    const-string v3, "com.android.mms.ui.BootActivity"

    .line 13
    .line 14
    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    new-instance v2, Landroid/content/ComponentName;

    .line 18
    .line 19
    const-string v3, "com.android.ztemms"

    .line 20
    .line 21
    const-string v4, "com.android.ztemms.ui.BootActivity"

    .line 22
    .line 23
    invoke-direct {v2, v3, v4}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    new-instance v3, Landroid/content/ComponentName;

    .line 27
    .line 28
    const-string v4, "com.android.messaging"

    .line 29
    .line 30
    const-string v5, "com.android.messaging.ui.conversationlist.ConversationListActivity"

    .line 31
    .line 32
    invoke-direct {v3, v4, v5}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    new-instance v4, Landroid/content/ComponentName;

    .line 36
    .line 37
    const-string v5, "com.google.android.apps.messaging"

    .line 38
    .line 39
    const-string v6, "com.google.android.apps.messaging.ui.ConversationListActivity"

    .line 40
    .line 41
    invoke-direct {v4, v5, v6}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    filled-new-array {v0, v1, v2, v3, v4}, [Landroid/content/ComponentName;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    sput-object v0, Lcom/android/launcher3/resource/UnreadInfoCollection$MessageUnReadInfo;->SMS_COMPONENT:[Landroid/content/ComponentName;

    .line 49
    .line 50
    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/resource/u1$d;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/android/launcher3/resource/UnreadInfoCollection$MessageUnReadInfo;->SMS_COMPONENT:[Landroid/content/ComponentName;

    .line 5
    .line 6
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {p1, v0}, Lcom/android/launcher3/resource/UnreadInfoCollection;->getDefaultAppComponentName(Landroid/content/Context;Ljava/util/List;)Landroid/content/ComponentName;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, v0}, Lcom/android/launcher3/resource/u1$d;->setPkgName(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Lcom/android/launcher3/resource/u1$d;->setClsName(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method
